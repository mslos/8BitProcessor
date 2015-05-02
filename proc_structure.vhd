----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:35:51 05/03/2015 
-- Design Name: 
-- Module Name:    proc_structure - Behavioral 
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

entity proc_structure is

Port (clk : in  STD_LOGIC;										--Common Clock
		rst : in  STD_LOGIC;										--Common Reset
		Rs1_out : out  STD_LOGIC_VECTOR (7 downto 0);	--Rs1 content to Display
		Rs2_out : out  STD_LOGIC_VECTOR (7 downto 0);	--Rs2 content to Display
		Rd_out : out  STD_LOGIC_VECTOR (7 downto 0);		--Rd content to Display
		reg_no: in STD_LOGIC_VECTOR (2 downto 0);			--???
	   display: in std_logic;  								--Is display on?
		PC_out : out  STD_LOGIC_VECTOR (7 downto 0));	--Output of program counter

end proc_structure;

architecture Behavioral of proc_structure is

--  *** Decare Blocks of the Processor ***

component ProgramCounter is
    Port ( offset : in  STD_LOGIC_VECTOR (7 downto 0);
           halt : in  STD_LOGIC;
           branch : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  nextaddress : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component ROM256 is
    Port ( address : in  STD_LOGIC_VECTOR (7 downto 0);
           instruction : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk: in STD_LOGIC);
end component;

component decoder is
    Port ( opcode : inout  STD_LOGIC_VECTOR (3 downto 0);
           offset : out  STD_LOGIC_VECTOR (7 downto 0);
           instruction : in  STD_LOGIC_VECTOR (15 downto 0);
           Rs1_addr : inout  STD_LOGIC_VECTOR (2 downto 0);
           Rs2_addr : inout  STD_LOGIC_VECTOR (2 downto 0);
           Rd_addr : inout  STD_LOGIC_VECTOR (2 downto 0);
           halt : out  STD_LOGIC;
           branch : out  STD_LOGIC;
			  wrt: out STD_LOGIC;
			  Rs1 : in  STD_LOGIC_VECTOR (7 downto 0);
			  Rs2 : in  STD_LOGIC_VECTOR (7 downto 0));			  

end component;

component alu is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Rd : out  STD_LOGIC_VECTOR (7 downto 0);
           offset : in  STD_LOGIC_VECTOR (7 downto 0);
           opcode : in  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Memory8x8 is
    Port ( Rs1_addr : in  STD_LOGIC_VECTOR (2 downto 0);
           Rs2_addr : in  STD_LOGIC_VECTOR (2 downto 0);
           Rd_addr : in  STD_LOGIC_VECTOR (2 downto 0);
           Rs1_cont : out  STD_LOGIC_VECTOR (7 downto 0);
           Rs2_cont : out  STD_LOGIC_VECTOR (7 downto 0);
           Rd_cont : in  STD_LOGIC_VECTOR (7 downto 0);
           wrt : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC);
end component;

-- *** Declare Signals conecting the Blocks ***
signal Rs1_addr, Rs2_addr, Rd_addr : STD_LOGIC_VECTOR (2 downto 0);	--Addresses of arguments and output
signal halt, branch, wrt : STD_LOGIC;											--Control signals
signal opcode : STD_LOGIC (3 downto 0);										--Operation code (4-bit)
signal offset, address, instruction : STD_LOGIC_VECTOR (7 downto 0);	--Offset (argument), address of next instruction, content of instruction
signal Rs1_cont, Rs2_cont, Rd_cont : STD_LOGIC_VECTOR (7 downto 0);	--Content of arguments and output

begin

Rs1_out <= Rs1_cont;
Rs2_out <= Rs2_cont;
Rd_out <= Rs_cont;
PC_out <= address;


end Behavioral;

