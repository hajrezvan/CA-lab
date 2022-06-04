-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY mux_tb IS
END mux_tb;

ARCHITECTURE behavior OF mux_tb IS 

-- Component Declaration
        COMPONENT mux_4x1
        PORT(
                inp : IN std_logic_vector(1 downto 0);
                sel : IN std_logic_vector(1 downto 0);       
                y : OUT std_logic
                );
        END COMPONENT;

        SIGNAL inp :  std_logic_vector(1 downto 0);
        SIGNAL sel :  std_logic_vector(1 downto 0);
        SIGNAL y :  std_logic;
        

BEGIN

-- Component Instantiation
        uut: entity work.mux_4x1 PORT MAP(
                inp => inp,
                sel => sel,
                y => y
        );
    
-- Testbench Behavior
    inp <= "01", "11" after 200 ns;
    sel <= "01", "11" after 100 ns;

END;
