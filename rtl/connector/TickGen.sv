/*
 Generate the tick, which is 1 for one clock cycle every DIVIDER clock cycles.
 */
module TickGen
  #(
    parameter DIVIDER = 5, 
    parameter REG_W = 3
  )(
    input clk_i,
    input reset_i, 
    output tick_o
  );

  // The counter register
  logic unsigned [REG_W-1:0] counter_q;
  
  always_ff @(posedge clk_i) begin
    if (reset_i  || counter_q == DIVIDER) begin
      counter_q <= 0;
    end else begin
      counter_q <= counter_q + 'd1;
    end
  end  // ff

  assign tick_o = (counter_q == 0);
endmodule
