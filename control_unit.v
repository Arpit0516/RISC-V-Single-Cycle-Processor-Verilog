`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 15:44:59
// Design Name: 
// Module Name: control_unit
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


module control_unit(opcode,regwrite,alusrc,memread,memwrite,memtoreg,branch,jump,aluop);
input[6:0]opcode;
output reg regwrite ;
output reg alusrc;
output reg memread;
output reg memwrite ;
output reg memtoreg;
output reg branch;
output reg jump;
output reg [1:0]aluop;

always @(*) begin
    case(opcode)

        7'b0110011: begin   // R-Type
            regwrite = 1;
            alusrc   = 0;
            memread  = 0;
            memwrite = 0;
            memtoreg = 0;
            branch   = 0;
            jump     = 0;
            aluop    = 2'b10;
        end

        7'b0010011: begin   // I-Type (addi, andi...)
            regwrite = 1;
            alusrc   = 1;
            memread  = 0;
            memwrite = 0;
            memtoreg = 0;
            branch   = 0;
            jump     = 0;
            aluop    = 2'b10;
        end

        7'b0000011: begin   // Load (lw)
            regwrite = 1;
            alusrc   = 1;
            memread  = 1;
            memwrite = 0;
            memtoreg = 1;
            branch   = 0;
            jump     = 0;
            aluop    = 2'b00;
        end

        7'b0100011: begin   // Store (sw)
            regwrite = 0;
            alusrc   = 1;
            memread  = 0;
            memwrite = 1;
            memtoreg = 0;
            branch   = 0;
            jump     = 0;
            aluop    = 2'b00;
        end

        7'b1100011: begin   // Branch
            regwrite = 0;
            alusrc   = 0;
            memread  = 0;
            memwrite = 0;
            memtoreg = 0;
            branch   = 1;
            jump     = 0;
            aluop    = 2'b01;
        end

        default: begin
            regwrite = 0;
            alusrc   = 0;
            memread  = 0;
            memwrite = 0;
            memtoreg = 0;
            branch   = 0;
            jump     = 0;
            aluop    = 2'b00;
        end

    endcase
 end
endmodule 
