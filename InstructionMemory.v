`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2022 23:00:18
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(PC,Reset,Instruction_Code);
input [7:0]PC;
input Reset;
output [7:0] Instruction_Code;

reg [7:0]Mem[7:0]; // Each location is 8 bits, and 8 such locations exist

assign Instruction_Code = Mem[PC];

always@(Reset)
begin
if (Reset == 0)
    begin
    Mem[0] = 8'b00_010_011;  // addi R2,3 
    Mem[1] = 8'b01_010_001;  // sll R2,1
    Mem[2] = 8'b00_101_100;  // addi R5,4
    Mem[3] = 8'b11_000_010;  // jmp L1 (2)
    Mem[4] = 8'b01_101_011;  // sll R5,3
    Mem[5] = 8'b00_001_010;  // L1: addi R1,2
    end
end
endmodule
