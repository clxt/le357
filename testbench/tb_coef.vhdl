library IEEE,std;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_coef is
end tb_coef;

architecture simu of tb_coef is
  
signal sortie: std_logic_vector(15 downto 0);
signal rst, en: std_logic;
signal clk: std_logic:='0';

begin
	test: entity work.mem_coef(Behavioral) port map (clk,rst,en,sortie);  

process    
	procedure clk_cycle is
	begin
		clk<='1';
		wait for 1 ns;
		clk<='0';
		wait for 1 ns;
	end procedure;
begin
		rst<='0';
		en<='0';
	clk_cycle;
	clk_cycle;
		rst<='1';
		en<='1';
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	clk_cycle;
	wait;
end process;
end simu;
