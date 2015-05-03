----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:00 03/27/2015 
-- Design Name: 
-- Module Name:    asynch_ram - Behavioral 
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

entity asynch_ram is
    Port ( read_address : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end asynch_ram;

architecture Behavioral of asynch_ram is
	type ram_type is array (0 to 255) of std_logic_vector(15 downto 0);
   signal ram : ram_type;
	
	begin
	data_out <= ram (to_integer(unsigned(read_address))); 
	ram_process: process (clk, rst)
		begin
	   if rising_edge(clk) then
			if rst = '1' then 
			--for i in 0 to 255 loop 
				--ram (i) <= (others => '0'); 
			--end loop; 
			
			--MUL: R1 and R2. R1 subtracted ... Result in R3 and R4
			
			ram (0) <= x"2248"; -- SUB R1,R1, 2_001_001_001_000
			ram (1) <= x"2490"; -- SUB R2,R2, 2_010_010_010_000
			
			ram (2) <= x"124A"; -- ADDI R1, num1 ... "125E" .. 30, &&(1)_001_001_001_010 .... 
			ram (3) <= x"149E"; -- ADDI R2, num2 ... "149E" .. 30, && (1)_010_010_111_100 ... . 
			
			ram (4) <= x"E243";--  BE R1 , R0, 15 ... else not -- E_(001)_001_000_111
			ram (5) <= x"06D0";  -- Rs3 = Rs3 + Rs2 = 0000_011_011_010_xxx
			ram (6) <= x"B900";  -- Sub R1, 1  , 0011_001_001_000001
			ram (7) <= x"3241";-- Rs4 = Rs4 + R0 + Carry ... ADDC B_100_100_000_0000
			ram (8) <= x"C03C"; --  JMP 0--C_0000_00_111100
			ram (9) <= x"C00F"; 	-- JMP to 15
			
			
--			ram (0) <= x"E243";--  BE ... R1 , R0, 15 ... else not -- E_(001)_001_000_111
--			ram (1) <= x"06D0";  -- ADD ... Rs3 = Rs3 + Rs2 = 0000_011_011_010_xxx
--			ram (2) <= x"B900";  -- ADDC ...  Rs4 = Rs4  + Carry ... ADDC B_100_100_000_0000
--			ram (3) <= x"3241";-- Sub R1, 1  , 0011_001_001_000001 
--			ram (4) <= x"C03C"; --  JMP 0--C_0000_00_111100
--			ram (5) <= x"C00F"; -- JMP to 15
--						
			
			--ram (5) <= x"A000"; -- HALT
			--ram (3) <= x"0003";
			
			ram (15) <= x"A000";-- HALT
			---ram (15) <= x"0e50";--
			ram (16) <= x"C03F"; -- JMP -1 locations
--			ram (0) <= x"C00F"; -- JMP to 15
--			
--			ram (0) <= x"D20F"; -- BLT R0, R1, 15
--			ram (0) <= x"E207"; -- BE R0, R0, 15
--			ram (0) <= x"F20F"; -- BNE R0, R1, 15
			
			end if; 
		end if; 	
	end process; 	

end Behavioral;




-------  %%
--architecture Behavioral of asynch_ram is
--	type ram_type is array (0 to 255) of std_logic_vector(15 downto 0);
--   signal ram : ram_type;
--	
--	begin
--	data_out <= ram (to_integer(unsigned(read_address))); 
--	ram_process: process (clk, rst)
--		begin
--	   if rising_edge(clk) then
--			if rst = '1' then 
--			--for i in 0 to 255 loop 
--				--ram (i) <= (others => '0'); 
--			--end loop; 
--			ram (0) <= x"0e50"; -- Rs7 = Rs1 + Rs2 = 0000_111_001_010_xxx
--			ram (1) <= x"C00E";
--			ram (2) <= x"0250";
--			ram (3) <= x"0250";
--			ram (4) <= x"0250";
--			ram (5) <= x"C00F"; -- JMP to 15
--			
--			
--			--ram (5) <= x"A000"; -- HALT
--			--ram (3) <= x"0003";
--			
--			ram (15) <= x"0e50";--
--			ram (16) <= x"C03F"; -- JMP back to 0 + PC ... means this same location
----			ram (0) <= x"C00F"; -- JMP to 15
----			
----			ram (0) <= x"D20F"; -- BLT R0, R1, 15
----			ram (0) <= x"E207"; -- BE R0, R0, 15
----			ram (0) <= x"F20F"; -- BNE R0, R1, 15
--			
--			end if; 
--		end if; 	
--	end process; 	

