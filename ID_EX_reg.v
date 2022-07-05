`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 19:49:07
// Design Name: 
// Module Name: ID_EX_reg
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


module ID_EX_reg(
input Clk,Reset,
input [7:0] Data1,Data2,extended,
input [2:0] Rd,Rs1,
input RegWrite,ALUctrl,ALUsrc,jump,
output reg [7:0] Data1_ID_EX,Data2_ID_EX,extended_ID_EX,
output reg [2:0] Rd_ID_EX,Rs1_ID_EX,
output reg RegWrite_ID_EX,ALUctrl_ID_EX,ALUsrc_ID_EX,jump_ID_EX
);

always @ (posedge Clk, negedge Reset)
begin  
    if( Reset == 0 ) begin
        Data1_ID_EX = 8'b0;
        Data2_ID_EX = 8'b0;
        extended_ID_EX = 8'b0;
        Rd_ID_EX = 3'b0;
        Rs1_ID_EX = 3'b0;
        {RegWrite_ID_EX,ALUctrl_ID_EX,ALUsrc_ID_EX,jump_ID_EX} = 4'b0000;
        end
    else begin
        Data1_ID_EX = Data1;
        Data2_ID_EX = Data2;
        extended_ID_EX = extended;
        Rd_ID_EX = Rd;
        Rs1_ID_EX = Rs1;
        RegWrite_ID_EX = RegWrite;
        ALUctrl_ID_EX = ALUctrl;
        ALUsrc_ID_EX = ALUsrc;
        jump_ID_EX = jump;
        end
end
endmodule
