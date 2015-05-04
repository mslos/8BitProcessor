--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:33:26 05/05/2015
-- Design Name:   
-- Module Name:   E:/processor/tb_proc.vhd
-- Project Name:  nyuad_processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: proc_structure
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_proc IS
END tb_proc;
 
ARCHITECTURE behavior OF tb_proc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT proc_structure
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         Rs1_out : OUT  std_logic_vector(7 downto 0);
         Rs2_out : OUT  std_logic_vector(7 downto 0);
         Rd_out : OUT  std_logic_vector(7 downto 0);
         reg_no : IN  std_logic_vector(2 downto 0);
         display : IN  std_logic;
         PC_out : OUT  std_logic_vector(7 downto 0);
         hlt : OUT  std_logic
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
   signal hlt : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: proc_structure PORT MAP (
          clk => clk,
          rst => rst,
          Rs1_out => Rs1_out,
          Rs2_out => Rs2_out,
          Rd_out => Rd_out,
          reg_no => reg_no,
          display => display,
          PC_out => PC_out,
          hlt => hlt
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
      wait for clk_period*10;
		rst <= '0'; 

      -- insert stimulus here 

      wait;
   end process;

END;
