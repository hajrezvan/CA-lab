-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

-- Component Declaration
        COMPONENT full_adder
        PORT(
                a : IN std_logic;
                b : IN std_logic;        
                ci : IN std_logic;        
                sum : OUT std_logic;
                co : OUT std_logic
                );
        END COMPONENT;

        SIGNAL a,b,ci :  std_logic;
        SIGNAL sum,co :  std_logic;
        

BEGIN

-- Component Instantiation
        uut: entity work.full_adder PORT MAP(a => a, b => b, ci => ci, sum => sum, co => co);
     
--  End Test Bench 
      a <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
      b <= '0', '1' after 40 ns;
      ci <= '0';

END;
