library verilog;
use verilog.vl_types.all;
entity siso is
    port(
        serial_in       : in     vl_logic;
        serial_out      : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end siso;
