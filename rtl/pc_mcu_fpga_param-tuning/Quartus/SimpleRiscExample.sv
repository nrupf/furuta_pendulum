/*
  This is a relatively simple demonstration of using the APB bus with the multiplexer
  and some read- and write registers.
  
  Yves Acremann, 29.4.2021
*/


// Here we define the inputs / outputs
module SimpleRiscExample(
    input           MAX10_CLK1_50,  // 50 HMz clock
    input  [1:0]    KEY,            // Buttons
    //inout  [9:0]    ARDUINO_IO,     // Header pins
    //output [9:0]    LEDR,           // LEDs
    input  [9:0]    SW,             // Switches
    output [7:0]    HEX0,           // 7-segment dieplay
    output [7:0]    HEX1,           // 7-segment dieplay
    output [7:0]    HEX2,           // 7-segment dieplay
    output [7:0]    HEX3,           // 7-segment dieplay
    output [7:0]    HEX4,           // 7-segment dieplay
	 
	// UART
	input           RXD,
	output          TXD,
	// JTAG
	input           TDI,            
	output          TDO,
	input           TCK,
	input           TMS,
	 
	// SDRAM
	output [12:0]   DRAM_ADDR,
    output [1:0]    DRAM_BA,
    output          DRAM_CAS_N,
    output          DRAM_CKE,
    output          DRAM_CLK,
    output          DRAM_CS_N,
    inout  [15:0]   DRAM_DQ,
    output          DRAM_RAS_N,
    output          DRAM_WE_N,
    output          DRAM_LDQM,
	output          DRAM_UDQM,

	// in- and outputs added for reading the angle and writing the coefficients
	input logic signed [14:0] angle_value,
	output logic [15:0] Kp_write,
    output logic [15:0] Ki_write,
    output logic [15:0] Kd_write,
	output logic [31:0] correction_fpga_cycles_write
);

    logic clk; // the clock (taken from the microcontroller!)
    logic interrupt;
	 assign interrupt = 0;
	 
	 // some assignments needed to match the 3-state data lines to the internal data lines from the controller
	 logic [15:0] DRAM_DQ_IN;
	 logic [15:0] DRAM_DQ_OUT;
	 logic [15:0] DRAM_DQ_WE;
	 assign DRAM_DQ = (DRAM_DQ_WE>0) ? DRAM_DQ_OUT : 16'bZ ;
	 assign DRAM_DQ_IN = DRAM_DQ;
	 // adapt the DRAM_DQM format
	 logic [1:0] DRAM_DQM;
	 assign DRAM_LDQM = DRAM_DQM[0];
	 assign DRAM_UDQM = DRAM_DQM[1];
	 
	 // This is our APB master bus from the controller
	 ApbBus bus();
	 
	 // The microcontroller:
    System system (
        .clk(MAX10_CLK1_50),
		.reset(!KEY[0]),
		.DRAM_ADDR(DRAM_ADDR),
		.DRAM_BA(DRAM_BA),
		.DRAM_CAS_N(DRAM_CAS_N),
		.DRAM_CKE(DRAM_CKE),
		.DRAM_CLK(DRAM_CLK),
		.DRAM_CS_N(DRAM_CS_N),
		.DRAM_DQ_IN(DRAM_DQ_IN),
		.DRAM_DQ_OUT(DRAM_DQ_OUT),
		.DRAM_DQ_WE(DRAM_DQ_WE),
		.DRAM_RAS_N(DRAM_RAS_N),
		.DRAM_WE_N(DRAM_WE_N),
		.DRAM_DQM(DRAM_DQM),
		  
		.jtag_tdi(TDI),
		.jtag_tms(TMS),
		.jtag_tck(TCK),
		.jtag_tdo(TDO),
		  
		.uart_rx(RXD),
		.uart_tx(TXD),
		 
		.externalInterrupt(interrupt),
		.apbBus_PADDR(bus.PADDR),
		.apbBus_PSEL(bus.PSEL),
		.apbBus_PENABLE(bus.PENABLE),
		.apbBus_PREADY(bus.PREADY),
		.apbBus_PWRITE(bus.PWRITE),
		.apbBus_PWDATA(bus.PWDATA),
		.apbBus_PRDATA(bus.PRDATA),
		.apbBus_PSLVERROR(bus.PSLVERROR),
		// here we take the clock used for the CPU and bus (as it comes from the internal PLL)
		.main_clk(clk) 
	);
	 
	 
	// here we take the clock used for the CPU and bus (as it comes from the internal PLL)
	assign bus.PCLK = clk;
 	assign bus.PRESETn = 1;
	 
	 
	 // define the addresses of the slaves:
	 // CAUTION: Here we only see the last 16 bits of the address!
	 // The real addresses on teh AXI4 bus are: 0xf0000000, 0xf0000004, ...
	 // The addresses are always in increments of 4!
    parameter integer numOfSlaves = 8; 						// ms: increased numOfSlaves from 4 to 9, because we have 3 parameters Kp, Ki, Kd and the angle value from the sensor + constant driving time
    parameter integer addresses_start [numOfSlaves] = '{
        //'h4,   // write register to LEDs
        'h8,   // write register to 7-segment displays
        'hC,   // read register address: Switches
		'h400,  // RAM
	    'h10,  // PID Kp
    	'h14,  // PID Ki
    	'h18,   // PID Kd
		'h1C,   // Angle read register
		'h20
    };
	 
	 parameter integer addresses_end [numOfSlaves] = '{
        'h8,   // write register to 7-segment displays
        'hC,   // read register address: Switches
		'h800, // RAM
		'h10,  // PID Kp
    	'h14,  // PID Ki
    	'h18,   // PID Kd
		'h1C,   // Angle read register
		'h20
		//'h4,   // write register to LEDs
    };
    
    // the slave buses:
    ApbBus slave_buses [numOfSlaves] () ;
    
	 
    // the multiplexer:
    ApbMultiplexer #(
        .NumOfSlaves(numOfSlaves), 
        .StartAddresses(addresses_start),
        .EndAddresses(addresses_end)
    ) mux(
        .master(bus),
        .slaves(slave_buses)
    );
    
	 
    // now we can connect our registers to the bus: Two write registers for LEDs:
	/*
	logic [31:0] led_reg_out;
    ApbWriteRegister #(.Address(addresses_start[8])) writeReg1(.bus(slave_buses[8]), .value(led_reg_out));
	 assign LEDR = led_reg_out[9:0];
	 */

	 logic [31:0] seven_seg_out;
    ApbWriteRegister #(.Address(addresses_start[0])) writeReg2(.bus(slave_buses[0]), .value(seven_seg_out));
	 assign HEX0 = seven_seg_out[7:0];
    
	 // and a read register for the switches:
    ApbReadRegister #(.Address(addresses_start[1])) readReg(.bus(slave_buses[1]), .value((SW)));
	 
	 logic [31:0] r_data, w_data;
	 logic [15:0] addr;
	 logic w_en;
	 assign w_data = 32'd0;
	 assign addr = 16'd0;
	 assign w_en = 0;
	 
	 
	// dual port RAM
	ApbRam #(
		.APB_ADDR(addresses_start[2]), 
		.DEPTH(1024),
		.WIDTH(32)
	) ram(
		.bus(slave_buses[2]),
		.address(addr),
		.w_data(w_data),
		.r_data(r_data),
		.w_en(w_en)
	);

	// Registers for the PID coefficients Kp, Ki, Kd
	logic [31:0] pid_kp_reg;
	logic [31:0] pid_ki_reg;
	logic [31:0] pid_kd_reg;
	logic [31:0] correction_fpga_cycles_write_reg;

	logic [31:0] angle_value_32;
	assign angle_value_32 = { {17{angle_value[14]}}, angle_value };   // sign‑extend to 32 bits

	ApbWriteRegister #(.Address(addresses_start[3])) pid_reg_kp (
		.bus(slave_buses[3]),
		.value(pid_kp_reg)
	);

	ApbWriteRegister #(.Address(addresses_start[4])) pid_reg_ki (
		.bus(slave_buses[4]),
		.value(pid_ki_reg)
	);

	ApbWriteRegister #(.Address(addresses_start[5])) pid_reg_kd (
		.bus(slave_buses[5]),
		.value(pid_kd_reg)
	);
	
	// Read register for the angle sensor
	ApbReadRegister #(.Address(addresses_start[6])) angle_reg (
		.bus(slave_buses[6]),
		.value(angle_value_32)   // connects to the new input port
	);

	
	ApbWriteRegister #(.Address(addresses_start[7])) reg_correction_fpga_cycles_write (
		.bus(slave_buses[7]),
		.value(correction_fpga_cycles_write_reg)
	);
		
	assign Kp_write = pid_kp_reg[15:0];
	assign Ki_write = pid_ki_reg[15:0];
	assign Kd_write = pid_kd_reg[15:0];
	assign correction_fpga_cycles_write = correction_fpga_cycles_write_reg;
	
endmodule

