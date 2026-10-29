module riscv_core (
    input  wire        clk,
    input  wire        rst_n,      // active-low reset
    // simple instruction + data memory interfaces
    output wire [31:0] imem_addr,
    input  wire [31:0] imem_data,
    output wire [31:0] dmem_addr,
    output wire [31:0] dmem_wdata,
    output wire        dmem_we,
    input  wire [31:0] dmem_rdata
);
endmodule