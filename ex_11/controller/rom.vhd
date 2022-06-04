library IEEE;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity ROM is
    port(
        address: in std_logic_vector(3 downto 0);
        rd: in std_logic;
        clk: in std_logic;
        data_out: out std_logic_vector(7 downto 0)
        );
end ROM;

architecture Behavioral of ROM is
type memory is Array(0 to 15) of std_logic_vector(7 downto 0);
signal rom: memory := (
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
            if (rd = '1') then
                data_out <= rom(addr);
            end if;
        end if;
    end process;
end Behavioral;
