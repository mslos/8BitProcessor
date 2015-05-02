----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:27 04/26/2015 
-- Design Name: 
-- Module Name:    Memory8x8 - Behavioral 
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

entity Memory8x8 is
    Port ( Rs1_addr : in  STD_LOGIC_VECTOR (2 downto 0);
           Rs2_addr : in  STD_LOGIC_VECTOR (2 downto 0);
           Rd_addr : in  STD_LOGIC_VECTOR (2 downto 0);
           Rs1_cont : out  STD_LOGIC_VECTOR (7 downto 0);
           Rs2_cont : out  STD_LOGIC_VECTOR (7 downto 0);
           Rd_cont : in  STD_LOGIC_VECTOR (7 downto 0);
           wrt : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC);
end Memory8x8;

architecture Behavioral of Memory8x8 is
type ram_type is array (7 downto 0) of std_logic_vector(7 downto 0);
signal ram : ram_type;

begin

Rs1_cont <= ram(to_integer(unsigned(Rs1_addr)));
Rs2_cont <= ram(to_integer(unsigned(Rs2_addr)));

ram_process: process(Clk, Reset)
	begin
		if (Clk'EVENT AND Clk='1') then
			if (wrt = '1') then ram(to_integer(unsigned(Rd_addr))) <= Rd_cont;
			end if;
			if (Reset = '1') then ram <= ("00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");
			end if;
		end if;
end process;

end Behavioral;