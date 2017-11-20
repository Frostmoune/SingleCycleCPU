`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 19:51:47
// Design Name: 
// Module Name: KeyOn
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


module KeyOn(CLK,Key,Led);
input CLK;
input Key;
output Led;

reg led=0;

always@(posedge CLK)
begin
  if(Key==0)//Èç¹û×´Ì¬ÖÃÒ»
    led <=1;//µÆÁÁ
  else
    led <=0;
end

assign Led=led;

endmodule
