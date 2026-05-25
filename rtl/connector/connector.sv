
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
// =============================================================================
  
module connector (

    input        MAX10_CLK1_50,  // 50 HMz clock
    input  [1:0] KEY,            // Buttons
    inout  [9:0] ARDUINO_IO,     // Header pins
    output [9:0] LEDR,           // LEDs
    input  [9:0] SW,             // Switches
    output [7:0] HEX0,           // 7-segment display
    output [7:0] HEX1,           // 7-segment display
    output [7:0] HEX2,           // 7-segment display
    output [7:0] HEX3,           // 7-segment display
    output [7:0] HEX4,            // 7-segment display

    // UART
	input           RXD,
	output          TXD,

    input           TDI,            
	output          TDO,
	input           TCK,
	input           TMS,

    // input  logic        clk_i,      // FPGA system clock (e.g. 50 MHz)
    // input  logic        reset_i,    // synchronous active-high reset. Wire to a button on fpga
 
    // -------------------------------------------------------------------------
    // TUNABLE PARAMETERS — connect to APB registers later for real-time tuning.
    // -------------------------------------------------------------------------
 
    // Control loop frequency:
    //   correction_fpga_cycles_write: number of clock cycles of FPGA after which motor will start driving a new correction:
    //                        ex: new signal every 10ms -> correction_fpga_cycles_write = 10ms * 50MHz = 500'000 cycles
    //                        10s max -> 5e8 cycles -> 32bit is enough
    // input  logic [31:0] correction_fpga_cycles_write,
 
    // Sensor SCK divider — see SSCSensor for formula:
    //   SCK = clk_i / (divider * 2)
    //input  logic [7:0]  divider_sensorfreq_i,
 
    // PID gains (unsigned 16-bit integers):
    // input  logic [15:0] K_p_i,
    // input  logic [15:0] K_i_i,
    // input  logic [15:0] K_d_i,
 
    



    // Optional for step tuning

    /*
 
    // Step scaling: right-shift applied to correction_value before counting steps.
    //   steps_to_send = correction_value >> step_scale_i
    //   Higher step_scale → fewer steps per correction → gentler response.
    //   Start with step_scale = 10 or so (tune from there).
    input  logic [4:0]  step_scale_i,
    */
 
 
    // -------------------------------------------------------------------------
    // SENSOR INTERFACE — connect directly to TLE5012B pins
    // -------------------------------------------------------------------------
    // wired
    /*
    inout  wire         sensor_data_pin,    // bidirectional DATA line
    output logic        sensor_sck_o,       // serial clock to sensor
    output logic        sensor_csq_o,       // chip select (active-low)
    */

    // -------------------------------------------------------------------------
    // PID INTERFACE 
    // -------------------------------------------------------------------------
    /*
    OPTIONAL FOR TUNING

    // PID anti-windup and forgetting:
    input  logic signed [31:0] integral_max_i,  // set to approx 2^20 initially (guess)
    input  logic [5:0]  integral_decay_bits_i,  // set to approx 4 initially

    currently hardcoded

    */
 
    // -------------------------------------------------------------------------
    // MOTOR INTERFACE — connect to BigEasyDriver STEP and DIR pins
    // -------------------------------------------------------------------------
    // output logic        motor_step_o,       // each rising edge = one microstep
    // output logic        motor_dir_o,        // direction: 0 = CW, 1 = CCW


 
    // -------------------------------------------------------------------------
    // DEBUG / STATUS OUTPUTS (optional — connect to LEDs or leave open)
    // -------------------------------------------------------------------------
    output logic        pid_sat_flag_o,     // high when PID output is saturated
    output logic signed [14:0] angle_raw_o  // current raw angle (for monitoring)
);
// =============================================================================
// 1. INTERNAL WIRES — connecting submodule ports together
// =============================================================================

    logic        clk_i;      // FPGA system clock (e.g. 50 MHz)
    logic        reset_i;    // synchronous active-high reset. Wire to a button on fpga
    
    assign clk_i = MAX10_CLK1_50;
    assign reset_i = SW[0]; // but this is not Debounced yet, probably think about if we want to also add that...

    // APB Bus signals
    logic [15:0] K_p_write;
    logic [15:0] K_i_write;
    logic [15:0] K_d_write;

    //logic uart_rxd_i; // ????????????????
    //logic uart_txd_o;


    logic [31:0] correction_fpga_cycles_write; 

    // --- Sensor wires ---
    /// hardcode optional inputs
    logic [7:0]  divider_sensorfreq_i;
    assign divider_sensorfreq_i = 8'b100; // set to 4 (value for clock division used for SCK)


    logic        sensor_start;      // we pulse this to trigger a new sensor read
    logic signed [14:0] sensor_angle_raw;      // 15-bit raw angle, valid when sensor_done=1
    logic        sensor_done;       // sensor pulses this when angle is ready
 
    // --- PID wires ---

    /// Hardcoded optional inputs
    logic signed [31:0] integral_max_i;  // set to approx 2^20 initially (guess)
    assign integral_max_i = 32'b00000000000100000000000000000000;
    logic [5:0]  integral_decay_bits_i;  // set to approx 4 initially
    assign integral_decay_bits_i = 6'b000100;
    // Calibrated zero angle: the raw sensor reading when pendulum is perfectly upright.
    // Subtracted inside PID_loop to compute the error around zero.
    logic signed [14:0] angle_0_i;
    assign angle_0_i = 15'b0;   

    /// Other inputs
    logic        pid_enable;        // we pulse this when we have a fresh angle
    logic        pid_correction_dir;  // 0 = positive correction, 1 = negative
    logic [30:0] pid_correction_val;  // magnitude of correction
    logic        pid_done;            // PID pulses this when output is valid


    // --- driver wires ---
    logic        driver_enable;

