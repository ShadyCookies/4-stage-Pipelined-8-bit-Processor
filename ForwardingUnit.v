`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2022 10:36:57
// Design Name: 
// Module Name: ForwardingUnit
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


module ForwardingUnit(Rs1_ID_EX,Rd_EX_WB,RegWrite_EX_WB,Forward);

input [2:0] Rs1_ID_EX,Rd_EX_WB;
input RegWrite_EX_WB;
output reg Forward;

always @ (*)
begin   
    if(RegWrite_EX_WB == 0)
        Forward = 0;
    else if ((Rs1_ID_EX == Rd_EX_WB) && (RegWrite_EX_WB == 1))
        Forward = 1;
    else Forward = 0;
end
endmodule

