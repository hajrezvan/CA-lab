library IEEE;
use IEEE.std_logic_1164.all;

-- And gate
entity and_3x1 is
    port (a : in std_logic;
          b : in std_logic;
          c : in std_logic;
          d : out std_logic
          );
    end entity and_3x1;
    
    architecture gate_level of and_3x1 is
    begin
      d <= a and b and c;
    end gate_level;
    