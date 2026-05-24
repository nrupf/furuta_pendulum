/*
This is an implementation of the APB-bus in SystemVerilog using interfaces.
The use of interfaces simplifies the wiring of the interconnect. Caution: not all
FPGA development environments already support arrays of buses!

Yves Acremann, 29.4.2021
*/


interface ApbBus #(
    parameter AddrWidth = 16,           // width of the address bus
    parameter DataWidth = 32            // width of the data bus
);
    logic                   PCLK;
    logic                   PRESETn;
    logic [AddrWidth-1:0]   PADDR;      // address
    logic [0:0]             PSEL;       // byte select
    logic                   PENABLE;    // slave enable
    logic                   PREADY;     // ready signal from slave
    logic                   PWRITE;     // write (1) / read (0)
    logic [DataWidth-1:0]   PWDATA;     // write data bus
    logic [DataWidth-1:0]   PRDATA;     // read data bus (from slave)
    logic                   PSLVERROR;  // error indicator (from slave)
    
    modport Slave (
        input  PCLK,
        input  PRESETn,
        input  PADDR,
        input  PSEL,
        input  PENABLE,
        output PREADY,
        input  PWRITE,
        input  PWDATA,
        output PRDATA,
        output PSLVERROR
    );
    
    modport Master (
        output PCLK,
        output PRESETn,
        output PADDR,
        output PSEL,
        output PENABLE,
        input  PREADY,
        output PWRITE,
        output PWDATA,
        input  PRDATA,
        input  PSLVERROR
    );
endinterface






