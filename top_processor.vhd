----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:11:32 03/27/2015 
-- Design Name: 
-- Module Name:    top_processor - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_processor is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Rs1_out : out  STD_LOGIC_VECTOR (7 downto 0);
           Rs2_out : out  STD_LOGIC_VECTOR (7 downto 0);
           Rd_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  
			  reg_no: in STD_LOGIC_VECTOR (2 downto 0);
			  display: in std_logic;  

			  PC_out : out  STD_LOGIC_VECTOR (7 downto 0));
end top_processor;

architecture Behavioral of top_processor is


	COMPONENT mux2x1_8bit
	PORT(
		alu : IN std_logic_vector(7 downto 0);
		pc : IN std_logic_vector(7 downto 0);
		sel : IN std_logic;          
		outp : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	COMPONENT PC_reg
	PORT(
		inp : IN std_logic_vector(7 downto 0);
		incr_pc : IN std_logic;
		load_pc : IN std_logic;
		rst : IN std_logic;
		clk : IN std_logic;
		data_pc_in : IN std_logic_vector(7 downto 0);          
		pc_out : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
		
	COMPONENT asynch_ram
	PORT(
		read_address : IN std_logic_vector(7 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		data_out : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	COMPONENT reg_file
	PORT(
		Addr_Rs1 : IN std_logic_vector(2 downto 0);
		Addr_Rs2 : IN std_logic_vector(2 downto 0);
		Addr_Rd : IN std_logic_vector(2 downto 0);
		Rd_we : in std_logic;
		clk : IN std_logic;
		rst : IN std_logic;
		data_in : IN std_logic_vector(7 downto 0);          
		data_out1 : OUT std_logic_vector(7 downto 0);
		data_out2 : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT decode_unit
	PORT(
		instruction : IN std_logic_vector(15 downto 0);  
		comp_res : IN std_logic_vector(2 downto 0);		
		Addr_Rs1 : OUT std_logic_vector(2 downto 0);
		Addr_Rs2 : OUT std_logic_vector(2 downto 0);
		Addr_Rd : OUT std_logic_vector(2 downto 0);
		opcode : OUT std_logic_vector(3 downto 0);
		offset: OUT  std_logic_vector(7 downto 0);
		Rd_we : out  STD_LOGIC; 
		incr_PC : OUT std_logic;
		load_PC : OUT std_logic;
		sel_alu_Rs1_PC : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT alu
	PORT(
		Rs1 : IN std_logic_vector(7 downto 0);
		Rs2 : IN std_logic_vector(7 downto 0);
		offset : IN std_logic_vector(7 downto 0);
		opcode : IN std_logic_vector(3 downto 0); 
		carry_in: in STD_LOGIC;
		carry_out: out STD_LOGIC;			
		Rd : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT comparator
	PORT(
		Rs1 : IN std_logic_vector(7 downto 0);
		Rs2 : IN std_logic_vector(7 downto 0);          
		result : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	----- SIGNALs
	signal PC, aluout,  muxout: std_logic_vector(7 downto 0); 
	signal Rs1, Rs2, offset,Rd : std_logic_vector(7 downto 0); 
	signal instruction: std_logic_vector(15 downto 0); 
	signal incr_pc, load_pc,  sel_alu_Rs1_PC, Rd_we, carry_from_alu, carry_to_alu : std_logic; 
	
	signal Addr_Rs1, Addr_Rs1_dec, Addr_Rs2, Addr_Rd, comparator_result: std_logic_vector(2 downto 0); 	
	signal opcode : std_logic_vector(3 downto 0); 
	
	begin
	-- 
		Rs1_out <= Rs1; 
		Rs2_out <= Rs2; 
		Rd_out <= Rd; 
		
		Rd <= aluout ; -- for time being 
		PC_out <= PC; 
		
		
		process (display,  reg_no,  Addr_Rs1_dec) 
		begin
			if (display = '1') then 
					Addr_Rs1 <= reg_no;
			else 
					Addr_Rs1 <= Addr_Rs1_dec;
			end if; 
		
		end process; 
	-- COMPONENT Instantiation 
		-- Program_Counter
		Program_Counter: PC_reg PORT MAP(
		inp => aluout, -- from aluout for JMP, Branch etc. 
		incr_pc => incr_pc,
		load_pc => load_pc,  
		rst => rst, 
		clk => clk,
		pc_out => PC , -- output
		data_pc_in => aluout
	);
	
		-- Instruction_RAM
	Instruction_RAM: asynch_ram PORT MAP(
		read_address => PC,
		clk => clk,
		rst => rst,
		data_out => instruction
	);

		-- Decode_Unit1
	Decoding_Unit: decode_unit PORT MAP(
		instruction => instruction,
		Addr_Rs1 => Addr_Rs1_dec,
		Addr_Rs2 => Addr_Rs2,
		Addr_Rd => Addr_Rd,
		opcode => opcode, 
		Rd_we => Rd_we,
		offset => offset,
		incr_PC => incr_pc,
		load_PC => load_pc, 
		comp_res => comparator_result,  
		sel_alu_Rs1_PC => sel_alu_Rs1_PC
	);

		-- Reg_file 
	Register_file: reg_file PORT MAP(
		Addr_Rs1 => Addr_Rs1,
		Addr_Rs2 => Addr_Rs2,
		Addr_Rd => Addr_Rd,
		clk => clk ,
		rst => rst,
		data_out1 => Rs1 ,
		data_out2 => Rs2, 
		
		Rd_we => Rd_we, 
		data_in  => Rd
	);	
		
		-- ALU
	ALU_Unit: alu PORT MAP(
		Rs1 => muxout, -- mux tells Rs1 or PC
		Rs2 => Rs2,
		offset => offset ,
		opcode => opcode,
		Rd => aluout,  
		carry_in =>  carry_to_alu, 
		carry_out => carry_from_alu 
	);	

	-- 
	
	
	Inst_comparator: comparator PORT MAP(
		Rs1 => Rs1,
		Rs2 => Rs2,
		result => comparator_result
	);
	
		Inst_mux2x1_8bit: mux2x1_8bit PORT MAP( -- selects Rs1 for alu
		alu => Rs1,
		pc => PC,
		sel => sel_alu_Rs1_PC,
		outp => muxout 
		);
		
		
		
		-- carry logic 
		carry_process: process (clk)
		begin 
			if (clk'event and clk = '1') then
						carry_to_alu <= carry_from_alu ; 
			end if; 
			
		end process; 	


end Behavioral;

