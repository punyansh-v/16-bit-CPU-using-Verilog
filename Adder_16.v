`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2024 08:00:19
// Design Name: 
// Module Name: Adder_16
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


module halfAdder(
input A,
input B,
output S,
output C
);

assign S=A^B;
assign C=A&B;

endmodule

module fullAdder(
input A,
input B,
input C,
output S,
output Carry
);

assign S=A^B^C;
assign Carry=(A&C)|(A&B)|(B&C);
endmodule

module Adder16(
input[15:0] x,
input[15:0] y,
output[15:0] s
);

wire[14:0] c;
halfAdder ha(x[0],y[0],s[0],c[0]);

genvar i;

for(i=1;i<=14;i=i+1) begin
fullAdder fa(x[i],y[i],c[i-1],s[i],c[i]);
end

assign s[15]=x[15]^y[15]^c[14];
endmodule
