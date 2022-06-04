----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:30 03/07/2022 
-- Design Name: 
-- Module Name:    down - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity down is
port (
	clk : in STD_LOGIC;
	reset : in STD_LOGIC; 
	q : inout STD_LOGIC_VECTOR (3 downto 0)
);

end down;

architecture Behavioral of down is

component TFF is
port( 
      T : in STD_LOGIC; 
      Clk : in STD_LOGIC; 
      Reset : in STD_LOGIC; 
      Q : inout STD_LOGIC
   );
End component TFF;

signal w0,w1,not_q0,not_q1,not_q2:STD_LOGIC; 


begin

tff1: TFF port map ( T => '1' , Clk => clk , Reset => reset , Q => q(0));
not_q0 <= not(q(0));
tff2: TFF port map ( T => not(q(0)) , Clk => clk , Reset => reset , Q => q(1));
--not_q1 <= not(q(1))
w0 <= not(q(0)) and not(q(1));
tff3: TFF port map ( T => w0 , Clk => clk , Reset => reset , Q => q(2));
--not_q2 <= not(q(2))
w1 <= w0 and not(q(2));
tff4: TFF port map ( T => w1 , Clk => clk , Reset => reset , Q => q(3)  );

end Behavioral;

