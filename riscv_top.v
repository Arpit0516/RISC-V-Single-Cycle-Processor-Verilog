module riscv_top(
    input clk,
    input reset
);

// PC
wire [31:0] pc_current;
wire [31:0] pc_next;
wire [31:0] pc_plus4;
wire [31:0] branch_address;

// Instruction Memory
wire [31:0] instruction_code;

// Decoder
wire [6:0] opcode;
wire [4:0] rs1, rs2, rd;
wire [2:0] f3;
wire [6:0] f7;

// Immediate Generator
wire [31:0] immediate;

// Control Unit
wire Branch;
wire MemRead;
wire MemtoReg;
wire MemWrite;
wire RegWrite;
wire ALUSrc;
wire [1:0] ALUOp;
wire Jump;

// Register File
wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] write_data;

// ALU Control
wire [3:0] alu_control;   // Change to [2:0] if your ALU control outputs 3 bits

// ALU
wire [31:0] alu_result;
wire zero;
wire carry;

// Data Memory
wire [31:0] memory_data;

// MUX output
wire [31:0] alu_input2;

// PC MUX select
wire pc_src;

wire [31:0] pc_out;
wire pc_write;

//PROGRAM-COUNTER
PC pc(
    .rst(reset),
    .clk(clk),
    .pc_next(pc_next),
    .pc_out(pc_out)
);

//INSTRUCTION-MEMORY 

instruction_memory  IM(
.reset(reset),
.clk(clk),
.pc_out(pc_out),
.instruction_code(instruction_code)
);


instruction_decoder ID(
.instruction_code(instruction_code),
.f7(f7),
.rs2(rs2),
.rs1(rs1),
.f3(f3),
.rd(rd),
.opcode(opcode)
);

//CONTROL UNIT
control_unit CU(
    .opcode(opcode),
    .regwrite(RegWrite),
    .alusrc(ALUSrc),
    .memread(MemRead),
    .memwrite(MemWrite),
    .memtoreg(MemtoReg),
    .branch(Branch),
    .jump(Jump),
    .aluop(ALUOp)
);

register32_32 RF(
    .write(RegWrite),
    .rddata1(read_data1),
    .rddata2(read_data2),
    .sr1(rs1),
    .sr2(rs2),
    .dr(rd),
    .wrdata(write_data),
    .clk(clk),
    .reset(reset)
);

//IMMEDIATE GENERATOR 
immediate_generator IG(
    .instruction_code(instruction_code),
    .immediate_out(immediate)
);

//ALU CONTROL
alu_control ALUCTRL(
    .opcode(opcode),
    .f7(f7),
    .f3(f3),
    .aluop(ALUOp),
    .alu_control_out(alu_control)
);


//ALU MUX 
mux2_1_32bit ALUSRC_MUX(
    .in0(read_data2),
    .in1(immediate),
    .sel(ALUSrc),
    .out(alu_input2)
);

//ALU 32BITS 
alu_32bit ALU(
    .A(read_data1),
    .B(alu_input2),
    .alu_control(alu_control),
    .Result(alu_result),
    .Zero(zero),
    .Carry(carry)
);

//DATA MEMORY 
data_memory DM(
    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .address(alu_result),
    .writeData(read_data2),
    .readData(memory_data)
);

//MEMTOREG MUX
mux2_1_32bit MEMTOREG_MUX(
    .in0(alu_result),
    .in1(memory_data),
    .sel(MemtoReg),
    .out(write_data)
);

//PC + 4 ADDER
pc_adder PC4(
    .pc(pc_out),
    .pc_plus4(pc_plus4)
);

//BRANCH ADDER 
branch_adder BA(
    .pc(pc_out),
    .immediate(immediate),
    .branch_address(branch_address)
);

//PC MUX
pc_mux PCMUX(
    .pc_plus4(pc_plus4),
    .branch_address(branch_address),
    .Branch(Branch),
    .Zero(zero),
    .next_pc(pc_next)
);


endmodule