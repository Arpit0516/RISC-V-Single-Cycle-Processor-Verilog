`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 10:37:53
// Design Name: 
// Module Name: branch_add_adder
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

module branch_adder(
    input  [31:0] pc,
    input  [31:0] immediate,
    output [31:0] branch_address
);

assign branch_address = pc + immediate;

endmodule
