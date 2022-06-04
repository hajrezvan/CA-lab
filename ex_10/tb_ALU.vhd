LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         ALU_Out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
       --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

  --Outputs
   signal ALU_Out : std_logic_vector(7 downto 0);
 
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          sel => sel,
          ALU_Out => ALU_Out
        );

 

   -- Stimulus process
   stim_proc: process
   begin  
   sel <= "000";
   A <= "00000001";
   B <= "00000010";
   wait for 100 ns;
   sel <= "001";
   wait for 100 ns;
   sel <= "010";
   wait for 100 ns;
   sel <= "011";
   wait for 100 ns;
   sel <= "100";
   wait for 100 ns;
   sel <= "101"; 
   wait for 100 ns;
   end process;

END;