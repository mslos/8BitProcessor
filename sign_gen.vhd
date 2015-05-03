library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity sig_gen is
generic (CLK_PER: integer:= 2499999);
Port (clk : in STD_LOGIC;
clk_out : out STD_LOGIC);
end entity sig_gen;

  

architecture Behavioral of sig_gen is
signal clk_sig : std_logic;
begin
process(clk)
variable cnt : integer := 0;
begin
if rising_edge(clk) then
if (cnt=CLK_PER) then
clk_sig<=NOT(clk_sig);
cnt:=0;
else
cnt:=cnt+1;
end if;
end if;
end process;
clk_out <= clk_sig;
end Behavioral;