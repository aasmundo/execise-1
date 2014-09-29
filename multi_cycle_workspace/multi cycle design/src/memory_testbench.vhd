library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memory_testbench is
	port
	(
		clk : in std_logic;
		MemRead, MemWrite : out std_logic;
		
		write_data, address : out std_logic_vector(31 downto 0);
		mem_data : in std_logic_vector(31 downto 0)
	
	);
end entity;	 


architecture tb of memory_testBench is

begin
	
	process
	begin
		MemRead <= '0';
		MemWrite <= '1';
		write_data <= x"12345678";
		address <= x"00000001";
		
		wait for 100 ns;
		assert (mem_data = x"12345678") report "ERROR1" severity note;
		MemRead <= '0';
		MemWrite <= '1';
		write_data <= x"23456789";
		address <= x"00000010";
		wait for 100 ns;
		assert (mem_data = x"23456789") report "ERROR2" severity note;
		MemRead <= '1';
		MemWrite <= '0';
		write_data <= x"40440400";
		address <= x"00000010";
		wait for 1 ns;
		assert (mem_data = x"23456789") report "ERROR3" severity note; 
		assert (mem_data = x"82828282") report "success" severity error;
	end process;
	
	
	
end tb;