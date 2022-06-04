-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

-- Component Declaration
        COMPONENT shift_register
        PORT(
                sel : IN std_logic;
                data : IN std_logic;
                clk : IN std_logic;
                parallel : IN std_logic_vector(3 downto 0);       
                reg_out : OUT std_logic
                );
        END COMPONENT;

        SIGNAL sel :  std_logic;
        SIGNAL data :  std_logic;
        SIGNAL clk :  std_logic;
        SIGNAL reg_out :  std_logic;
        SIGNAL parallel :  std_logic_vector(3 downto 0);
        
           -- clk period definitions
        constant clk_period : time := 100 ns;

BEGIN

-- Component Instantiation
        uut: shift_register PORT MAP(
                sel => sel,
                data => data,
                clk => clk,
                parallel => parallel,
                reg_out => reg_out
        );


--  Test Bench Statements

    clkprocess : process
    begin
        clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
    end process ; -- clk process

   tb : PROCESS
   BEGIN
      -- Add user defined stimulus here
     data <= '1';
     parallel<="0010";
     sel<='0';
      
      
      wait for clk_period;
      parallel<="1110";
      sel<='1';

      wait for clk_period;
      parallel<="0101";
      sel<='0';

--      wait for clk_period;
--      parallel<="1111";
--      sel<='1';
      
   END PROCESS tb;
--  End Test Bench 

END;
