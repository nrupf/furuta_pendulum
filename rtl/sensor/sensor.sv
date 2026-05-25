// =============================================================================
// SSCSensor.sv  —  TLE5012B angle sensor driver via SSC (SPI-compatible)
//
// KEY DESIGN DECISION: Everything runs on clk_i.
//   The SCK we send to the sensor is *generated* inside this module as a
//   slower toggling signal, but we never clock flip-flops with it.
//   Instead we detect its edges (rising_edge_tick / falling_edge_tick) and
//   use those ticks as "enables" inside a clk_i always_ff block.
//
//   Why? Because if you clock two different always_ff blocks from two
//   different clocks (clk_i and sck), signals shared between them can
//   arrive at unpredictable times — this is called a clock domain crossing
//   and causes metastability (random bit flips). Running everything on one
//   clock avoids this entirely.
//
// SSC PROTOCOL SUMMARY (from TLE5012B datasheet):
//   1. Pull CSQ low  (chip select, active-low)
//   2. FPGA sends 16-bit command word, MSB first, on DATA
//      - data is SET on rising SCK, SAMPLED by sensor on falling SCK
//   3. Wait twr_delay (≥130 ns) after last command bit — FPGA releases DATA (hi-Z)
//   4. Sensor sends 16-bit data word back, MSB first
//      - FPGA samples on falling SCK
//   5. Sensor sends 16-bit safety word (we capture but can optionally ignore)
//   6. Pull CSQ high  (deselect)
//   7. Wait tCSoff (≥600 ns) before next transaction
//
// COMMAND WORD to read AVAL (angle value register, address 0x02):
//   Bit 15    : 1        (Read)
//   Bits 14:11: 0000     (Lock = default access)
//   Bit 10    : 0        (UPD  = read current value, not snapshot)
//   Bits 9:4  : 000010   (ADDR = 0x02, the AVAL register)
//   Bits 3:0  : 0001     (ND   = 1 data word)
//   => 1_0000_0_000010_0001 = 16'h8021
//
// AVAL DATA WORD (what the sensor sends back):
//   Bits 14:0 : 15-bit  angle  (range: -16384 to +16383 → maps to -180° to +180°)
//   Bit  15   : RD_AV (status flag)
// =============================================================================

module SSCSensor (
    input  logic        clk_i,            // FPGA system clock (e.g. 50 MHz)
    input  logic        reset_i,          // synchronous active-high reset
    input  logic        start_i,          // pulse high for 1 cycle to trigger a new read

    // divider_sensorfreq_i: controls SCK frequency
    //   SCK freq = clk_i_freq / (divider * 2)
    //   e.g. divider=4 with 50 MHz clk → SCK ≈ 6.25 MHz (well within 8 MHz max)
    input  logic [7:0]  divider_sensorfreq_i,

    inout  wire         data_pin,         // bidirectional DATA line to sensor

    output logic        sck_o,            // serial clock output to sensor
    output logic        csq_o,            // chip select, active-low
    output logic signed [14:0] angle_raw_o,      // 15-bit angle, valid when done_o=1
    output logic        done_o            // pulses high for 1 clk_i cycle when angle ready
);

