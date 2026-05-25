/**
Driver for a stepper motor CW or CCW, connecting all the different files
**/

module MDriver (
        input logic clk_i,
        input logic reset_i,
        input logic enable_i,
        input logic direction_i,
        input logic [30:0] correction_i,

        output logic driver_direction_o,
        output logic driver_step_signal_o
    );

    logic square_wave_M;
    logic [24:0] divider;

    // -------------------------------------------------------------------------
    // STARTUP STATE MACHINE
    //   WAITING : holds divider at 0 (motor stopped) until first enable_i pulse
    //   RUNNING : normal operation — correction_i drives speed, direction_i drives dir
    // -------------------------------------------------------------------------
    typedef enum logic { WAITING, RUNNING } startup_t;
    startup_t startup_state;

    always_ff @(posedge clk_i) begin
        if (reset_i)
            startup_state <= WAITING;
        else if (startup_state == WAITING && enable_i)
            startup_state <= RUNNING;
        // stays RUNNING forever until next reset
        default: startup_state <= WAITING;
    end

    // -------------------------------------------------------------------------
    // LOOK-UP TABLE: correction magnitude → step frequency divider
    // -------------------------------------------------------------------------
    localparam logic [24:0] DIV0  = 0;       // 0 Hz (motor off)
    localparam logic [24:0] DIV1  = 250000;  // 100 Hz
    localparam logic [24:0] DIV2  = 125000;  // 200 Hz
    localparam logic [24:0] DIV3  = 83333;   // 300 Hz
    localparam logic [24:0] DIV4  = 62500;   // 400 Hz
    localparam logic [24:0] DIV5  = 50000;   // 500 Hz
    localparam logic [24:0] DIV6  = 41666;   // 600 Hz
    localparam logic [24:0] DIV7  = 35714;   // 700 Hz
    localparam logic [24:0] DIV8  = 31250;   // 800 Hz
    localparam logic [24:0] DIV9  = 27777;   // 900 Hz
    localparam logic [24:0] DIV10 = 25000;   // 1000 Hz

    logic [4:0] msb_pos;
    logic       mag_nonzero;

    always_comb begin
        msb_pos     = 5'd0;
        mag_nonzero = 1'b0;
        for (int i = 30; i >= 0; i--) begin
            if (correction_i[i]) begin
                msb_pos     = i[4:0];
                mag_nonzero = 1'b1;
                break;
            end
        end
    end

    logic [24:0] divider_from_correction;
    always_comb begin
        if (!mag_nonzero)
            divider_from_correction = DIV0;
        else case (msb_pos)
            5'd30, 5'd29, 5'd28: divider_from_correction = DIV10;
            5'd27, 5'd26, 5'd25: divider_from_correction = DIV9;
            5'd24, 5'd23, 5'd22: divider_from_correction = DIV8;
            5'd21, 5'd20, 5'd19: divider_from_correction = DIV7;
            5'd18, 5'd17, 5'd16: divider_from_correction = DIV6;
            5'd15, 5'd14, 5'd13: divider_from_correction = DIV5;
            5'd12, 5'd11, 5'd10: divider_from_correction = DIV4;
            5'd9,  5'd8,  5'd7:  divider_from_correction = DIV3;
            5'd6,  5'd5,  5'd4:  divider_from_correction = DIV2;
            5'd3,  5'd2,  5'd1:  divider_from_correction = DIV1;
            5'd0:                divider_from_correction = DIV1;
            default:             divider_from_correction = DIV0;
        endcase
    end

    // Gate divider: zero (stopped) while waiting for first enable
    assign divider = (startup_state == RUNNING) ? divider_from_correction : DIV0;

    MSignalFreq mSignalFreq(
        .clk_i        (clk_i),
        .reset_i      (reset_i),
        .divider      (divider),
        .square_wave_o(square_wave_M)
    );

    assign driver_direction_o  = direction_i;
    assign driver_step_signal_o = square_wave_M;  // step_enable_gated removed: reset=stop, running=always enabled

endmodule