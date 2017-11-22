`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 15:49:16
// Design Name: 
// Module Name: NextPC
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


module NextPC(Reset,PC,Immediate,JumpPC,PCSrc,NextPC);
input Reset;
input [31:0] PC,Immediate;
input [31:0] JumpPC;
input [1:0] PCSrc;
output reg [31:0] NextPC;


always@(Reset or PCSrc or PC or Immediate or JumpPC) begin
        if(Reset==0)NextPC=PC+4;
        else begin
            case(PCSrc)
                2'b00: NextPC=PC+4;
                2'b01: NextPC=PC+4+(Immediate<<2);
                2'b10: begin
                    NextPC=JumpPC;
                end
                2'b11:NextPC=PC;
            endcase
        end
end

endmodule
