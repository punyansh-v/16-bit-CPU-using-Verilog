`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2024 11:13:06
// Design Name: 
// Module Name: Mux16_tb
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


module Mux16_tb();
reg sel;
reg [15:0] a,b;
wire [15:0] out;

Mux16 q1(a,b,sel,out);
initial begin

$monitor($time,"\n A = %d B = %d sel = %b out = %d ",a,b,sel,out);

a=63;b=24;sel=0;
#5 sel=1;
#5 b=31;
#5 a=27;b=127;sel=0;
#5 sel=1;
end

endmodule
