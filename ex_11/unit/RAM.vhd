----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:37:59 05/11/2022 
-- Design Name: 
-- Module Name:    RAM - RAM32x8 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM is
    generic(
        W : integer := 8;
        C : integer := 5
    );

    port(
        CLK: in STD_LOGIC;
        RD: in STD_LOGIC;
        address: in STD_LOGIC_VECTOR(4 downto 0);
        data_in: in STD_LOGIC_VECTOR(7 downto 0);
        data_out: out STD_LOGIC_VECTOR(7 downto 0)
    );

end RAM;

architecture RAM32x8 of RAM is

    type memory is array (0 to 31) of STD_LOGIC_VECTOR (7 downto 0);
    signal RAM : memory;
    signal addr: integer range 0 to 31;

begin
    
    CMB : process(CLK, RD)
    begin

        addr <= conv_integer(address);
        if (CLK'event and CLK = '1') then
        -- Read
            if (RD = '1') then
                data_out <= RAM(addr);
                
        -- Write
            else
                RAM(addr) <= data_in;
                data_out <= RAM(addr);
            end if;
        end if ;
    end process ; -- identifier


end RAM32x8;

