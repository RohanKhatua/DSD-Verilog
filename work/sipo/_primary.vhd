library verilog;
use verilog.vl_types.all;
entity sipo is
    port(
        serial_in       : in     vl_logic;
        parallel_out    : out    vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end sipo;
