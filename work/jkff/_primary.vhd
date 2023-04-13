library verilog;
use verilog.vl_types.all;
entity jkff is
    port(
        j               : in     vl_logic;
        k               : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        q               : out    vl_logic;
        qbar            : out    vl_logic
    );
end jkff;
