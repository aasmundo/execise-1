-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : multi cycle design
-- Author      : Ole Brumm
-- Company     : Hundremeterskogen Dataservice
--
-------------------------------------------------------------------------------
--
-- File        : d:\user\multi_cycle_workspace\multi cycle design\compile\asd.vhd
-- Generated   : Fri Sep 26 15:42:14 2014
-- From        : d:\user\multi_cycle_workspace\multi cycle design\src\asd.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity asd is 
end asd;

architecture asd of asd is

---- Component declarations -----

component ALU
  port (
       control_signal : in STD_LOGIC_VECTOR(3 downto 0);
       port_a : in STD_LOGIC_VECTOR(31 downto 0);
       port_b : in STD_LOGIC_VECTOR(31 downto 0);
       result : out STD_LOGIC_VECTOR(31 downto 0);
       zero : out STD_LOGIC
  );
end component;
component ALU_tb
  port (
       result : in STD_LOGIC_VECTOR(31 downto 0);
       zero : in STD_LOGIC;
       control_signal : out STD_LOGIC_VECTOR(3 downto 0);
       port_a : out STD_LOGIC_VECTOR(31 downto 0);
       port_b : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET50 : STD_LOGIC;
signal BUS38 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS42 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS46 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS62 : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U1 : ALU
  port map(
       control_signal => BUS46,
       port_a => BUS38,
       port_b => BUS42,
       result => BUS62,
       zero => NET50
  );

U2 : ALU_tb
  port map(
       control_signal => BUS46,
       port_a => BUS38,
       port_b => BUS42,
       result => BUS62,
       zero => NET50
  );


end asd;
