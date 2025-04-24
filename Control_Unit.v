`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 03:45:26 PM
// Design Name: 
// Module Name: Control_Unit
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

module Control_Unit(
    input [6:0] opcode,
    output reg Branch,
    output reg MemRead,
    output reg MemToReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );
    // assigning control signals based on the opcode values
    always @(*) begin
    case (opcode)  
    // R-Type 
    7'b0110011 : begin
        ALUSrc<=1'b0;
        MemToReg<=1'b0;
        RegWrite<=1'b1;
        MemRead<=1'b0;
        MemWrite<=1'b0;
        Branch<=1'b0;
   ALUOp<=2'b10; end
    // I-Type (ld)
    7'b0000011 : begin
        ALUSrc<=1'b1;
        MemToReg<=1'b1;
        RegWrite<=1'b1;
        MemRead<=1'b1;
        MemWrite<=1'b0;
        Branch<=1'b0;
        ALUOp<=2'b00; end
    // S-Type (sd)    
    7'b0100011 : begin
        ALUSrc<=1'b1;
        MemToReg<=1'bx;
        RegWrite<=1'b0;
        MemRead<=1'b0;
        MemWrite<=1'b1;
        Branch<=1'b0;
        ALUOp<=2'b00; end
     // SB-Type (beq)    
    7'b1100011 : begin
        ALUSrc<=1'b0;
        MemToReg<=1'bx;
        RegWrite<=1'b0;
        MemRead<=1'b0;
        MemWrite<=1'b0;
        Branch<=1'b1;
        ALUOp<=2'b01; end
    // addi instruction   
    7'b0010011: begin
        ALUSrc<=1'b1;
        MemToReg<=1'b0;
        RegWrite<=1'b1;
        MemRead<=1'b0;
        MemWrite<=1'b0;
        Branch<=1'b0;
        ALUOp<=2'b00; end
        // default
    default: begin
        ALUSrc<=1'b0;
        MemToReg<=1'b0;
        RegWrite<=1'b0;
        MemRead<=1'b0;
        MemWrite<=1'b0;
        Branch<=1'b0;
        ALUOp<=2'b00; end
    endcase
    
    end
endmodule

