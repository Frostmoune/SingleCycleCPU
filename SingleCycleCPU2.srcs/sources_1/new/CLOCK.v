`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 19:51:19
// Design Name: 
// Module Name: CLOCK
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


module CLOCK(
    input CLK,
    input Reset,
    output CLK190,
    output CLK3
    );
    
reg [25:0] wires;

always @(posedge CLK or negedge Reset)
begin
     if(Reset==0)begin
        wires<=0;
     end
     else begin
        wires<=wires+1;
     end
end

assign CLK190=wires[17];
assign CLK3=wires[25];

endmodule
