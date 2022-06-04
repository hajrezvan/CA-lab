----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:07:14 03/07/2022 
-- Design Name: 
-- Module Name:    up - Behavioral 
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

entity up is
port (
	clk : in STD_LOGIC;
	reset : in STD_LOGIC; 
	q : inout STD_LOGIC_VECTOR (3 downto 0)
);

end up;

architecture Behavioral of up is

component TFF is
port( 
      T : in STD_LOGIC; 
      Clk : in STD_LOGIC; 
      Reset : in STD_LOGIC; 
      Q : inout STD_LOGIC
   );
End component TFF;

signal w: std_logic_vector(1 downto 0); 

begin


tff1: TFF port map ( T => '1' , Clk => clk , Reset => reset , Q => q(0)  );
tff2: TFF port map ( T => q(0) , Clk => clk , Reset => reset , Q => q(1)  );
w(0) <= q(0) and q(1);
tff3: TFF port map ( T => w(0) , Clk => clk , Reset => reset , Q => q(2)  );
w(1) <= w(0) and q(2);
tff4: TFF port map ( T => w(1) , Clk => clk , Reset => reset , Q => q(3)  );

end Behavioral;

