`timescale 1ns / 1ps


module CPU_tb();
    reg clk;
    reg[15:0] MReg;
    reg[15:0] instruction;
    reg rst;
    wire[14:0] addr_M;
    wire writeM;
    wire[15:0] outM;
    wire[15:0] pCnt;

    CPU l(clk,MReg,instruction,rst,addr_M,writeM,outM,pCnt);

    initial clk=0;
    always begin
    $display($time/10,"\t%d\t%b\t%d\t%d\t%d\t%d\t%d",MReg,instruction,rst,addr_M,writeM,outM,pCnt); 
    #10 clk=~clk;
    end
    initial begin
    rst=1; instruction=0; MReg=0;//initialising all values as zero
    #10 instruction=16'b1110101010010000;
    #20 rst =0; instruction=16514;//A-instruction
    #20 MReg=27654; instruction=16'b1110110000010000;//copying value
    #20 instruction=16'b1111010011001000;//computation
    #20 MReg=350; instruction=324;
    #20 instruction=16'b1111000111000101;//jump 
    #20 instruction=0;
    end

endmodule
