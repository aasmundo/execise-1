library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity ALU_tb is
	port(port_a, port_b : out std_logic_vector(31 downto 0);	 
	control_signal : out std_logic_vector(3 downto 0);
	
	
	result : in std_logic_vector(31 downto 0);
	zero : in std_logic
	
	);
 end entity;
architecture ALU_tb_b of ALU_tb is

begin

process

begin
wait for 10 ns;
port_a <= x"00000539";
port_b <= x"00000400";
control_signal <= "0000";
wait for 5 ns;
assert (result = x"00000400") report "AND resultat stemmer ikke" severity note;
assert (zero = '0') report "zero funker ikke AND" severity note;
wait for 5 ns;
port_a <= x"000007ff";
port_b <= x"ffffff00";
control_signal <= "0001";
wait for 5 ns;
assert (result = x"ffffffff") report "OR resultat stemmer ikke" severity note;	 
assert (zero = '0') report "zero funker ikke OR" severity note;
wait for 5 ns;
port_a <= x"0000abc0";
port_b <= x"0000cba0";
control_signal <= "0110";
wait for 5 ns;
assert (result = x"FFFFE020") report "SUB resultat stemmer ikke" severity note;	
assert (zero = '0') report "zero funker ikke SUB" severity note;
wait for 5 ns;
port_a <= x"0000fec0";
port_b <= x"0000fed0";
control_signal <= "0010";
wait for 5 ns;
assert (result = x"0001fd90") report "ADD resultat stemmer ikke" severity note;	
assert (zero = '0') report "zero funker ikke ADD" severity note;
wait for 5 ns;
port_a <= x"f0000000";
port_b <= x"00000000";
control_signal <= "0111";
wait for 5 ns;
assert (result = x"00000001") report "SLT resultat stemmer ikke" severity note;	
assert (zero = '0') report "zero funker ikke SLT" severity note;
wait for 5 ns;
port_a <= x"00000000";
port_b <= x"00001000";
control_signal <= "0001";
wait for 5 ns;
assert (result = x"00001000") report "OR2 resultat stemmer ikke" severity note;	 
assert (zero = '0') report "zero funker ikke OR" severity note;
wait for 5 ns;
port_a <= x"ffffffff";
port_b <= x"00000001";
control_signal <= "0010";
wait for 5 ns;
assert (result = x"00000000") report "ADD2 resultat stemmer ikke" severity note;	 
assert (zero = '1') report "zero funker ikke OR" severity note;



wait for 10 ms;
end process;
	
	
end ALU_tb_b;
