library IEEE;
use IEEE.std_logic_1164.all;

-- And gate
entity nand3x1 is
    port (
        a : in std_logic;
        b : in std_logic;
        c : in std_logic;
        result : out std_logic
    );
    end entity nand3x1;
    
    architecture gate_level of nand3x1 is
    begin
        result <= (a and b and c);
    end gate_level;
    