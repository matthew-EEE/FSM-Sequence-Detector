# FSM Sequence Detector

A Mealy Finite State Machine (FSM) designed in Verilog HDL that acts as a digital lock. The sequence detector processes binary inputs and grants access (outputs a `1`) only when the specific 4-bit sequences `0101` or `1001` are detected. 

## Project Overview
- **Language:** Verilog HDL
- **Architecture:** Mealy Finite State Machine (7 States)
- **Logic Minimization:** Karnaugh Maps (implemented via 3 D-Flip-Flops)
- **Verification:** Custom Verilog testbench simulating randomized 16-bit sequences

## Repository Structure
- `/source` - Contains the core FSM Verilog module (`fsmStringSearch.v`)
- `/testbench` - Contains the testbench used for simulation and verification (`testbench.v`)
- `/docs` - Contains the full project report, including state transition diagrams, Karnaugh map logic, and waveform simulations.

## State Machine Logic
The FSM continuously reads a serial sequence bit. It resets to the `idle` state after every 4 bits. Access is granted only if the 4-bit sequence perfectly matches one of the two programmed passwords. The logic was minimized to require only three D-flip-flops for state memory.
