library IEEE,std;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_ech is
end tb_ech;

architecture simu of tb_ech is
  
signal data_in,sortie: std_logic_vector(15 downto 0);
signal rst, wr, en: std_logic;
signal clk: std_logic:='0';

begin
	test: entity work.mem_echantillons(Behavioral) port map (data_in,clk,rst,wr,en,sortie);  

process    
	procedure clk_cycle is
	begin
		clk<='1';
		wait for 1 ns;
		clk<='0';
		wait for 1 ns;
	end procedure;
begin
		data_in<="0111111000011000";
		rst<='0';
		wr<='0';
		en<='0';
	clk_cycle;
	clk_cycle;
		rst<='1';
		wr<='1';
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

