module riscv_core (
    input  wire        clk,
    input  wire        rst_n,      // active-low reset, the _n = 'negated'
    // when rst_n = 0 the CPU is forced to a know start state and when its 1 it works normally.
    // simple instruction + data memory interfaces
    output wire [31:0] imem_addr, //Instruction memory address. The CPU outputs which instruction it wants next.
    input  wire [31:0] imem_data, //The instruction word. Read back the intruction memory at that address.
    output wire [31:0] dmem_addr, // Data memory address the CPU wants to read from or write to.
    output wire [31:0] dmem_wdata, // The data to write into data memory (used by store instructions)
    output wire        dmem_we, // Write-enabled, 1 = store this data; 0 = I'm only reading
    input  wire [31:0] dmem_rdata // The data read back from data memory (used by load instructions)
);
endmodule