library IEEE;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity RAM is
    port(clk: in std_logic;
        RD: in std_logic;
        WR: in std_logic;
        data_in: in std_logic_vector(7 downto 0);
        address: in std_logic_vector(3 downto 0);
        data_out: out std_logic_vector(7 downto 0));
end RAM;

architecture Behavioral of RAM is
type memory is Array(0 to 15) of std_logic_vector(7 downto 0);
signal ram: memory := (
    "00000000",
    "00000001",
    "00000010",
    "00000011",
    "00000100",
    "00000101",
    "00000110",
    "00000111",
    "00001000",
    "00001001",
    "00001010",
    "00001011",
    "00001100",
    "00001101",
    "00001110",
    "00001111");
signal addr: integer range 0 to 15;
begin
    CMB: process(clk)
    begin
        addr <= to_integer(unsigned(address));
        if (clk'event and clk = '1') then
            if (WR = '1') then
                ram(addr) <= data_in;
				end if;
            if (RD = '1') then
                data_out <= ram(addr);
            end if;
        end if;
    end process;
end Behavioral;
