`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 13:30:27
// Design Name: 
// Module Name: immediate_generator
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


module immediate_generator(instruction_code,immediate_out);
input [31:0]instruction_code;
output reg[31:0]immediate_out;

always@(*)
begin 
 case(instruction_code[6:0]) /* we took[6:0] because we wanted only the opcode part*/
     7'b0010011,   // I-Type (addi, andi, ori, lw, jalr)
     7'b0000011,
     7'b1100111:
     immediate_out={{20{instruction_code[31]}},
     instruction_code[31:20]};
     
     7'b0100011:
        // S-Type (sw, sh, sb)
      immediate_out={{20{instruction_code[31]}},
      instruction_code[31:25],
      instruction_code[11:7]};
     
      7'b1101111: //j type
       immediate_out = {{11{instruction_code[31]}},
                              instruction_code[31],
                              instruction_code[19:12],
                              instruction_code[20],
                              instruction_code[30:21],
                              1'b0};

      
      
      7'b0110111,  // u type 
      7'b0010111:
            immediate_out = {instruction_code[31:12], 12'b0};

      // r Type
      7'b0110011:
         immediate_out = 32'b0;
         
          // B-Type (beq, bne, blt...)
      7'b1100011:
            immediate_out = {{19{instruction_code[31]}},
                              instruction_code[31],
                              instruction_code[7],
                              instruction_code[30:25],
                              instruction_code[11:8],
                              1'b0};
                              
                              
     default:     immediate_out = 32'b0;
    endcase 
end 

endmodule
