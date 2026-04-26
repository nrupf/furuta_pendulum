/**
Debounce the switches (stable signal)
**/

module Debouncer#(
    parameter COUNT_LEN = 500
  )
  (
    input logic  clk_i,     // the clock
    input logic  reset_i,   // reset, active high
    input logic  bouncing_i,  // input
    output logic debounced_o  // output
  );

  typedef enum logic [1:0] {
    IDLE_LOW,      // wait for the input to go high
    COUNT_TO_HIGH, // wait for the high level to stabilize
    IDLE_HIGH,     // wait for the input to go low
    COUNT_TO_LOW   // wait for the low level to stabilize
  } state_enum_e;
  
  typedef struct packed{
    state_enum_e state;
    logic unsigned [23:0] counter;
  } state_t;
  
  state_t state_q;
  state_t state_d;

  always_comb begin
    state_d.state = state_q.state;  // by default: maintain current state
    state_d.counter = 0;  // by default: set the counter to 0
    
    case(state_q.state)
      IDLE_LOW: begin
        state_d.counter = 0;
        if (bouncing_i == 1) state_d.state = COUNT_TO_HIGH;
      end
      
      COUNT_TO_HIGH: begin
        if (bouncing_i == 1) begin
          if (state_q.counter < COUNT_LEN) state_d.counter = state_q.counter + 1;
          else state_d.state = IDLE_HIGH;
        end else state_d.state = IDLE_LOW;
      end
        
      IDLE_HIGH: begin
        state_d.counter = 0;
        if (bouncing_i == 0) state_d.state = COUNT_TO_LOW;
      end
        
      COUNT_TO_LOW: begin
        if (bouncing_i == 0) begin
          if (state_q.counter < COUNT_LEN) state_d.counter = state_q.counter + 1;
          else state_d.state = IDLE_LOW;
        end else state_d.state = IDLE_HIGH;
      end
        
      default: ;
      
    endcase
  end

  always_ff @(posedge clk_i)begin
    if (reset_i == 1) begin
      // reset state and counter
      state_q.counter <= 0;
      state_q.state <= IDLE_LOW;
    end 
    else begin
      // update state and counter
      state_q <= state_d;
    end
  end

  assign debounced_o = ((state_q.state == COUNT_TO_LOW) | (state_q.state == IDLE_HIGH));

endmodule
