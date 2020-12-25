`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 17:34:13
// Design Name: 
// Module Name: Extend
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


module Extend(
input [15:0] imm16,
input ExtOp,
output reg [31:0] O1,
output [31:0] O2
    );
    always@(*)
    begin
        case(ExtOp)
        1'b1:begin if(imm16[15]) O1={16'hffff,imm16};else O1={16'h0000,imm16};   end
        1'b0:O1={16'h0000,imm16};
        endcase
    end
    assign O2=O1<<2;
endmodule
