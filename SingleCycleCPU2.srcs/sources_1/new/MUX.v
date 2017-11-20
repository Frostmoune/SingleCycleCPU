`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/22 19:33:19
// Design Name: 
// Module Name: mux
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


module MUX(
    input CLK190,
    input Reset,
    input [15:0] Out,
    output reg [6:0] a_to_g,
    output reg [3:0] an,
    output wire dp
);

reg [1:0] wires;
reg [3:0] digit;
wire [3:0] aen;
assign dp=1;

always @(posedge CLK190 or negedge Reset)
begin
     if(Reset==0)
        wires<=0;
     else
        wires<=wires+1;
end

assign aen=4'b1111;

always @(*)
begin
    case(wires)
        0:begin
            digit=Out[3:0];
        end
        1:begin
            digit=Out[7:4];
        end
        2:begin
            digit=Out[11:8];
        end
        3:begin
            digit=Out[15:12];
        end
        default:begin
            digit=Out[3:0];
        end
    endcase
end

always @(*)
case(digit)
0:a_to_g=7'b0000001;
1:a_to_g=7'b1001111;
2:a_to_g=7'b0010010;
3:a_to_g=7'b0000110;
4:a_to_g=7'b1001100;
5:a_to_g=7'b0100100;
6:a_to_g=7'b0100000;
7:a_to_g=7'b0001111;
8:a_to_g=7'b0000000;
9:a_to_g=7'b0000100;
'hA:a_to_g=7'b0001000;
'hB:a_to_g=7'b1100000;
'hC:a_to_g=7'b0110001;
'hD:a_to_g=7'b1000010;
'hE:a_to_g=7'b0110000;
'hF:a_to_g=7'b0111000;
default:a_to_g=7'b1111111;
endcase

always@(*)
begin
   an=4'b1111;
   if(aen[wires]==1)
      an[wires]=0;
end

endmodule
