----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:04:10 03/28/2015 
-- Design Name: 
-- Module Name:    wrapper_proc_7seg - Behavioral 
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

-- *** Important: Display shows hex-in (find below) ***

entity wrapper_proc_7seg is
    Port ( clk : in  STD_LOGIC;
           rst, btn : in  STD_LOGIC;
			  reg_no: in STD_LOGIC_VECTOR (2 downto 0);
			  display: in std_logic;  

           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0));
end wrapper_proc_7seg;

architecture Behavioral of wrapper_proc_7seg is



	COMPONENT sig_gen
	generic (CLK_PER: integer:= 2499999);
	PORT(
		clk : IN std_logic;          
		clk_out : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT proc_structure
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;          
		Rs1_out : OUT std_logic_vector(7 downto 0);
		Rs2_out : OUT std_logic_vector(7 downto 0);
		Rd_out : OUT std_logic_vector(7 downto 0);
		 reg_no: in STD_LOGIC_VECTOR (2 downto 0);
			  display: in std_logic;  
		hlt : out STD_LOGIC;
		 PC_out : out  STD_LOGIC_VECTOR (7 downto 0)
		);
	END COMPONENT;

	COMPONENT seven_seg_multiplex
	PORT(
		sixteen_bit_hex_in : IN std_logic_vector(15 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		seven_seg_output : OUT std_logic_vector(6 downto 0);
		segment_enable : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	signal Rs1_out, Rs2_out, Rd_out, PC_out :  std_logic_vector(7 downto 0) ;  
	signal hex_in :  std_logic_vector(15 downto 0) ; 
	signal slow_clk, hlt: std_logic; 
	
	begin
	
-- *** Display shows content of Rs1, program counter direction and last fo-
--		 ur bits of Rd
-- *** If display button is HIGH, then Rs1 becomes determined by user input
--		 and the user can check the content of the register. Must turn off bu-
--		 tton before next clock cycle. UCF gives button mapping.

	hex_in <=  Rs1_out(7 downto 0) & PC_out(3 downto 0) & Rd_out(3 downto 0); -- & Rs2_out(3 downto 0); PC_out(3 downto 0) & Rd_out(3 downto 0)
		
	Inst_top_processor: proc_structure PORT MAP(
		clk => btn , ---slow_clk,
		rst => rst,
		Rs1_out => Rs1_out,
		Rs2_out => Rs2_out,
		Rd_out => Rd_out,
		reg_no => reg_no, 
		display => display, 
		PC_out => PC_out,
		hlt => hlt
	);
	
	Inst_seven_seg_multiplex: seven_seg_multiplex PORT MAP(
		sixteen_bit_hex_in => hex_in,
		clk => clk,
		rst => rst,
		seven_seg_output => seg,
		segment_enable => an
	);
	

	Inst_sig_gen: sig_gen generic map (CLK_PER => 24999 ) PORT MAP(
		clk => clk,
		clk_out => slow_clk
	);

end Behavioral;

