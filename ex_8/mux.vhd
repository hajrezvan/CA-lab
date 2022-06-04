library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity mux is port(
    data,inp : in STD_LOGIC;
    sel: in STD_LOGIC;
    omux: out STD_LOGIC
    );
end mux;
 
architecture Behavioral of mux is
 
begin
    
    process (sel) is
        begin
            if (sel ='0') then
                omux <= data;
            else
                omux <= inp;
        end if;
    end process;
 
end Behavioral;