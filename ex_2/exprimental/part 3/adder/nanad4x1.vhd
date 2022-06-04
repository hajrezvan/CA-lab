library IEEE;
use IEEE.std_logic_1164.all;

-- And gate
entity nand4x1 is
    port (
        a : in std_logic;
        b : in std_logic;
        c : in std_logic;
        d : in std_logic;
        result : out std_logic
    );
    end entity nand4x1;
    
    architecture gate_level of nand4x1 is
    begin
        result <= not (a and b and c and d);
    end gate_level;
    