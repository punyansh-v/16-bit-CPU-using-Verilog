`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2024 08:03:17
// Design Name: 
// Module Name: adder_tb
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


module adder_tb();

reg[15:0] x,y;
wire[15:0] s;

Adder16 a1(x,y,s);

initial begin

$monitor($time," %d %d %d",x,y,s);
x=0;y=0;

#5 x=256;y=76;
#5 x=-1;y=24;
#5 x=0;y=0;
#5 x=16383;y=0;
#5 y=1;
#5 x=-1;
end
endmodule
