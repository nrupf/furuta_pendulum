module PID_loop #(
    parameter int FRAC_BITS     = 8,
    parameter int INT_MAX       =  20_000,
    parameter int INT_MIN       = -20_000
)(

    input logic clk_fpga,
    input logic rst_n,
    input logic enable,

    input logic [15:0] K_i,
    input logic [15:0] K_d,
    input logic [15:0] K_p,

    input logic [13:0] angle,
    input logic [13:0] angle_0,

    output logic signed [31:0] error_correction,
    output logic sat_flag // high when output is clamped
);


    // STAGE 1
    logic signed [14:0] error;
    logic signed [14:0] previous_error;
    logic signed [14:0] derivative;
    logic signed [31:0] integral;

    logic signed [31:0] int_next;
    assign int_next = integral + {{17{error[14]}}, error}; // sign-extend from 15 bits to 32

    always_ff @(posedge clk_fpga) begin
        if (!rst_n) begin
            error <= '0;
            previous_error <= '0;
            derivative <= '0;
            integral <= '0;
        end
        else if(enable) begin

        error <= $signed({1'b0, angle_0}) - $signed({1'b0, angle});     // range: -16383 to +16383

        derivative <= error - previous_error;
        previous_error = error;

        if (int_next > INT_MAX) integral <= INT_MAX;
        else if (int_next < INT_MIN) integral <= INT_MIN;
        else integral <= int_next;
        end
    end

    // STAGE 2
    logic signed [31:0] p_term;
    logic signed [47:0] i_term;
    logic signed [31:0] d_term;

    always_ff @(posedge clk_fpga) begin
        if (!rst_n) begin
            p_term <= '0;
            i_term <= '0;
            d_term <= '0;
        end else if (enable) begin
            p_term <= $signed({1'b0, K_p}) * $signed({{1{error[14]}}, error});
            i_term <= $signed({1'b0, K_i}) * integral;
            d_term <= $signed({1'b0, K_d}) * $signed({{1{derivative[14]}}, derivative});
        end
    end


    // STAGE 3
    localparam signed [47:0] OUTMAX = 48'h0000_7FFF_FFFF;
    localparam signed [47:0] OUTMIN = 48'hFFFF_8000_0000;

    logic signed [47:0] pid_sum;
    logic signed [47:0] pid_scaled;

    assign pid_sum = {{16{p_term[31]}}, p_term} + i_term + {{16{d_term[31]}}, d_term};

    assign pid_scaled = pid_sum >>> FRAC_BITS;

    always_ff @(posedge clk_fpga) begin
        if(!rst_n) begin
            error_correction <= '0;
            sat_flag <= 1'b0;
        end else if(enable) begin
            if (pid_scaled > OUTMAX) begin
                error_correction <= 32'h7FFF_FFFF;
                sat_flag <= 1'b1;
            end else if(pid_scaled < OUTMIN) begin
                error_correction <= 32'h8000_0000;
                sat_flag <= 1'b1;
            end else begin
                error_correction <= pid_scaled[31:0];
                sat_flag <= 1'b0;
            end
        end
    end


endmodule