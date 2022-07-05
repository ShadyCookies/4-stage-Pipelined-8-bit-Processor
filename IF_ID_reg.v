`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 19:41:40
// Design Name: 
// Module Name: IF_ID_reg
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


module IF_ID_reg(Clk,Reset,flush,instrCode,PC,instrCode_IF_ID,PC_IF_ID);

input Clk,Reset,flush;
input [7:0] instrCode,PC;
output reg [7:0] instrCode_IF_ID,PC_IF_ID;

always @ (posedge Clk, negedge Reset)
begin  
    if((Reset == 0) || (flush == 1)) begin
        instrCode_IF_ID = 8'b0;
        PC_IF_ID = 8'b0;
        end
    else begin
        instrCode_IF_ID = instrCode;
        PC_IF_ID = PC;
        end
end
endmodule
