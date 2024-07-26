# 16-bit CPU
This project shows design, implementation and testing of a 16-bit CPU using verilog.

## Approach
The CPU has 3-inputs, namely 
 * Instruction(16-bit), which is the intruction to be executed
 * M_Reg(16-bit), which is the value stored in selected memory register in the memory.
 * rst(1-bit), if true, sets the program counter to zero,i.e. program is executed from starting.

and 4-outputs, namely
 * writeM, if `true`, the outM value is written to selected memory register in Memory.
 * outM, which is the value to be stored in Memory, if writeM is `false`, it may have any value.
 * pCnt, which is the address of next instruction to be executed.
 * Addr_M, which is the address of the memory register to or from value is to be written or read respectively.

At first, the basic below-written components were designed and integrated together to meet desired specification.
  * 16-bit ALU
  * A-Register
  * D-Register
  * Program Counter

### ALU
For working and design of ALU, click [here](https://github.com/punyansh-v/16-bit-ALU-using-Verilog/blob/main/README.md).
### A-Register
It is a simple 16-bit register which stores value. It can store value of output by ALU, or any desired number specified by the instruction set. 
The register in the memory, with the address value in **A-register**, gets automatically selected in the Memory and its value is available to **CPU** for processing.
Also, in jump situation, program counter executes the program with address in A-Register.
### D-Register
It is a simple 16-bit register which stores value. It may store the output of **ALU**, depending on instruction.
### Program Counter
It is also basically a 16-bit register. This gives the address of the next instruction to be executed in sequence. It may go to next instruction, or to the intruction at the address in **A-Register**, depending on the instruction set.

## Instruction-set
This **CPU** has a 16-bit instruction according to which it perform operations. It has 2-types of instructions.
 * A-instruction
 * C-instruction

`P.S. - the MSB is the 15th bit and LSB is the zeroth bit.`

### A-instruction
It has first bit (MSB) as `0`, and other 14-bits have some value. The A-register gets initialised to this value. Therefore, A-register can be intialised to value from 0 to 32,767 by A-instruction.
For, e.g. if the instruction is `0000101101001011` then the A-register takes the value 2,891, and thus the memory register with this address is selected.
### C-intruction
This instruction is computation instruction, by this instruction, **CPU** may perform computation or copy the value to a register or may specify the address of next instruction or all of them. The syntax is like this.

First bit (MSB) is `1`, next 2-bits are also expected to be `1` but it works fine with not being that.

12th bit determines the operand of `ALU`. The first operand of `ALU` is value in `D-register`. If 12th bit is `1`, then the second operand is value in `M-Reg`, else the value in `A-Register`.

Next 6-bits, 11th to 6th, determine the operation/computation to be performed. For specification of operations, please refer to explanation paragraph of `ALU`, written above.

Next 3-bits, 5th to 3rd, determines the register to which the output value of `ALU` is to be stored. For bit 5,4 and 3 being `1`, the value is stored in A-Register, D-register and M-Register respectively. So,there can be 8-combinations, from nowhere to store, to store in all of the 3 registers.
`000` The value is stored nowhere.
`001` In M-Reg.
`010` In D-Reg.
`011` In M and D-regs.
`100` In A-Reg.
`101` In A and M-Regs.
`110` In A and D-Regs.
`111` In A,D and M-Regs.

Now the 3 LSBs, determine the jump condtion


