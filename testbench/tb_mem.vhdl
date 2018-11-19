--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:40:51 10/19/2012
-- Design Name:   
-- Module Name:   H:/Filtre/Projet/simu.vhd
-- Project Name:  Projet
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memoire
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY simu IS
END simu;
 
ARCHITECTURE behavior OF simu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memoire
    PORT(
         go : IN  std_logic;
         fin : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         donnee : OUT  std_logic_vector(15 downto 0);
         start : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal go : std_logic := '0';
   signal fin : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal donnee : std_logic_vector(15 downto 0);
   signal start : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memoire PORT MAP (
          go => go,
          fin => fin,
          reset => reset,
          clk => clk,
          donnee => donnee,
          start => start
        );

   -- Clock process definitions
 clk<=not clk after 10 ns;
 reset<='1' after 15 ns;
 go<='1' after 100 ns, '0' after 200 ns;
 
 stim_proc: process
	begin
		wait for 310 ns; fin<='1';
		wait for 20 ns; fin<='0';
	end process;

END;
