/***
 SSCPrimary.sv
 Top-level wrapper for the TLE5012B-E3005 SSC interface on the DE10-Lite.

 Instantiates:
   · TickGen       — generates the SCK half-period tick
   · SSCTransaction — combined TX+RX FSM

 Pin assignments
   sck_o   → ARDUINO_IO[2]   (sensor pin SCK)
   csq_o   → ARDUINO_IO[3]   (sensor pin CSQ, active LOW)
   data_io → ARDUINO_IO[4]   (sensor pin DATA, bidirectional)

 Marvin Schmidiger, April 2026
***/
module SSCPrimary (
    input           MAX10_CLK1_50,  // 50 MHz system clock (DE10-Lite)
    output [9:0]    LEDR,            // LEDs
    inout [9:0]     ARDUINO_IO
);
    logic                   clk_i;
    logic                   reset_i;        // active-high synchronous reset
    logic                   start_i;        // trigger one read transaction (hold high)
    logic unsigned [14:0]   angle_o;        // 15-bit angle result (AVAL[14:0])
    logic                   valid_o;        // 1 for one tick when angle_o is fresh
    // ── SSC pins to/from TLE5012B ──
    logic                   sck_o;          // SSC serial clock  → sensor SCK
    logic                   csq_o;          // SSC chip select   → sensor CSQ (active LOW)
                                            

    logic tick;
    logic data_out, data_oe, data_in;

    // ── Tri-state buffer for the bidirectional DATA line ──────────────────
    // When data_oe = 1 (TX phase): FPGA drives data_out onto data_io.
    // When data_oe = 0 (RX phase): data_io is hi-Z; sensor drives the line.
    assign ARDUINO_IO[7] = data_oe ? data_out : 1'bz; // SSC data line     → sensor DATA (bidirectional)
    assign data_in = ARDUINO_IO[7];
    assign ARDUINO_IO[8] = sck_o;
    assign ARDUINO_IO[9] = csq_o;
    assign clk_i = MAX10_CLK1_50;

    // Generate a reset pulse on power-up
    ResetGenerator resetGenerator(
        .clk_i  (clk_i),
        .reset_o(reset_i)
    );

    // ── Tick generator ────────────────────────────────────────────────────
    // DIVIDER = 50: tick fires once every 50 system clocks = 1 MHz tick.
    // Each FSM state lasts one tick → SCK frequency = tick / 2 = 500 kHz.
    // 500 kHz is well within the TLE5012B's 8 Mbit/s SSC limit.
    // REG_W = 6: counter only needs to reach 49 (fits in 6 bits).
    TickGen #(.DIVIDER(50), .REG_W(6)) u_tickgen (
        .clk_i  (clk_i),
        .reset_i(reset_i),           
        .tick_o (tick)          // 1 MHz tick for FSM states
    );

    // generating a periodic start pulse (100 Hz)
    localparam TICKS_PER_START = 10_000;   // 10 ms at 1 MHz tick
    logic [13:0] start_cnt;
    logic start_pulse;

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            start_cnt <= 0;
            start_pulse <= 1'b0;
        end else if (tick) begin // synchronize with the generated tick fo the FSM states
            if (start_cnt == TICKS_PER_START - 1) begin
                start_cnt <= 0;
                start_pulse <= 1'b1;
            end else begin
                start_cnt <= start_cnt + 1;
                start_pulse <= 1'b0;
            end
        end
    end
    assign start_i = start_pulse;   // guaranteed one tick_i-wide pulse every 10 ms

    // ── SSC transaction FSM ───────────────────────────────────────────────
    SSCTransaction u_ssc (
        .clk_i   (clk_i),
        .reset_i (reset_i),
        .tick_i  (tick),
        .start_i (start_i),
        .angle_o (angle_o),
        .valid_o (valid_o),
        .sck_o   (sck_o),
        .csq_o   (csq_o),
        .data_out(data_out),
        .data_oe (data_oe),
        .data_in (data_in)
    );

    // Debug: show angle on LEDs (lower 8 bits)
    assign LEDR[9:0] = angle_o[14:5];
    //assign LEDR[8] = valid_o;
    //assign LEDR[9] = tick;

endmodule