// =============================================================================
// 1. GENERATE A SLOW "SCK" SIGNAL (still in clk_i domain)
//    This is a simple counter that toggles sck_int every (divider+1) clk_i cycles.
//    The result is a symmetric square wave at the desired baud rate.
// =============================================================================
    logic        sck_int;       // internal SCK (the actual toggling signal)
    logic [7:0]  sck_counter;

    logic [7:0] max_div_freq;
    assign max_div_freq = (divider_sensorfreq_i > 8'd4) ? divider_sensorfreq_i : 8'd4; //can't go faster than this


    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            sck_int     <= 1'b0;
            sck_counter <= '0;
        end else begin
            if (sck_counter == max_div_freq) begin
                sck_int     <= ~sck_int;   // toggle
                sck_counter <= '0;
            end else begin
                sck_counter <= sck_counter + 1;
            end
        end
    end

// =============================================================================
// 2. EDGE DETECTION ON sck_int
//    We remember sck_int from the previous clk_i cycle (sck_prev).
//    Then:
//      rising_edge_tick  = 1 for exactly ONE clk_i cycle when SCK goes 0→1
//      falling_edge_tick = 1 for exactly ONE clk_i cycle when SCK goes 1→0
//    These are used as "go" signals inside the FSM below.
// =============================================================================
    logic sck_prev;
    logic rising_edge_tick;
    logic falling_edge_tick;

    always_ff @(posedge clk_i) begin
        if (reset_i) sck_prev <= 1'b0;
        else         sck_prev <= sck_int;
    end

    assign rising_edge_tick  =  sck_int & ~sck_prev;   // 0→1 transition
    assign falling_edge_tick = ~sck_int &  sck_prev;   // 1→0 transition

// =============================================================================
// 3. STATE MACHINE DEFINITION
//    The states map directly to the SSC protocol steps above.
// =============================================================================
    typedef enum logic [2:0] {
        IDLE,           // waiting for start_i
        ASSERT_CS,      // CSQ goes low; wait one full SCK period before shifting
        SEND_CMD,       // FPGA shifts out 16-bit command word (one bit per SCK cycle)
        HOLD_LAST_BIT,  // Keep last written bit on line
        TURNAROUND,     // FPGA releases DATA; sensor prepares to drive
        RECV_DATA,      // sensor shifts in 16-bit angle data word
        RECV_SAFETY,    // sensor shifts in 16-bit safety word (we discard it here)
        DEASSERT_CS     // CSQ goes high; wait tCSoff before going IDLE
    } state_t;

    state_t state;

// =============================================================================
// 4. INTERNAL REGISTERS
// =============================================================================

    // The command word we send to read the AVAL register.
    // Build it from the bit fields so it's self-documenting:
    //   [15]   = 1        (Read)
    //   [14:11]= 4'b0000  (Lock: default access, no config write protection needed)
    //   [10]   = 0        (UPD:  current value, not snapshot buffer)
    //   [9:4]  = 6'h02    (ADDR: 0x02 = AVAL register)
    //   [3:0]  = 4'h1     (ND:   1 data word → sensor also appends 1 safety word)
    localparam logic [15:0] CMD_READ_AVAL = {1'b1, 4'b0000, 1'b0, 6'h02, 4'h1};
    //                                       RW    Lock      UPD   ADDR   ND

    logic [15:0] shift_reg;      // multi-purpose: holds command during TX, data during RX
    logic [4:0]  bit_cnt;        // counts bits shifted (0..15 = 16 bits per word)

    // Tri-state control for data_pin:
    //   data_oe=1 → FPGA drives the line (output enable)
    //   data_oe=0 → FPGA releases the line (hi-Z), sensor can drive it
    logic        data_oe;
    logic        data_out;       // what FPGA outputs when data_oe=1

    // Delay counter — used for twr_delay (turnaround) and tCSoff (deassert)
    // With a 50 MHz clk_i, 1 cycle = 20 ns.
    // twr_delay ≥ 130 ns → 7 cycles minimum
    // tCSoff    ≥ 600 ns → 30 cycles minimum
    // We use a generous 8-bit counter so it covers both.
    logic [7:0]  delay_cnt;

    // Captured angle output (15-bit, from bits [14:0] of the data word)
    logic signed [14:0] angle_capture;

// =============================================================================
// 5. BIDIRECTIONAL DATA PIN LOGIC
//    This is the tri-state buffer. On an FPGA, 'z' infers a tri-state buffer
//    at the I/O boundary.
//    When data_oe=1 (FPGA driving): data_pin = data_out
//    When data_oe=0 (sensor driving): data_pin is hi-Z, we read it via data_in
// =============================================================================
    assign data_pin = data_oe ? data_out : 1'bz;
    logic data_in;
    assign data_in = data_pin;     // read from pin (valid only when sensor is driving)

// =============================================================================
// 6. SCK OUTPUT — only toggling while a transaction is in progress
//    When IDLE or DEASSERT_CS, we hold SCK low (sensor expects it idle-low
//    between transactions).
// =============================================================================
    assign sck_o = (state == IDLE || state == ASSERT_CS || state == DEASSERT_CS || state == HOLD_LAST_BIT || state == TURNAROUND)
                   ? 1'b0
                   : sck_int;

// =============================================================================
// 7. MAIN FSM — all sequential, all on clk_i
// =============================================================================
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            state         <= IDLE;
            csq_o         <= 1'b1;    // deselected (active-low, so 1 = off)
            data_oe       <= 1'b0;
            data_out      <= 1'b1;
            shift_reg     <= '0;
            bit_cnt       <= '0;
            delay_cnt     <= '0;
            angle_capture <= '0;
            done_o        <= 1'b0;
            angle_raw_o   <= '0;
        end else begin

            // Default: done_o is a single-cycle pulse, so clear it each cycle
            done_o <= 1'b0;

            case (state)

                // -----------------------------------------------------------------
                // IDLE: wait for start_i
                // -----------------------------------------------------------------
                IDLE: begin
                    csq_o   <= 1'b1;
                    data_oe <= 1'b0;
                    if (start_i) begin
                        state     <= ASSERT_CS;
                        delay_cnt <= '0;
                    end
                end

                // -----------------------------------------------------------------
                // ASSERT_CS: pull CSQ low, then wait for a rising SCK edge so
                //   we enter SEND_CMD at a known point in the SCK cycle.
                //   delay_cnt increments each cycle; at cycle 6 the registered value
                //   reads 5 on this cycle, so the +1 commits to 6 next cycle.
                //   We wait until delay_cnt == 6 (7 cycles elapsed) then catch
                //   the very next rising SCK edge — guaranteed ≥ 140 ns > tCSs.
                // -----------------------------------------------------------------
                ASSERT_CS: begin
                    csq_o   <= 1'b0;                // assert chip select
                    data_oe <= 1'b1;                // FPGA will drive DATA
                    shift_reg <= CMD_READ_AVAL;     // Load shift register with command word, MSB ready to go
                    data_out  <= CMD_READ_AVAL[15]; // ready well before first falling edge
                    bit_cnt   <= 4'd15;             // we'll count down 15→0
                    delay_cnt <= delay_cnt + 1;     // increase delay count while waiting 105ns

                    if (delay_cnt == 8'd6 && rising_edge_tick) begin
                        delay_cnt <= '0;
                        state     <= SEND_CMD;
                    end
                end

                // -----------------------------------------------------------------
                // SEND_CMD: shift out 16 bits of command word.
                //   - On each RISING edge: advance shift register, put next bit out
                //     (data changes when SCK goes high, sensor samples when SCK falls)
                //   - After all 16 bits, move to TURNAROUND
                //
                // Timing picture for one bit:
                //   SCK:  ___/‾‾‾\___ 
                //   DATA: =====X===== (X = new bit, set just after rising edge)
                //   Sensor samples on falling edge → data has been stable for
                //   half a SCK period by then. Plenty of setup margin.
                // -----------------------------------------------------------------
                SEND_CMD: begin
                    if (rising_edge_tick) begin
                        if (bit_cnt == 15) begin
                            // MSB already on wire from ASSERT_CS — just decrement, don't shift
                            bit_cnt <= bit_cnt - 1;
                        end else begin
                            shift_reg <= shift_reg << 1;
                            data_out  <= shift_reg[15];
                            bit_cnt   <= bit_cnt - 1;
                        end
                    end
                    if (falling_edge_tick && bit_cnt == 0) begin
                        state <= HOLD_LAST_BIT;   // new state
                        delay_cnt <= '0;
                    end
                end

                HOLD_LAST_BIT: begin
                    // DATA still driven here (data_oe still 1)
                    // hold for tDATAh = 40ns → 2 cycles at 50MHz, use 2 to be safe
                    delay_cnt <= delay_cnt + 1;
                    if (delay_cnt == 8'd1) begin
                        data_oe   <= 1'b0;
                        delay_cnt <= '0;
                        state     <= TURNAROUND;
                    end
                end

                // -----------------------------------------------------------------
                // TURNAROUND: datasheet requires twr_delay ≥ 130 ns after last
                //   command bit before the sensor starts driving DATA.
                //   We simply count clk_i cycles. At 50 MHz, 8 cycles = 160 ns 
                // -----------------------------------------------------------------
                TURNAROUND: begin
                    delay_cnt <= delay_cnt + 1;
                    if (delay_cnt == 8'd8) begin
                        delay_cnt <= 8'd0;
                        bit_cnt <= 5'd15;       // prepare to receive 16 bits
                        state   <= RECV_DATA;
                    end
                end

                // -----------------------------------------------------------------
                // RECV_DATA: sample 16 bits from sensor.
                //   - Sensor puts data on line after rising edge
                //   - We sample on FALLING edge (data stable by then)
                //   - Shift into shift_reg MSB-first
                // -----------------------------------------------------------------
                RECV_DATA: begin
                    if (falling_edge_tick) begin
                        // Shift in the new bit
                        shift_reg <= {shift_reg[14:0], data_in};
                        
                        if (bit_cnt == 0) begin
                            // We just shifted in the last bit (bit 0)
                            // But shift_reg hasn't updated yet (non-blocking assignment!)
                            // So we need to manually construct the final value:
                            
                            // Current shift_reg[14:0] has bits [15:1] from sensor
                            // data_in has bit [0] from sensor
                            // not a problem to store bits from unsigned shiftreg in signed angle_capture,
                            // as long as no arithmetic is done
                            angle_capture <= {shift_reg[13:0], data_in};  // 15 bits [14:0]
                            
                            bit_cnt <= 5'd15;
                            state <= RECV_SAFETY;
                        end else begin
                            bit_cnt <= bit_cnt - 1;
                        end
                    end
                end

                // -----------------------------------------------------------------
                // RECV_SAFETY: receive the 16-bit safety word the sensor appends
                //   automatically after every read with ND≥1.
                //   We capture it into shift_reg but don't use it for now.
                //   (A more complete implementation would check the CRC and STAT bits.)
                // -----------------------------------------------------------------
                RECV_SAFETY: begin
                    if (falling_edge_tick) begin
                        shift_reg <= {shift_reg[14:0], data_in};
                        if (bit_cnt == 0) begin
                            bit_cnt <= 5'd15;
                            state <= DEASSERT_CS;
                        end else begin
                            bit_cnt <= bit_cnt - 1;
                        end
                    end
                end

                // -----------------------------------------------------------------
                // DEASSERT_CS: pull CSQ high, wait tCSoff ≥ 600 ns before IDLE.
                //   At 50 MHz, 30 cycles = 600 ns exactly — use 32 to be safe.
                //   Publish the new angle and pulse done_o.
                // -----------------------------------------------------------------
                DEASSERT_CS: begin
                    csq_o     <= 1'b1;
                    delay_cnt <= delay_cnt + 1;
                    if (delay_cnt == 8'd1) begin
                        // Publish angle on the very first cycle of this state
                        angle_raw_o <= angle_capture;
                        done_o      <= 1'b1;        // single-cycle pulse
                    end else begin
                        done_o      <= 1'b0;        // All other cycles: low
                    end

                    if (delay_cnt == 8'd32) begin
                        delay_cnt <= '0;
                        state     <= IDLE;
                    end
                end

                default: state <= IDLE;

            endcase
        end
    end

endmodule