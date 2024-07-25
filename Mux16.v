`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2024 09:43:24
// Design Name: 
// Module Name: Mux16
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


module Mux16(
    input [15:0] A,
    input [15:0] B,
    input sel,
    output [15:0] O
);
    wire [15:0] a,b;
    
    for(genvar i=0;i<=15;i=i+1) begin
    assign a[i]=A[i]&(~sel);
    assign b[i]=B[i]&sel;
    end

    assign O=a|b;

endmodule