// =============================================================================
// 2. SUBMODULE INSTANTIATION
//    We wire the tunable inputs directly into the submodules.
//    When you add APB registers later, you connect those register outputs here
//    instead of the input ports — nothing else changes.
// =============================================================================

    SimpleRiscExample read_write_registers (
        // Clock & reset
        .MAX10_CLK1_50 (clk_i),            // same 50 MHz clock
        .KEY           ({1'b1, ~reset_i}), // KEY[0] = active‑low reset
        // UART (connect to top‑level pins later)
        .RXD           (RXD),       // add this input to connector
        .TXD           (TXD),       // add this output to connector
        // JTAG – leave unconnected if not used
        .TDI           (TDI),
        .TDO           (TDO),
        .TCK           (TCK),
        .TMS           (TMS),
        // SDRAM – tie off (RISC‑V won't use it if firmware doesn't)
        .DRAM_ADDR     (),
        .DRAM_BA       (),
        .DRAM_CAS_N    (),
        .DRAM_CKE      (),
        .DRAM_CLK      (),
        .DRAM_CS_N     (),
        .DRAM_DQ       (),
        .DRAM_RAS_N    (),
        .DRAM_WE_N     (),
        .DRAM_LDQM     (),
        .DRAM_UDQM     (),
        // LEDs, switches, 7‑seg – ignore
        //.LEDR          (LEDR),
        .SW            (SW),
        .HEX0          (HEX0),
        .HEX1          (HEX1),
        .HEX2          (HEX2),
        .HEX3          (HEX3),
        .HEX4          (HEX4),
        // Your custom connections
        .angle_value   (sensor_angle_raw),      // from SSCSensor
        .Kp_write        (K_p_write),            // new wire
        .Ki_write        (K_i_write),            // new wire
        .Kd_write        (K_d_write),             // new wire
        .correction_fpga_cycles_write(correction_fpga_cycles_write)
    );
 
    SSCSensor sensor_inst (
        .clk_i                  (clk_i),
        .reset_i                (reset_i),
        .start_i                (sensor_start),
        .divider_sensorfreq_i   (divider_sensorfreq_i),
        .data_pin               (ARDUINO_IO[7]),
        .sck_o                  (ARDUINO_IO[8]),
        .csq_o                  (ARDUINO_IO[9]),
        .angle_raw_o            (sensor_angle_raw),
        .done_o                 (sensor_done)
    );
 
    PID_loop pid_inst (
        .clk_i                  (clk_i),
        .reset_i                (reset_i),
        .enable_i               (pid_enable),
        .K_p                    (K_p_write),
        .K_i                    (K_i_write),
        .K_d                    (K_d_write),
        .integral_max_i         (integral_max_i),
        .integral_decay_bits    (integral_decay_bits_i),
        .angle_raw_i            (sensor_angle_raw),
        .angle_0                (angle_0_i),
        .correction_direction   (pid_correction_dir),
        .correction_value       (pid_correction_val),
        .sat_flag               (pid_sat_flag_o),
        .done_o                 (pid_done)
    );

    MDriver motor_driver (
        .clk_i(clk_i),
        .reset_i(reset_i),
        .enable_i(driver_enable),
        .direction_i(pid_correction_dir),
        .correction_i(pid_correction_val),
        .driver_direction_o(ARDUINO_IO[0]),
        .driver_step_signal_o(ARDUINO_IO[1])
    );


/**
    // generate the tick (one pulse every 9.5 ms)
    TickGen #(.DIVIDER(499_999), .REG_W(19)) tickGen(
        .clk_i  (clk_i),
        .reset_i(reset_i),
        .tick_o (period_tick)
    );
 **/

    typedef enum logic [2:0] {
        IDLE,         // wait for the period tick
        WAIT_READOUT, // Wait until correction_period (= time for which driver holds correction step freq constant) minus 0.5ms 
        READ_SENSOR,  // pulse sensor start, wait for sensor done_o
        RUN_PID,      // pulse PID enable, wait for PID done_o
        WAIT_SEND,    // Wait until full correction_period has passed
        SEND_CORR     // send correction signal to driver
    } state_t;

    state_t state;

    // set waiting cycles (0.5ms before sending signal)
    logic [31:0] wait_readout_fpga_cycles;
    assign wait_readout_fpga_cycles = correction_fpga_cycles_write - 25_000;
    
    // Counters
    logic [31:0] fpga_cycle_counter;

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            state           <= IDLE;
            fpga_cycle_counter <= 32'b0;
            sensor_start    <= 1'b0;
            pid_enable      <= 1'b0;
            driver_enable   <= 1'b0;
        end else begin
 
            // Default: strobe signals are 0 unless we explicitly set them
            sensor_start <= 1'b0;
            pid_enable   <= 1'b0;
            driver_enable <= 1'b0;
 
            case (state)

/**
    FROM HERE ON OUT NOT EDITED !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
**/
                // -----------------------------------------------------------------
                // IDLE: wait for the period tick that starts a new control cycle.
                // The first tick after reset gets us going.
                // -----------------------------------------------------------------
                IDLE: begin
                    fpga_cycle_counter <= 32'b0;
                    state <= WAIT_READOUT;
                end

                WAIT_READOUT: begin
                    fpga_cycle_counter <= fpga_cycle_counter + 1;
                    if (fpga_cycle_counter == wait_readout_fpga_cycles) begin
                        sensor_start <= 1'b1;
                        state <= READ_SENSOR;
                    end
                end

                // -----------------------------------------------------------------
                // READ_SENSOR: sensor is talking to the TLE5012B over SSC.
                // We just wait — sensor_done tells us when it's finished.
                // -----------------------------------------------------------------
                READ_SENSOR: begin
                    sensor_start <= 1'b0;
                    fpga_cycle_counter <= fpga_cycle_counter + 1;
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
                    fpga_cycle_counter <= fpga_cycle_counter + 1;
                    if (pid_done) begin
                        state <= WAIT_SEND;
                    end
                end


                WAIT_SEND: begin
                    fpga_cycle_counter <= fpga_cycle_counter + 1;

                    if (fpga_cycle_counter >= correction_fpga_cycles_write) begin
                        state <= SEND_CORR;
                    end
                end

                SEND_CORR: begin
                    driver_enable <= 1'b1;
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end
    
    assign LEDR[9:0] = angle_raw_o[14:5];

endmodule