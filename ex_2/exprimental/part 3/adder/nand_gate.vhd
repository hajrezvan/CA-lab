library IEEE;
use IEEE.std_logic_1164.all;

-- And gate
entity nand_gate is
    port (
        a : in std_logic;
        b : in std_logic;
        c : out std_logic
    );
    end entity nand_gate;
    
    architecture gate_level of nand_gate is
    begin
      c <= not (a and b);
    end gate_level;
    