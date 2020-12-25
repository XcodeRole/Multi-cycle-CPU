`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/26 20:48:48
// Design Name: 
// Module Name: IR_reg
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


module IR_reg(
input clk,
input rst,
input IRWr,
input [31:0] idata,
output [5:0] op,
output [4:0] rs,
output [4:0] rt,
output [4:0] rd,
output [4:0] shamt,
output [5:0] func 
    );
    reg [31:0] instr;
    assign op=instr[31:26];
    assign rs=instr[25:21];
    assign rt=instr[20:16];
    assign rd=instr[15:11];
    assign shamt=instr[10:6];
    assign func=instr[5:0];
    always@(negedge clk)
    begin
    if(rst)
        instr=32'b0;
    else if(IRWr)
        instr=idata;
    end
endmodule
