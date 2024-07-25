`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2024 09:11:23
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input [15:0] x,//operand-1
    input [15:0] y,//operand-2
    input [5:0] opr,//operation
    output [15:0] out,//output
    output zr, // 1, if output=0
    output ng //1, if output<0
);
    wire zx,//sets x=0,if 1
    nx,     //bitwise not x, if 1
    zy,     //sets y=0, if 1
    ny,     // bitwise not y, if 1
    f,      // if 1, x+y(addition), else x&y(bitwise and)
    no;     // bitwise not the output of f, if 1
    
    assign {zx,nx,zy,ny,f,no}=opr;
    
    
    wire[15:0] ZX,ZY,X,Y,S,fOut;
    
    Mux16 Mzx(x,16'b0,zx,ZX); // selection of zeroing x
    Mux16 Mnx(ZX,~ZX,nx,X); // selection of bitwise NOTing x
    
    Mux16 Mzy(y,16'b0,zy,ZY); // selection of zeroing y
    Mux16 Mny(ZY,~ZY,ny,Y); // selection of bitwise NOTing y
    
    Adder16 add(X,Y,S); // Adds both output after folowing above 4 steps
    Mux16 Mfunc(X&Y,S,f,fOut); // selection of operation
    
    Mux16 nO(fOut,~fOut,no,out); // Selection of bitwise NOTing outpur
    
    assign ng=out[15];
    assign zr=~(|out);
endmodule
