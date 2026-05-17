
// =============================================================================
// connector.sv  —  Top-level orchestrator for the Furuta pendulum FPGA
//
// WHAT THIS MODULE DOES:
//   It is the "traffic controller" between three submodules:
//     1. SSCSensor  — reads the pendulum angle from the TLE5012B over SSC/SPI
//     2. PID_loop   — computes a signed motor correction from the angle error
//     3. MotorDriver (external) — receives CORR + DIR signals for the BigEasyDriver
//
//   Each submodule uses a simple handshake:
//     - Connector pulses their input strobe (start_i / enable_i)
//     - Submodule does its work
//     - Submodule pulses done_o back
//   The connector chains these handshakes in sequence, once per control period.
//
// TUNABLE PARAMETERS (inputs, not hardcoded):
//   All gain values and timing parameters come in as input ports.
//   TODAY: tie them to constants or switches on your FPGA board.
//   LATER: connect them to APB bus registers written by a RISC-V over UART,
//          which gives you real-time tuning from your PC — no recompile needed.
//          The connector itself does NOT need to change for that upgrade.
//
// CONTROL LOOP TIMING:
//   A counter counts up to correction_fpga_cycles_i * (1/50MHz) -0.5ms (in clk_i cycles)
//   When it reaches the target, it fires a "tick" that starts a new sensor read.
//   At loop period, the signal is sent to the driver
//
// MOTOR INTERFACE (BigEasyDriver):
//   The BED takes two signals: STEP and DIR.
//   - DIR: set before each burst of steps. High = CCW, Low = CW.
//   - CORR: an absolute correction value. The motor driver then converts this to a stepping frequency using a lookup table
//   
//   
//
// STATE MACHINE:
//   IDLE         → wait for the period tick
//   WAIT_READOUT → Wait until correction_period (= time for which driver holds correction step freq constant) minus 0.5ms 
//   READ_SENSOR  → pulse sensor start, wait for sensor done_o
//   RUN_PID      → pulse PID enable, wait for PID done_o
//   WAIT_SEND    → Wait until full correction_period has passed
//   SEND_CORR    → send correction signal to driver
//   WAIT_PERIOD  → sit here until the next period tick
//
// =============================================================================
 
module connector (
    input  logic        clk_i,      // FPGA system clock (e.g. 50 MHz)
    input  logic        reset_i,    // synchronous active-high reset. Wire to a button on fpga
 
    // -------------------------------------------------------------------------
    // TUNABLE PARAMETERS — connect to APB registers later for real-time tuning.
    // -------------------------------------------------------------------------
 
    // Control loop frequency:
    //   correction_fpga_cycles_i: number of clock cycles of FPGA after which motor will start driving a new correction:
    //                        ex: new signal every 10ms -> correction_fpga_cycles_i = 10ms * 50MHz = 500'000 cycles
    //                        10s max -> 5e8 cycles -> 32bit is enough
    input  logic [31:0] correction_fpga_cycles_i,
 
    // Sensor SCK divider — see SSCSensor for formula:
    //   SCK = clk_i / (divider * 2)
    input  logic [7:0]  divider_sensorfreq_i,
 
    // PID gains (unsigned 16-bit integers):
    input  logic [15:0] K_p_i,
    input  logic [15:0] K_i_i,
    input  logic [15:0] K_d_i,
 
    // PID anti-windup and forgetting:
    input  logic signed [31:0] integral_max_i,  // set to approx 2^20 initially (guess)
    input  logic [5:0]  integral_decay_bits_i,  // set to approx 4 initially
 
    // Calibrated zero angle: the raw sensor reading when pendulum is perfectly upright.
    // Subtracted inside PID_loop to compute the error around zero.
    input  logic [14:0] angle_0_i,
 
    // Step scaling: right-shift applied to correction_value before counting steps.
    //   steps_to_send = correction_value >> step_scale_i
    //   Higher step_scale → fewer steps per correction → gentler response.
    //   Start with step_scale = 10 or so (tune from there).
    input  logic [4:0]  step_scale_i,
 
 
    // -------------------------------------------------------------------------
    // SENSOR INTERFACE — connect directly to TLE5012B pins
    // -------------------------------------------------------------------------
    inout  wire         sensor_data_pin,    // bidirectional DATA line
    output logic        sensor_sck_o,       // serial clock to sensor
    output logic        sensor_csq_o,       // chip select (active-low)
 
    // -------------------------------------------------------------------------
    // MOTOR INTERFACE — connect to BigEasyDriver STEP and DIR pins
    // -------------------------------------------------------------------------
    output logic        motor_step_o,       // each rising edge = one microstep
    output logic        motor_dir_o,        // direction: 0 = CW, 1 = CCW
 
    // -------------------------------------------------------------------------
    // DEBUG / STATUS OUTPUTS (optional — connect to LEDs or leave open)
    // -------------------------------------------------------------------------
    output logic        pid_sat_flag_o,     // high when PID output is saturated
    output logic [14:0] angle_raw_o         // current raw angle (for monitoring)
);
// =============================================================================
// 1. INTERNAL WIRES — connecting submodule ports together
// =============================================================================
 
    // --- Sensor wires ---
    logic        sensor_start;      // we pulse this to trigger a new sensor read
    logic [14:0] sensor_angle;      // 15-bit raw angle, valid when sensor_done=1
    logic        sensor_done;       // sensor pulses this when angle is ready
 
    // --- PID wires ---
    logic        pid_enable;        // we pulse this when we have a fresh angle
    logic        pid_correction_dir;  // 0 = positive correction, 1 = negative
    logic [30:0] pid_correction_val;  // magnitude of correction
    logic        pid_done;            // PID pulses this when output is valid


