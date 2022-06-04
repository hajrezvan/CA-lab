library IEEE;
use IEEE.std_logic_1164.all;

-- Or gate
entity or_4x1 is
    port (inp : in std_logic_vector(3 downto 0);
          outp : out std_logic
          );
    end entity or_4x1;
    
    architecture gate_level of or_4x1 is
    begin
      outp <= inp(0) or inp(1) or inp(2) or inp(3);
    end gate_level;
    