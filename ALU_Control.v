`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 03:40:49 PM
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control(
    input [1:0] ALUOp,
    input [3:0] Funct,
    output reg[3:0] Operation
    );
    
    always @ (*) begin 
    // assigning values to operation based on ALUOp values
    case (ALUOp) 
        2'b00 : begin
        if (Funct[2:0]==3'b001)
        begin Operation = 4'b1000; end // slli type
        else begin
        Operation = 4'b0010; // i type (ld, sd) 
        end
        end
        2'b01 : begin 
            Operation = 4'b0110;
        end
        2'b10 : begin 
            // assigning values to operation based on funct values
            if (Funct==4'b0000)
                Operation = 4'b0010;
            else if (Funct==4'b1000)
                Operation = 4'b0110;
            else if (Funct==4'b0111)
                Operation = 4'b0000;
            else if (Funct==4'b0110)
                 Operation = 4'b0001;
//            else if (Funct==4'b0001)
//                 Operation = 4'b0100; //slli
       
        end
    endcase
    end
    
endmodule
