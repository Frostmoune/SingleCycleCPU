`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 15:33:49
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(Op,Sign,Zero,PCWre,ALUSrcA,ALUSrcB,DBDataSrc,RegWre,InsMemRW,RD,WR,RegDst,ExtSel,PCSrc,ALUOp);
input [5:0] Op;
input Sign,Zero;
output PCWre,ALUSrcA,ALUSrcB,DBDataSrc,RegWre,InsMemRW,RD,WR,RegDst,ExtSel;
output [1:0] PCSrc;
output [2:0] ALUOp;

assign PCWre=(Op==6'b111111)?0:1;
assign ALUSrcA=(Op==6'b011000)?1:0;
assign ALUSrcB=((Op==6'b000001)||(Op==6'b010000)||(Op==6'b010011)||(Op==6'b010101)||(Op==6'b100110)||(Op==6'b100111))?1:0;
assign DBDataSrc=(Op==6'b100111)?1:0;
assign RegWre=((Op==6'b100110)||(Op==6'b110000)||(Op==6'b110001)||(Op==6'b110010)||(Op==6'b111000)||(Op==6'b111111))?0:1;
assign InsMemRW=0;
assign RD=(Op==6'b100111)?0:1;
assign WR=(Op==6'b100110)?0:1;
assign RegDst=((Op==6'b000001)||(Op==6'b010000)||(Op==6'b010011)||(Op==6'b010101)||(Op==6'b100111))?0:1;
assign ExtSel=((Op==6'b000001)||(Op==6'b100110)||(Op==6'b100111)||(Op==6'b110000)||(Op==6'b110001)||(Op==6'b110010))?1:0;
assign PCSrc[1]=((Op==6'b111000)||(Op==6'b111111))?1:0;
assign PCSrc[0]=((Op==6'b110000&&Zero==1)||(Op==6'b110001&&Zero==0)||(Op==6'b110010&&Zero==0&&Sign==0)||(Op==6'b111111))?1:0;
assign ALUOp[2]=((Op==6'b010001)||(Op==6'b010011)||(Op==6'b010100)||(Op==6'b010101)||(Op==6'b011100)||(Op==6'b110000)||(Op==6'b110001)||(Op==6'b110010))?1:0;
assign ALUOp[1]=((Op==6'b010000)||(Op==6'b010010)||(Op==6'b010100)||(Op==6'b010101)||(Op==6'b011000)||(Op==6'b011100)||(Op==6'b110000)||(Op==6'b110001)||(Op==6'b110010))?1:0;
assign ALUOp[0]=((Op==6'b000010)||(Op==6'b010000)||(Op==6'b010010)||(Op==6'b010100)||(Op==6'b010101)||(Op==6'b110000)||(Op==6'b110001)||(Op==6'b110010))?1:0;


endmodule
