`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2024 09:34:56
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();

reg[15:0] a,b;
wire [5:0] opr;
reg zx,nx,zy,ny,f,no;
wire [15:0] out;
wire zr, ng;

assign opr={zx,nx,zy,ny,f,no};
ALU a1(a,b,opr,out,zr,ng);

initial begin
$display("a\tb\tzx\tnx\tzy\tny\tf\tno\tout\tzr\tng");
$monitor("%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d",a,b,zx,nx,zy,ny,f,no,out,zr,ng);
a=112;b=310;
   zx=1;nx=0;zy=1;ny=0;f=0;no=0;
#5 zx=1;nx=1;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=1;ny=0;f=1;no=0;
#5 zx=0;nx=0;zy=1;ny=1;f=0;no=0;
#5 zx=1;nx=1;zy=0;ny=0;f=0;no=0;
#5 zx=0;nx=0;zy=1;ny=1;f=0;no=1;
#5 zx=1;nx=1;zy=0;ny=0;f=0;no=1;
#5 zx=0;nx=0;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=0;ny=0;f=1;no=1;
#5 zx=0;nx=1;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=0;ny=1;f=1;no=1;
#5 zx=0;nx=0;zy=1;ny=1;f=1;no=0;
#5 zx=1;nx=1;zy=0;ny=0;f=1;no=0;
#5 zx=0;nx=0;zy=0;ny=0;f=1;no=0;
#5 zx=0;nx=1;zy=0;ny=0;f=1;no=1;
#5 zx=0;nx=0;zy=0;ny=1;f=1;no=1;
#5 zx=0;nx=0;zy=0;ny=0;f=0;no=0;
#5 zx=0;nx=1;zy=0;ny=1;f=0;no=1;

#5 a=-112;b=310;
#5 zx=1;nx=0;zy=1;ny=0;f=0;no=0;
#5 zx=1;nx=1;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=1;ny=0;f=1;no=0;
#5 zx=0;nx=0;zy=1;ny=1;f=0;no=0;
#5 zx=1;nx=1;zy=0;ny=0;f=0;no=0;
#5 zx=0;nx=0;zy=1;ny=1;f=0;no=1;
#5 zx=1;nx=1;zy=0;ny=0;f=0;no=1;
#5 zx=0;nx=0;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=0;ny=0;f=1;no=1;
#5 zx=0;nx=1;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=0;ny=1;f=1;no=1;
#5 zx=0;nx=0;zy=1;ny=1;f=1;no=0;
#5 zx=1;nx=1;zy=0;ny=0;f=1;no=0;
#5 zx=0;nx=0;zy=0;ny=0;f=1;no=0;
#5 zx=0;nx=1;zy=0;ny=0;f=1;no=1;
#5 zx=0;nx=0;zy=0;ny=1;f=1;no=1;
#5 zx=0;nx=0;zy=0;ny=0;f=0;no=0;
#5 zx=0;nx=1;zy=0;ny=1;f=0;no=1;

#5 a=112;b=-310;
#5 zx=1;nx=0;zy=1;ny=0;f=0;no=0;
#5 zx=1;nx=1;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=1;ny=0;f=1;no=0;
#5 zx=0;nx=0;zy=1;ny=1;f=0;no=0;
#5 zx=1;nx=1;zy=0;ny=0;f=0;no=0;
#5 zx=0;nx=0;zy=1;ny=1;f=0;no=1;
#5 zx=1;nx=1;zy=0;ny=0;f=0;no=1;
#5 zx=0;nx=0;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=0;ny=0;f=1;no=1;
#5 zx=0;nx=1;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=0;ny=1;f=1;no=1;
#5 zx=0;nx=0;zy=1;ny=1;f=1;no=0;
#5 zx=1;nx=1;zy=0;ny=0;f=1;no=0;
#5 zx=0;nx=0;zy=0;ny=0;f=1;no=0;
#5 zx=0;nx=1;zy=0;ny=0;f=1;no=1;
#5 zx=0;nx=0;zy=0;ny=1;f=1;no=1;
#5 zx=0;nx=0;zy=0;ny=0;f=0;no=0;
#5 zx=0;nx=1;zy=0;ny=1;f=0;no=1;

#5 a=-112;b=-310;
#5 zx=1;nx=0;zy=1;ny=0;f=0;no=0;
#5 zx=1;nx=1;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=1;ny=0;f=1;no=0;
#5 zx=0;nx=0;zy=1;ny=1;f=0;no=0;
#5 zx=1;nx=1;zy=0;ny=0;f=0;no=0;
#5 zx=0;nx=0;zy=1;ny=1;f=0;no=1;
#5 zx=1;nx=1;zy=0;ny=0;f=0;no=1;
#5 zx=0;nx=0;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=0;ny=0;f=1;no=1;
#5 zx=0;nx=1;zy=1;ny=1;f=1;no=1;
#5 zx=1;nx=1;zy=0;ny=1;f=1;no=1;
#5 zx=0;nx=0;zy=1;ny=1;f=1;no=0;
#5 zx=1;nx=1;zy=0;ny=0;f=1;no=0;
#5 zx=0;nx=0;zy=0;ny=0;f=1;no=0;
#5 zx=0;nx=1;zy=0;ny=0;f=1;no=1;
#5 zx=0;nx=0;zy=0;ny=1;f=1;no=1;
#5 zx=0;nx=0;zy=0;ny=0;f=0;no=0;
#5 zx=0;nx=1;zy=0;ny=1;f=0;no=1;
end
endmodule
