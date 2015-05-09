----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:25 04/19/2015 
-- Design Name: 
-- Module Name:    decoder - Behavioral 
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

entity decoder is
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

end decoder;

architecture Behavioral of decoder is
	signal tail : STD_LOGIC_VECTOR (2 downto 0);
	signal offset1: STD_LOGIC_VECTOR (7 downto 0);
	signal offset2: STD_LOGIC_VECTOR (7 downto 0);
	signal offset3: STD_LOGIC_VECTOR (7 downto 0);
	signal offset4: STD_LOGIC_VECTOR (7 downto 0);
begin

	opcode <= instruction(15 downto 12);
	Rd_addr <= instruction(11 downto 9);
	Rs1_addr <= instruction(8 downto 6);
	Rs2_addr <= instruction(5 downto 3);
	tail <= instruction(2 downto 0);
	
	offset1 <= Rs2_addr(2)&Rs2_addr(2)&Rs2_addr(2 downto 0)&tail;
	offset2 <= "00"&Rs2_addr(2 downto 0)&tail;
	offset3 <= "00000"&tail;
	offset4 <= Rd_addr(2)&Rd_addr(2)&Rd_addr(2 downto 0)&tail;
	
	with opcode select offset <=
		offset1 when "0001",
		offset1 when "0010",
		offset2 when "0110",
		offset2 when "0111",
		offset3 when "1000",
		offset3 when "1001",
		offset1 when "1100",
		offset4 when "1101",
		offset4 when "1110",
		offset4 when "1111",
		offset3 when "1011",
		"00000000" when others;
		
	halt <= '1' when (opcode= "1010" and Rs1 < Rs2) else
		'0';
	branch <= '1' when (opcode="1100") else
		'1' when (opcode="1101" and Rs1<Rs2) else
		'1' when (opcode="1110" and Rs1=Rs2) else
		'1' when (opcode="1111" and Rs1/=Rs2) else
		'0';
		           
	with  opcode select wrt <= 
		'1' when "0000",  
		'1' when "0001",  
		'1' when "0010",   
		'1' when "0011",  	
		'1' when "0100",  
		'1' when "0101",   
		'1' when "0110", 
		'1' when "0111",  	
		'1' when "1000", -- 
		'1' when "1001", -- Arithmetic/Logical end
		'0' when "1010", -- HALT
		'1' when "1011", -- custom operation to be implemented
		'0' when "1100", --JMP
		'0' when "1101", -- BLT
		'0' when "1110", -- BE		
		'0' when "1111", -- BNE
		'0' when others; 		
		

end Behavioral;

