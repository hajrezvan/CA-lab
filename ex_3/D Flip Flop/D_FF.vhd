library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
port(
   Clk :in std_logic;  
   reset: in std_logic;  
   D :in  std_logic  
   Q : out std_logic;
   );
end D_FF;

architecture Behavioral of D_FF is

begin

process(D, reset)
 begin 
     if(reset='1') then 
			Q <= '0';
     elsif(rising_edge(Clk)) then
			Q <= D; 
  end if;      
 end process;

end Behavioral;