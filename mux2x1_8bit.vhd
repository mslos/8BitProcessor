----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:54:10 03/27/2015 
-- Design Name: 
-- Module Name:    mux2x1_8bit - Behavioral 
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

entity mux2x1_8bit is
    Port ( alu : in  STD_LOGIC_VECTOR (7 downto 0);
           pc : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR (7 downto 0));
end mux2x1_8bit;

architecture Behavioral of mux2x1_8bit is

begin

	with sel select outp <= 
		alu when '0',
		pc when '1',  
		
		X"00" when others; 

end Behavioral;

