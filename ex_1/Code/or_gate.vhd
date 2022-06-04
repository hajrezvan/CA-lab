library IEEE;
use IEEE.std_logic_1164;

-- Or gate
entity or_gate is
    port (a : in std_logic;
          b : in std_logic;
          c : out std_logic);
    end entity or_gate;
    
    architecture gate_level of or_gate is
    begin
      c <= a or b;
    end gate_level;
    