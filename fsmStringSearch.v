module FSM_string_search(
  input  clk,
  input  asyncReset,
  input  sequenceBit,
  output reg fsmOut);
  
//declaring the state register size and the states
  parameter size = 3;
  parameter idle          = 3'b000;//state a
  parameter found0        = 3'b001;//state b
  parameter found1        = 3'b010;//state c
  parameter found01_10    = 3'b011;//state d
  parameter found010_100  = 3'b100;//state e
  parameter foundNull     = 3'b101;//state f
  parameter foundNull2    = 3'b110;//state g

//fsm state register
  reg [size-1:0] currState;
  reg [size-1:0] nextState;

//sequential logic for changing states
  always @ (posedge clk or posedge asyncReset) 
    begin
      if (asyncReset) begin
        currState <= idle; 
        end else 
        currState  <= nextState; 
    end

//combinational logic 
  always @ (currState or sequenceBit)
    begin
      case(currState)
        idle:
          if(sequenceBit) begin nextState=found1;       fsmOut=0;end
          else            begin nextState=found0;       fsmOut=0;end
        found0:
          if(sequenceBit) begin nextState=found01_10;   fsmOut=0;end
          else            begin nextState=foundNull;    fsmOut=0;end
        found1:
          if(sequenceBit) begin nextState=foundNull;    fsmOut=0;end
          else            begin nextState=found01_10;   fsmOut=0;end
        found01_10:
          if(sequenceBit) begin nextState=foundNull2;   fsmOut=0;end
          else            begin nextState=found010_100; fsmOut=0;end
        found010_100:
          if(sequenceBit) begin nextState=idle;         fsmOut=1;end
          else            begin nextState=idle;         fsmOut=0;end
        foundNull:
          begin nextState = foundNull2;                 fsmOut=0;end
        foundNull2:
          begin nextState = idle;                       fsmOut=0;end
        
        default:begin nextState=idle;                   fsmOut=0;end
      endcase
    end
endmodule 


