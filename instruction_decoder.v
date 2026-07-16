`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 19:13:08
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder(
instruction_code,f7,rs2,rs1,f3,rd,opcode);
input[31:0]instruction_code;/* output of instruction memory and input to decoder for splitting*/
output [6:0]opcode;
output [4:0]rd;
output [4:0]rs1;
output [4:0]rs2;
output [2:0]f3;
output [6:0]f7;


assign opcode=instruction_code[6:0];
assign rd=instruction_code[11:7];
assign f3=instruction_code[14:12];
assign rs1=instruction_code[19:15];
assign rs2=instruction_code[24:20];
assign f7=instruction_code[31:25];


endmodule
