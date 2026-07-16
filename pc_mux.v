`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 18:07:08
// Design Name: 
// Module Name: pc_mux
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


module pc_mux(
    input [31:0] pc_plus4,
    input [31:0] branch_address,
    input Branch,
    input Zero,
    output [31:0] next_pc
);

assign next_pc = (Branch && Zero) ? branch_address : pc_plus4;

endmodule

