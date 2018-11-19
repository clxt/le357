library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity memoire is
    Port ( go : in  STD_LOGIC;
           fin : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           donnee : out  STD_LOGIC_VECTOR (15 downto 0);
           start : out  STD_LOGIC);
end memoire;

architecture behavioral of memoire is
signal cpt : std_logic_vector (13 downto 0);
signal gofin : std_logic_vector (1 downto 0);
signal st, tmp : std_logic;

component rom
	port ( clka: in std_logic;
		addra: in std_logic_vector(13 downto 0);
		douta: out std_logic_vector(15 downto 0));
end component;

begin

roma : rom port map (clka => clk,addra => cpt,douta => donnee);

-- Compteur
gofin<=go&fin;
process(clk, reset)
begin
	if reset='0' then cpt<=(others => '0');
	elsif rising_edge(clk) then
		if cpt="10011100010000" then cpt<=(others => '0');
		else
		case(gofin) is
			when "00" => cpt<= cpt;
			when "01" => cpt<= cpt+1;
			when others => cpt<=(others => '0');
		end case;
		end if;
	end if;
end process;		

-- Ligne à retard
st<= go or fin;
process(clk, reset)
begin
	if reset='0' then start<='0';
	elsif rising_edge(clk) then
		tmp<=st;
		start<=tmp;
	end if;
end process;

end behavioral;
