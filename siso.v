module siso (serial_in, serial_out, clk, rst);
  input serial_in;
  input clk;
  input rst;
  output reg serial_out;
  
  always @(posedge clk) begin
    if (rst) 
      serial_out <= 1'b0;
    else 
      serial_out <=serial_in;
  end  
endmodule

module test_siso;
  reg serial_in;
  reg clk;
  reg rst;
  
  wire serial_out;
  
  siso uut (serial_in, serial_out, clk, rst);
  
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
    serial_in = 1;#10;
  end
endmodule
  
