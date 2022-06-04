library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity adder_carry is
    port (
        a, b : in STD_LOGIC;
        cin : in STD_LOGIC;
        cout : out STD_LOGIC
    );
end entity adder_carry;

architecture structure of adder_carry is

    component nand_gate is
        port (
            a : in std_logic;
            b : in std_logic;
            c : out std_logic
        );
    end component;

    component nand3x1 is
        port (
            a : in std_logic;
            b : in std_logic;
            c : in std_logic;
            result : out std_logic
        );
    end component nand3x1;

    signal nand_result : std_logic_vector(2 downto 0);
    signal final_result : STD_LOGIC;

begin

    nand_gate0: nand_gate
        port map (
            a => b,
            b => cin,
            c => nand_result(0)
        );
    
    nand_gate1: nand_gate
        port map (
            a => a,
            b => cin,
            c => nand_result(1)
        );

    nand_gate2: nand_gate
        port map (
            a => a,
            b => b,
            c => nand_result(2)
        );

    nand3x1_1: nand3x1
        port map (
            a => nand_result(0),
            b => nand_result(1),
            c => nand_result(2),
            result => final_result
        );

        cout <= not final_result;

end structure ; -- structure