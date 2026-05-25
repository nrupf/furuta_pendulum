/***
 SSCTransaction.sv
 Combined TX + RX SSC transaction FSM for the TLE5012B-E3005.

 Transaction sequence:
   1. Assert CSQ low.
   2. Transmit 16-bit command word 0x8021 (read AVAL, 1 word) MSB-first.
   3. Turnaround: release DATA line for one SCK half-period.
   4. Receive 16-bit data word (sensor drives MSB first); bit[15] = RDAV status,
      bits[14:0] = 15-bit angle value.
   5. Receive 16-bit safety word (auto-appended by sensor).
   6. Latch angle_o, assert valid_o for one tick, deassert CSQ.

 Timing:
   Each FSM state lasts exactly one tick_i pulse.
   SCK frequency = tick_frequency / 2.
   With DIVIDER=50 on a 50 MHz clock: tick = 1 MHz, SCK = 500 kHz.

 Angle conversion (external, not done here):
   angle_degrees = angle_o * 360.0 / 32768.0

 Marvin Schmidiger, April 2026
***/
module SSCTransaction (
    input  logic        clk_i,       // 50 MHz system clock
    input  logic        reset_i,     // synchronous active-high reset
    input  logic        tick_i,      // SCK half-period gate (from TickGen)
    input  logic        start_i,     // start transaction; hold high until valid_o
    output logic [14:0] angle_o,     // latched 15-bit angle (AVAL[14:0])
    output logic        valid_o,     // 1 for one tick when angle_o is fresh
    output logic        sck_o,       // SSC serial clock to sensor (SCK pin)
    output logic        csq_o,       // SSC chip select to sensor (CSQ pin, active LOW)
    output logic        data_out,    // bit to drive onto the DATA line
    output logic        data_oe,     // output enable: 1=drive DATA, 0=hi-Z (sensor drives)
    input  logic        data_in,      // bit received from the DATA line
    output logic        done_o
);

    // Read AVAL register command word:
    //   [15]   = 1       → read
    //   [14:11]= 0000    → operational access (registers 0x00-0x04)
    //   [10]   = 0       → current value
    //   [9:4]  = 000010  → address 0x02 (AVAL)
    //   [3:0]  = 0001    → 1 data word
    // = 1_0000_0_000010_0001 = 0x8021
    localparam logic [15:0] CMD_READ_AVAL = 16'h8021;

    typedef enum logic [3:0] {
        IDLE,          // wait for start_i
        CSQ_LOW,       // assert CSQ=0, pre-drive first TX bit, SCK=0
        TX_CLK_HI,     // SCK=1: sensor samples current command bit
        TX_CLK_LO,     // SCK=0: advance bit counter or go to TURNAROUND
        TURNAROUND,    // release DATA (data_oe=0), sensor prepares first RX bit
        RX_CLK_HI,     // SCK=1: data_in is stable (sensor already set it) → sample
        RX_CLK_LO,     // SCK=0: advance counter or move to safety phase
        SFTY_CLK_HI,   // SCK=1: sample safety word bit
        SFTY_CLK_LO,   // SCK=0: advance counter or latch result and finish
        DONE           // CSQ=1, valid_o pulsed, wait for start_i=0
    } state_t;

    state_t      state_q,   state_d;
    logic [3:0]  bit_ctr_q, bit_ctr_d;    // 4-bit: counts 15 down to 0 per phase
    logic [15:0] cmd_reg_q, cmd_reg_d;   // command shift register
    logic [15:0] data_rx_q, data_rx_d;  // received data word
    logic [15:0] sfty_rx_q, sfty_rx_d;  // received safety word
    logic [14:0] angle_q,   angle_d;    // latched angle output
    logic        valid_q,   valid_d;    // one-tick valid pulse

    // ── Flip-flops: synchronous reset, gated by tick_i ──────────────────
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            state_q   <= IDLE;
            bit_ctr_q <= 4'd0;
            cmd_reg_q <= CMD_READ_AVAL;
            data_rx_q <= 16'h0000;
            sfty_rx_q <= 16'h0000;
            angle_q   <= 15'd0;
            valid_q   <= 1'b0;
        end else if (tick_i) begin      // FSM advances one step per tick
            state_q   <= state_d;
            bit_ctr_q <= bit_ctr_d;
            cmd_reg_q <= cmd_reg_d;
            data_rx_q <= data_rx_d;
            sfty_rx_q <= sfty_rx_d;
            angle_q   <= angle_d;
            valid_q   <= valid_d;
        end
    end

    // ── Next-state and datapath logic ────────────────────────────────────
    always_comb begin
        // defaults: hold all registered values
        state_d   = state_q;
        bit_ctr_d = bit_ctr_q;
        cmd_reg_d = cmd_reg_q;
        data_rx_d = data_rx_q;
        sfty_rx_d = sfty_rx_q;
        angle_d   = angle_q;
        valid_d   = 1'b0;  // valid is a one-tick pulse, off by default
        done_o = 1'b0;

        case (state_q)

            IDLE: begin
                if (start_i) begin
                    cmd_reg_d = CMD_READ_AVAL;  // load command
                    bit_ctr_d = 4'd15;           // start at MSB
                    state_d   = CSQ_LOW;
                end
            end

            // CSQ_LOW: CSQ goes low this tick, data_oe=1, bit[15] pre-driven, SCK=0.
            // One idle SCK half-period before the first rising edge, satisfying
            // the SSC setup time for CSQ→SCK.
            CSQ_LOW: state_d = TX_CLK_HI;

            // TX_CLK_HI: SCK=1. The sensor samples cmd_reg_q[bit_ctr_q].
            // data_out is driven by the combinatorial assignment below (uses
            // bit_ctr_d so the bit is pre-loaded relative to the next rise).
            TX_CLK_HI: state_d = TX_CLK_LO;

            // TX_CLK_LO: SCK=0. Advance counter for the next bit, or finish TX.
            TX_CLK_LO: begin
                if (bit_ctr_q > 0) begin
                    bit_ctr_d = bit_ctr_q - 4'd1;
                    state_d   = TX_CLK_HI;
                end else begin
                    bit_ctr_d = 4'd15;   // pre-load for the RX phase
                    state_d   = TURNAROUND;
                end
            end

            // TURNAROUND: SCK=0, data_oe=0 (DATA released to hi-Z).
            // The sensor detects the released line and starts driving bit[15]
            // of the data word, which will be stable before the next SCK rise.
            TURNAROUND: state_d = RX_CLK_HI;

            // RX_CLK_HI: SCK=1. The sensor had set its output bit after the
            // previous SCK falling edge; the bit is stable now → sample it.
            RX_CLK_HI: begin
                data_rx_d[bit_ctr_q] = data_in;  // MSB-first into [15:0]
                state_d = RX_CLK_LO;
            end

            // RX_CLK_LO: SCK=0. Advance, or switch to safety phase.
            RX_CLK_LO: begin
                if (bit_ctr_q > 0) begin
                    bit_ctr_d = bit_ctr_q - 4'd1;
                    state_d   = RX_CLK_HI;
                end else begin
                    bit_ctr_d = 4'd15;   // pre-load for safety phase
                    state_d   = SFTY_CLK_HI;
                end
            end

            // SFTY_CLK_HI: SCK=1. Sample one bit of the safety word.
            // The safety word is automatically appended by the TLE5012B
            // after every data word (ND >= 1); no extra command needed.
            SFTY_CLK_HI: begin
                sfty_rx_d[bit_ctr_q] = data_in;
                state_d = SFTY_CLK_LO;
            end

            // SFTY_CLK_LO: SCK=0. Advance, or latch final result and finish.
            SFTY_CLK_LO: begin
                if (bit_ctr_q > 0) begin
                    bit_ctr_d = bit_ctr_q - 4'd1;
                    state_d   = SFTY_CLK_HI;
                end else begin
                    // All 32 bits received. data_rx_q[14:0] holds the angle.
                    // data_rx_q[15] is RDAV (data-available flag), not angle data.
                    angle_d = data_rx_q[14:0];
                    valid_d = 1'b1;   // one-tick pulse
                    state_d = DONE;
                end
            end

            // DONE: CSQ=1 (deasserted). Hold angle until next transaction.
            // Wait for start_i to go low before accepting a new trigger.
            DONE: begin
                done_o = 1'b1;
                state_d = IDLE;
            end

            default: state_d = IDLE;

        endcase
    end

    // ── Output assignments ───────────────────────────────────────────────
    //
    // data_out: select the next command bit to be driven onto DATA.
    //   Uses bit_ctr_d (combinatorial next-value) so the bit is
    //   pre-selected before the SCK rising edge (improves setup time).
    //   This means:
    //     · In CSQ_LOW       → bit_ctr_d = 15 → DATA = cmd[15] (pre-driven)
    //     · In TX_CLK_HI     → bit_ctr_d = 15 → sensor samples cmd[15]  ✓
    //     · In TX_CLK_LO(15) → bit_ctr_d = 14 → DATA changes to cmd[14]
    //     · In TX_CLK_HI     → bit_ctr_d = 14 → sensor samples cmd[14]  ✓
    //     · … and so on down to bit 0.
    assign data_out = cmd_reg_q[bit_ctr_d];

    // data_oe: drive DATA only during the command-transmit phase.
    //   Released (hi-Z) during TURNAROUND, all RX states, IDLE, and DONE.
    assign data_oe = (state_q == CSQ_LOW)  |
                      (state_q == TX_CLK_HI) |
                      (state_q == TX_CLK_LO);

    // sck_o: high during all three "clock-high" states.
    assign sck_o = (state_q == TX_CLK_HI)  |
                    (state_q == RX_CLK_HI)   |
                    (state_q == SFTY_CLK_HI);

    // csq_o: active LOW — deasserted (HIGH) only in IDLE and DONE.
    assign csq_o = (state_q == IDLE) | (state_q == DONE);

    assign angle_o = angle_q;
    assign valid_o = valid_q;

endmodule