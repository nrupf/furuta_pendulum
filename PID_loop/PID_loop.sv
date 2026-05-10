module PID_loop(

    input logic clk_fpga,

    input logic [15:0] K_i,
    input logic [15:0] K_d,
    input logic [15:0] K_p,

    input logic [14:0] angle,
    input logic [14:0] angle_0,

    output logic [31:0] error_correction
    );

    logic signed [15:0] error;
    logic signed [15:0] previous_error;

    logic signed [31:0] integral;
    logic signed [31:0] derivative;

    always_ff @(posedge clk_fpga) begin

        error <= angle_0 - angle;
        
        integral <= integral + error;

        derivative <= error - previous_error;

        error_correction <= K_p * error + K_i * integral + K_d * derivative;

        previous_error <= error;
    end


endmodule