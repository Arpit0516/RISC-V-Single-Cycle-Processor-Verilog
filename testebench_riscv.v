`timescale 1ns / 1ps

module riscv_top_tb;

reg clk;
reg reset;

// Instantiate DUT
riscv_top DUT (
    .clk(clk),
    .reset(reset)
);

// Clock Generation (10 ns period)
always #5 clk = ~clk;

// Test Sequence
initial begin
    clk = 0;
    reset = 1;

    // Hold reset
    #15;
    reset = 0;

    // Run processor
    #150;

    $display("\n=========== FINAL REGISTER VALUES ===========");
    $display("x1 = %0d", DUT.RF.regfile[1]);
    $display("x2 = %0d", DUT.RF.regfile[2]);
    $display("x3 = %0d", DUT.RF.regfile[3]);
    $display("x4 = %0d", DUT.RF.regfile[4]);
    $display("x5 = %0d", DUT.RF.regfile[5]);

    $display("---------------------------------------------");
    $display("Memory[0] = %0d", DUT.DM.memory[0]);
    $display("=============================================\n");

    $finish;
end

// Monitor every instruction
initial begin

$display("---------------------------------------------------------------------------------------------");
$display("Time\tPC\t\tInstruction\tALU_Result\tWriteBack\tMemData");
$display("---------------------------------------------------------------------------------------------");

$monitor("%0t\t%h\t%h\t%h\t%h\t%h",
          $time,
          DUT.pc_out,
          DUT.instruction_code,
          DUT.alu_result,
          DUT.write_data,
          DUT.memory_data);

end

endmodule