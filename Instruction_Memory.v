`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 03:33:37 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    input [63:0] Instr_Addr,
    output [31:0] Instruction
);

    reg [7:0] Inst_Memory [0:255]; // Enough space for 64+ instructions

//    // Creating the memory with bubble sort instructions
//    initial begin
//        // li x1, 0x100 --> addi x1, x0, 256 --> 0x10000093
//        {Inst_Memory[3], Inst_Memory[2], Inst_Memory[1], Inst_Memory[0]} = 32'h10000093;

//        // li x2, 6 --> addi x2, x0, 6 --> 0x00600113
//        {Inst_Memory[7], Inst_Memory[6], Inst_Memory[5], Inst_Memory[4]} = 32'h00600113;

//        // li x3, 3
//        {Inst_Memory[11], Inst_Memory[10], Inst_Memory[9], Inst_Memory[8]} = 32'h00300193;

//        // li x4, 2
//        {Inst_Memory[15], Inst_Memory[14], Inst_Memory[13], Inst_Memory[12]} = 32'h00200213;

//        // li x5, 4
//        {Inst_Memory[19], Inst_Memory[18], Inst_Memory[17], Inst_Memory[16]} = 32'h00400293;

//        // li x6, 5
//        {Inst_Memory[23], Inst_Memory[22], Inst_Memory[21], Inst_Memory[20]} = 32'h00500313;

//        // li x7, 1
//        {Inst_Memory[27], Inst_Memory[26], Inst_Memory[25], Inst_Memory[24]} = 32'h00100393;

//        // li x8, 8
//        {Inst_Memory[31], Inst_Memory[30], Inst_Memory[29], Inst_Memory[28]} = 32'h00800413;

//        // sw x2, 0(x1)
//        {Inst_Memory[35], Inst_Memory[34], Inst_Memory[33], Inst_Memory[32]} = 32'h0020a023;

//        // sw x3, 4(x1)
//        {Inst_Memory[39], Inst_Memory[38], Inst_Memory[37], Inst_Memory[36]} = 32'h0030a223;

//        // sw x4, 8(x1)
//        {Inst_Memory[43], Inst_Memory[42], Inst_Memory[41], Inst_Memory[40]} = 32'h0040a423;

//        // sw x5, 12(x1)
//        {Inst_Memory[47], Inst_Memory[46], Inst_Memory[45], Inst_Memory[44]} = 32'h0050a623;

//        // sw x6, 16(x1)
//        {Inst_Memory[51], Inst_Memory[50], Inst_Memory[49], Inst_Memory[48]} = 32'h0060a823;

//        // sw x7, 20(x1)
//        {Inst_Memory[55], Inst_Memory[54], Inst_Memory[53], Inst_Memory[52]} = 32'h0070aa23;

//        // sw x8, 24(x1)
//        {Inst_Memory[59], Inst_Memory[58], Inst_Memory[57], Inst_Memory[56]} = 32'h0080ac23;

//        // li x10, 7
//        {Inst_Memory[63], Inst_Memory[62], Inst_Memory[61], Inst_Memory[60]} = 32'h00700513;

//        // li x9, 0
//        {Inst_Memory[67], Inst_Memory[66], Inst_Memory[65], Inst_Memory[64]} = 32'h00000493;

//        // bge x9, x10, endout
//        {Inst_Memory[71], Inst_Memory[70], Inst_Memory[69], Inst_Memory[68]} = 32'h04a4d063;

//        // li x11, 0
//        {Inst_Memory[75], Inst_Memory[74], Inst_Memory[73], Inst_Memory[72]} = 32'h00000593;

//        // bge x11, x10, endin
//        {Inst_Memory[79], Inst_Memory[78], Inst_Memory[77], Inst_Memory[76]} = 32'h02a5d863;

//        // slli x12, x9, 2
//        {Inst_Memory[83], Inst_Memory[82], Inst_Memory[81], Inst_Memory[80]} = 32'h00249613;

//        // add x12, x12, x1
//        {Inst_Memory[87], Inst_Memory[86], Inst_Memory[85], Inst_Memory[84]} = 32'h00160633;

//        // lw x13, 0(x12)
//        {Inst_Memory[91], Inst_Memory[90], Inst_Memory[89], Inst_Memory[88]} = 32'h00062683;

//        // slli x14, x11, 2
//        {Inst_Memory[95], Inst_Memory[94], Inst_Memory[93], Inst_Memory[92]} = 32'h00259713;

//        // add x14, x14, x1
//        {Inst_Memory[99], Inst_Memory[98], Inst_Memory[97], Inst_Memory[96]} = 32'h00170733;

//        // lw x15, 0(x14)
//        {Inst_Memory[103], Inst_Memory[102], Inst_Memory[101], Inst_Memory[100]} = 32'h00072783;

//        // bge x13, x15, DONT
//        {Inst_Memory[107], Inst_Memory[106], Inst_Memory[105], Inst_Memory[104]} = 32'h00f6d663;

//        // sw x15, 0(x12)
//        {Inst_Memory[111], Inst_Memory[110], Inst_Memory[109], Inst_Memory[108]} = 32'h00f62023;

//        // sw x13, 0(x14)
//        {Inst_Memory[115], Inst_Memory[114], Inst_Memory[113], Inst_Memory[112]} = 32'h00d72023;

//        // addi x11, x11, 1
//        {Inst_Memory[119], Inst_Memory[118], Inst_Memory[117], Inst_Memory[116]} = 32'h00158593;

//        // jal x0, -44 (to innerloop)
//        {Inst_Memory[123], Inst_Memory[122], Inst_Memory[121], Inst_Memory[120]} = 32'h0xfc000ae3;

//        // addi x9, x9, 1
//        {Inst_Memory[127], Inst_Memory[126], Inst_Memory[125], Inst_Memory[124]} = 32'h00148493;

//        // jal x0, -60 (to outerloop)
//        {Inst_Memory[131], Inst_Memory[130], Inst_Memory[129], Inst_Memory[128]} = 32'h0xfc0002e3;
        
//        {Inst_Memory[135], Inst_Memory[134], Inst_Memory[133], Inst_Memory[132]} = 32'h0x0000aa03;
        
//        {Inst_Memory[139], Inst_Memory[138], Inst_Memory[137], Inst_Memory[136]} = 32'h0x0040aa83	;
        
//        {Inst_Memory[143], Inst_Memory[142], Inst_Memory[141], Inst_Memory[140]} = 32'h0x0080ab03;
        
//        {Inst_Memory[147], Inst_Memory[146], Inst_Memory[145], Inst_Memory[144]} = 32'h0x00c0ab83;
        
//        {Inst_Memory[151], Inst_Memory[150], Inst_Memory[149], Inst_Memory[148]} = 32'h0x0100ac03;
        
//        {Inst_Memory[155], Inst_Memory[154], Inst_Memory[153], Inst_Memory[152]} = 32'h0x0140ac83;
                
//        {Inst_Memory[159], Inst_Memory[158], Inst_Memory[157], Inst_Memory[156]} = 32'h0x0180ad03;



//    end
    initial begin
  {Inst_Memory[3], Inst_Memory[2], Inst_Memory[1], Inst_Memory[0]}     = 32'h10000a13; // li x20, 0x100
  {Inst_Memory[7], Inst_Memory[6], Inst_Memory[5], Inst_Memory[4]}     = 32'h03700a93; // li x21, 55
  {Inst_Memory[11], Inst_Memory[10], Inst_Memory[9], Inst_Memory[8]}   = 32'h015a2023; // sw x21, 0(x20)
  {Inst_Memory[15], Inst_Memory[14], Inst_Memory[13], Inst_Memory[12]} = 32'h04b00b13; // li x22, 75
  {Inst_Memory[19], Inst_Memory[18], Inst_Memory[17], Inst_Memory[16]} = 32'h016a2223; // sw x22, 4(x20)
  {Inst_Memory[23], Inst_Memory[22], Inst_Memory[21], Inst_Memory[20]} = 32'h02300b93; // li x23, 35
  {Inst_Memory[27], Inst_Memory[26], Inst_Memory[25], Inst_Memory[24]} = 32'h017a2423; // sw x23, 8(x20)
  {Inst_Memory[31], Inst_Memory[30], Inst_Memory[29], Inst_Memory[28]} = 32'h01900c13; // li x24, 25
  {Inst_Memory[35], Inst_Memory[34], Inst_Memory[33], Inst_Memory[32]} = 32'h018a2623; // sw x24, 12(x20)
  {Inst_Memory[39], Inst_Memory[38], Inst_Memory[37], Inst_Memory[36]} = 32'h02800c93; // li x25, 40
  {Inst_Memory[43], Inst_Memory[42], Inst_Memory[41], Inst_Memory[40]} = 32'h019a2823; // sw x25, 16(x20)
  {Inst_Memory[47], Inst_Memory[46], Inst_Memory[45], Inst_Memory[44]} = 32'h00f00d13; // li x26, 15
  {Inst_Memory[51], Inst_Memory[50], Inst_Memory[49], Inst_Memory[48]} = 32'h01aa2a23; // sw x26, 20(x20)
  {Inst_Memory[55], Inst_Memory[54], Inst_Memory[53], Inst_Memory[52]} = 32'h05500d93; // li x27, 85
  {Inst_Memory[59], Inst_Memory[58], Inst_Memory[57], Inst_Memory[56]} = 32'h01ba2c23; // sw x27, 24(x20)
  {Inst_Memory[63], Inst_Memory[62], Inst_Memory[61], Inst_Memory[60]} = 32'h00700a93; // li x21, 7
  {Inst_Memory[67], Inst_Memory[66], Inst_Memory[65], Inst_Memory[64]} = 32'h00000b13; // li x22, 0
  {Inst_Memory[71], Inst_Memory[70], Inst_Memory[69], Inst_Memory[68]} = 32'h416a8bb3; // sub x23, x21, x22
  {Inst_Memory[75], Inst_Memory[74], Inst_Memory[73], Inst_Memory[72]} = 32'hfffb8b93; // addi x23, x23, -1
  {Inst_Memory[79], Inst_Memory[78], Inst_Memory[77], Inst_Memory[76]} = 32'h00000c13; // li x24, 0
  {Inst_Memory[83], Inst_Memory[82], Inst_Memory[81], Inst_Memory[80]} = 32'h018a0d33; // add x26, x20, x24
  {Inst_Memory[87], Inst_Memory[86], Inst_Memory[85], Inst_Memory[84]} = 32'h000d2d83; // lw x27, 0(x26)
  {Inst_Memory[91], Inst_Memory[90], Inst_Memory[89], Inst_Memory[88]} = 32'h004d2e03; // lw x28, 4(x26)
  {Inst_Memory[95], Inst_Memory[94], Inst_Memory[93], Inst_Memory[92]} = 32'h01cdcc63; // blt x27, x28, +24 (skip swap)
  {Inst_Memory[99], Inst_Memory[98], Inst_Memory[97], Inst_Memory[96]} = 32'h00000013; // nop
  {Inst_Memory[103], Inst_Memory[102], Inst_Memory[101], Inst_Memory[100]} = 32'h00000013; // nop
  {Inst_Memory[107], Inst_Memory[106], Inst_Memory[105], Inst_Memory[104]} = 32'h00000013; // nop
  {Inst_Memory[111], Inst_Memory[110], Inst_Memory[109], Inst_Memory[108]} = 32'h01cd2023; // sw x28, 0(x26)
  {Inst_Memory[115], Inst_Memory[114], Inst_Memory[113], Inst_Memory[112]} = 32'h01bd2223; // sw x27, 4(x26)
  {Inst_Memory[119], Inst_Memory[118], Inst_Memory[117], Inst_Memory[116]} = 32'h001c0c13; // addi x24, x24, 1
  {Inst_Memory[123], Inst_Memory[122], Inst_Memory[121], Inst_Memory[120]} = 32'h004d0d13; // addi x26, x26, 4
  {Inst_Memory[127], Inst_Memory[126], Inst_Memory[125], Inst_Memory[124]} = 32'hfd7c4ce3; // blt x24, x23, -40 (inner loop)
  {Inst_Memory[131], Inst_Memory[130], Inst_Memory[129], Inst_Memory[128]} = 32'h00000013; // nop
  {Inst_Memory[135], Inst_Memory[134], Inst_Memory[133], Inst_Memory[132]} = 32'h00000013; // nop
  {Inst_Memory[139], Inst_Memory[138], Inst_Memory[137], Inst_Memory[136]} = 32'h00000013; // nop
  {Inst_Memory[143], Inst_Memory[142], Inst_Memory[141], Inst_Memory[140]} = 32'h001b0b13; // addi x22, x22, 1
  {Inst_Memory[147], Inst_Memory[146], Inst_Memory[145], Inst_Memory[144]} = 32'hfb5b4ae3; // blt x22, x21, -76 (outer loop)
  {Inst_Memory[151], Inst_Memory[150], Inst_Memory[149], Inst_Memory[148]} = 32'h00000013; // nop
  {Inst_Memory[155], Inst_Memory[154], Inst_Memory[153], Inst_Memory[152]} = 32'h00000013; // nop
  {Inst_Memory[159], Inst_Memory[158], Inst_Memory[157], Inst_Memory[156]} = 32'h00000013; // nop
end

    // Assembling the full instruction (4 bytes) from memory
    assign Instruction[7:0]   = Inst_Memory[Instr_Addr];
    assign Instruction[15:8]  = Inst_Memory[Instr_Addr + 1];
    assign Instruction[23:16] = Inst_Memory[Instr_Addr + 2];
    assign Instruction[31:24] = Inst_Memory[Instr_Addr + 3];

endmodule


//module Instruction_Memory(
//    input [63:0] Instr_Addr,
//    output[31:0]Instruction
//    );
    
//    reg [7:0] Inst_Memory  [15:0];
//    // creating the memory
//    initial begin
//        Inst_Memory [0] = 8'b10000011;
//        Inst_Memory [1] = 8'b00110100;
//        Inst_Memory [2] = 8'b10000101;
//        Inst_Memory [3] = 8'b00000010;
//        Inst_Memory [4] = 8'b10110011;
//        Inst_Memory [5] = 8'b10000100;
//        Inst_Memory [6] = 8'b10011010;
//        Inst_Memory [7] = 8'b00000000;
//        Inst_Memory [8] = 8'b10010011;
//        Inst_Memory [9] = 8'b10000100;
//        Inst_Memory [10] = 8'b00010100;
//        Inst_Memory [11] = 8'b00000000;
//        Inst_Memory [12] = 8'b00100011;
//        Inst_Memory [13] = 8'b00110100;
//        Inst_Memory [14] = 8'b10010101;
//        Inst_Memory [15] = 8'b00000010;
//   end
   
//   // creating the instruction bit using 4 bytes depending on the value of Instr_Addr
//   assign Instruction[7:0] = Inst_Memory[Instr_Addr];
//   assign Instruction[15:8] = Inst_Memory[Instr_Addr+1];
//   assign Instruction[23:16] = Inst_Memory[Instr_Addr+2];
//   assign Instruction[31:24] = Inst_Memory[Instr_Addr+3];
   
//endmodule
