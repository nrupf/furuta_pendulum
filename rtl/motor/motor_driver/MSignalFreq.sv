/*
 Generate the a square wave signal, at another frequency than the 50 MHz clock
 */
 
module SignalFreq
  #(
    parameter DIVIDER = 50, 
    parameter REG_W = 24
  )(
    input logic clk_i,
    input logic reset_i, 
    output logic tick_o
  );

  // The counter register
  logic unsigned [REG_W-1:0] counter_q;
  logic square_q;

  always_ff @(posedge clk_i) begin
    if (reset_i) begin
      counter_q <= 0;
      square_q <= 0;
    end else begin
      if(counter_q == DIVIDER-1) begin
        counter_q <= 0;
        square_q <= ~square_q;
      end else begin
        counter_q <= counter_q + 'd1;
      end
    end
  end  // ff

  assign tick_o = square_q;
endmodule
