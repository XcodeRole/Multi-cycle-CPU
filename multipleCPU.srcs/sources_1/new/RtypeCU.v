`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 17:44:23
// Design Name: 
// Module Name: RtypeCU
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


module RtypeCU(
input [5:0] func,
output [2:0] RALUop
    );
    assign RALUop[2]=func[5]&~func[4]&func[3]&~func[2]&func[1];
    assign RALUop[1]=func[5]&~func[4]&~func[3]&~func[2]&func[1];
    assign RALUop[0]=func[5]&~func[4]&~func[2]&func[1]&func[0];
endmodule
