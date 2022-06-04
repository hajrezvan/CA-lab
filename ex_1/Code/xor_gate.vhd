library IEEE;
use IEEE.std_logic_1164;

-- Xor gate
entity xor_gate is
    port (a : in std_logic;
          b : in std_logic;
          c : out std_logic);
    end entity xor_gate;
    
    architecture gate_level of xor_gate is
    begin
      c <= a xor b;
    end gate_level;
    