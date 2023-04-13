module mealy_fsm(clk, rst, data, detected);
  input clk;
  input rst;
  input data;
  output reg detected;
  
  parameter s0 = 2'b00;
  parameter s1 = 2'b01;
  parameter s2 = 2'b10;
  parameter s3 = 2'b11;
  
  reg [2:0] current_state, next_state;  
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      detected<=0;
      current_state <= s0;
    end
    else current_state <= next_state;
  end
  
  always @ (current_state or data) begin
    case(current_state)
      s0: begin
        if (data) next_state <= s1;
        else next_state<=s0;
        detected<=0;
      end
      
      s1: begin
        if (data) next_state<=s2;
        else next_state <= s0;
        detected<=0;
      end
      
      s2: begin  
        if (!data) next_state <= s3;
        else next_state <= s0;
        detected <= 0;
      end
      
      s3: begin
        if (data) next_state <= s1;
        else next_state <= s0;
        detected<=1;
      end
    endcase
  end
endmodule

module test_mealy_fsm;
  reg clk;
  reg rst;
  reg data;
  wire detected;
  
  mealy_fsm uut(clk, rst, data, detected);
  
  always #5 clk = ~clk;
  
  initial begin
    clk=0;rst=0;#10
    rst=1;#10
    rst=0;#10
    
    data = 1;#10
    data = 1;#10
    data = 0;#10
    data = 1;#10 
    data = 0;#10
    data = 0;#10
    data = 0;#10
    data = 0;#10   
    data = 1;#10
    data = 1;#10
    data = 0;#10
    data = 1;#100;
  end
endmodule
