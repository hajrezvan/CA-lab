library ieee;
use ieee. std_logic_1164.all;

-- D Flip Flop
entity D_FF is
    PORT(
        data,clk: in std_logic;
        Q: out std_logic
    );
    end D_FF;
     
architecture behavioral of D_FF is
    begin
        process(clk)
        begin
        if(clk='1') then
            Q <= data;
        end if;
    end process;
end behavioral;
    