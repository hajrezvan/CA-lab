library IEEE;
use IEEE.STD_LOGIC_1164.all;
 library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity decoder_adder is
    port(
        a : in std_logic;
        b : in std_logic;
        result : out STD_LOGIC_VECTOR(3 downto 0)
    );
end decoder_adder;
 
architecture behavior of decoder_adder is

    component and_gate is
        port (a : in std_logic;
              b : in std_logic;
              c : out std_logic
              );
      end component and_gate;

      signal not_a : std_logic;
      signal not_b : std_logic;

begin

    not_a <= not a;
    not_b <= not b;

    and_gate_instance1: and_gate port map (a => not_a, b => not_b, c => result(0));
    and_gate_instance2: and_gate port map (a => not_a, b => b, c => result(1));
    and_gate_instance3: and_gate port map (a => a, b => not_b, c => result(2));
    and_gate_instance4: and_gate port map (a => a, b => b, c => result(3));
end behavior;
