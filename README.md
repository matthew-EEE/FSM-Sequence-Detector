# FSM Sequence Detector

A Mealy Finite State Machine (FSM) designed in Verilog HDL that acts as a digital lock. The sequence detector processes binary inputs and grants access only when the specific 4-bit sequences `0101` or `1001` are detected. 

## Project Overview
- **Language:** Verilog HDL
- **Architecture:** Mealy Finite State Machine (7 States)
- **Logic Minimisation:** Karnaugh Maps (implemented via 3 D-Flip-Flops)
- **Verification:** Custom Verilog testbench simulating randomized 16-bit sequences
