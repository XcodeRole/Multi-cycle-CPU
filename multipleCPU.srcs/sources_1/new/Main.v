`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/14 15:59:37
// Design Name: 
// Module Name: Main
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


module Main(
input rst,
input clk,
output IRWr,//CU
output ExtOp,
output IorD,
output [1:0] PCSource,
output [1:0] ALUSelB,
output [2:0] ALUop,
output R_type,
output RegDst,
output MemtoReg,
output ALUSelA,
output BrWr,
output PCWr,
output PCWrCond,
output RegWr,
output MemWr,
output [5:0] opcode,
///////////
output [31:0] prePC,//PC
output [31:0] Odata32,//I
output [3:0] Odata4,
output Zero,
/////////
output [31:0] D,//mux1
output [31:0] Adr,
//////////
output [31:0] Db,//Memory
output [31:0] Dout,
/////////
output [4:0] rs,//IR_reg
output [4:0] rt,
output [4:0] rd,
output [4:0] shamt,
output [5:0] func,
///////
output [4:0] Rw,//Register
output [31:0] Dw,
output [31:0] Da,//Db在上面声明
////////
output [31:0] O1,//extend
output [31:0] O2,
////////
output [31:0] selA,//ALU
output [31:0] selB,
output [2:0] ALUctr,
////////
output [2:0] RALUop,//RtypeCU
//////
output [31:0] npc//NPC
    );
//    wire IRWr;//CU
//    wire ExtOp;
//    wire IorD;
//    wire [1:0] PCSource;
//    wire [1:0] ALUSelB;
//    wire [2:0] ALUop;
//    wire R_type;
//    wire RegDst;
//    wire MemtoReg;
//    wire ALUSelA;
//    wire BrWr;
//    wire PCWr;
//    wire PCWrCond;
//    wire RegWr;
//    wire MemWr;
//    wire [5:0] opcode;
//    ///////////
//    wire [31:0] prePC;//PC
//    wire [31:0] Odata32;//I
//    wire [3:0] Odata4;
//    wire Zero;
//    /////////
//    wire [31:0] D;//mux1
//    wire [31:0] Adr;
//    //////////
//    wire [31:0] Db;//Memory
//    wire [31:0] Dout;
//    /////////
//    wire [4:0] rs;//IR_reg
//    wire [4:0] rt;
//    wire [4:0] rd;
//    wire [4:0] shamt;
//    wire [5:0] func;
//    ///////
//    wire [4:0] Rw;//Register
//    wire [31:0] Dw;
//    wire [31:0] Da;//Db在上面声明
//    ////////
//    wire [31:0] O1;//extend
//    wire [31:0] O2;
//    ////////
//    wire [31:0] selA;//ALU
//    wire [31:0] selB;
//    wire [2:0] ALUctr;
//    ////////
//    wire [2:0] RALUop;//RtypeCU
//    //////
//    wire [31:0] npc;//NPC
//    //////
    CU control(clk,rst,opcode,IRWr,ExtOp,IorD,PCSource,ALUSelB,ALUop,R_type,RegDst,MemtoReg,ALUSelA,BrWr,PCWr,PCWrCond,RegWr,MemWr);
    PC pc(clk,rst,prePC,PCWr,PCWrCond,Zero,Odata32,Odata4);
    MUX32_2to1 mux1(IorD,Odata32,D,Adr);
    Memory mem(MemWr,Db,Adr,Dout);
    IR_reg ir(clk,rst,IRWr,Dout,opcode,rs,rt,rd,shamt,func);
    MUX32_2to1 mux2(MemtoReg,D,Dout,Dw);
    MUX5_2to1 mux3(rt,rd,RegDst,Rw);
    Register register(rs,rt,Rw,Dw,RegWr,Da,Db);
    Extend extend({rd,shamt,func},ExtOp,O1,O2);
    MUX32_2to1 mux4(ALUSelA,Odata32,Da,selA);
    MUX32_4to1 mux5(Db,O1,O2,ALUSelB,selB);
    RtypeCU rtype(func,RALUop);
    MUX3_2to1 mux6(RALUop,ALUop,R_type,ALUctr);
    ALU alu(selA,selB,ALUctr,D,Zero);
    NPC branch_reg(clk,rst,BrWr,D,npc);
    MUX32_3to1 mux7({Odata4,rs,rt,rd,shamt,func,2'b00},D,npc,PCSource,prePC);
endmodule
