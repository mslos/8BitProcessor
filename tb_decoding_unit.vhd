--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:21:41 03/27/2015
-- Design Name:   
-- Module Name:   Z:/Technical_Stuff/ADLD_Spring2014/Yasin_Processor/tb_decoding_unit.vhd
-- Project Name:  Yasin_Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decode_unit
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
 
ENTITY tb_decoding_unit IS
END tb_decoding_unit;
 
ARCHITECTURE behavior OF tb_decoding_unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decode_unit
    PORT(
         instruction : IN  std_logic_vector(15 downto 0);
         comp_res : IN  std_logic_vector(2 downto 0);
         Addr_Rs1 : OUT  std_logic_vector(2 downto 0);
         Addr_Rs2 : OUT  std_logic_vector(2 downto 0);
         Addr_Rd : OUT  std_logic_vector(2 downto 0);
         opcode : OUT  std_logic_vector(3 downto 0);
         offset : OUT  std_logic_vector(7 downto 0);
         incr_PC : OUT  std_logic;
         load_PC : OUT  std_logic;
         Rd_we : OUT  std_logic;
         sel_alu_Rs1_PC : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(15 downto 0) := (others => '0');
   signal comp_res : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Addr_Rs1 : std_logic_vector(2 downto 0);
   signal Addr_Rs2 : std_logic_vector(2 downto 0);
   signal Addr_Rd : std_logic_vector(2 downto 0);
   signal opcode : std_logic_vector(3 downto 0);
   signal offset : std_logic_vector(7 downto 0);
   signal incr_PC : std_logic;
   signal load_PC : std_logic;
   signal Rd_we : std_logic;
   signal sel_alu_Rs1_PC : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
---   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decode_unit PORT MAP (
          instruction => instruction,
          comp_res => comp_res,
          Addr_Rs1 => Addr_Rs1,
          Addr_Rs2 => Addr_Rs2,
          Addr_Rd => Addr_Rd,
          opcode => opcode,
          offset => offset,
          incr_PC => incr_PC,
          load_PC => load_PC,
          Rd_we => Rd_we,
          sel_alu_Rs1_PC => sel_alu_Rs1_PC
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		instruction <= x"0002"; 

      -- insert stimulus here 

      wait;
   end process;

END;
