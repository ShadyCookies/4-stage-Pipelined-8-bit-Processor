`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2022 23:02:35
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
input [2:0] Read_Reg_Num_1,
input [2:0] Read_Reg_Num_2,
input [2:0] Write_Reg_Num_1,
input [7:0] Write_Data,
output [7:0] Read_Data_1,
output [7:0] Read_Data_2,
input RegWrite,
input Clk,
input Reset
);

reg [7:0] RegMemory [7:0];
integer i;
always @ (*)
begin  
    if (Reset == 0)
    begin
        RegMemory[0] = 32'h0000_0000;
        RegMemory[1] = 32'h0000_0001;
        RegMemory[2] = 32'h0000_0002;
        RegMemory[3] = 32'h0000_0003;
        RegMemory[4] = 32'h0000_0004;
        RegMemory[5] = 32'h0000_0005;   
        RegMemory[6] = 32'h0000_0006;   
        RegMemory[7] = 32'h0000_0007;   
    end
    else
    if ( RegWrite == 1 )
    begin   
         RegMemory[Write_Reg_Num_1] = Write_Data;
    end
end

assign Read_Data_1 = RegMemory[Read_Reg_Num_1];
assign Read_Data_2 = RegMemory[Read_Reg_Num_2];

endmodule
