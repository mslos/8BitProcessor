--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:12:59 04/08/2015
-- Design Name:   
-- Module Name:   Z:/Technical_Stuff/ADLD_Spring2015/Yasin_Processor/t_top.vhd
-- Project Name:  Yasin_Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_processor
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
use std.textio.all;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
---use IEEE.STD_LOGIC_ARITH.ALL; 
 
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY t_top IS
END t_top;
 
ARCHITECTURE behavior OF t_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_processor
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         Rs1_out : OUT  std_logic_vector(7 downto 0);
         Rs2_out : OUT  std_logic_vector(7 downto 0);
         Rd_out : OUT  std_logic_vector(7 downto 0);
         reg_no : IN  std_logic_vector(2 downto 0);
         display : IN  std_logic;
         PC_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal reg_no : std_logic_vector(2 downto 0) := (others => '0');
   signal display : std_logic := '0';

 	--Outputs
   signal Rs1_out : std_logic_vector(7 downto 0);
   signal Rs2_out : std_logic_vector(7 downto 0);
   signal Rd_out : std_logic_vector(7 downto 0);
   signal PC_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_processor PORT MAP (
          clk => clk,
          rst => rst,
          Rs1_out => Rs1_out,
          Rs2_out => Rs2_out,
          Rd_out => Rd_out,
          reg_no => reg_no,
          display => display,
          PC_out => PC_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '1';
      wait for clk_period*2;
		rst <= '0';
		
		--report  "and is" & integer'image(to_integer(unsigned(uut.Register_file.carry_in))); 
		-- wait for 
      -- insert stimulus here 
		wait for 2000 ns; 
		display <= '1'; 
		wait for clk_period*2;
		
		--report  "and is" & integer'image(to_integer(unsigned(reg_no))); --& integer'image(CONV_INTEGER(reg_no)); 
		reg_no <= "001"; 
		
				wait for clk_period*2;
		reg_no <= "010"; 
		
				wait for clk_period*2;
		reg_no <= "011"; 
		wait for clk_period*2;
		reg_no <= "100"; 
      wait;
   end process;

END;
