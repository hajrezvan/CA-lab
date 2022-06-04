
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is
    port (inp: in std_logic;
          clk: in std_logic;
          reset: in std_logic;
          qout: inout std_logic);
end DFF;

architecture Behavioral of DFF is
begin
    process(clk, reset)
        variable tmp: std_logic;
    begin
        if (reset = '1') then
            tmp := '0';
        elsif (clk'event and clk = '1') then
            tmp := inp;
        end if;
        qout <= tmp;
    end process;
end Behavioral;
