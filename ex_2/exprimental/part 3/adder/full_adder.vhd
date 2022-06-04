library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity full_adder is
port (
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    cin : in STD_LOGIC;
    cout : out STD_LOGIC;
    sum : out STD_LOGIC
);
end full_adder;

architecture structure of full_adder is
    component adder_carry is
        port (
            a, b : in STD_LOGIC;
            cin : in STD_LOGIC;
            cout : out STD_LOGIC
        );
    end component adder_carry;

    component adder_sum is
        port(
            a : in std_logic;
            b : in std_logic;
            cin : in std_logic;
            sum : out std_logic
        );
    end component adder_sum;

begin
    adder_carry_1 : adder_carry
        port map (
            a => a,
            b => b,
            cin => cin,
            cout => cout
        );

    adder_sum_1 : adder_sum
        port map (
            a => a,
            b => b,
            cin => cin,
            sum => sum
        );

end structure ; -- structure