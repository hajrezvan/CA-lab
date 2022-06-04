-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

-- Component Declaration
        COMPONENT UNIT
        PORT(
              CLK : in STD_LOGIC;
              reset : in STD_LOGIC;
              ROM_adder : in STD_LOGIC_VECTOR(0 downto 0);
              RAM_adder : in STD_LOGIC_VECTOR(0 downto 0);
              ALU_selector : in STD_LOGIC_VECTOR(2 downto 0);
              reg_2_input : in STD_LOGIC_VECTOR (7 downto 0);
              reg_4_output : out STD_LOGIC_VECTOR (7 downto 0)
      );
      END COMPONENT;

      signal CLK : STD_LOGIC;
      signal reset : STD_LOGIC;
      signal ROM_adder : STD_LOGIC_VECTOR(0 downto 0);
      signal RAM_adder : STD_LOGIC_VECTOR(0 downto 0);
      signal ALU_selector : STD_LOGIC_VECTOR(2 downto 0);
      signal reg_2_input : STD_LOGIC_VECTOR (7 downto 0);
      signal reg_4_output : STD_LOGIC_VECTOR (7 downto 0);

BEGIN

-- Component Instantiation
        uut: UNIT PORT MAP(
              CLK => CLK,
              reset => reset,
              ROM_adder => ROM_adder,
              RAM_adder => RAM_adder,
              ALU_selector => ALU_selector,
              reg_2_input => reg_2_input,
              reg_4_output => reg_4_output
              );


CLK_PR : process
begin
  CLK <= '0';
  wait for 100 ns;
  CLK <= '1';
  wait for 100 ns;
  
end process ; -- CLK_PR 


--  Test Bench Statements
   tb : PROCESS
   BEGIN
      reset <= '1';
      ROM_adder <= "0";
      RAM_adder <= "0";
      ALU_selector <= "000";
      reg_2_input <= "00000000";
      wait for 200 ns;
      reset <= '1';
      ROM_adder <= "0";
      RAM_adder <= "0";
      ALU_selector <= "000";
      reg_2_input <= "00000001";
      wait for 200 ns;
      ROM_adder <= "0";
      RAM_adder <= "1";
      ALU_selector <= "000";
      reg_2_input <= "00000010";
      wait for 200 ns;
      ROM_adder <= "0";
      RAM_adder <= "0";
      ALU_selector <= "000";
      reg_2_input <= "00000011";
      wait for 200 ns;

   END PROCESS tb;
--  End Test Bench 

END;
