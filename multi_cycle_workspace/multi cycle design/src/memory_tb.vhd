LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ARCHITECTURE testbench OF memory_tb IS

COMPONENT memory IS
	PORT (
	clk : IN STD_LOGIC;
	rst : IN STD_LOGIC;
	memory_read : IN STD_LOGIC;
	memory_write : IN STD_LOGIC;
	mem_address : in STD_LOGIC_VECTOR(width-1 DOWNTO 0);
	data_in : IN STD_LOGIC_VECTOR(width-1 DOWNTO 0);
	data_out : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0));
END COMPONENT;

signal clk : STD_LOGIC;
signal rst : STD_LOGIC;
signal memory_read : STD_LOGIC;
signal memory_write : STD_LOGIC;
signal mem_address : STD_LOGIC_VECTOR(width-1 DOWNTO 0);
signal data_in : STD_LOGIC_VECTOR(width-1 DOWNTO 0);
signal data_out : STD_LOGIC_VECTOR(width-1 DOWNTO 0);

CONSTANT period : time := 10 ns;
SIGNAL clken_p : boolean := true;

BEGIN
	DUT: memory
	PORT MAP (
	clk => clk,
	rst => rst,
	memory_read => memory_read,
	memory_write => memory_write,
	mem_address => mem_address,
	data_in => data_in,
	data_out => data_out);
	
clock_proc : PROCESS
BEGIN
	WHILE clken LOOP
		clk <= '0' WAIT FOR period/2;
		clk <= '1' WAIT FOR period/2;
	END LOOP;
	WAIT;
END PROCESS;

reset : rst <= '0', '1' AFTER period;

WaveGen_Proc : PROCESS
	VARIABLE mem_temp : STD_ULOGIC_VECTOR(width-1 DOWNTO 0);
	TYPE array_vector IS ARRAY (0 TO 5) OF STD_ULOGIC_VECTOR(width-1 DOWNTO 0);
	VARIABLE addr_pattern : array_vector;
	VARIABLE data_pattern : array_vector;
BEGIN
	memory_read <= '1';
	memory_write <= '0';
	mem_address <= (OTHERS => '0');
	addr_pattern := (
		x"00000000",
		x"00000004",
		x"00000008",
		x"0000000C",
		x"00000010",
		x"00000014");
		
	data_pattern := (
		x"01020304",
		x"05060708",
		x"090A0B0C",
		x"0D0E0F10",


