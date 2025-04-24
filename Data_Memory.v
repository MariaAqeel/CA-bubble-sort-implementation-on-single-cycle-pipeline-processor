`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 03:24:55 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input [63:0] Mem_Addr,
    input[63:0] Write_Data,
    input clk,
    input MemWrite,
    input MemRead,
    output reg [63:0] Read_Data,
    output reg [63:0] mem0,
	output reg [63:0] mem1,
	output reg [63:0] mem2,
	output reg [63:0] mem3
    );
    // creating data memory
    reg [7:0] Data_Memory [300:0];
    integer x;
    initial begin 
        for (x=0; x <301; x = x + 1) begin
            Data_Memory[x] = 0;
        end
    end
    
    // if MemWrite is 1 then write data to memory on the given address
    always @(posedge clk) begin
       if (MemWrite) begin
       
          Data_Memory[Mem_Addr] = Write_Data[7:0];
          Data_Memory[Mem_Addr+1] = Write_Data[15:8];
          Data_Memory[Mem_Addr+2] = Write_Data[23:16];
          Data_Memory[Mem_Addr+3] = Write_Data[31:24];
//          Data_Memory[Mem_Addr+4] = Write_Data[39:32];
//          Data_Memory[Mem_Addr+5] = Write_Data[47:40];
//          Data_Memory[Mem_Addr+6] = Write_Data[55:48];
//          Data_Memory[Mem_Addr+7] = Write_Data[63:56];  
        end
    end
    // if MemRead is 1 then data is read from memory
    always @(*) begin
        if (MemRead) begin
          Read_Data[7:0] = Data_Memory[Mem_Addr];
          Read_Data[15:8] = Data_Memory[Mem_Addr+1];
          Read_Data[23:16] = Data_Memory[Mem_Addr+2];
          Read_Data[31:24] = Data_Memory[Mem_Addr+3];
//          Read_Data[39:32] = Data_Memory[Mem_Addr+4];
//          Read_Data[47:40] = Data_Memory[Mem_Addr+5]; 
//          Read_Data[55:48] = Data_Memory[Mem_Addr+6]; 
//          Read_Data[63:56] = Data_Memory[Mem_Addr+7]; 
        end else begin
	       Read_Data = 64'b0; end
	    mem0 = {Data_Memory[15], Data_Memory[14], Data_Memory[13], Data_Memory[12], Data_Memory[11], Data_Memory[10],
	            Data_Memory[9], Data_Memory[8]};
	    mem1 = {Data_Memory[23], Data_Memory[22], Data_Memory[21], Data_Memory[20], Data_Memory[19], Data_Memory[18],
	            Data_Memory[17], Data_Memory[16]};
	    mem2 = {Data_Memory[31], Data_Memory[30], Data_Memory[29], Data_Memory[28], Data_Memory[27], Data_Memory[26],
	            Data_Memory[25], Data_Memory[24]};
	    mem3 = {Data_Memory[39], Data_Memory[38], Data_Memory[37], Data_Memory[36], Data_Memory[35], Data_Memory[34],
	            Data_Memory[33], Data_Memory[32]};
    end
endmodule
/**/