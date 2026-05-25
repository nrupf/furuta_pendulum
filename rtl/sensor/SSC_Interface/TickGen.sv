/*
 Generate the tick, which is 1 for one clock cycle every DIVIDER clock cycles.
 */
module TickGen #(
    parameter DIVIDER = 50, 
    parameter REG_W = 24
  )(
    input logic clk_i,
    input logic reset_i, 
    output logic tick_o
  );

  // The counter register
  logic unsigned [REG_W-1:0] counter_q;
  
  always_ff @(posedge clk_i) begin
    if (reset_i  || counter_q == DIVIDER - 1) begin // changed here to == DIVIDER - 1 from == DIVIDER
      counter_q <= 0;
    end else begin
      counter_q <= counter_q + 'd1;
    end
  end

  assign tick_o = (counter_q == 0);
endmodule
