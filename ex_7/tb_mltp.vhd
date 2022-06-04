LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_mltp IS
END tb_mltp;

ARCHITECTURE behavior OF tb_mltp IS 

-- Component Declaration
        COMPONENT carry_save_adder
        PORT(
                a : IN std_logic_vector(3 downto 0);
                b : IN std_logic_vector(3 downto 0);       
                c : OUT std_logic_vector(7 downto 0)
                );
        END COMPONENT;

        SIGNAL a :  std_logic_vector(3 downto 0);
        SIGNAL b :  std_logic_vector(3 downto 0);
        SIGNAL c :  std_logic_vector(7 downto 0);
        

BEGIN

-- Component Instantiation
        uut: carry_save_adder PORT MAP(
                a => a,
                b => b,
                c => c
        );


--  Test Bench Statements
   tb : PROCESS
   BEGIN
      -- Add user defined stimulus here
    a <= "0000";
    b <= "0000";

    wait for 100 ns;
    a <= "0001";
    b <= "0001";

    wait for 100 ns;
    a <= "0010";
    b <= "0010";

    wait for 100 ns;
    a <= "0011";
    b <= "0011";

    wait for 100 ns;
    a <= "0100";
    b <= "0100";

    wait for 100 ns;
    a <= "0101";
    b <= "0101";

    wait for 100 ns;
    a <= "0110";
    b <= "0110";

    wait for 100 ns;
    a <= "0111";
    b <= "0111";

    wait for 100 ns;
    a <= "1000";
    b <= "1000";

    wait for 100 ns;
    a <= "1001";
    b <= "1001";

    wait for 100 ns;

   END PROCESS tb;
--  End Test Bench 

END;
