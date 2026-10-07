module tb_DUT;

  //declaring input/output ports
  reg clk; 
  reg asyncReset;
  reg [0:15] sequenceIn=16'b0101_1001_1001_0101;
  reg sequenceBit; 
  wire fsmOut;
  
  FSM_string_search DUT(clk,asyncReset,sequenceBit,fsmOut); 

  //clock generation
  localparam clkPeriod=10;// constant

  initial 
    begin
      clk = 0;
      forever 
        #(clkPeriod/2) clk = ~clk;// toggling the clock
    end

  
  initial 
    begin	
      $dumpvars;

      //assigning values to the fsm inputs
      sequenceBit = sequenceIn[0];
      asyncReset  = 1;
      
      // wait for 2 clock cycles and then de-assert the asyncReset
      repeat (2) @(posedge clk);
      asyncReset =  0;

      // loop to send each bit of the input to the fsm
      for (integer i=1;i<16;i++)
        begin
          sequenceBit = sequenceIn[i]; 
          @(posedge clk);
        end

      // wait for 1 clock cycle then stop the simulation 
      @(posedge clk);
      $finish; 
    end
endmodule