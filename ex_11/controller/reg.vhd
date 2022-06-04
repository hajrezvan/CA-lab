
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
    port (data_in: in std_logic_vector(7 downto 0);
          clk: in std_logic;
          data_out: inout std_logic_vector(7 downto 0));
end reg;

architecture Behavioral of reg is
    component dff is
        port (d: in std_logic;
              clk: in std_logic;
              reset: in std_logic;
              q: inout std_logic);
    end component;
begin
    DFF1: dff port map(d=>data_in(0), clk=>clk, reset=>'0', q=>data_out(0));
    DFF2: dff port map(d=>data_in(1), clk=>clk, reset=>'0', q=>data_out(1));
    DFF3: dff port map(d=>data_in(2), clk=>clk, reset=>'0', q=>data_out(2));
    DFF4: dff port map(d=>data_in(3), clk=>clk, reset=>'0', q=>data_out(3));
    DFF5: dff port map(d=>data_in(4), clk=>clk, reset=>'0', q=>data_out(4));
    DFF6: dff port map(d=>data_in(5), clk=>clk, reset=>'0', q=>data_out(5));
    DFF7: dff port map(d=>data_in(6), clk=>clk, reset=>'0', q=>data_out(6));
    DFF8: dff port map(d=>data_in(7), clk=>clk, reset=>'0', q=>data_out(7));
end Behavioral;
