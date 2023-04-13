module pipo(parallel_in, parallel_out, clk, rst);
  input [3:0] parallel_in;
  input clk;
  input rst;
  
  output [3:0] parallel_out;
  
  reg [3:0] parallel_out;
  
  reg [3:0] p_out;
  
  always @ (posedge clk) begin
    if (rst)
      p_out <= 4'b0000;
    else begin
      p_out[3] <= parallel_in[3];
      p_out[2] <=parallel_in[2];
      p_out[1] <=parallel_in[1];
      p_out[0] <=parallel_in[0];
    end
    parallel_out <= p_out;
  end
endmodule

module test_pipo;
  reg [3:0] parallel_in;
  reg clk;
  reg rst;
  
  wire [3:0] parallel_out;
  
  pipo uut (parallel_in, parallel_out, clk, rst);
  
  always #5 clk = ~clk;
  
  initial begin
    clk=0;rst=0;#10
    rst=1;#10
    rst=0;#10
    
    parallel_in[0] = 1;
    parallel_in[1] = 1;
    parallel_in[2] = 0;
    parallel_in[3] = 1; #100
 
    parallel_in[0] = 1;
    parallel_in[1] = 0;
    parallel_in[2] = 0;
    parallel_in[3] = 1; #100;
    
    $stop;
  end
endmodule
   
        
    
    