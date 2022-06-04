--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:53:42 02/28/2022
-- Design Name:   
-- Module Name:   D:/ISE/experiment_1/experiment_2/part_2/Mx4_1_tb.vhd
-- Project Name:  part_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux4_1
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
 
ENTITY Mx4_1_tb IS
END Mx4_1_tb;
 
ARCHITECTURE behavior OF Mx4_1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux4_1
    PORT(
         SEL : IN  std_logic_vector(1 downto 0);
         A : IN  std_logic_vector(3 downto 0);
         X : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SEL : std_logic_vector(1 downto 0) := (others => '0');
   signal A : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal X : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux4_1 PORT MAP (
          SEL => SEL,
          A => A,
          X => X
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
    A(0) <= '1';
    A(1) <= '0';
    A(2) <= '1';
    A(3) <= '0';       
 
    SEL(0) <= '0'; SEL(1) <= '0';
 
      wait for 100 ns; 
 
    SEL(0) <= '1'; SEL(1) <= '0';
 
      wait for 100 ns; 
 
    SEL(0) <= '0'; SEL(1) <= '1';
 
        wait for 100 ns;   
 
    SEL(0) <= '0'; SEL(1) <= '1';  
 
        wait for 100 ns;
    SEL(0) <= '1'; SEL(1) <= '1';  
 
        wait for 100 ns; 		  
      wait;
   end process;

END;
