`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/27 21:35:31
// Design Name: 
// Module Name: PC
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


module PC(
input clk,//下降沿
input rst,//高电平有效
input [31:0] prePC,
input PCWr,//控制信号
input PCWrCond,
input Zero,
output [31:0] Odata32,
output [3:0] Odata4
    );
    reg [31:0] Instr;
    assign Odata32=Instr;
    assign Odata4=Instr[31:28];
    wire tmp1,tmp2;
    and a(tmp1,PCWrCond,Zero);
    or o(tmp2,tmp1,PCWr);
    always@(negedge clk)
    begin
    if(rst)
        Instr=32'b0;
    else if(tmp2)
        Instr=prePC;
    end
endmodule