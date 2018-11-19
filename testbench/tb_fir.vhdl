library IEEE,std;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

entity tb_fir is 
end tb_fir;

architecture archi of tb_fir is

   -- Signaux a connecter au module a tester
    signal donnee,TO_WATCH : std_logic_vector(15 downto 0):="0000000000000001";
    signal hor, RAZ, start,init : std_logic:='0';
    signal sortie : std_logic_vector(47 downto 0);
    signal done : std_logic;

-- Donnee a une valeur initiale de 1 pour initialiser les coefficients

-- Declaration des fichiers d'entree et de sortie
-- METTRE A JOUR EVENTUELLEMENT LES CHEMINS D'ACCES
file ENTREE: text open read_mode is "infir.dat";
file OUT_FILE: text open write_mode is "res.dat";


begin

-- Instanciation du FIR       
test: entity work.top_FIR
port map(donnee,hor,raz,start,sortie,done);
    
-- Comportement de l'horloge, RAZ asynchrone et Init            
hor<=not hor after 10 ns;
raz<='0', '1' after 25 ns;
init<='1' after 105 ns, '0' after 135 ns;

process(raz,hor)

variable b: unsigned (15 downto 0);
variable c: unsigned (47 downto 0);
variable buff: line;
variable data: integer;
begin

if raz='0' then start<='0';TO_WATCH<=(others=>'0');

-- A chaque coup d'horloge
elsif rising_edge(hor) then

   -- Si on a une demande de calcul
   if start='1' then 
      start<='0';
      -- Tant qu'on n'a pas parcouru tout le fichier
      if(not endfile(ENTREE)) then
         -- Lecture d'une ligne du fichier d'entree
         readline(ENTREE, buff);
         -- Extraction de la donnee de la ligne
         read(buff, data); 
         -- Conversion en std_logic_vector -> Echantillon d'entree
         b:=to_unsigned(data,16);
         donnee<=std_logic_vector(b);   
      end if;
   end if;

   if init='1' then start<='1'; end if;
   
   -- Si la donnee en sortie est disponible
   if done='1' then    
      -- On extrait la partie utile
      TO_WATCH<=sortie(19 downto 4);
      c:=unsigned(sortie); data:=to_integer(c);
      start<='1';
      write(buff,data);
      writeline(OUT_FILE,buff);
   end if;
end if;

end process;

end archi;

