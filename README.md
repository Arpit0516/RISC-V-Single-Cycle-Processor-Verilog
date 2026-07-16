# 32-bit Single-Cycle RISC-V Processor (Verilog)

## Overview

This project implements a 32-bit Single-Cycle RISC-V Processor in Verilog HDL based on the RV32I instruction set. The processor executes each instruction in a single clock cycle and demonstrates the complete datapath including instruction fetch, decode, execute, memory access, and write-back.

The design was simulated and verified in Xilinx Vivado using a hardcoded instruction memory.

---

## Features

- 32-bit Program Counter (PC)
- Instruction Memory (ROM)
- Instruction Decoder
- Immediate Generator
- Control Unit
- 32 × 32 Register File
- ALU Control Unit
- 32-bit ALU
- Data Memory
- ALUSrc Multiplexer
- MemtoReg Multiplexer
- PC + 4 Adder
- Branch Address Adder
- PC Selection Multiplexer
- Complete Top-Level Integration
- Functional Testbench

---

## Supported Instructions

### R-Type
- ADD
- SUB
- AND
- OR
- XOR
- SLL
- SRL
- SRA
- SLT

### I-Type
- ADDI

### Memory
- LW
- SW

### Branch
- BEQ

---

## Processor Datapath

(Add your processor block diagram here)

Example:

![Datapath](images/datapath.png)

---

## Project Structure
