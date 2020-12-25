`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 17:14:04
// Design Name: 
// Module Name: CU
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


module CU(
input clk,
input rst,
input [5:0] opcode,//输入的指令op段
output reg IRWr,
output reg ExtOp,
output reg IorD,
output reg [1:0] PCSource,
output reg [1:0] ALUSelB,
output reg [2:0] ALUop,//此处的取值参考ALU中
output reg R_type,
output reg RegDst,
output reg MemtoReg,
output reg ALUSelA,
output reg BrWr,
output reg PCWr,
output reg PCWrCond,
output reg RegWr,
output reg MemWr
    );
    parameter [3:0] zero=4'b0000,//12种有限状态机
                      one=4'b0001,
                      two=4'b0010,
                      three=4'b0011,
                      four=4'b0100,
                      five=4'b0101,
                      six=4'b0110,
                      seven=4'b0111,
                      eight=4'b1000,
                      nine=4'b1001,
                      ten=4'b1010,
                      eleven=4'b1011;
    reg [3:0] curr_state,next_state;
    always@(negedge clk)
    begin
    if(rst)
        curr_state<=zero;
    else
        curr_state<=next_state;
    end
    always@(*)
    begin
        case(curr_state)
        zero:begin
                IorD=0;
                ALUSelA=0;
                ALUSelB=2'b01;
                ALUop=3'b001;
                PCSource=2'b01;
                PCWr=1'b1;
                IRWr=1'b1;
                MemWr=0;
                RegWr=0;
                BrWr=0;
                R_type=0;
                next_state=one;
             end
        one:begin
                ExtOp=1'b1;
                ALUSelA=0;
                ALUSelB=2'b11;
                ALUop=3'b001;
                BrWr=1'b1;
                PCWr=0;
                PCWrCond=0;
                IRWr=0;
                MemWr=0;
                RegWr=0;
                R_type=0;
                if(opcode==6'b000100)
                    next_state=two;
                else if(opcode==6'b000010)
                    next_state=three;
                else if(opcode==6'b001101)
                    next_state=four;
                else if(opcode==6'b000000)
                    next_state=six;
                else if(opcode==6'b100011||opcode==101011)
                    next_state=eight;
            end
        two:begin
                ALUSelA=1'b1;
                ALUSelB=2'b00;
                ALUop=3'b011;
                PCWrCond=1'b1;
                PCSource=2'b10;
                RegWr=0;
                PCWr=0;
                IRWr=0;
                MemWr=0;
                BrWr=0;
                R_type=0;
                next_state=zero;
            end
        three:begin
            PCSource=2'b00;
            PCWr=1'b1;
            RegWr=0;
            IRWr=0;
            MemWr=0;
            BrWr=0;
            next_state=zero;
            end
        four:begin
            ALUSelA=1'b1;
            ALUSelB=2'b10;
            ExtOp=0;
            MemtoReg=0;
            RegDst=0;
            RegWr=0;
            PCWr=0;
            PCWrCond=0;
            IRWr=0;
            MemWr=0;
            BrWr=0;
            R_type=0;
            next_state=five;
            if(opcode==6'b001101)
                ALUop=3'b110;
            else if(opcode==6'b001001)
                ALUop=3'b001;
            end
        five:begin
            ALUSelA=1'b1;
            ALUSelB=2'b10;
            ExtOp=0;
            MemtoReg=0;
            RegDst=0;
            RegWr=1'b1;
            PCWr=0;
            PCWrCond=0;
            IRWr=0;
            MemWr=0;
            BrWr=0;
            R_type=0;
            next_state=zero;
            if(opcode==6'b001101)
                ALUop=3'b110;
            else if(opcode==6'b001001)
                ALUop=3'b001;
            end
        six:begin
            ALUSelA=1'b1;
            ALUSelB=0;
            RegDst=1'b1;
            R_type=1'b1;
            RegWr=0;
            PCWr=0;
            PCWrCond=0;
            IRWr=0;
            MemWr=0;
            BrWr=0;
            MemtoReg=0;
            next_state=seven;
            end
        seven:begin
            ALUSelA=1'b1;
            ALUSelB=0;
            RegDst=1'b1;
            R_type=1'b1;
            RegWr=1'b1;
            PCWr=0;
            PCWrCond=0;
            IRWr=0;
            MemWr=0;
            BrWr=0;
            MemtoReg=0;
            next_state=zero;
            end
        eight:begin
            ALUSelA=1'b1;
            ALUSelB=2'b10;
            ALUop=3'b001;
            ExtOp=1'b1;
            IorD=1'b1;
            RegWr=0;
            PCWr=0;
            PCWrCond=0;
            IRWr=0;
            MemWr=0;
            BrWr=0;
            R_type=0;
            if(opcode==6'b101011)
                next_state=nine;
            else if(opcode==6'b100011)
                next_state=ten;
            end
        nine:begin
            ALUSelA=1'b1;
            ALUSelB=2'b10;
            ALUop=3'b001;
            ExtOp=1'b1;
            IorD=1'b1;
            RegWr=0;
            PCWr=0;
            PCWrCond=0;
            IRWr=0;
            MemWr=1'b1;
            BrWr=0;
            R_type=0;
            next_state=zero;
            end
        ten:begin
            ExtOp=1'b1;
            ALUSelA=1'b1;
            ALUSelB=2'b10;
            ALUop=3'b001;
            IorD=1'b1;
            R_type=0;
            MemtoReg=1'b1;
            RegDst=0;
            RegWr=0;
            PCWr=0;
            PCWrCond=0;
            IRWr=0;
            MemWr=0;
            BrWr=0;
            next_state=eleven;
            end
        eleven:begin
            ExtOp=1'b1;
            ALUSelA=1'b1;
            ALUSelB=2'b10;
            ALUop=3'b001;
            IorD=1'b1;
            R_type=0;
            MemtoReg=1'b1;
            RegDst=0;
            RegWr=1'b1;
            PCWr=0;
            PCWrCond=0;
            IRWr=0;
            MemWr=0;
            BrWr=0;
            next_state=zero;
            end
        endcase
    end
endmodule
