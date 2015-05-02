----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:52:27 03/27/2015 
-- Design Name: 
-- Module Name:    decode_unit - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decode_unit is
    Port ( instruction : in  STD_LOGIC_VECTOR (15 downto 0);
				comp_res : IN std_logic_vector(2 downto 0);		
           Addr_Rs1 : out  STD_LOGIC_VECTOR (2 downto 0);
           Addr_Rs2 : out  STD_LOGIC_VECTOR (2 downto 0);
           Addr_Rd : out  STD_LOGIC_VECTOR (2 downto 0);
			  opcode : OUT std_logic_vector(3 downto 0);
			  offset: OUT  std_logic_vector(7 downto 0);
           incr_PC : out  STD_LOGIC;
           load_PC : out  STD_LOGIC;
			  Rd_we : out  STD_LOGIC; 
           sel_alu_Rs1_PC : out  STD_LOGIC);
end decode_unit;

architecture Behavioral of decode_unit is
 
		signal lessthan, equalto, notequal: std_logic; 
		signal offset_arth, offset_branch : std_logic_vector (7 downto 0); 
	begin
					lessthan <= comp_res (0);
					equalto <= comp_res (1);
					notequal <= comp_res (2);		

					opcode <= instruction(15 downto 12);  
					Addr_Rd <= instruction(11 downto 9); 
					Addr_Rs1 <= instruction(8 downto 6);
					Addr_Rs2 <= instruction(5 downto 3); 
					
					offset_arth <= instruction(5) & instruction(5) & instruction(5 downto 0); 					
					offset_branch <= instruction(11) & instruction(11) & instruction(11 downto 9) & instruction(2 downto 0);
					
	           with  instruction(15 downto 12) select offset <= 
						offset_arth when "0000",  
						offset_arth when "0001",  
						offset_arth when "0010",   
						offset_arth when "0011",  	
						offset_arth when "0100",  
						offset_arth when "0101",   
						offset_arth when "0110", 
						offset_arth when "0111",  	
						offset_arth when "1000", -- 
						offset_arth when "1001", -- Arithmetic/Logical end
						offset_arth when "1010", -- HALT
						offset_arth when "1011", -- add CARRY
						offset_arth when "1100", --JMP
						offset_branch when "1101", -- BLT
						offset_branch when "1110", -- BE		
						offset_branch when "1111", -- BNE
						
						X"00" when others; 

						
	           with  instruction(15 downto 12) select incr_PC <= 
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
						'1' when "1011", -- add CARRY
						'0' when "1100", --JMP
						not(lessthan) when "1101", -- BLT
						not(equalto) when "1110", -- BE		
						not(notequal) when "1111", -- BNE
						
						'0' when others; 

	           with  instruction(15 downto 12) select load_PC <= 
						'0' when "0000",  
						'0' when "0001",  
						'0' when "0010",   
						'0' when "0011",  	
						'0' when "0100",  
						'0' when "0101",   
						'0' when "0110", 
						'0' when "0111",  	
						'0' when "1000", -- 
						'0' when "1001", -- Arithmetic/Logical end
						'0' when "1010", -- HALT
						'0' when "1011", -- add CARRY
						'1' when "1100", --JMP
						(lessthan) when "1101", -- BLT
						(equalto) when "1110", -- BE		
						(notequal) when "1111", -- BNE
						
						'0' when others; 						

				with  instruction(15 downto 12) select sel_alu_Rs1_PC <= 
						'0' when "0000",  
						'0' when "0001",  
						'0' when "0010",   
						'0' when "0011",  	
						'0' when "0100",  
						'0' when "0101",   
						'0' when "0110", 
						'0' when "0111",  	
						'0' when "1000", -- 
						'0' when "1001", -- Arithmetic/Logical end
						'0' when "1010", -- HALT
						'0' when "1011", -- add CARRY
						'1' when "1100", --JMP
						(lessthan) when "1101", -- BLT
						(equalto) when "1110", -- BE		
						(notequal) when "1111", -- BNE
						
						'0' when others; 	
						
						
	           with  instruction(15 downto 12) select Rd_we <= 
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
						'1' when "1011", -- add CARRY
						'0' when "1100", --JMP
						'0' when "1101", -- BLT
						'0' when "1110", -- BE		
						'0' when "1111", -- BNE
						
						'0' when others; 							
					 


end Behavioral;

