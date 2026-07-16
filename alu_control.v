`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name: alu_control
// Project Name:
// Target Devices:
// Tool Versions:
// Description: ALU Control Unit for Single-Cycle RISC-V Processor
//////////////////////////////////////////////////////////////////////////////////

module alu_control(
    input [6:0] opcode,
    input [6:0] f7,
    input [2:0] f3,
    input [1:0] aluop,
    output reg [3:0] alu_control_out
);

parameter ADD = 4'b0000;
parameter SUB = 4'b0001;
parameter AND = 4'b0010;
parameter OR  = 4'b0011;
parameter XOR = 4'b0100;
parameter SLL = 4'b0101;
parameter SRL = 4'b0110;
parameter SRA = 4'b0111;
parameter SLT = 4'b1000;

always @(*) begin

    case (aluop)

        // Load / Store
        2'b00:
            alu_control_out = ADD;

        // Branch Instructions
        2'b01: begin
            case (f3)
                3'b000: alu_control_out = SUB; // BEQ
                3'b001: alu_control_out = SUB; // BNE
                3'b100: alu_control_out = SLT; // BLT
                3'b101: alu_control_out = SLT; // BGE
                default: alu_control_out = ADD;
            endcase
        end

        // R-Type and I-Type
        2'b10: begin

            // R-Type Instructions
            if (opcode == 7'b0110011) begin

                case ({f7,f3})

                    {7'b0000000,3'b000}: alu_control_out = ADD;
                    {7'b0100000,3'b000}: alu_control_out = SUB;
                    {7'b0000000,3'b111}: alu_control_out = AND;
                    {7'b0000000,3'b110}: alu_control_out = OR;
                    {7'b0000000,3'b100}: alu_control_out = XOR;
                    {7'b0000000,3'b001}: alu_control_out = SLL;
                    {7'b0000000,3'b101}: alu_control_out = SRL;
                    {7'b0100000,3'b101}: alu_control_out = SRA;
                    {7'b0000000,3'b010}: alu_control_out = SLT;

                    default: alu_control_out = ADD;

                endcase

            end

            // I-Type Instructions
            else if (opcode == 7'b0010011) begin

                case (f3)

                    3'b000: alu_control_out = ADD; // ADDI
                    3'b111: alu_control_out = AND; // ANDI
                    3'b110: alu_control_out = OR;  // ORI
                    3'b100: alu_control_out = XOR; // XORI
                    3'b001: alu_control_out = SLL; // SLLI

                    3'b101: begin
                        if (f7 == 7'b0000000)
                            alu_control_out = SRL; // SRLI
                        else if (f7 == 7'b0100000)
                            alu_control_out = SRA; // SRAI
                        else
                            alu_control_out = ADD;
                    end

                    3'b010: alu_control_out = SLT; // SLTI

                    default: alu_control_out = ADD;

                endcase

            end

            else
                alu_control_out = ADD;

        end

        default:
            alu_control_out = ADD;

    endcase

end

endmodule