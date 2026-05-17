// =============================================================================
// MODULE: PID_loop
// =============================================================================
//
// PURPOSE:
//   Implements a discrete-time PID (Proportional-Integral-Derivative) controller
//   for the Furuta pendulum balancing loop. Given the current pendulum angle and
//   a target zero-angle, it computes a signed motor correction to be applied each
//   control cycle.
//
//   The PID idea in one sentence:
//     correction = Kp*(how far off we are)
//               + Ki*(how long we've been off, accumulated)
//               + Kd*(how fast the error is changing)
//
// INPUTS:
//   clk_i               - System clock (all registers update on rising edge)
//   reset_i             - Synchronous active-high reset; clears all state
//   enable_i            - Strobe: pulse high for exactly 1 clock cycle when a
//                         fresh angle reading is available from the sensor
//
//   K_p [15:0]          - Proportional gain (unsigned fixed-point)
//   K_i [15:0]          - Integral gain (unsigned fixed-point)
//   K_d [15:0]          - Derivative gain (unsigned fixed-point)
//
//   integral_max_i [31:0] - Anti-windup clamp: integral is capped to ±integral_max_i.
//                         Prevents the integrator from accumulating unboundedly
//                         when the pendulum is held away from zero for a long time.
//   integral_decay_bits [5:0]
//                       - Controls integral "forgetting": each cycle the integral
//                         is reduced by (integral >> integral_decay_bits) before
//                         adding the new error. A value of 4 keeps 15/16 of history.
//                         Higher values = longer memory. Set to ~4 as a starting point.
//
//   angle_raw_i [14:0]  - Raw 15-bit angle reading from the TLE5012B sensor (0..32767)
//   angle_0     [14:0]  - Calibrated zero angle: the raw reading that corresponds
//                         to the pendulum perfectly upright. Subtracted from
//                         angle_raw_i to get a signed error around zero.
//
// OUTPUTS:
//   correction_direction - Sign of the computed correction:
//                            0 = positive (motor turns one way)
//                            1 = negative (motor turns the other way)
//   correction_value [30:0]
//                       - Magnitude of the correction (unsigned, 31-bit).
//                         Together with correction_direction this encodes the
//                         full signed PID output split into sign + magnitude.
//   sat_flag            - Saturation flag: goes high when the PID output was
//                         clamped to the maximum representable value. Useful for
//                         debugging — if this is constantly high, your gains are
//                         too large or the pendulum is too far from upright.
//   done_o              - Pulses high for exactly 1 clock cycle when
//                         correction_direction and correction_value are valid.
//                         Downstream logic (motor driver) should sample outputs
//                         on this pulse.
//
// PIPELINE (3 stages, 2 registered):
//   Stage 1 (registered, triggered by enable_i):
//     - Computes error = angle_raw_i - angle_0  (signed)
//     - Computes derivative = current_error - previous_error
//     - Updates integral with decay and anti-windup clamping
//     - Pulses s1_done to trigger Stage 3
//
//   Stage 2 (combinational, zero latency):
//     - Multiplies error, integral, derivative by K_p, K_i, K_d respectively
//     - Results are wider to hold the full product without overflow
//
//   Stage 3 (registered, triggered by s1_done):
//     - Sums all three PID terms (sign-extended to 48 bits)
//     - Clamps result to output range (±2^31 - 1)
//     - Splits into correction_direction (sign) + correction_value (magnitude)
//     - Pulses done_o
//
// FIXED-POINT NOTE:
//   Gains K_p, K_i, K_d are treated as integers here. If you want fractional
//   gains (e.g. Kp = 0.5), shift your angle values or right-shift the PID sum
//   before the output stage. The current output is the raw product — scaling
//   is left to the motor driver or gain tuning.
// =============================================================================

