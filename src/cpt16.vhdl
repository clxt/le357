library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cpt16 is
        port(clk, rst : in std_logic;
                enable, raz : in std_logic;
                fin : out std_logic);
      end cpt16;
      
architecture Behavioral of cpt16 is
  signal s : std_logic;
  signal cpt : integer range 0 to 15;
   signal enaraz : std_logic_vector(1 downto 0);
  begin
    
enaraz<= raz&enable;   
process(clk,rst)
  begin
	if rst='0' then cpt <= 0;
	elsif rising_edge(clk) then
		if cpt=15 then cpt<=0;
		else
		case(enaraz) is
			when "00" => cpt <= cpt;
			when "01" => cpt <= cpt+1;
			when others => cpt <= 0;
		end case;
		end if;
	if cpt=14 then s<='1';
	else s<='0';
	end if;
	end if;

end process;

fin<=enable and s;

end architecture;
