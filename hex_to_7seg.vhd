----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:16:05 03/28/2015 
-- Design Name: 
-- Module Name:    hex_to_7seg - Behavioral 
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

entity hex_to_7seg is
    Port ( hex_nibble : in  STD_LOGIC_VECTOR (3 downto 0);
           seven_seg_output : out  STD_LOGIC_VECTOR (6 downto 0));
end hex_to_7seg;

architecture Behavioral of hex_to_7seg is
begin
		process (hex_nibble)
		begin
			case hex_nibble is
				when "0000" => seven_seg_output <= "1000000";
				when "0001" => seven_seg_output <= "1111001";
				when "0010" => seven_seg_output <= "0100100";
				when "0011" => seven_seg_output <= "0110000";
				when "0100" => seven_seg_output <= "0011001";
				when "0101" => seven_seg_output <= "0010010";
				when "0110" => seven_seg_output <= "0000010";
				when "0111" => seven_seg_output <= "1011000";
				when "1000" => seven_seg_output <= "0000000";
				when "1001" => seven_seg_output <= "0010000";
				when "1010" => seven_seg_output <= "0001000";
				when "1011" => seven_seg_output <= "0000011";
				when "1100" => seven_seg_output <= "1000110";
				when "1101" => seven_seg_output <= "0100001";
				when "1110" => seven_seg_output <= "0000110";
				when "1111" => seven_seg_output <= "0001110";
				when others => seven_seg_output <= "1000000";
			end case;
		end process; 
end Behavioral;

