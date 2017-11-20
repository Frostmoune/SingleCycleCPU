`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 15:46:17
// Design Name: 
// Module Name: Select32
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


module Select32(
    input Select,
    input [31:0] DataA,DataB,
    output [31:0] Data
);

assign Data=Select?DataB:DataA;

endmodule
