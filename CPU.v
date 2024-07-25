`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// This 16-bit CPU executes parses the binary code in input
// and executes it according to the machine language specification.
// CPU expects to access a memory of 32K 16-bit registers.
// CPU has two registers, Address register(Areg) and a Destination Register (Dreg),
// a program counter, which gives the address of next instruction to be executed
// an ALU, which performs the Arithmetic and Logical operations
// Only Areg can be initialised to any value through machine instruction between 0 to 32,767
// DReg generally stores the output value of ALU, for later use in program.
//////////////////////////////////////////////////////////////////////////////////


module CPU(
    input clk,
    input[15:0] MReg, //The data in the current selected memory address
    input[15:0] instruction, //Instruction to be executed by the CPU.
    input rst, //If rst==1, restart the execution from 1st instruction
    // else continue execution 
    output[14:0] addr_M, //The address of memory register to which the value is to be written
    output writeM,      //if writeM==1, write the outM to addr_M
    output[15:0] outM,  //Value to be written in memory
    output[15:0] pCnt   //Address of the next instruction to be executed
);
    
    //Assignment of A-register
    wire [15:0] AReg;
    wire [15:0]A_in=instruction[15]?ALUout:instruction;
    wire Aload=instruction[15]?instruction[5]:1;    
    Reg16 Areg(clk,A_in,Aload,AReg);
    
    
    //computaion part of C-instruction
    wire[15:0] ALUout;
    wire zr,ng;
    wire a= instruction[12];
    ALU a0(DReg,(a?MReg:AReg),instruction[11:6],ALUout,zr,ng);
    
    //Register to which output is to be stored
    wire [15:0] DReg;
    //A-register instantiated previously
    Reg16 Dreg(clk,ALUout,instruction[4],DReg);
    assign outM = ALUout;
    assign addr_M = AReg;
    assign writeM = instruction[3];
        
    //Jump conditions
    wire jump=(instruction[15])&(ng&instruction[2])|(zr&instruction[1])|(~(zr&ng)&instruction[0]);
    
    PC p(clk,AReg,rst,jump,1,pCnt);
    
endmodule
