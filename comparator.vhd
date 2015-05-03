----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:50:15 03/27/2015 
-- Design Name: 
-- Module Name:    comparator - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (2 downto 0));
end comparator;

architecture Behavioral of comparator is

begin


	result(0) <= '1' WHEN Rs1 < Rs2 ELSE '0' ;
	result(1) <= '1' WHEN Rs1 = Rs2 ELSE '0' ;
	result(2) <= '1' WHEN Rs1 /= Rs2 ELSE '0' ;

end Behavioral;

