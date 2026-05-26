import cocotb
from cocotb.triggers import Timer
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge

# inputs and outputs of MSignalFreq.sv
#input logic clk_i,
#input logic reset_i, 
#input logic [31:0] divider,

#output logic square_wave_o

@cocotb.test()
async def MSignalFreq(dut):
    # set up the clock
    clock = Clock(dut.clk_i, 20, units="ns")  # Create a 20ns period clock
    cocotb.start_soon(clock.start())  # Start the clock
    # Synchronize with the clock
    await FallingEdge(dut.clk_i)

    # set up the input signals and do a reset
    dut.divider.value = 10
    dut.reset_i.value = 1
    await FallingEdge(dut.clk_i)

    # come out of reset
    dut.reset_i.value = 0

    for _ in range(1000):
        await FallingEdge(dut.clk_i)
    
    await Timer(100, "ns")
    await FallingEdge(dut.clk_i)

    dut.divider.value = 20

    await FallingEdge(dut.clk_i)
    
    for _ in range(1000):
        await FallingEdge(dut.clk_i)
    

    await Timer(100, "ns")
    await FallingEdge(dut.clk_i)

    dut.divider.value = 31250

    await FallingEdge(dut.clk_i)
    
    for _ in range(1000):
        await FallingEdge(dut.clk_i)
    
    await Timer(100, "ns")
    await FallingEdge(dut.clk_i)

    dut.divider.value = 25000

    await FallingEdge(dut.clk_i)

    for _ in range(1000):
        await FallingEdge(dut.clk_i)
    
    await FallingEdge(dut.clk_i)
    
    dut.reset_i = 1

    await Timer(100, "ns")


    
