`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/27 23:04:00
// Design Name: 
// Module Name: ALU
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


module ALU(
input [31:0] Da,
input [31:0] Db,
input [2:0] ALUctr,//add-000,addu-001,sub-010,subu-011,slt-100,sltu-101,or-110
output reg [31:0] F,
output Zero
    );
    reg [32:0] bool;//通过多一位的方式取出最高位进位
    reg [31:0] over;
    assign Zero=(F==32'b0)?1:0;
    always@(*)
    begin
        case(ALUctr)
        3'b000:F=Da+Db;
        3'b001:F=Da+Db;
        3'b010:F=Da+~Db+1;
        3'b011:F=Da+~Db+1;
        3'b100:begin bool=Da+~Db+1;if(bool[31]) F=32'h1;else F=32'h0; end
        3'b101:begin bool=Da+~Db+1;if(!bool[32]) F=32'h1;else F=32'h0; end
        3'b110:F=Da|Db;
        endcase
    end
endmodule