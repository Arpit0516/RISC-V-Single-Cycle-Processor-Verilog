`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 17:25:13
// Design Name: 
// Module Name: alu_32
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
`timescale 1ns / 1ps

module alu_32bit(
    input  [31:0] A,
    input  [31:0] B,
    input  [3:0] alu_control,
    output reg [31:0] Result,
    output Zero,
    output reg Carry
);

// ALU operation codes
parameter ADD  = 4'b0000;
parameter SUB  = 4'b0001;
parameter AND  = 4'b0010;
parameter OR   = 4'b0011;
parameter XOR  = 4'b0100;
parameter SLL  = 4'b0101;
parameter SRL  = 4'b0110;
parameter SRA  = 4'b0111;
parameter SLT  = 4'b1000;
parameter SLTU = 4'b1001;

always @(*) begin
    Carry = 0;

    case (alu_control)

        ADD:
            {Carry, Result} = A + B;

        SUB:
            {Carry, Result} = A - B;

        AND:
            Result = A & B;

        OR:
            Result = A | B;

        XOR:
            Result = A ^ B;

        SLL:
            Result = A << B[4:0];

        SRL:
            Result = A >> B[4:0];

        SRA:
            Result = $signed(A) >>> B[4:0];

        SLT:
            Result = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;

        SLTU:
            Result = (A < B) ? 32'd1 : 32'd0;

        default:
            Result = 32'd0;

    endcase
end

assign Zero = (Result == 32'd0);

endmodule
