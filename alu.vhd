----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:26:45 04/12/2015 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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


entity alu is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Rd : out  STD_LOGIC_VECTOR (7 downto 0);
           offset : in  STD_LOGIC_VECTOR (7 downto 0);
           opcode : in  STD_LOGIC_VECTOR (3 downto 0));
end alu;

architecture Behavioral of alu is
signal holder : std_logic;
begin
holder <= Rs1(to_integer(unsigned(offset)));

	with opcode select Rd <=
			(Rs1+Rs2) when "0000", -- Addition
			(Rs1-Rs2) when "0001", -- Subtraction
			(Rs1+offset) when "0010", -- Add Immediate
			(Rs1-offset) when "0011", -- Sub Immediate
			(Rs1 and Rs2) when "0100", -- Bitwise AND
			(Rs1 or Rs2) when "0101", -- Bitwise OR
			(Rs1 and offset) when "0110", -- Immediate Bitwise AND
			(Rs1 or offset) when "0111", -- Imediate Bitwise OR
			to_stdlogicvector((to_bitvector(Rs1) sll to_integer(unsigned(offset)))) when "1000", -- Shift left
			to_stdlogicvector((to_bitvector(Rs1) sra to_integer(unsigned(offset)))) when "1001", -- Shift right
			"0000" &holder&holder&holder&holder when "1011", -- Extra Operation - choose one element
			"00000000" when others;

end Behavioral;

