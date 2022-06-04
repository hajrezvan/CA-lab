-- tb_SDM Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_SDM IS
END tb_SDM;

ARCHITECTURE behavior OF tb_SDM IS 

-- Component Declaration
        COMPONENT SDM
        PORT(
                clk : in STD_LOGIC;
                input_data : in STD_LOGIC;
                output_data : out STD_LOGIC
                );
        END COMPONENT;

        SIGNAL clk :  STD_LOGIC;
        SIGNAL input_data :  std_logic;
        SIGNAL output_data : std_logic;
        

BEGIN

-- Component Instantiation
        uut: SDM PORT MAP(
                clk => clk,
                input_data => input_data,
                output_data => output_data
        );


        --  Test Bench Statements
        clk_process : PROCESS
        BEGIN
                clk <= '0';
                wait for 100 ns;
                clk <= '1';
                wait for 100 ns;
        END PROCESS clk_process;
--  End Test Bench 
        input_process : PROCESS
        BEGIN
                input_data <= '0';
                wait for 100 ns;
                input_data <= '1';
                wait for 100 ns;
                input_data <= '0';
                wait for 200 ns;
                input_data <= '1';
                wait for 200 ns;
                input_data <= '0';
        END PROCESS input_process;
--  End Test Bench 

END;
