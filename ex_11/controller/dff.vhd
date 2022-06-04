
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff is
    port (d: in std_logic;
          clk: in std_logic;
          reset: in std_logic;
          q: inout std_logic);
end dff;

architecture Behavioral of dff is
begin
    process(clk, reset)
        variable tmp: std_logic;
    begin
        if (reset = '1') then
            tmp := '0';
        elsif (clk'event and clk = '1') then
            tmp := d;
        end if;
        q <= tmp;
    end process;
end Behavioral;
