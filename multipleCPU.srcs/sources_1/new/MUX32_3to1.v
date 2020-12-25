`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 16:14:08
// Design Name: 
// Module Name: MUX32_3to1
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


module MUX32_3to1(
input [31:0] jPC,//jump指令
input [31:0] aPC,//ALU结果
input [31:0] bPC,//branch指令
input [1:0] PCSource,
output reg [31:0] NPC//输入到PC端口的值
    );
    always@(*)
    begin
        case(PCSource)
        2'b00:NPC=jPC;
        2'b01:NPC=aPC;
        2'b10:NPC=bPC;
        endcase
    end
endmodule
