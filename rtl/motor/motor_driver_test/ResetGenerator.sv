/*
Generate an active-high reset pulse for a few clock cycles on power-up.
*/

module ResetGenerator (
  input logic clk_i,
  output logic reset_o
);
  logic unsigned [2:0] counter;

  initial begin
    counter = 3'b000;
  end
  
  always_ff @(posedge clk_i) begin
    if (counter < 3'b111)
      counter <= counter + 1;
  end

  assign reset_o = counter != 3'b111;
endmodule