// =============================================================================
// 2. SUBMODULE INSTANTIATION
//    We wire the tunable inputs directly into the submodules.
//    When you add APB registers later, you connect those register outputs here
//    instead of the input ports — nothing else changes.
// =============================================================================
 
    SSCSensor sensor_inst (
        .clk_i                  (clk_i),
        .reset_i                (reset_i),
        .start_i                (sensor_start),
        .divider_sensorfreq_i   (divider_sensorfreq_i),
        .data_pin               (sensor_data_pin),
        .sck_o                  (sensor_sck_o),
        .csq_o                  (sensor_csq_o),
        .angle_raw_o            (sensor_angle),
        .done_o                 (sensor_done)
    );
 
    PID_loop pid_inst (
        .clk_i                  (clk_i),
        .reset_i                (reset_i),
        .enable_i               (pid_enable),
        .K_p                    (K_p_i),
        .K_i                    (K_i_i),
        .K_d                    (K_d_i),
        .integral_max           (integral_max_i),
        .integral_decay_bits    (integral_decay_bits_i),
        .angle_raw_i            (sensor_angle),
        .angle_0                (angle_0_i),
        .correction_direction   (pid_correction_dir),
        .correction_value       (pid_correction_val),
        .sat_flag               (pid_sat_flag_o),
        .done_o                 (pid_done)
    );
 
    typedef enum logic [2:0] {
        IDLE,         // wait for the period tick
        WAIT_READOUT, // Wait until correction_period (= time for which driver holds correction step freq constant) minus 0.5ms 
        READ_SENSOR,  // pulse sensor start, wait for sensor done_o
        RUN_PID,      // pulse PID enable, wait for PID done_o
        WAIT_SEND,    // Wait until full correction_period has passed
        SEND_CORR,    // send correction signal to driver
        WAIT_PERIOD,  // sit here until the next period tick
    } state_t;

    state_t state;

    // set waiting cycles (0.5ms before sending signal)
    logic [31:0] wait_readout_fpga_cycles = correction_fpga_cycles_i - 25_000;


    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            state           <= IDLE;
            fpga_cycle_counter <= 1b'0;
            sensor_start    <= 1'b0;
            pid_enable      <= 1'b0;
            motor_step_o    <= 1'b0;
            motor_dir_o     <= 1'b0;
        end else begin
 
            // Default: strobe signals are 0 unless we explicitly set them
            sensor_start <= 1'b0;
            pid_enable   <= 1'b0;
 
            case (state)


            FROM HERE ON OUT NOT EDITED !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
                // -----------------------------------------------------------------
                // IDLE: wait for the period tick that starts a new control cycle.
                // The first tick after reset gets us going.
                // -----------------------------------------------------------------
                IDLE: begin
                    if (period_tick) begin
                        sensor_start <= 1'b1;   // one-cycle pulse to sensor
                        state        <= READ_SENSOR;
                    end
                end
 
                // -----------------------------------------------------------------
                // READ_SENSOR: sensor is talking to the TLE5012B over SSC.
                // We just wait — sensor_done tells us when it's finished.
                // -----------------------------------------------------------------
                READ_SENSOR: begin
                    if (sensor_done) begin
                        // Fresh angle is now in sensor_angle.
                        // Forward it to the PID by pulsing enable.
                        pid_enable <= 1'b1;     // one-cycle pulse to PID
                        state      <= RUN_PID;
                    end
                end
 
                // -----------------------------------------------------------------
                // RUN_PID: PID is computing (takes 2 registered pipeline stages).
                // Wait for pid_done.
                // -----------------------------------------------------------------
                RUN_PID: begin
                    if (pid_done) begin
                        // PID output is now in pid_correction_dir and pid_correction_val.
                        // Convert correction_value to a step count by right-shifting.
                        //
                        // WHY SHIFT? correction_value can be up to 2^31.
                        // We don't want to send millions of steps — that would take forever.
                        // step_scale_i lets you trade resolution for speed.
                        // e.g. step_scale_i=10 divides by 1024, giving manageable counts.
                        steps_remaining <= pid_correction_val >> step_scale_i;
                        motor_dir_o     <= pid_correction_dir;
                        step_timer      <= '0;
                        motor_step_o    <= 1'b0;
 
                        if ((pid_correction_val >> step_scale_i) == 0) begin
                            // Zero steps to send — motor stays still this cycle
                            state <= WAIT_PERIOD;
                        end else begin
                            state <= STEP_MOTOR;
                        end
                    end
                end
 
                // -----------------------------------------------------------------
                // STEP_MOTOR: emit a burst of STEP pulses.
                //
                // Each step = one full HIGH + LOW cycle of the STEP pin.
                //   - HIGH for step_pulse_width_i cycles
                //   - LOW  for step_pulse_width_i cycles
                //   = 2 * step_pulse_width_i clk_i cycles per step
                //
                // At 50 MHz, step_pulse_width_i = 60 → each step takes 2.4 µs.
                // That's ~416 kHz max step rate, well within the BED's capability.
                //
                // We stop when steps_remaining reaches zero.
                // -----------------------------------------------------------------
                STEP_MOTOR: begin
                    if (steps_remaining == 0) begin
                        motor_step_o <= 1'b0;
                        state        <= WAIT_PERIOD;
                    end else begin
                        step_timer <= step_timer + 1;
 
                        if (step_timer < step_pulse_width_i) begin
                            // HIGH phase
                            motor_step_o <= 1'b1;
                        end else if (step_timer < (step_pulse_width_i << 1)) begin
                            // LOW phase
                            motor_step_o <= 1'b0;
                        end else begin
                            // One full step completed — reset timer, decrement count
                            step_timer      <= '0;
                            steps_remaining <= steps_remaining - 1;
                        end
                    end
                end
 
                // -----------------------------------------------------------------
                // WAIT_PERIOD: computation is done early.
                // Sit here until the next period tick rather than starting over.
                // This ensures a consistent, fixed control loop frequency
                // regardless of how long sensor + PID + stepping took.
                // -----------------------------------------------------------------
                WAIT_PERIOD: begin
                    if (period_tick) begin
                        sensor_start <= 1'b1;
                        state        <= READ_SENSOR;
                    end
                end
 
            endcase
        end
    end
 
endmodule