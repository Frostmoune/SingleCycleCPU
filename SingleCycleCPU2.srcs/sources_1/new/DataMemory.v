`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 15:44:49
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(CLK,RD,WR,DAddr,DataIn,DataOut);
input CLK,RD,WR;
input [31:0] DAddr,DataIn;
output [31:0] DataOut;

reg [7:0] memory[0:60];

integer i;
initial begin
    for(i=0;i<60;i=i+1)
        begin
            memory[i]=0;
        end      
end

assign DataOut[7:0] = (RD==0)?memory[DAddr + 3]:8'bz; 
assign DataOut[15:8] = (RD==0)?memory[DAddr + 2]:8'bz;
assign DataOut[23:16] = (RD==0)?memory[DAddr + 1]:8'bz;
assign DataOut[31:24] = (RD==0)?memory[DAddr]:8'bz;

always@( negedge CLK ) 
begin 
    if( WR==0 ) begin
        memory[DAddr] <= DataIn[31:24];
        memory[DAddr+1] <= DataIn[23:16];
        memory[DAddr+2] <= DataIn[15:8];
        memory[DAddr+3] <= DataIn[7:0];
    end
end

endmodule
