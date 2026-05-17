/*
 Generate the a square wave signal, at another frequency than the 50 MHz clock
 */
 
module MSignalFreq (
    input logic clk_i,
    input logic reset_i, 
    input logic [24:0] divider,

    output logic square_wave_o
  );

  // The counter register
  logic unsigned [31:0] counter_q; // We just use [31:0] so 32 bit number, such that we are sure we have enough space, as could only set this using a parameter, but this would only work during compile time, so just fix enough space, such that we do not run into problems here
  logic square_q;
  logic [24:0] divider_d;          // delay line to detect changes

  // Register the previous divider value
  always_ff @(posedge clk_i) begin
      divider_d <= divider;
  end


  always_ff @(posedge clk_i) begin
    if (reset_i || (divider == '0) || (divider != divider_d)) begin
      counter_q <= 0;
      square_q <= 0;
    end else begin
      if(counter_q == divider-1) begin
        counter_q <= 0;
        square_q <= ~square_q;
      end else begin
        counter_q <= counter_q + 'd1;
      end
    end
  end  // ff

  assign square_wave_o = square_q;
endmodule
