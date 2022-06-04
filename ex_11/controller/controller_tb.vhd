LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_controller IS
END TB_controller;

ARCHITECTURE behavior OF TB_controller IS

    COMPONENT controller
    PORT(
         clk : IN  std_logic;
         ROM_adder : IN  std_logic_vector(3 downto 0);
         RAM_adder : IN  std_logic_vector(3 downto 0);
         ALU_selector : IN  std_logic_vector(2 downto 0);
         regitster2_input : IN  std_logic_vector(7 downto 0);
         reset : IN  std_logic;
         register_out : INOUT  std_logic_vector(7 downto 0);
         carry : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';
   signal ROM_adder : std_logic_vector(3 downto 0) := (others => '0');
   signal RAM_adder : std_logic_vector(3 downto 0) := (others => '0');
   signal ALU_selector : std_logic_vector(2 downto 0) := (others => '0');
   signal regitster2_input : std_logic_vector(7 downto 0) := (others => '0');
   signal reset : std_logic := '0';

   signal register_out : std_logic_vector(7 downto 0);

 	--Outputs
   signal carry : std_logic;

   -- Clock period definitions
   constant clk_period : time := 100 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: controller PORT MAP (
          clk => clk,
          ROM_adder => ROM_adder,
          RAM_adder => RAM_adder,
          ALU_selector => ALU_selector,
          regitster2_input => regitster2_input,
          reset => reset,
          register_out => register_out,
          carry => carry
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin

      ROM_adder <= "0001";
      RAM_adder <= "0010";
      ALU_selector <= "010";
      regitster2_input <= "10100101";
      reset <= '0';
      wait;
   end process;

END;
