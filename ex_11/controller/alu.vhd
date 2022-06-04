library IEEE;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity alu is
    port(
        a: in std_logic_vector(7 downto 0);
        b: in std_logic_vector(7 downto 0);
        sel: in std_logic_vector(2 downto 0);
        carry: out std_logic;
        res: out std_logic_vector(7 downto 0));
end alu;

architecture Behavioral of alu is

    signal sum: std_logic_vector(7 downto 0);

begin
    process(a, b, sel)
    begin
        carry <= '0';
        case (sel) is
        when "000" => res <= a or b;
        when "001" => res <= a and b;
        when "010" =>
            sum := std_logic_vector(unsigned(a) + unsigned(b));
            carry <= (a(7) or b(7)) and not sum(7);
            res <= sum;
        when "011" =>
            sum := std_logic_vector(unsigned(a) + 1);
            carry <= a(7) and not sum(7);
            res <= sum;
        when "100" => res <= a(6 downto 0) & "0";
        when others => res <= a;
        end case;
    end process;
end Behavioral;
