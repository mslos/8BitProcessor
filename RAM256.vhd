----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:36:23 04/26/2015 
-- Design Name: 
-- Module Name:    RAM256 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM256 is
    Port ( address : in  STD_LOGIC_VECTOR (7 downto 0);
           instruction : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk: in STD_LOGIC);
end ROM256;

architecture Behavioral of ROM256 is

type rom_type is array (0 to 255) of std_logic_vector(15 downto 0);
constant rom : rom_type := (
X"ABCD", X"AAAA", X"0000", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"ABCD", X"ABCD", X"ABCD");


begin

rom_process: process(clk)
begin
	if (clk'EVENT and clk='1') then instruction <= rom(to_integer(unsigned(address)));
	end if;
end process;

end Behavioral;

