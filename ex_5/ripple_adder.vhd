library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ripple_Adder is
Port (
    A : in STD_LOGIC_VECTOR (3 downto 0);
    B : in STD_LOGIC_VECTOR (3 downto 0);
    Cin : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR (3 downto 0);
    Cout : out STD_LOGIC
);
end ripple_Adder;
 
architecture Behavioral of ripple_Adder is
 
 -- Full Adder VHDL Code Component Decalaration
component full_adder
Port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Cin : in STD_LOGIC;
    S : out STD_LOGIC;
    Cout : out STD_LOGIC
);
end component;
 
 -- Intermediate Carry declaration
signal c1,c2,c3: STD_LOGIC;
 
begin

 -- Port Mapping Full Adder 4 times
    FA1: full_adder port map( A(0), B(0), Cin, S(0), c1);
    FA2: full_adder port map( A(1), B(1), c1, S(1), c2);
    FA3: full_adder port map( A(2), B(2), c2, S(2), c3);
    FA4: full_adder port map( A(3), B(3), c3, S(3), Cout);
 
end Behavioral;
