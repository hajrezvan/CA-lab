-- tb_SDM_1110_Moore Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_SDM_1110_Moore IS
END tb_SDM_1110_Moore;

ARCHITECTURE behavior OF tb_SDM_1110_Moore IS 

-- Component Declaration
        COMPONENT SDM_1110_Moore
        PORT(
                clk : IN std_logic;
                input_data : IN std_logic;       
                output_data : OUT std_logic
                );
        END COMPONENT;

        SIGNAL clk :  std_logic;
        SIGNAL input_data :  std_logic;
        SIGNAL output_data : std_logic;
        

BEGIN

-- Component Instantiation
        uut: SDM_1110_Moore PORT MAP(
                clk => clk,
                input_data => input_data,
                output_data => output_data
        );


--  Test Bench Statements
   tb : PROCESS
   BEGIN

      wait for 100 ns; -- wait until global set/reset completes

      -- Add user defined stimulus here

      wait; -- will wait forever
   END PROCESS tb;
--  End Test Bench 

END;
