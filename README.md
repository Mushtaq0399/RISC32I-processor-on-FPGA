# RV32I-processor-on-FPGA
Design of a 32 bit RISC-V processor with base integer instruction set and enhancements using AI and implementing on a FPGA.

## Stage 1: 
 - Designing a working 32-bit RISC-V processor in Verilog that fetches, decodes, expecutes and repeates RISC-V machine code.
## Stage 2:
 - Optimizing the RV32I into a 5-stage pipelined code with forwarding, hazard handling, add CSRs and mermory mapped I/O. Implement it on a FPGA.

## Registers
 - Load-Store Architecture: it is an instruction set archituecture (ISA) where the CPU does'nt allow Arithmetic&Logical instructions to directly access memory.
 - In RISC-V, data must first be copied from memory to internal registers using a load instruction, proccessed using registers via ALU, and then written back to memory using store instructions. 

My processor with have 32 32-bit wide registers named x0,x1-x31. 

## x0 Register
 - x0 is a special register as it is hardwired to zero. Reading it will get 0 and writing to it will throw away the write.
 - We can use this functionality to cleverly use it to reduce instruction set by utilizing its propert to work as a:
    - Use it anytime a zero is reguired.
    - copy a register using the add function, Example: add x2, x3, x0 will copy x3 to x2 without specifically using any copy function.
    - If you want to thow away a result just write it to x0.

## The Program Counter Register
 - In RISC-V, the Program Counter (PC) is a dedicated register that holds the memory address of the current instruction executing. It is one of the most critical parts of the processor's datapath, directing the CPU on where to fetch the next instruction from memory.

## Fields in a 32-bit instruction set
 - opcode
  - size: 7 bits (bits [6:0])
  - It signifies the general instruction type and format (such as R-type, I-type, B-type, S-type etc.)
 - rd
  -  size: 5 Bits
  - It signified where the results goes, Desitnation register. ( 5 bits = one of 32 registers)
 - rs1 & rs2
  - size: 5 Bits each
  - Source register 1 - first input
  - Source register 2 - second input
 - funct3
  - size: 3 Bits
  - Picks he exact operation within the opcode's family/format.
 - funct7
  - size: 7 Bits
  - Exact bits to distinguish operations that share a funct3
 - imm
  - size: varies
  - Immediate: a constant value baked into the instruction.    
