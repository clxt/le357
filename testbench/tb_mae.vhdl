library IEEE,std;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_mae is 
end tb_mae;

architecture simu of tb_mae is

signal clk, rst, start, fin, wre, enable, raz : std_logic;

begin
	test: entity work.MAE port map(clk,rst,start,fin,wre,enable,raz);

process    
	procedure clk_cycle is
	begin
		clk<='1';
		wait for 1 ns;
		clk<='0';
		wait for 1 ns;
	end procedure;
begin
-- Comportement de l'horloge, RAZ asynchrone et Init            
		rst<='0';
		start<= '1';
		fin<='0';
	clk_cycle;
		rst<='1';
	clk_cycle;
	clk_cycle;
	clk_cycle;
		start<= '0';
		fin<='1';
	clk_cycle;
		start<= '1';
		fin<='1';
	clk_cycle;
		start<= '0';
		fin<='0';
	clk_cycle;
		start<= '0';
		fin<='0';
	wait;
end process;
end simu;
