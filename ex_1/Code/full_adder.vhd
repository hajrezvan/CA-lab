library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
port (
    a : in std_logic;
    b : in std_logic;
    ci : in std_logic;
    sum : out std_logic;
    co : out std_logic
); 
end entity full_adder;

architecture structural of full_adder is
    component half_adder is
        port (
              in1 : in std_logic;
              in2 : in std_logic;
              out1 : out std_logic;
              out2 : out std_logic
        );
    end component half_adder;

    component or_gate is
        port (a : in std_logic;
              b : in std_logic;
              c : out std_logic);
    end component or_gate;

    signal half_adder_xor: std_logic;
    signal half_adder_and: std_logic;
    signal half_adder_or: std_logic;

    begin
        half_adder_instance_1: half_adder port map (in1 => a, in2 => b, out1 => half_adder_xor, out2 => half_adder_and);
        half_adder_instance_2: half_adder port map (in1 => half_adder_xor, in2 => ci, out1 => sum, out2 => half_adder_or);
        or_gate_instance: or_gate port map (a => half_adder_and, b => half_adder_or, c => co);
end structural;
