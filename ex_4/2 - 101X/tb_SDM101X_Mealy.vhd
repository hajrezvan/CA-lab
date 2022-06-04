-- tb_SDM101X_Mealy Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_SDM101X_Mealy IS
END tb_SDM101X_Mealy;

ARCHITECTURE behavior OF tb_SDM101X_Mealy IS 

-- Component Declaration
        COMPONENT SDM101X_Mealy
        PORT(
                clk : IN std_logic;
                input_data : IN std_logic;       
                output_data : OUT STD_LOGIC_VECTOR(1 downto 0)
                );
        END COMPONENT;

        SIGNAL clk :  STD_LOGIC;
        SIGNAL input_data :  std_logic;
        SIGNAL output_data : STD_LOGIC_VECTOR(1 downto 0);
        

BEGIN

-- Component Instantiation
        uut: SDM101X_Mealy PORT MAP(
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
                wait for 300 ns;
                input_data <= '0';
                wait for 200 ns;
                input_data <= '1';
                wait for 300 ns;
                input_data <= '0';
        END PROCESS input_process;
--  End Test Bench 

END;
