library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Cin : in STD_LOGIC;
    S : out STD_LOGIC;
    Cout : out STD_LOGIC
  ) ;
end full_adder;

architecture arch of full_adder is

begin

    S <= A xor B xor Cout;
    Cout <= (A and B) or (A and Cout) or (Cout and B);

end arch ; -- arch