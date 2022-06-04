library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;
  
entity dcounter is 
   port(Clock, CLR : in std_logic; 
      Q : out std_logic_vector(3 downto 0)); 
end dcounter; 
 
architecture virat of dcounter is 
   signal tmp: std_logic_vector(3 downto 0); 

begin 
   process (Clock, CLR) 
   begin 
      if (CLR = '1') then 
         tmp <= "1111"; 
      elsif (Clock'event and Clock = '1') then 
         tmp <= tmp - 1; 
      end if; 
   end process; 
   Q <= tmp; 
end virat;