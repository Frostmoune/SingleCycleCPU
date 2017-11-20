`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 15:39:39
// Design Name: 
// Module Name: SignZeroExtend
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


module SignZeroExtend(Immediate,ExtSel,Sign,ExtOut);
input [15:0] Immediate;
input ExtSel,Sign;
output [31:0] ExtOut;

assign ExtOut[15:0]=Immediate[15:0];
assign ExtOut[31:16]=(ExtSel==1&&(Immediate[15]==1))?16'hFFFF:16'h0000;

endmodule
