library verilog;
use verilog.vl_types.all;
entity piso is
    port(
        qin             : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        mode            : in     vl_logic;
        serial_output   : out    vl_logic
    );
end piso;
