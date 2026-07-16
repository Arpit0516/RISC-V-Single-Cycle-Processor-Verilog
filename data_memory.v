`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 17:45:18
// Design Name: 
// Module Name: data_mem
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

module data_memory(
    input clk,
    input MemRead,
    input MemWrite,
    input [31:0] address,
    input [31:0] writeData,
    output reg [31:0] readData
);

    reg [31:0] memory [0:255];   // 256 words of 32-bit memory

    // Write Operation
    always @(posedge clk) begin
        if (MemWrite)
            memory[address[9:2]] <= writeData;
    end

    // Read Operation
    always @(*) begin
        if (MemRead)
            readData = memory[address[9:2]];
        else
            readData = 32'b0;
    end

endmodule