module PID_loop #(
)(
    input  logic        clk_i,       // FPGA clock
    input  logic        reset_i,
    input  logic        enable_i,    // pulse high for 1 cycle when a new angle is ready

    input  logic [15:0] K_p,
    input  logic [15:0] K_i,
    input  logic [15:0] K_d,

    // maximum value of integral to avoid wind-up
    // declared signed so comparisons with signed integral_next work correctly
    input  logic signed [31:0] integral_max_i,

    // how many bits of old integral to throw away, for tuning how much integral remembers
    // set to ca 4 (guess). 6 bits is enough since max meaningful shift is ~32
    input  logic [5:0]  integral_decay_bits,

    input  logic [14:0] angle_raw_i,   // raw angle input
    input  logic [14:0] angle_0,       // calibrated zero angle

    output logic        correction_direction,  // sign of correction: 0 = positive, 1 = negative
    output logic [30:0] correction_value,      // magnitude of correction
    output logic        sat_flag,              // high when output is clamped
    output logic        done_o                 // pulses high for 1 cycle when output is valid
);


    // =========================================================================
    // STAGE 1
    // calculate current error, derivative and integral (sum of past errors)
    // triggered by enable_i
    // when done, pulses s1_done for exactly 1 cycle to trigger stage 3
    // =========================================================================

    // convert unsigned 15-bit angles to positive, signed, 16-bit angles
    // subtract zero angle from incoming angle to get correct sign
    //
    // SV NOTE: {1'b0, angle_raw_i} concatenates a 0 bit in front of the 15-bit
    // angle, making it 16 bits. $signed() tells SV to treat it as a signed number.
    // Without $signed(), the subtraction would be unsigned and negative results
    // would wrap around instead of going negative.
    // Result range: -16383 to +16383
    logic signed [15:0] current_error;
    assign current_error = $signed({1'b0, angle_raw_i}) - $signed({1'b0, angle_0});

    logic signed [15:0] error;           // error from previous cycle (registered)
    logic signed [15:0] previous_error;
    logic signed [15:0] derivative;
    logic signed [31:0] integral;

    // we want the moving average of the past errors.
    // we do this by adding the new error with weight 1/integral_stored_vals
    //
    // SV NOTE: >>> is the arithmetic right shift — it shifts right and fills
    // with the sign bit, so negative numbers stay negative.
    // This is equivalent to dividing by 2^integral_decay_bits.
    // e.g. integral_decay_bits=4 keeps 15/16 of the old integral each cycle.
    //
    // SV NOTE: this is a combinational assign (a wire, not a register).
    // It updates instantly whenever integral or error changes,
    // so the always_ff below always sees the freshly computed value.
    logic signed [31:0] integral_next;
    assign integral_next = integral - (integral >>> integral_decay_bits) + error;

    // s1_done: pulses for 1 cycle when stage 1 has written fresh values to its registers.
    // Stage 3 uses this as its trigger instead of enable_i, so if stage 1 ever takes
    // more cycles (e.g. you add a registered intermediate step), stage 3 still triggers
    // at exactly the right time without any changes needed downstream.
    logic s1_done;

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            error          <= '0;
            previous_error <= '0;
            derivative     <= '0;
            integral       <= '0;
            s1_done        <= 1'b0;
        end
        else if (enable_i) begin
            // save new error
            error          <= current_error;

            // DERIVATIVE CALCULATION
            // change in error since last cycle — tells us how fast we're moving
            // uses current_error directly (not the registered error) to avoid 1-cycle lag
            derivative     <= current_error - error;
            previous_error <= error;

            // INTEGRAL CALCULATION
            // check bounds of integral to prevent wind-up
            // (integral_next is the combinational wire computed above)
            if      (integral_next >  integral_max_i) integral <=  integral_max_i;
            else if (integral_next < -integral_max_i) integral <= -integral_max_i;
            else                                    integral <= integral_next;

            s1_done <= 1'b1;  // tell stage 3 that fresh data is in the registers
        end
        else begin
            s1_done <= 1'b0;  // only pulse for one cycle
        end
    end


    // =========================================================================
    // STAGE 2 (combinational — zero cycle delay, no done signal needed)
    // multiply each term by its gain
    // outputs update instantly when stage 1 registers settle
    // =========================================================================

    // SV NOTE: multiplying an N-bit number by an M-bit number produces an (N+M)-bit result.
    // We size each output to exactly hold the product:
    //   K (16-bit) × error (16-bit)    → 32-bit result for p_term and d_term
    //   K (16-bit) × integral (32-bit) → 48-bit result for i_term
    //
    // SV NOTE: {1'b0, K_p} prepends a 0 sign-bit to the unsigned 16-bit gain,
    // making it a valid 17-bit signed number for signed multiplication.
    // Without this, mixing signed × unsigned gives wrong results in SV.
    logic signed [31:0] p_term;
    logic signed [47:0] i_term;
    logic signed [31:0] d_term;

    always_comb begin
        p_term = $signed({1'b0, K_p}) * error;
        i_term = $signed({1'b0, K_i}) * integral;
        d_term = $signed({1'b0, K_d}) * derivative;
    end


    // =========================================================================
    // STAGE 3
    // sum all three terms, remove fixed-point scaling, then clamp to output range
    // triggered by s1_done — so if stage 1 ever takes more cycles, this still works
    // when done, pulses done_o for exactly 1 cycle
    // =========================================================================

    // SV NOTE: before adding signals of different widths, we sign-extend them
    // to the same width (48 bits) by replicating the sign bit.
    // {{16{p_term[31]}}, p_term} means: repeat bit 31 (the sign bit) 16 times,
    // then append the original 32-bit value — giving a correct 48-bit signed number.
    logic signed [47:0] pid_sum;
    assign pid_sum = {{16{p_term[31]}}, p_term}
                   + i_term
                   + {{16{d_term[31]}}, d_term};


    // saturation bounds — the output is 31-bit magnitude + 1-bit sign,
    // so max magnitude is 2^31 - 1 = 0x7FFF_FFFF
    // SV NOTE: the 'sh' prefix means signed hex literal
    localparam signed [47:0] OUTMAX = 48'sh00007FFFFFFF;
    localparam signed [47:0] OUTMIN = 48'shFFFF80000000;

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            correction_direction <= 1'b0;
            correction_value     <= '0;
            sat_flag             <= 1'b0;
            done_o               <= 1'b0;
        end
        // triggered by s1_done, not enable_i — decoupled from cycle counting.
        // if you add more cycles to stage 1 later, this still triggers at the right time.
        // stage 2 is combinational so its outputs are already settled when s1_done arrives.
        else if (s1_done) begin
            if (pid_sum > OUTMAX) begin
                // clamp to maximum positive correction
                correction_direction <= 1'b0;
                correction_value     <= 31'h7FFF_FFFF;
                sat_flag             <= 1'b1;
            end
            else if (pid_sum < OUTMIN) begin
                // clamp to maximum negative correction (direction=1, full magnitude)
                correction_direction <= 1'b1;
                correction_value     <= 31'h7FFF_FFFF;
                sat_flag             <= 1'b1;
            end
            else begin
                // SV NOTE: pid_sum[31] is the sign bit of the 32-bit result.
                // We split the signed value into direction (sign) + magnitude (remaining bits and if - -> sign conversion).
                correction_direction <= pid_sum[31];
                correction_value     <= pid_sum[30:0];
                sat_flag             <= 1'b0;
                if (pid_sum[47]) begin
                    // Negative PID output → motor goes one direction
                    correction_direction <= 1'b1;
                    correction_value     <= 31'((-pid_sum)[30:0]);
                end else begin
                    // Positive PID output → motor goes other direction
                    correction_direction <= 1'b0;
                    correction_value     <= pid_sum[30:0];
                end
                sat_flag <= 1'b0;
            end
            done_o <= 1'b1;  // tell the outside world: output is valid this cycle
        end
        else begin
            done_o <= 1'b0;  // only pulse for one cycle
        end
    end

endmodule
