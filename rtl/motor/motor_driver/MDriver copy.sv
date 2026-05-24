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

    logic square_wave_M; // square_wave_M is used for the signal output of the MSignalFreq.sv file
    logic direction_M; // direction_M is the signal, which gets put on the DIR input of the Big Easy Driver
    logic step_enable_M; // step_enableg_M is a signal, which is 1 when the motor should either turn CW or CCW and gets put in an and link onto the STEP input of the Big Easy Driver
    logic [24:0] divider; // divider used for storing the value from the look up table depending on the correction for further processing


    // Look-Up Table for divider values, implementing 11 different cases, because of our maximal frequency of 1 kHz,
    // and the duration of how long the step signal on the big easy driver is at the same specific signal, at the
    // moment we decided that we have it at the same signal for 10 ms (so we update our loop every 10 ms) therefore
    // 11 cases are good for now.
    // Pre‑computed dividers 
    localparam logic [24:0] DIV0  = 0;          // 0 Hz (motor off)
    localparam logic [24:0] DIV1  = 250000;     // 100 Hz
    localparam logic [24:0] DIV2  = 125000;     // 200 Hz
    localparam logic [24:0] DIV3  = 83333;      // 300 Hz
    localparam logic [24:0] DIV4  = 62500;      // 400 Hz
    localparam logic [24:0] DIV5  = 50000;      // 500 Hz
    localparam logic [24:0] DIV6  = 41666;      // 600 Hz
    localparam logic [24:0] DIV7  = 35714;      // 700 Hz
    localparam logic [24:0] DIV8  = 31250;      // 800 Hz
    localparam logic [24:0] DIV9  = 27777;      // 900 Hz
    localparam logic [24:0] DIV10 = 25000;      // 1000 Hz

    // Priority encoder – find highest set bit (0..31) or none
    logic [4:0] msb_pos;          // 0..31, value only valid if mag != 0
    logic       mag_nonzero;

    always_comb begin
        msb_pos = 5'd0;
        mag_nonzero = 1'b0;
        for (int i = 30; i >= 0; i--) begin
            if (correction_i[i]) begin
                msb_pos = i[4:0];
                mag_nonzero = 1'b1;
                break;
            end
        end
    end

    // Map MSB position to divider
    always_comb begin
        if (!mag_nonzero)
            divider = DIV0;
        else case (msb_pos)
            // Grouping: higher MSB -> smaller divider
            5'd30, 5'd29, 5'd28: divider = DIV10;
            5'd27, 5'd26, 5'd25: divider = DIV9;
            5'd24, 5'd23, 5'd22: divider = DIV8;
            5'd21, 5'd20, 5'd19: divider = DIV7;
            5'd18, 5'd17, 5'd16: divider = DIV6;
            5'd15, 5'd14, 5'd13: divider = DIV5;
            5'd12, 5'd11, 5'd10: divider = DIV4;
            5'd9, 5'd8, 5'd7:    divider = DIV3;
            5'd6, 5'd5, 5'd4:    divider = DIV2;
            5'd3, 5'd2, 5'd1:    divider = DIV1;
            5'd0:                divider = DIV1;
            default:             divider = DIV0;
        endcase
    end


    // generate the square wave signal with the frequency corresponding to the correction of the PID-loop 
    MSignalFreq mSignalFreq(
        .clk_i (clk_i),
        .reset_i(reset_i),
        .divider(divider),
        .square_wave_o (square_wave_M)
    );

    MDriverStateMachine mDriverStateMachine(
        .clk_i(clk_i),
        .reset_i(reset_i),
        .freq_update_i(enable_i),
        .direction_i(direction_i),
        .direction_o(direction_M),
        .step_o(step_enable_M)    
    );

    // Synchronise step enable to the low phase of the square wave
    logic step_enable_gated;

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            step_enable_gated <= 1'b0;
        end else if (!step_enable_M && square_wave_M == 1'b0) begin
            step_enable_gated <= 1'b0;        // disable only when low
        end else if (step_enable_M && square_wave_M == 1'b0) begin
            step_enable_gated <= 1'b1;        // enable when low
        end
        // else hold state
    end

    assign driver_direction_o = direction_M;
    assign driver_step_signal_o = step_enable_gated & square_wave_M;

endmodule