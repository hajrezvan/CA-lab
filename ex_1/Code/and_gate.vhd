library IEEE;
use IEEE.std_logic_1164;

-- And gate
entity and_gate is
    port (a : in std_logic;
          b : in std_logic;
          c : out std_logic);
    end entity and_gate;
    
    architecture gate_level of and_gate is
    begin
      c <= a and b;
    end gate_level;
    