module piso(qin, clk, mode, serial_output);
  input [3:0] qin;
  input clk, mode;
  output reg serial_output;
  reg [3:0] q;
  always @(posedge clk)
  begin
    if (mode) q<=qin;
    else begin
    serial_output<=q[4];
    q[4]<=q[3];
    q[3]<=q[2];
    q[2]<=q[1];
    q[1]<=q[0];
    end
  end
endmodule

module piso_test;
  reg [4:0] q;
  reg clk,mode;
  wire serial_output;
  
  piso s1(q,clk,mode,serial_output);
  
  initial
  begin
    mode =1;
    q = 5'b10110;
    clk = 0;    
    
    #20 mode =0;   
    
  end
  
  always #5 clk = ~clk;
endmodule  
      
