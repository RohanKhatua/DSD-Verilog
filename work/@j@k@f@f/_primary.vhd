library verilog;
use verilog.vl_types.all;
entity JKFF is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        j               : in     vl_logic;
        k               : in     vl_logic;
        q               : out    vl_logic
    );
end JKFF;
