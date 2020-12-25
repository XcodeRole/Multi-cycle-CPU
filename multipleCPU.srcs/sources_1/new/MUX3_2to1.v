`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 17:18:04
// Design Name: 
// Module Name: MUX3_2to1
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


module MUX3_2to1(
input [2:0] Rop,
input [2:0] ALUop,
input R_type,
output [2:0] ALUctr
    );
    assign ALUctr=(R_type==1)?Rop:ALUop;
endmodule
