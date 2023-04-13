module sipo(serial_in, parallel_out, clk, rst);
  input serial_in;
  input clk;
  input rst;
  output [3:0] parallel_out;
  
  reg [3:0] parallel_out;
  
  always @ (posedge clk) begin
    if (rst)
      parallel_out = 4'b0000;
    else begin
      parallel_out[3] <= serial_in;
      parallel_out[2] <= parallel_out[3];
      parallel_out[1] <= parallel_out[2];
      parallel_out[0] <= parallel_out[1];
    end
  end
endmodule 
      
module test_sipo;
  reg serial_in;
  reg clk;
  reg rst;
  wire [3:0] parallel_out;
  
  sipo uut (serial_in, parallel_out, clk, rst);
  
  always #5 clk = ~clk;
  
  initial begin
    clk=0;rst=0;#10
    rst=1;#10
    rst=0;#10
    
    serial_in = 1;#10
    serial_in = 1;#10
    serial_in = 1;#10
    serial_in = 0;#10
    serial_in = 0;#10
    serial_in = 1;#10
    serial_in = 0;#10
    serial_in = 1;#10;
  end
endmodule