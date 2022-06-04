library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity decoder is
 port(
 a : in STD_LOGIC_VECTOR(1 downto 0);
 b : out STD_LOGIC_VECTOR(3 downto 0)
 );
end decoder;
 
architecture behavior of decoder is

    component and_gate is
        port (
            a : in std_logic;
              b : in std_logic;
              c : out std_logic
              );
      end component and_gate;


      signal not_a_0 : std_logic;
      signal not_a_1 : std_logic;

begin
    not_a_0 <= not a(0);
    not_a_1 <= not a(1);


    and_gate_instance1: and_gate port map (a => not_a_0, b => not_a_1, c => b(0));
    and_gate_instance2: and_gate port map (a => not_a_0, b => a(1), c => b(1));
    and_gate_instance3: and_gate port map (a => a(0), b => not_a_1, c => b(2));
    and_gate_instance4: and_gate port map (a => a(0), b => a(1), c => b(3));
    
end behavior;
