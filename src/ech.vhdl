library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mem_echantillons is
	generic(N: positive:=16;
			M: positive:=16);
	port(data_in : in std_logic_vector(15 downto 0);
		 clk: in std_logic;
		 rst: in std_logic;
		 wr: in std_logic;
		 en: in std_logic;
		 sortie : out std_logic_vector(15 downto 0));
end mem_echantillons;

architecture Behavioral of mem_echantillons is

type memoire is array (M-1 downto 0) of std_logic_vector(N-1 downto 0);

signal ma_memoire : memoire;
signal comptAdr : integer range 0 to 15;
signal wren : std_logic_vector(1 downto 0);

begin
wren<=wr&en;
process(clk,rst)
	begin
	if rst='0' then comptAdr <= 0;
		for i in 0 to 15 loop ma_memoire(i)<=(others =>'0');
		end loop;
	elsif rising_edge(clk) then
		if comptAdr="1111" then comptAdr<=0;
		else
		case(wren) is
			when "00" => comptAdr <= comptAdr;
			when "01" => comptAdr <= comptAdr+1;
			when "10" => comptAdr <= comptAdr+1;
						 ma_memoire(comptAdr)<=data_in;
			when "11" => comptAdr <= comptAdr+1;
						 ma_memoire(comptAdr)<=data_in;
			when others => NULL;
		end case;
		end if;
	end if;
end process;
sortie<= ma_memoire(comptAdr);
end architecture;
