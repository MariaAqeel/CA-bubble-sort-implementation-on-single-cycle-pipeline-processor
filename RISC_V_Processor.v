

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 03:46:47 PM
// Design Name: 
// Module Name: RISC_V_Processor
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


module RISC_V_Processor(
    input clk, 
    input reset,
     
     // initilaising all the output wires that might be needed

      output wire [63:0] PC_Out,
      output wire [31:0] Instruction,
      output wire [4:0] rs1,
      output wire [4:0] rs2,
      output wire [4:0] rd,
      output wire [63:0] ReadData1,
      output wire [63:0] ReadData2,
      output wire [63:0] ALU_Result,
      output wire [63:0] Read_Data,
      output wire  [63:0] Imm_Data,
      output wire Zero,
      output wire [63:0] WriteData,
     
     output wire [63:0] PC_In,
     output wire PC_Src,
     output wire [6:0] opcode,
     output wire [2:0] funct3,
     output wire [6:0] funct7,
     output wire Branch, MemRead, MemtoReg,
     output wire [1:0] ALUOp,
     output wire MemWrite,
     output wire ALUSrc,
     output wire RegWrite,
     output wire [3:0] operation,
     output wire [63:0] Adder_1,
     output wire [63:0] Adder_2,
     output wire [63:0] ALU_input2,
     output wire [63:0] mem0,
	 output wire [63:0] mem1,
	 output wire [63:0] mem2,
	 output wire [63:0] mem3,
     output wire [3:0] Funct);
     
    wire lessThan;
    //wire Zero;
    assign Funct = {Instruction[30], Instruction[14:12]};
//    assign PC_Src =  Branch & Zero;
//assign PC_Src = (Branch && ((funct3 == 3'b000 && Zero) || // beq
                           // (funct3 == 3'b001 && !Zero) || // bne
                            //(funct3 == 3'b101 && !lessThan))); // bge
     
     // figuring out PC address, either next instruction executed or branch target calculated
     Program_Counter a(clk, reset,PC_In, PC_Out);
     Adder b(PC_Out, 64'd4, Adder_1 ); 
     Adder c(PC_Out, Imm_Data*2, Adder_2);
      
     
     // decoding instruction and fetching relevant data from the RegisterFile
     Instruction_Memory e(PC_Out, Instruction); 
     InsParser f(Instruction, opcode, rd, funct3, rs1,rs2, funct7); 
     RegisterFile g(clk, reset, WriteData, rs1, rs2, rd, RegWrite, ReadData1,ReadData2 );
     ImmGen h(Instruction, Imm_Data); 
     
     assign Funct = {Instruction[30], Instruction[14:12]};
     
     // generating control signals and ALU operation
     Control_Unit i(opcode, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite); 
     ALU_Control j(ALUOp, Funct, operation);
     
     // carrying out ALU calculation depending on the operation. Writing ALU result or data from memory back dependong on MemToReg
     mux k(ReadData2, Imm_Data, ALUSrc, ALU_input2 ); 
     ALU_64_bit l(ReadData1, ALU_input2, operation, ALU_Result, Zero, lessThan); 
     Data_Memory m(ALU_Result , ReadData2, clk, MemWrite, MemRead, Read_Data, mem0, mem1,mem2,mem3); 
     mux n(ALU_Result, Read_Data, MemtoReg, WriteData); 
     
assign PC_Src = (Branch && ((funct3 == 3'b000 && Zero) || // beq
                            (funct3 == 3'b001 && !Zero) || // bne
                            (funct3 == 3'b101 && $signed(ALU_Result) >= 0)||
                            (funct3 == 3'b100 && $signed(ALU_Result) < 0))); // bge
//     assign PC_Src =  Branch & Zero;
     mux d(Adder_1, Adder_2, PC_Src, PC_In);
     
endmodule
