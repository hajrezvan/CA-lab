-- full_adder_tb Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY full_adder_tb IS
END full_adder_tb;

ARCHITECTURE behavior OF full_adder_tb IS 

-- Component Declaration
        COMPONENT full_adder
        PORT(
                a : IN STD_LOGIC;
                b : IN STD_LOGIC;       
                cin : IN STD_LOGIC;
                cout : OUT STD_LOGIC;
                sum : OUT STD_LOGIC
                );
        END COMPONENT;
        
		  signal a : STD_LOGIC;
		  signal b : STD_LOGIC;
		  signal cin : STD_LOGIC;
		  signal cout : STD_LOGIC;
		  signal sum : STD_LOGIC;

BEGIN

-- Component Instantiation
        uut: entity work.full_adder PORT MAP(
                a => a,
                b => b,       
                cin => cin,
                cout => cout,
                sum => sum
        );
		  
-- Testbench Behavior
    a <= '0', '0' after 200 ns, '1' after 400 ns, '0' after 600 ns, '1' after 800 ns, '1' after 900 ns, '0' after 1000 ns;
    b <= '0', '0' after 200 ns, '1' after 400 ns, '1' after 600 ns, '0' after 800 ns, '1' after 900 ns, '0' after 1000 ns;
    cin <= '0', '0' after 200 ns,'1' after 400 ns, '1' after 600 ns, '1' after 800 ns, '0' after 900 ns, '0' after 1000 ns;

END;
