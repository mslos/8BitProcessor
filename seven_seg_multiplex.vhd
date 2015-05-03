----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:19:18 03/28/2015 
-- Design Name: 
-- Module Name:    seven_seg_multiplex - Behavioral 
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
use IEEE.Numeric_Std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seven_seg_multiplex is
    Port ( sixteen_bit_hex_in : in  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           seven_seg_output : out  STD_LOGIC_VECTOR (6 downto 0);
			  segment_enable : out  STD_LOGIC_VECTOR (3 downto 0));
end seven_seg_multiplex;

architecture Behavioral of seven_seg_multiplex is

	COMPONENT sig_gen
	generic (CLK_PER: integer:= 2499999);
	PORT(
		clk : IN std_logic;          
		clk_out : OUT std_logic
		);
	END COMPONENT;


	COMPONENT hex_to_7seg
	PORT(
		hex_nibble : IN std_logic_vector(3 downto 0);          
		seven_seg_output : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

	signal slow_clk : STD_LOGIC; 
	signal count: unsigned (1 downto 0);
	signal hex_nibble : std_logic_vector(3 downto 0); 
	begin

	Inst_sig_gen: sig_gen  generic map (CLK_PER => 2499) PORT MAP(
		clk => clk,
		clk_out => slow_clk
	);
	
	Inst_hex_to_7seg: hex_to_7seg  PORT MAP(
		hex_nibble => hex_nibble,
		seven_seg_output => seven_seg_output
	);

	counter: process (slow_clk, rst)
	begin
		if (rst = '1') then 
			count <= "00";
		elsif (slow_clk'event and slow_clk = '1')	then 
			count <= count + 1;
		end if;  	
	end process counter;
	
	
	with count select hex_nibble <= 
		sixteen_bit_hex_in(3 downto 0) when "00", 
		sixteen_bit_hex_in(7 downto 4) when "01", 
		sixteen_bit_hex_in(11 downto 8) when "10", 
		sixteen_bit_hex_in(15 downto 12) when "11",
		sixteen_bit_hex_in(3 downto 0) when others; 		
	
		with count select segment_enable <= 
			"0111" when "11", 
			"1011" when "10", 
			"1101" when "01", 
			"1110" when "00", 
			"1111" when others; 
			
	-- choose the hex nibble 
--	nibble: process (count)
--	begin
--		case count is
--			when "00" => 
--		end case; 
--	end process nibble; 

end Behavioral;

