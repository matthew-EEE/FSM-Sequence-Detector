# FSM Sequence Detector

A Mealy Finite State Machine (FSM) designed in Verilog HDL that acts as a digital lock. The sequence detector processes binary inputs and allows access only when the specific 4-bit sequences `0101` or `1001` are detected. Logic minimisation was done through Karnaugh maps with the final circuit using 3 D flip-flops. The code was verified using a Verilog testbench simulating randomised 16-bit sequences
