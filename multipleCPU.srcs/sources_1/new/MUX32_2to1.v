`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/27 21:25:33
// Design Name: 
// Module Name: MUX32_2to1
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


module MUX32_2to1(
input IorD,
input [31:0] I,
input [31:0] D,
output reg [31:0] Odata
    );
    always@(*)
    begin
        case(IorD)
        1'b0:Odata=I;
        1'b1:Odata=D;
        endcase
    end
endmodule