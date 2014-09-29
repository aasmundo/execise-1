library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memory is
	generic 
	( 
	mem_size : integer := 1024; --size of mem
	mem_address_MSB : integer := 9 --log2 of mem_size minus 1
	);	
	
	port
	(
		clk : in std_logic;
		MemRead, MemWrite : in std_logic;
		
		write_data, address : in std_logic_vector(31 downto 0);
		mem_data : out std_logic_vector(31 downto 0)
	
	);
type memory_array is array(0 to (mem_size - 1)) of std_logic_vector(31 downto 0);
end entity;

architecture mem_arch of memory is
signal memory_field : memory_array;
signal read_address : std_logic_vector(mem_address_MSB downto 0);
begin

mem_data <= memory_field(to_integer(unsigned(read_address)));	
	
process(clk)
begin
	if(clk'event and clk = '1') then
			if(MemWrite = '1') then
				memory_field(to_integer(unsigned(address(mem_address_MSB downto 0)))) <= write_data;
			end if;
			read_address <= address(mem_address_MSB downto 0);
	end if;
end process;
	
	
	
	
end mem_arch;
