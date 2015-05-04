----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:43 04/26/2015 
-- Design Name: 
-- Module Name:    ProgramCounter - Behavioral 
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

entity ProgramCounter is
    Port ( offset : in  STD_LOGIC_VECTOR (7 downto 0);
           halt : in  STD_LOGIC;
           branch : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  nextaddress : out  STD_LOGIC_VECTOR (7 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is
signal curnum : STD_LOGIC_VECTOR(7 downto 0);

begin

nextaddress <= curnum;

pc_process: process(clk, reset, branch, halt)
begin
	if (clk'EVENT and clk ='1') then
		if curnum = "11111111" then curnum <= "00000000";
		end if;
		if reset = '1' then curnum <= "00000000";
		elsif halt = '1' then curnum <= curnum;
		elsif branch = '1' then curnum <= curnum+offset;
		else curnum<= curnum+1;
		end if;
	end if;
end process;

end Behavioral;


