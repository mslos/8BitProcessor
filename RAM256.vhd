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

-- *** Programs ***
-- Add 7 and 8, save result into R0 and HALT
-- X"2207", X"2408", X"0050", X"A000"


entity ROM256 is
    Port ( address : in  STD_LOGIC_VECTOR (7 downto 0);
           instruction : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk: in STD_LOGIC);
end ROM256;

architecture Behavioral of ROM256 is

type rom_type is array (0 to 255) of std_logic_vector(15 downto 0);
constant rom : rom_type := ( --X"2248", -- SUB R1,R1, 2_001_001_001_000
--X"2490", -- SUB R2,R2, 2_010_010_010_000
--X"2248", X"2490", X"124A", X"149E", X"E243", X"06D0", X"B900", X"3241", X"C03C", X"C00F", X"A000",
-- *** test program ***
"0010000000000100", --R0=4
"0010001111000111", --R1=7
"0000010000001000", --R2=R0+R1
"0001010001000000", --R2=R1-R0
"0011010000000001", --R2=R0-1
"0101010010000000", --R2=R2 OR R0=111
"0100010001001000", --R2=R1andR1=7
"0110010001000011", --R2=R1AND011=3
"0111010001001111", --R2=R1or1111=1111=F
"1000010001000001", --R2=shl(R1)=1110=E
"1001010000000001", --R2=shr(R0)=0010=2

--"0010100000001111", 
--"1011000100000011",
--"1011001100000010",
--"1011010100000001",
--"1011011100000000",
--"0010100111000111",
--"0100000100000000",
--"0100001100000000",
--"0100010100000000",
--"0100011100000000",
--"1000000000000011",
--"1000001001000010",
--"1000010010000001",
--"0000000000001000",
--"0000000000010000",
--"0000000000011000",
--X"2207", X"2408", X"0050", X"A000", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
X"A000", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD", X"ABCD",
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

