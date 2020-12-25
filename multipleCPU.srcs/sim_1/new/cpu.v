`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/16 11:45:52
// Design Name: 
// Module Name: cpu
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


module cpu;
    reg clk;
    reg rst;
    wire IRWr;//CU
    wire ExtOp;
    wire IorD;
    wire [1:0] PCSource;
    wire [1:0] ALUSelB;
    wire [2:0] ALUop;
    wire R_type;
    wire RegDst;
    wire MemtoReg;
    wire ALUSelA;
    wire BrWr;
    wire PCWr;
    wire PCWrCond;
    wire RegWr;
    wire MemWr;
    wire [5:0] opcode;
    ///////////
    wire [31:0] prePC;//PC
    wire [31:0] Odata32;//I
    wire [3:0] Odata4;
    wire Zero;
    /////////
    wire [31:0] D;//mux1
    wire [31:0] Adr;
    //////////
    wire [31:0] Db;//Memory
    wire [31:0] Dout;
    /////////
    wire [4:0] rs;//IR_reg
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] shamt;
    wire [5:0] func;
    ///////
    wire [4:0] Rw;//Register
    wire [31:0] Dw;
    wire [31:0] Da;//Db在上面声明
    ////////
    wire [31:0] O1;//extend
    wire [31:0] O2;
    ////////
    wire [31:0] selA;//ALU
    wire [31:0] selB;
    wire [2:0] ALUctr;
    ////////
    wire [2:0] RALUop;//RtypeCU
    //////
    wire [31:0] npc;//NPC
    //////
    Main main(
    rst,clk, IRWr,
     ExtOp,
     IorD,
    PCSource,
      ALUSelB,
      ALUop,
     R_type,
     RegDst,
     MemtoReg,
     ALUSelA,
     BrWr,
     PCWr,
     PCWrCond,
     RegWr, MemWr,opcode,prePC,Odata32,Odata4,Zero,D,Adr,Db,Dout,rs,rt,rd,shamt,func,Rw,Dw,Da,O1,O2,selA,selB,ALUctr,RALUop,npc
    );
    initial 
    begin
        rst=1;
        #10 rst=0;
    end
    initial
    begin
        clk=0;
        forever #5 clk=~clk;
    end
endmodule
