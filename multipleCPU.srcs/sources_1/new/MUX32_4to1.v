`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 17:21:08
// Design Name: 
// Module Name: MUX32_4to1
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


module MUX32_4to1(
input [31:0] Db,
input [31:0] immdata,
input [31:0] immaddr,
input [1:0] ALUSelB,
output reg [31:0] Odata
    );
    always@(*)
    begin
        case(ALUSelB)
        2'b00:Odata=Db;
        2'b01:Odata=32'h4;
        2'b10:Odata=immdata;
        2'b11:Odata=immaddr;
        endcase
    end
endmodule
