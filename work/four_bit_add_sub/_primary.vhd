library verilog;
use verilog.vl_types.all;
entity four_bit_add_sub is
    port(
        k               : in     vl_logic;
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        sum             : out    vl_logic_vector(3 downto 0);
        cout            : out    vl_logic
    );
end four_bit_add_sub;
