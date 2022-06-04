Library IEEE;
USE IEEE.Std_logic_1164.all;

entity REG is 
   port(
       Clk :in std_logic;
       data_in :in  STD_LOGIC_VECTOR(7 downto 0);    
       data_out : out STD_LOGIC_VECTOR(7 downto 0)    
   );
end REG;
architecture Behavioral of REG is  
begin  
process(Clk)
    begin 
        if(rising_edge(Clk)) then
            data_out <= data_in; 
        end if;       
    end process;  
end Behavioral; 