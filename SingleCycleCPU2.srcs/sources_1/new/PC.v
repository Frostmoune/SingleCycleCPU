`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 15:25:15
// Design Name: 
// Module Name: PC
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


module PC(CLK,Reset,NextPC,PCWre,IAddr);
input CLK,Reset;
input [31:0] NextPC;
input PCWre;
output reg [31:0] IAddr;

initial begin
    IAddr=0;
end

always @(posedge CLK or negedge Reset)
begin
    if(Reset==0)IAddr<=0;
    else if(PCWre==1)IAddr<=NextPC;
end
endmodule
