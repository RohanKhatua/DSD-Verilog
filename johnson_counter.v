module johnson_counter(clk, rst, q);
  input clk;
  input rst;
  output reg [3:0] q;
  
  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 4'b1000;
    else begin
      q[0] <= ~q[3];
      q[1] <= q[0];
      q[2] <= q[1];
      q[3] <= q[2];
    end
  end
endmodule

module test_johnson_counter;
  reg clk;
  reg rst;
  wire [3:0] q;
  
  ring_counter uut (clk, rst, q);
  
  always #5 clk = ~clk;
  
  initial begin
    clk=0;rst=0;#10
    rst=1;#10;
    rst=0;#200;
    $stop;
  end
endmodule


