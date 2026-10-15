# Verilog Digital Logic: 4-Bit Ripple Carry Adder

A modular, structural implementation of a **4-Bit Ripple Carry Adder (RCA)** built by chaining hierarchical **Full Adder** blocks in Verilog. Designed and verified using Icarus Verilog and EPWave.

---

## 🏗️ Design Architecture

This project leverages hierarchical design principles to scale up combinational arithmetic without writing redundant gate-level equations:
1. **Half Adder (`halfAdder`):** Combines an XOR gate (sum) and an AND gate (carry).
2. **Full Adder (`fullAdder`):** Instantiates two Half Adders and an OR gate to handle 3-bit addition (`a`, `b`, and `cin`).
3. **4-Bit Ripple Carry Adder (`rippleAdder4bit`):** Instantiates four Full Adders (`FA0` through `FA3`) in a sequential chain. The carry-out of each stage ripples directly into the carry-in of the next stage to compute multi-bit addition.

---

## 📊 Verification & Results

The 4-bit adder was verified using an automated testbench testing various edge cases, including standard addition (`5 + 3`), boundary values, overflow handling, and maximum inputs (`15 + 15`).

### 1. Console Simulation Table
*The testbench simulation log verifying input combinations and expected outputs:*

<img width="333" height="138" alt="image" src="https://github.com/user-attachments/assets/e32ff2f0-226d-4926-86ce-bd3a9224e875" />


### 2. EPWave Waveform Simulation
*The waveform showing proper multi-bit bus transitions and carry-ripple behavior across simulation time:*

<img width="1842" height="170" alt="image" src="https://github.com/user-attachments/assets/91bb9783-8dfd-4555-8685-b6ce31a8d383" />


---

## 🚀 How to Run Locally

If you have Icarus Verilog (`iverilog`) and `vvp` installed on your machine, you can run the simulation via terminal:

```bash
iverilog -Wall -g2012 design.sv testbench.sv
./a.out
