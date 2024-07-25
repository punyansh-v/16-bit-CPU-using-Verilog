`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2024 13:23:54
// Design Name: 
// Module Name: PC_tb
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


module PC_tb();

reg clk,rst,load,nxt;
reg [15:0] I;
wire[15:0] Q;

PC r(clk,I,rst,load,nxt,Q);
initial clk=1;
always #10 clk=~clk;
initial begin
 $display($time,"\tI\trst\tload\tnxt\tQ");
 $monitor($time,"%d\t%b\t%b\t%b\t%d",I,rst,load,nxt,Q);
 I=25;nxt=1;rst=0;load=0;
 #55 I=20;
 #5 load=1;
 #20 load=0;
 #30 rst=1;
 #5 rst=0;
 #5 I=35;
 end
 
endmodule
