library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mem_array is
	generic (
		data_width: integer := 12;
		addr_width: integer := 8;
		init_file:  string  := "inst_mem.mif"
		);
	port (
		addr	: in  STD_LOGIC_VECTOR(addr_width-1 downto 0);
		datain	: in  STD_LOGIC_VECTOR(data_width-1 downto 0);
		clk, we : in  STD_LOGIC;
		output	: out STD_LOGIC_VECTOR(data_width-1 downto 0)
		);
end mem_array;

architecture behavioral of mem_array is

Type MEMORY_ARRAY is array (0 to addr_width-1) of STD_LOGIC_VECTOR(data_width-1 downto 0);

impure function init_memory_wfile(mif_file_name : in string) return MEMORY_ARRAY is
    file mif_file : text open read_mode is mif_file_name;
    variable mif_line : line;
    variable temp_bv : bit_vector(DATA_WIDTH-1 downto 0);
    variable temp_mem : MEMORY_ARRAY;
begin
    for i in MEMORY_ARRAY'range loop
        readline(mif_file, mif_line);
        read(mif_line, temp_bv);
        temp_mem(i) := to_stdlogicvector(temp_bv);
    end loop;
    return temp_mem;
end function;

SIGNAL memory : MEMORY_ARRAY(addr_width-1);

begin



end behavioral;