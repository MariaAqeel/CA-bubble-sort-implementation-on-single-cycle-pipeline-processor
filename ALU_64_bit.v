`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 03:20:04 PM
// Design Name: 
// Module Name: ALU_64_bit
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


module ALU_64_bit(
    input [63:0] a,
    input [63:0] b,
    input [3:0] ALUOp,
    output  reg [63:0] Result,
    output Zero,
    output lessThan
    );
   
    always @(*) begin
    case (ALUOp)
    4'b0000: begin
        Result = a & b;
    end
    4'b0001: begin
        Result = a | b;
    end
    4'b0010: begin
        Result = a + b;
    end
    4'b0110: begin
        Result = a - b;
    end
    4'b1100: begin
        Result = ~(a | b);
    end
    4'b1000: begin
        Result = a * (2 ** b);
    end
    default: begin
        Result = 64'h0000000000000000;
    end
    endcase
    end
   
    assign Zero = (Result == 64'h0000000000000000) ? 1 : 0;
    assign lessThan =Result[63] == 1'b1 ? 1'b1 : 1'b0;

   
endmodule
