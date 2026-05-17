/**
Driver for a stepper motor CW or CCW, connecting all the different files

#(
parameter DIVIDER_LEN = 10000 // 5000000 Hz tick
)(
input        MAX10_CLK1_50,  // 50 MHz clock
input  [1:0] KEY,            // Buttons
inout  [9:0] ARDUINO_IO,     // Header pins
output [9:0] LEDR,           // LEDs
input  [9:0] SW,             // Switches
output [7:0] HEX0,           // 7-segment display
output [7:0] HEX1,           // 7-segment display
output [7:0] HEX2,           // 7-segment display
output [7:0] HEX3,           // 7-segment display
output [7:0] HEX4            // 7-segment display
);

logic clk;
logic reset;
logic enable_i;
logic direction_i;
logic step_enable;
logic direction_o;
**/

module MDriver #()(
    input logic clk_i,
    input logic enable_i,
    input logic direction_i,
    input logic step_enable_i
);

// Signal definition
logic tick;


// sw_in[0] on-off button strobe
// sw_in[1] direction button strobe
logic unsigned [1:0] sw_in;

// sw_in[0] on-off debounced
// sw_in[1] direction debounced
logic unsigned [1:0] sw_in_debounced;

// Signal assignment
assign clk = MAX10_CLK1_50;
assign sw_in[0] = SW[0];
assign sw_in[1] = SW[1];
assign enable_i = sw_in_debounced[0];
assign direction_i = sw_in_debounced[1];

// HERE I SURELY NEED TO ASSIGN MORE BUTTONS AND SO ON.... ???

// Generate a reset pulse on power-up
ResetGenerator resetGenerator(
    .clk_i  (clk),
    .reset_o(reset)
);

// generate the tick (one pulse every 1/3 s approximately)
SignalFreq #(.DIVIDER(DIVIDER_LEN), .REG_W(24)) signalFreq(
    .clk_i (clk),
    .reset_i(reset),
    .tick_o (tick)
);

genvar i;
generate
    for(i=0; i<2; i++) begin: generate_debouncer
        Debouncer #(.COUNT_LEN(DIVIDER_LEN)) debounce(
            .clk_i(clk),
            .reset_i(reset),
            .bouncing_i(sw_in[i]), // ...??? I'm not sure if it is debounced properly, since we need both states of the switch
            .debounced_o(sw_in_debounced[i])
        );
    end
endgenerate

DriverStateMachine driverStateMachine(
    .clk_i(clk),
    .enable_i(enable_i),
    .direction_i(direction_i),
    .direction_o(direction_o),
    .step_o(step_enable)    
);

assign ARDUINO_IO[0] = direction_o;
assign ARDUINO_IO[1] = step_enable && tick;

endmodule