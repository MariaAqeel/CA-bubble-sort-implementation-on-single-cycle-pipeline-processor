`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 03:15:58 PM
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(
    input [31:0] inst,
    output [63:0] imm_data
    );
    reg [11:0] imm_12;
    wire [6:0] opcode;
    assign opcode = inst[6:0];
   
    always @* begin
        case (opcode[6:5])
            2'b00: imm_12 = inst[31:20]; //I-type 
            2'b01: imm_12 = {inst[31:25], inst[11:7]}; //S-type 
            2'b11: imm_12 = {inst[31], inst[7], inst[30:25], inst[11:8]}; //SB-type 
        endcase
    end
   
    assign imm_data = {{52{imm_12[11]}}, imm_12}; //Sign extend to 64-bit
endmodule
