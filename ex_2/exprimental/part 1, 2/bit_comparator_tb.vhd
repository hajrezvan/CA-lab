--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:47:55 02/28/2022
-- Design Name:   
-- Module Name:   D:/ISE/experiment_1/experiment_2/part_2/bit_comparator_tb.vhd
-- Project Name:  part_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bit_comparator
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
 
ENTITY bit_comparator_tb IS
END bit_comparator_tb;
 
ARCHITECTURE behavior OF bit_comparator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bit_comparator
    PORT(
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         B0 : IN  std_logic;
         B1 : IN  std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal B0 : std_logic := '0';
   signal B1 : std_logic := '0';

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bit_comparator PORT MAP (
          A0 => A0,
          A1 => A1,
          B0 => B0,
          B1 => B1,
          Y => Y
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
		
    A0 <= '1'; A1 <= '1';
    B0 <= '0'; B1 <= '0';
        wait for 100 ns;   
	 A0 <= '0'; A1 <= '1';
    B0 <= '1'; B1 <= '1';
        wait for 100 ns; 
	 A0 <= '1'; A1 <= '0';
    B0 <= '0'; B1 <= '0';
        wait for 100 ns;
	 A0 <= '0'; A1 <= '0';
    B0 <= '0'; B1 <= '1';
        wait for 100 ns;		  
		  
		  
--      in0<= '0','1' after 50 ns ;		
--      in1<= '0','1' after 100 ns;
--      p0<= '0','1'  after 150 ns;		
--      p1<= '0','1', after 200 ns;
		

      wait;
   end process;

END;
