library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity MAE is
  port( clk,rst : in std_logic;
        start,fin : in std_logic;
        wre, enable, raz : out std_logic);
      end MAE;
      
architecture Moore3 of MAE is
  type etat is(E0,E1,E2);
  signal EP,EF: etat;
      
begin
  process(clk,rst)
    begin
      if rst='0' then EP<=E0;
      elsif rising_edge(clk) then EP<=EF;
      end if;
  end process;
  
        -- etats
  process(EP,start,fin)
    begin
      case(EP) is
        when E0 => EF<=E0; if start='1' then EF<=E1; end if;
        when E1 => EF<=E2;
        when E2 => EF<=E2; if fin='1' then EF<=E0; end if;
        when others => null;
      end case;
  end process;
  
      -- sortie
  process(EP)
    begin
      case(EP) is
        when E0 => wre<='0'; enable<='0'; raz<='1';
        when E1 => wre<='1'; enable<='0'; raz<='0';
        when E2 => wre<='0'; enable<='1'; raz<='0';
        when others => null;
      end case;
  end process;
end Moore3;
        
