library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Half adder
entity half_adder is
port (
      in1 : in std_logic;
      in2 : in std_logic;
      out1 : out std_logic;
      out2 : out std_logic
);
end entity half_adder;

architecture structural of half_adder is
  component xor_gate is
    port (a : in std_logic;
          b : in std_logic;
          c : out std_logic);
  end component xor_gate;

  component and_gate is
    port (a : in std_logic;
          b : in std_logic;
          c : out std_logic);
  end component and_gate;

  begin
    xor_gate_instance: xor_gate port map (a => in1, b => in2, c => out1);
    and_gate_instance: and_gate port map (a => in1, b => in2, c => out2);
end structural;