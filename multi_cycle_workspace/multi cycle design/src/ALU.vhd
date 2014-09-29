library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
	port(port_a, port_b : in std_logic_vector(31 downto 0);	 
	control_signal : in std_logic_vector(3 downto 0);
	
	
	result : out std_logic_vector(31 downto 0);
	zero : out std_logic
	
	);
end entity;

architecture ALU_behaviour of ALU is
signal add_result, sub_result, and_result, or_result, slt_result : signed(31 downto 0);
signal result_signal : std_logic_vector(31 downto 0);
begin
process(port_a, port_b)
begin
	add_result <= signed(port_a) + signed(port_b);
	
	sub_result <= signed(port_a) - signed(port_b); 
	
	and_result <= signed(port_a and port_b);
	
	or_result <= signed(port_a or port_b);
	
	if(signed(port_a) < signed(port_b)) then
		slt_result <= x"00000001";
	else
		slt_result <= x"00000000";
	end if;
end process;


process(add_result, sub_result, and_result, or_result, slt_result)

begin
	case control_signal	is
		when "0000" =>	--AND
			result_signal <= std_logic_vector(and_result);
		when "0001" =>	--OR
			result_signal <= std_logic_vector(or_result);
		when "0010" =>	--ADD
			result_signal <= std_logic_vector(add_result);
		when "0110" =>	--SUB
			result_signal <= std_logic_vector(sub_result);
		when "0111" =>  --SLT
			result_signal <= std_logic_vector(slt_result);
		when others =>	--control error
			result_signal <= x"00000194";
	end case;
	
	
end process;
	
process(result_signal)

begin
	result <= result_signal;
	if(result_signal = x"00000000") then
		zero <= '1';
	else
		zero <= '0';
	end if;
end process;

	
	
end ALU_behaviour;