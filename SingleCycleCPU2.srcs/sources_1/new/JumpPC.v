`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 15:48:00
// Design Name: 
// Module Name: JumpPC
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


module JumpPC(PC,InAddress,Out);
input [31:0] PC;
input [25:0] InAddress;
output reg [31:0] Out;

always @(PC or InAddress) 
begin
    Out[31:28]=PC[31:28];
    Out[27:2]=(InAddress>>2);
    Out[1:0]=0;
end

endmodule
