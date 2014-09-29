-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : multi cycle design
-- Author      : Ole Brumm
-- Company     : Hundremeterskogen Dataservice
--
-------------------------------------------------------------------------------
--
-- File        : D:\user\multi_cycle_workspace\multi_cycle_workspace\multi cycle design\compile\dsa.vhd
-- Generated   : Mon Sep 29 17:11:41 2014
-- From        : D:\user\multi_cycle_workspace\multi_cycle_workspace\multi cycle design\src\dsa.bde
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


entity dsa is 
end dsa;

architecture dsa of dsa is

---- Component declarations -----

component memory
  generic(
       mem_address_MSB : INTEGER := 9;
       mem_size : INTEGER := 1024
  );
  port (
       MemRead : in STD_LOGIC;
       MemWrite : in STD_LOGIC;
       address : in STD_LOGIC_VECTOR(31 downto 0);
       clk : in STD_LOGIC;
       write_data : in STD_LOGIC_VECTOR(31 downto 0);
       mem_data : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component memory_testbench
  port (
       clk : in STD_LOGIC;
       mem_data : in STD_LOGIC_VECTOR(31 downto 0);
       MemRead : out STD_LOGIC;
       MemWrite : out STD_LOGIC;
       address : out STD_LOGIC_VECTOR(31 downto 0);
       write_data : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET111 : STD_LOGIC;
signal NET66 : STD_LOGIC;
signal NET74 : STD_LOGIC;
signal BUS38 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS50 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS58 : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U1 : memory
  port map(
       MemRead => NET66,
       MemWrite => NET74,
       address => BUS58,
       clk => NET111,
       mem_data => BUS38,
       write_data => BUS50
  );

U2 : memory_testbench
  port map(
       MemRead => NET66,
       MemWrite => NET74,
       address => BUS58,
       clk => NET111,
       mem_data => BUS38,
       write_data => BUS50
  );


end dsa;
