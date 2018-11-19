library IEEE,std;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_mac is
end tb_mac;

architecture simu of tb_mac is

signal A, B : std_logic_vector(15 downto 0);
signal S : std_logic_vector(47 downto 0);
signal clk, rst, en : std_logic;

begin
	test: entity work.mac(Behavioral) port map(A, B, clk, rst, en, S);

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
		A<="0000000000000011";
		B<="0000000000000001";
	clk_cycle;
		rst<='1';
	clk_cycle;
		en<='1';
	clk_cycle;
		A<="0000000000001011";
	clk_cycle;
		A<="0000000000000010";
	clk_cycle;
		A<="0000000010101010";
	clk_cycle;
		A<="0000000000001010";
	clk_cycle;
		A<="0000000000000100";
	clk_cycle;
		A<="0000000000100100";
	clk_cycle;
		A<="0000000000101000";
	clk_cycle;
		A<="0000000000001000";
	clk_cycle;
		A<="0000000000000001";
	clk_cycle;
		A<="0000000000001110";
	clk_cycle;
		A<="0000000000000011";
	clk_cycle;
		A<="0000000000000100";
	clk_cycle;
		A<="0000000000010110";
	clk_cycle;
		A<="0000000000000111";
	clk_cycle;
		A<="0000000000110000";
	clk_cycle;
		A<="0000000000100010";
		en<='0';
	clk_cycle;
		A<="0000000000011010";
		en<='1';
	clk_cycle;
		A<="0000000010000000";
	clk_cycle;
	wait;
end process;
end simu;
