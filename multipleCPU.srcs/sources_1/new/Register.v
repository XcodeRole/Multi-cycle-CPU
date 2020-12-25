`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/27 22:04:34
// Design Name: 
// Module Name: Register
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


module Register(
input [4:0] Ra,
input [4:0] Rb,
input [4:0] Rw,
input [31:0] Dw,
input RegWr,
//input Overflow,
output [31:0] Da,
output [31:0] Db
    );
    reg [31:0] register [0:31];
    //wire Wr;
    //assign Wr=(~Overflow)&RegWr;
    assign Da=register[Ra];
    assign Db=register[Rb];
    always@(*)
    begin
       if(RegWr)
            register[Rw]=Dw; 
    end
endmodule
