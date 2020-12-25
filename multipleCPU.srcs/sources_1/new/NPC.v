`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 16:03:06
// Design Name: 
// Module Name: NPC
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


module NPC(
input clk,
input rst,
input BrWr,
input [31:0] iaddr,
output [31:0] oaddr
    );
    reg [31:0] addr;
    assign oaddr=addr;
    always@(negedge clk)
    begin
    if(rst)
        addr=32'b0;
    else if(BrWr)
        addr=iaddr;
    end
endmodule
