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
input [31:0] jPC,//jumpָ��
input [31:0] aPC,//ALU���
input [31:0] bPC,//branchָ��
input [1:0] PCSource,
output reg [31:0] NPC//���뵽PC�˿ڵ�ֵ
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
