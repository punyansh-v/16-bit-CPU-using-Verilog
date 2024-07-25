`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2024 23:14:32
// Design Name: 
// Module Name: Reg16
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


module Reg16(clk,I,load,Q);
    input [15:0] I;
    input load,clk;
    output [15:0] Q;

    reg [15:0] Q;
    wire [15:0] q;

    assign q=Q;
    
    
    always @(negedge clk)
    Q=load?I:q;
endmodule
