# 16-bit CPU
This project shows design, implementation and testing of a 16-bit CPU using verilog.

## Approach
At first, the basic below-written components were designed and integrated together to meet desired specification.
  * 16-bit ALU
  * A-Register
  * D-Register
  * Program Counter

### ALU
For working and design of ALU, click [here](https://github.com/punyansh-v/16-bit-ALU-using-Verilog/blob/main/README.md).
### A-Register
It is a simple 16-bit register which stores value. It can store value of output by ALU, or any desired number specified by the instruction set. 
The register in the memory, with the address value in register, gets automatically selected in the Memory and its value is available to CPU for processing.
Also, in jump situation, program counter executes the program with address in A-Register.
### D-Register
It is a simple 16-bit register which stores value. It 
