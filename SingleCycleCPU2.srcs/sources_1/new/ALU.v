`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 15:41:31
// Design Name: 
// Module Name: ALU
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


module ALU(InA,InB,ALUOp,Result,Zero,Sign);
input [31:0] InA,InB;
input [2:0] ALUOp;
output reg [31:0] Result;
output Zero,Sign;

always @(ALUOp or InA or InB)
begin
    case(ALUOp)
        3'b000:begin
            Result=(InA+InB);
          end
        3'b001:begin
            Result=(InA-InB);
          end
        3'b010:begin
            Result=(InB<<InA);
          end
        3'b011:begin
            Result=(InA|InB);
          end
        3'b100:begin
            Result=(InA&InB);
          end
        3'b101:begin
            Result=((InA<InB)?1:0);
          end
        3'b110:begin
            if(InA<InB&&(InA[31]==InB[31]))Result=1;
            else if(InA[31]&&!InB[31])Result=1;
            else Result=0;
          end
        3'b111:begin
            Result=(InA^InB);
          end
        default:begin
            Result=0;
          end
     endcase
end

assign Zero=(Result==0)?1:0;
assign Sign=Result[31];

endmodule
