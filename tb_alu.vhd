--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:54:17 03/27/2015
-- Design Name:   
-- Module Name:   Z:/Technical_Stuff/ADLD_Spring2014/Yasin_Processor/tb_alu.vhd
-- Project Name:  Yasin_Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_alu IS
END tb_alu;
 
ARCHITECTURE behavior OF tb_alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         Rs1 : IN  std_logic_vector(7 downto 0);
         Rs2 : IN  std_logic_vector(7 downto 0);
         offset : IN  std_logic_vector(7 downto 0);
         opcode : IN  std_logic_vector(3 downto 0);
         Rd : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rs1 : std_logic_vector(7 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(7 downto 0) := (others => '0');
   signal offset : std_logic_vector(7 downto 0) := (others => '0');
   signal opcode : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Rd : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          offset => offset,
          opcode => opcode,
          Rd => Rd
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Rs1 <= x"01"; 
		Rs2 <= x"02"; 
		offset <= x"03";
		opcode <= "0000";
		wait for 100 ns;
		opcode <= "0001";
		
		wait for 100 ns;
		opcode <= "0010";
				
		wait for 100 ns;
		opcode <= "0011";
				
		wait for 100 ns;
		opcode <= "0100";
				
		wait for 100 ns;
		opcode <= "0101";
				
		wait for 100 ns;
		opcode <= "0110";
				
		wait for 100 ns;
		opcode <= "0111";
				
		wait for 100 ns;
		opcode <= "1000";
				
		wait for 100 ns;
		opcode <= "1001";		
						
		wait for 100 ns;
		opcode <= "1010";
						
		wait for 100 ns;
		opcode <= "1011";
						
		wait for 100 ns;
		opcode <= "1100";
						
		wait for 100 ns;
		opcode <= "1101";
		
						
		wait for 100 ns;
		opcode <= "1110";

				
		wait for 100 ns;
		opcode <= "1111";      -- insert stimulus here 

      wait;
   end process;

END;
