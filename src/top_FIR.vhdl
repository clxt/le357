library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_FIR is
  port(entree : in std_logic_vector(15 downto 0);
      clk, rst, start : in std_logic;
      sortie : out std_logic_vector(47 downto 0);
      done : out std_logic);
end top_FIR;

architecture Behavioral of top_FIR is
  signal ech, coeff : std_logic_vector(15 downto 0);
  signal wre, enable, raz, fin : std_logic;
   
begin
 MAE : entity work.mae(Moore3) port map (clk,rst,start,fin,wre,enable,raz);
 Echa : entity work.mem_echantillons(Behavioral) port map (entree,clk,rst,wre,enable,ech);
 Coef: entity work.mem_coef(Behavioral) port map(clk,rst,enable,coeff);
 cpt : entity work.cpt16(Behavioral) port map(clk,rst,enable,raz,fin);
 MACi : entity work.mac(Behavioral) port map(ech,coeff,clk,rst,enable,sortie);
 process(clk)
   begin
     done<=fin;
  end process;
end architecture;
