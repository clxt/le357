library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mac is
	port(A, B: in std_logic_vector(15 downto 0);
		clk, rst: in std_logic;
		en : in std_logic;
		S : out std_logic_vector(47 downto 0));
end mac;

architecture Behavioral of mac is
signal mult : std_logic_vector(31 downto 0);
signal add : std_logic_vector(47 downto 0);
signal reg : std_logic_vector(47 downto 0);
begin
mult<=A*B;
add<=mult+reg;
S<=reg;
	process(clk,rst)
	 begin
	   if rst='0' then reg <=(others=>'0');
	   elsif rising_edge(clk) then
	     --mult<=A*B;
	     if en='0' then reg<=(others=>'0');
	     elsif en='1' then reg<=add;
	     end if;
	     --add<=mult+reg;
	   end if;
  end process;

end architecture;
