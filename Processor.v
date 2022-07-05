`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2022 23:14:20
// Design Name: 
// Module Name: Processor
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


module Processor(input Clk, input Reset);

wire [7:0] Instruction_Code,ALU_result,Read_Data_1,Read_Data_2;
wire [7:0] PC,PCout,PCplus1,PCpluslabel;
wire [7:0] extended,Data_1,Data_2;
wire ALUctrl,jump,ImmSel,ALUsrc,RegWrite,Zero;

wire [7:0] instrCode_IF_ID,PC_IF_ID;

wire [2:0] Rd_ID_EX,Rs1_ID_EX;
wire RegWrite_ID_EX,ALUctrl_ID_EX,ALUsrc_ID_EX,jump_ID_EX;
wire [7:0] PC_ID_EX,Data1_ID_EX,Data2_ID_EX,extended_ID_EX;

wire [2:0] Rd_EX_WB;
wire RegWrite_EX_WB;
wire [7:0] PCpluslabel_EX_WB,ALUresult_EX_WB;

InstructionFetch IF(Clk,Reset,PCout,PC,Instruction_Code);

// Calculate PC+1 and PC+label and select PC based on jump signal
Add8bit ADD1(PC,8'b0000_0001,PCplus1);
Add8bit ADD2(PC_IF_ID,extended,PCpluslabel);
Mux M1(PCplus1,PCpluslabel,jump,PCout);

// Flush IF/ID register when jump instruction
wire flush;
assign flush = jump;
// IF/ID Register
IF_ID_reg pipreg1(Clk,Reset,flush,Instruction_Code,PC,instrCode_IF_ID,PC_IF_ID);

wire [2:0]Rd,Rs1,Rs2;
wire [1:0]opcode;
assign Rs1 = instrCode_IF_ID[5:3];
assign Rs2 = instrCode_IF_ID[5:3];
assign Rd = instrCode_IF_ID[5:3];
assign opcode = instrCode_IF_ID[7:6];

// Register File
RegisterFile RF(Rs1,Rs2,Rd_EX_WB,ALUresult_EX_WB,
                Read_Data_1,Read_Data_2,RegWrite_EX_WB,Clk,Reset);

// Control Unit           
ControlUnit CU(opcode,ALUctrl,ALUsrc,RegWrite,jump,ImmSel);

// ID/EX Register
ID_EX_reg pipreg2(Clk,Reset,Read_Data_1,Read_Data_2,extended,Rd,Rs1,
            RegWrite,ALUctrl,ALUsrc,jump,
            Data1_ID_EX,Data2_ID_EX,extended_ID_EX,Rd_ID_EX,Rs1_ID_EX,
            RegWrite_ID_EX,ALUctrl_ID_EX,ALUsrc_ID_EX,jump_ID_EX);

// Forwarding unit
wire Forward;
ForwardingUnit FU(Rs1_ID_EX,Rd_EX_WB,RegWrite_EX_WB,Forward);

Mux M2(Data2_ID_EX,extended_ID_EX,ALUsrc_ID_EX,Data_2); // Mux with inputs ReadData2,ImmGen, output to ALU
Mux M3(Data1_ID_EX,ALUresult_EX_WB,Forward,Data_1); // Forwarding Mux with inputs ReadData1,ALUresult, output to ALU

// ALU
ALU ALU1(Data_1,Data_2,ALUctrl_ID_EX,ALU_result,Zero);

// Immediate data generator
ImmGen IG(instrCode_IF_ID,ImmSel,extended);

// EX/WB Register
EX_WB_reg pipreg3(Clk,Reset,RegWrite_ID_EX,ALU_result,Rd_ID_EX,
                    RegWrite_EX_WB,ALUresult_EX_WB,Rd_EX_WB);
endmodule
