`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 17:06:45
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(reset,clk,pc_out,instruction_code);
input[31:0]pc_out; /* output of pc input to instruction memory*/
input clk,reset;
output reg[31:0]instruction_code;

reg[31:0]rom[0:31];

initial 
 begin 
    rom[0]  = 32'h00500093; // addi x1,x0,5
    rom[1]  = 32'h00A00113; // addi x2,x0,10
    rom[2]  = 32'h002081B3; // add x3,x1,x2
    rom[3]  = 32'h40118233; // sub x4,x3,x1
    rom[4]  = 32'h00302023; // sw x3,0(x0)
    rom[5]  = 32'h00002283; // lw x5,0(x0)
    rom[6]  = 32'h00000013; // nop
    rom[7]  = 32'h00000013; // nop
    rom[8]  = 32'h00000013;
    rom[9]  = 32'h00000013;
    rom[10] = 32'h00000013;
    rom[11] = 32'h00000013;
    rom[12] = 32'h00000013;
    rom[13] = 32'h00000013;
    rom[14] = 32'h00000013;
    rom[15] = 32'h00000013;
    rom[16] = 32'h00000013;
    rom[17] = 32'h00000013;
    rom[18] = 32'h00000013;
    rom[19] = 32'h00000013;
    rom[20] = 32'h00000013;
    rom[21] = 32'h00000013;
    rom[22] = 32'h00000013;
    rom[23] = 32'h00000013;
    rom[24] = 32'h00000013;
    rom[25] = 32'h00000013;
    rom[26] = 32'h00000013;
    rom[27] = 32'h00000013;
    rom[28] = 32'h00000013;
    rom[29] = 32'h00000013;
    rom[30] = 32'h00000013;
    rom[31] = 32'h00000013;
end

always @(*) begin
    instruction_code = rom[pc_out[6:2]];
end

endmodule
