`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2022 23:04:50
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


module ALU(input [7:0] A, input [7:0] B, input Control, output reg [7:0] Result, output reg Zero);

always @ (A,B,Control)
begin
	case (Control)
	1'b0: Result = A + B;
	1'b1: Result = A << B;
	endcase
	if (Result == 0) Zero = 1; else Zero = 0;
end
endmodule