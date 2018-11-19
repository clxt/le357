library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mem_coef is
	generic(N: positive:=16;
			M: positive:=16);
	port(clk: in std_logic;
		 rst: in std_logic;
		 en: in std_logic;
		 sortie : out std_logic_vector(15 downto 0));
end mem_coef;

architecture Behavioral of mem_coef is

signal comptAdr : integer range 0 to 15;
type memoire is array (M-1 downto 0) of std_logic_vector(N-1 downto 0);
signal ma_memoire : memoire;

begin

-- compteur
process(clk,rst)
begin
	if rst='0' then comptAdr <= 0;
		for i in 0 to 15 loop ma_memoire(i) <= "0000000000000001"; -- coeffs du filtre à 1.
		end loop;
	elsif rising_edge(clk) then
	if comptAdr=15 then comptAdr<=0;
	else
	case(en) is
		when '0' => comptAdr <= comptAdr;
		when '1' => comptAdr <= comptAdr+1;
		when others => null;
		end case;
	end if;
	end if;
end process;

sortie<=ma_memoire(comptAdr);

end architecture;
