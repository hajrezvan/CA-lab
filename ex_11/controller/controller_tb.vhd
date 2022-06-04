--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   16:59:20 06/04/2022
-- Design Name:
-- Module Name:   E:/University/4th term/CA/Lab/CA11/controller_tb.vhd
-- Project Name:  CA11
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: controller
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY controller_tb IS
END controller_tb;

ARCHITECTURE behavior OF controller_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT controller
    PORT(
         clk : IN  std_logic;
         rom_addr : IN  std_logic_vector(3 downto 0);
         ram_addr : IN  std_logic_vector(3 downto 0);
         alu_sel : IN  std_logic_vector(2 downto 0);
         reg2_input : IN  std_logic_vector(7 downto 0);
         reset : IN  std_logic;
         result : INOUT  std_logic_vector(7 downto 0);
         carry : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';
   signal rom_addr : std_logic_vector(3 downto 0) := (others => '0');
   signal ram_addr : std_logic_vector(3 downto 0) := (others => '0');
   signal alu_sel : std_logic_vector(2 downto 0) := (others => '0');
   signal reg2_input : std_logic_vector(7 downto 0) := (others => '0');
   signal reset : std_logic := '0';

	--BiDirs
   signal result : std_logic_vector(7 downto 0);

 	--Outputs
   signal carry : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: controller PORT MAP (
          clk => clk,
          rom_addr => rom_addr,
          ram_addr => ram_addr,
          alu_sel => alu_sel,
          reg2_input => reg2_input,
          reset => reset,
          result => result,
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
      -- hold reset state for 100 ns.
      --wait for 100 ns;

      --wait for clk_period*10;

      -- insert stimulus here
      rom_addr <= "0001";
      ram_addr <= "0010";
      alu_sel <= "010";
      reg2_input <= "10100101";
      reset <= '0';
      wait;
   end process;

END;
