`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name: register32_32
// Description: 32 x 32-bit Register File
//////////////////////////////////////////////////////////////////////////////////

module register32_32(
    input reset,
    input clk,
    input write,

    input [4:0] sr1,
    input [4:0] sr2,
    input [4:0] dr,

    input [31:0] wrdata,

    output [31:0] rddata1,
    output [31:0] rddata2
);

reg [31:0] regfile [0:31];
integer k;

// Asynchronous Read
assign rddata1 = regfile[sr1];
assign rddata2 = regfile[sr2];

// Synchronous Write
always @(posedge clk) begin

    if (reset) begin
        for (k = 0; k < 32; k = k + 1)
            regfile[k] <= 32'b0;
    end

    else if (write && (dr != 5'd0)) begin
        regfile[dr] <= wrdata;
    end

end

endmodule