`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/27 22:00:14
// Design Name: 
// Module Name: MUX5_2to1
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


module MUX5_2to1(
input [4:0] rt,
input [4:0] rd,
input RegDst,
output reg [4:0] Rw
    );
    always@(*)
    begin
        case(RegDst)
        1'b0:Rw=rt;
        1'b1:Rw=rd;
        endcase
    end
endmodule
