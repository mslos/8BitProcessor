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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity proc_structure is

Port (clk : in  STD_LOGIC;										--Common Clock
		rst : in  STD_LOGIC;										--Common Reset
		Rs1_out : out  STD_LOGIC_VECTOR (7 downto 0);	--Rs1 content to Display
		Rs2_out : out  STD_LOGIC_VECTOR (7 downto 0);	--Rs2 content to Display
		Rd_out : out  STD_LOGIC_VECTOR (7 downto 0);		--Rd content to Display
		reg_no: in STD_LOGIC_VECTOR (2 downto 0);			--Register num to show on display
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
signal Rs1_address, Rs2_address, Rd_address : STD_LOGIC_VECTOR (2 downto 0);	--Addresses of arguments and output
signal halt, branch, wrt : STD_LOGIC;											--Control signals
signal op_code : STD_LOGIC_VECTOR (3 downto 0);								--Operation code (4-bit)
signal offset, address : STD_LOGIC_VECTOR (7 downto 0);					--Offset (argument), address of next instruction
signal Rs1_cont, Rs2_cont, Rd_cont : STD_LOGIC_VECTOR (7 downto 0);	--Content of arguments and output
signal Rs1_address_temp : STD_LOGIC_VECTOR (2 downto 0); 				--Temporary holder for Rs1 used for debug
signal instruction : STD_LOGIC_VECTOR (15 downto 0);						--Content of the instruction

begin

-- *** Outputs to the display ***
Rs1_out <= Rs1_cont;
Rs2_out <= Rs2_cont;
Rd_out <= Rd_cont;
PC_out <= address;

-- *** Inputs from buttons used for debugging ***
process (display,  reg_no,  Rs1_address_temp) 
	begin
		if (display = '1') then 
				Rs1_address <= reg_no;
		else 
				Rs1_address <= Rs1_address_temp;
		end if; 
	end process; 

-- *** Signal Mapping for Each Component ***

Program_Counter: ProgramCounter PORT MAP(
	offset => offset,
	halt => halt,
	branch => branch,
	clk => clk,
	reset => rst,
	nextaddress => address
	);
	
Program_Register : ROM256 PORT MAP(
	address => address,
	instruction => instruction,
	clk => clk
	);

Decode_Unit : decoder PORT MAP(
	opcode => op_code,
	offset => offset,
	instruction => instruction,
	Rs1_addr => Rs1_address_temp, --using temporary holder so that Rs1 display can be switched to debug
	Rs2_addr => Rs2_address,
	Rd_addr => Rd_address,
	halt => halt,
	branch => branch,
	wrt => wrt,
	Rs1 => Rs1_cont,
	Rs2 => Rs2_cont
	);
	
ALU_instance : alu PORT MAP(
	Rs1 => Rs1_cont,
	Rs2 => Rs2_cont,
	Rd => Rd_cont,
	offset => offset,
	opcode => op_code
	);
	
Register_File : Memory8x8 PORT MAP(
	Rs1_addr => Rs1_address,
   Rs2_addr => Rs2_address,
   Rd_addr => Rd_address,
   Rs1_cont => Rs1_cont,
   Rs2_cont => Rs2_cont,
   Rd_cont => Rd_cont,
   wrt => wrt,
   clk => Clk,
   Reset => rst
	);

end Behavioral;

