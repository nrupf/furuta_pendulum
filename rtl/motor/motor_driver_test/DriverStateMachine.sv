/**
State machine for driving a stepper motor CW or CCW

Marvin Schmidiger 31.03.2026
**/

module DriverStateMachine (
    input logic clk_i,
    input logic reset_i,
    input logic enable_i,
    input logic direction_i,

    output logic direction_o,
    output logic step_o
);

typedef enum logic [1:0]{
    IDLE,   // motor stopped
    CW,     // rotating clockwise
    CCW     // rotating counter-clockwise
} state_e;

typedef struct packed {
    state_e state;
    logic unsigned dir;
    logic unsigned step;
} state_t;

state_t state_q, state_d;


// sequential logic block (the flipflops)
always_ff @(posedge clk_i) begin
    if (reset_i) begin
        state_q <= '{IDLE, 1'b0, 1'b0};
    end else if (!enable_i) begin
        state_q <= '{IDLE, 1'b0, 1'b0};
    end else begin
        state_q <= state_d;
    end
end

// next state logic (combinational logic)
always_comb begin
    // defaults
    state_d.state = state_q.state;
    state_d.dir = state_q.dir;
    state_d.step = 1'b0;

    case(state_q.state)
        IDLE: begin
            if (enable_i) begin
                if (!direction_i) state_d.state = CW;
                else state_d.state = CCW;
            end
            else begin
                state_d.dir = 1'b0;
                state_d.step = 1'b0;
            end
        end

        CW: begin
            if (!enable_i) state_d.state = IDLE;
            else begin
                if (direction_i) begin
                    state_d.state = CCW;
                    state_d.dir = 1'b1;
                    state_d.step = 1'b1;
                end
                else begin
                    state_d.dir = 1'b0;
                    state_d.step = 1'b1;
                end
            end
        end

        CCW: begin
            if (!enable_i) state_d.state = IDLE;
            else begin
                if (!direction_i) begin
                    state_d.state = CW;
                    state_d.dir = 1'b0;
                    state_d.step = 1'b1;
                end
                else begin
                    state_d.dir = 1'b1;
                    state_d.step = 1'b1;
                end
            end
        
        end

        default: begin
            state_d.state = IDLE;
            state_d.dir = 1'b0;
            state_d.step = 1'b0;
        end
    endcase
end

// the output
assign direction_o = state_q.dir;
assign step_o = state_q.step;

endmodule