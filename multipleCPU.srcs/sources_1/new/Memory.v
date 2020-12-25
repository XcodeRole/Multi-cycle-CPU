`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/14 12:03:57
// Design Name: 
// Module Name: Memory
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


module Memory(
input MemWr,
input [31:0] Din,
input [31:0] Adr,
output reg [31:0] Dout
    );
    reg [31:0] Mem [0:2047]; //2K
    always@(*)
    begin
        if(MemWr)
            Mem[Adr]=Din;
        else
            Dout=Mem[Adr];
    end
endmodule
