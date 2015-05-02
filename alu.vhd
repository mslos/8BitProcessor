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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Rd : out  STD_LOGIC_VECTOR (7 downto 0);
           offset : in  STD_LOGIC_VECTOR (7 downto 0);
           opcode : in  STD_LOGIC_VECTOR (3 downto 0));
end alu;

architecture Behavioral of alu is
begin


	with opcode select Rd <=
			(Rs1+Rs2) when "0000",
			(Rs1-Rs2) when "0001",
			(Rs1+offset) when "0010",
			(Rs1-offset) when "0011",
			(Rs1 and Rs2) when "0100",
			(Rs1 or Rs2) when "0101",
			(Rs1 and offset) when "0110",
			(Rs1 or offset) when "0111",
			to_stdlogicvector((to_bitvector(Rs1) sll to_integer(unsigned(offset)))) when "1000",
			to_stdlogicvector((to_bitvector(Rs1) sra to_integer(unsigned(offset)))) when "1001",
			"00000000" when others;
	

end Behavioral;

