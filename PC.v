`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Program Counter gives the address of the next program to be executed.
// All the instructions stored in ROM are accessed by Program Counter.
// if rst==1 , Q(t+1)=0, else
// if load==1, Q(t+1)=I(t), else
// if nxt==1 , Q(t+1)=Q(t)+1
//////////////////////////////////////////////////////////////////////////////////


module PC(clk,I,rst,load,nxt,Q);
    input [15:0] I;
    input rst, load, nxt,clk;
    output [15:0] Q;
    reg [15:0] Q;
    
    always @(negedge clk)
    Q=rst?0:(load?I:(nxt?(Q+1):Q));
    
    initial begin
    Q=0;
    end
    endmodule