module ApbWriteRegister #(
    parameter Address   =  0,               // address of the reg.
	parameter DataWidth = 32,
	parameter AddrWidth = 16
)(
    ApbBus.Slave bus,                       // the APB bus interface
    output logic [DataWidth-1:0] value      // the output of the reg.
);

    logic enabled;
    logic [DataWidth-1:0] result_reg;
    
    
    assign enabled = bus.PENABLE & (bus.PSEL != 0) & (bus.PADDR == AddrWidth'(Address));
    assign bus.PRDATA = (enabled & !bus.PWRITE)? result_reg : 0;
    
    // the flipflops:
    always_ff @(posedge bus.PCLK, negedge bus.PRESETn) begin
        if (bus.PRESETn == 0) begin
            result_reg <= 0;
        end else begin
            if (enabled & bus.PWRITE)
                result_reg <= bus.PWDATA;
        end
    end
    
    assign value = result_reg;
    assign bus.PSLVERROR = 0;
    assign bus.PREADY = 1;
endmodule


/*
 * Input register
 */
module ApbReadRegister #(
     parameter Address = 0,                 // the address of the reg.
	 parameter DataWidth = 32,
	 parameter AddrWidth = 16
)(
    ApbBus.Slave                    bus,  // the APB bus interface
    input logic [DataWidth-1:0] value // the input to read
);

    // states of the FSM
    typedef enum logic [1:0] {
        IDLE,    // wait for select
        ENABLE   // perform the transfer
    } state_t;
    
    state_t state, next_state;
    logic selected;
    logic enabled;
    logic [DataWidth-1:0] read_reg;
    
    assign selected = (bus.PSEL != 0) & (bus.PADDR == AddrWidth'(Address));
    assign enabled = (state == ENABLE) & (bus.PENABLE);
    assign bus.PRDATA = enabled & !bus.PWRITE ? read_reg : 0;
    
    // the flipflops:
    always_ff @(posedge bus.PCLK, negedge bus.PRESETn) begin
        if (bus.PRESETn == 0) begin
            state <= IDLE;
            read_reg <= 0;
        end else begin
            state <= next_state;
            if (selected & !bus.PWRITE)
                read_reg <= value;
        end
    end
    
    // next state logic:
    always_comb begin
        next_state = state;
        
        case(state)
            IDLE:
                if (selected == 1) next_state = ENABLE;
            ENABLE: 
                if (selected == 0) 
                    next_state = IDLE;
            default:
                next_state = IDLE;
        endcase
    end

    assign bus.PSLVERROR = 0;
    assign bus.PREADY = 1;
endmodule


/*
 * Multiplexer for the APB bus.
 * 
 * Parameters:
 *  NumOfSlaves: Number of slaves
 *  StartAddresses: Start of the address range for each slave
 *  EndAddresses: End of the address range for each slave
 *
 * The address decoder is implemented such that if the start and end 
 * addresses are equal only that particular address is assigned to the slave.
 * If the start and end addresses are non-equal, the whole range is assigned
 * to the slave ([StartAddress, EndAddress]).
 *
 * It is inspired by the solution from here:
 * https://github.com/RoaLogic/apb4_mux
 */
module ApbMultiplexer #(
    parameter NumOfSlaves = 2,
    parameter integer StartAddresses [NumOfSlaves] = '{10, 20},
    parameter integer EndAddresses   [NumOfSlaves] = '{10, 20},
	 parameter DataWidth = 32,
	 parameter AddrWidth = 16
    )(
    ApbBus.Slave  master,                      // master bus interface
    ApbBus.Master slaves [NumOfSlaves]     // slave bus interfaces
    );
    
    // intermediate signals for generating the multiplexer structures.
    // These are sent to an OR to generate the signals to the master.
    logic addr_ok [NumOfSlaves-1:0] ;
    logic [NumOfSlaves-1:0] slave_PREADY_switched ;
    logic [DataWidth-1:0][NumOfSlaves-1:0] slave_PRDATA_switched;
    logic [NumOfSlaves-1:0] slave_PSLVERROR_switched ;
    
    
    genvar b, s;
    generate
        // loop over all slaves:
        for (s = 0; s < NumOfSlaves; s++) begin : gen_loop
        
            // the address decoding logic
            if (StartAddresses[s] == EndAddresses[s])
                assign addr_ok[s] = (master.PADDR == AddrWidth'(StartAddresses[s]));
            else
                assign addr_ok[s] = (master.PADDR >= AddrWidth'(StartAddresses[s]))
                        & (master.PADDR <= AddrWidth'(EndAddresses[s]));
        
            // connect the signals from the master to the slaves:
            assign slaves[s].PCLK = master.PCLK;
            assign slaves[s].PRESETn = master.PRESETn;
            assign slaves[s].PWRITE = master.PWRITE;
            assign slaves[s].PWDATA = master.PWDATA;
            assign slaves[s].PENABLE = master.PENABLE & addr_ok[s];
            assign slaves[s].PSEL = master.PSEL & addr_ok[s];
            assign slaves[s].PADDR = master.PADDR;
            
            // the AND part of the multiplexer from the slaves to the master
            assign slave_PREADY_switched[s] = slaves[s].PREADY & addr_ok[s];
            assign slave_PSLVERROR_switched[s] = slaves[s].PSLVERROR & addr_ok[s];
            
        end // gen_loop
    endgenerate
    
    
    // for the PRDATA signals we need to generate the correct assignment bit-wise...
    generate
        for (b = 0; b < DataWidth; b++) begin : bit_loop
                for (s = 0; s < NumOfSlaves; s++) begin : slave_loop
                     assign slave_PRDATA_switched[b][s] = addr_ok[s]? slaves[s].PRDATA[b] : 0;
                end // slave_loop
                // here we assign the OR for each bit separately.
                assign master.PRDATA[b] = |slave_PRDATA_switched[b];
        end // bit_loop
        
    endgenerate
    
    // the OR part of the multiplexer for the signle bit signals to the master:
    assign master.PREADY =|slave_PREADY_switched;
    assign master.PSLVERROR =|slave_PSLVERROR_switched;
    
endmodule

/*
    Dual port RAM connected to the APB bus. It is intended to be used with a single clock
    from the bus.
    
    The access port from logic  as well as from the bus allows for read and write access.
    
    All addresses (also from the logic port!) are in steps of 4.
*/
module ApbRam #(
    parameter int APB_ADDR  =    0,              // start address on APB bus
    parameter int DEPTH     = 1024,              // size of the memory in words
    parameter int WIDTH     =   32               // width of the data
)(
    ApbBus.Slave bus,                            // APB bus
    
    // interface from logic:
    input  logic [$clog2(DEPTH*4)-1:0] address,  // address (increments in 4)
    input  logic [WIDTH-1:0]           w_data,   // data to write
    input  logic                       w_en,     // write enable
    output logic [WIDTH-1:0]           r_data    // read data  
);

    parameter APB_ADDR_WIDTH = $bits(bus.PADDR);
    parameter APB_DATA_WIDTH = $bits(bus.PWDATA); 
	 
    // the memory
    (* ramstyle = "mlab" *) logic [WIDTH-1:0] ram [DEPTH-1:0];
    
    
    // memory: access from FSM
    always_ff @(posedge bus.PCLK) begin
        if (w_en) begin
            ram[$clog2(DEPTH)'(address >> 2)] <= w_data;
        end
        r_data <= ram[$clog2(DEPTH)'(address >> 2)];
    end
    
    // memory access from APB:
    logic apb_selected;
    logic apb_selected_read;
    logic apb_we;
    logic [WIDTH-1:0] apb_rdata;   // read data register
    logic unsigned [$clog2(DEPTH)-1:0] apb_addr; // address in single words (not *4)
    
    // calculate the address from the APB bus:
    assign apb_addr = $clog2(DEPTH)'((bus.PADDR - APB_ADDR_WIDTH'(APB_ADDR)) >> 2);
    
    // memory: APB access
    always_ff @(posedge bus.PCLK) begin
        if (apb_selected) begin
            if (apb_we) begin
                ram[apb_addr] <= WIDTH'(bus.PWDATA);
            end //else begin
                //apb_rdata <= ram[apb_addr];
            //end
        end
        if (apb_selected_read) begin
            apb_rdata <= ram[apb_addr];
        end
    end
    //assign apb_rdata = apb_selected? ram[apb_addr] : 0;
    
    // APB port:
    logic addr_OK;
    // check if the address is in range
    assign addr_OK = (bus.PADDR >= APB_ADDR_WIDTH'(APB_ADDR)) & (bus.PADDR <= APB_ADDR_WIDTH'(APB_ADDR + 4*(DEPTH-1)));
    assign apb_selected  = (bus.PSEL != 0) & bus.PENABLE & addr_OK;
    assign apb_selected_read = (bus.PSEL != 0) & addr_OK;
    assign apb_we        = bus.PWRITE;
    assign bus.PSLVERROR = 0;
    assign bus.PREADY    = 1;
    assign bus.PRDATA    = (apb_selected & !apb_we)? APB_DATA_WIDTH'(apb_rdata) : 0;
endmodule


