library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity adder_sum is
    port(
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        cin : in STD_LOGIC;
        sum : out STD_LOGIC
    );
end entity adder_sum;

architecture structure of adder_sum is

    component decoder_adder is
        port(
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            result : out STD_LOGIC_VECTOR(3 downto 0)
        );
        end component decoder_adder;

    
    component nand_gate is
        PORT(
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            c : out STD_LOGIC
        );
    end component nand_gate;

    component nand4x1 is
        port(
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            c : in STD_LOGIC;
            d : in STD_LOGIC;
            result : out STD_LOGIC
        );
    end component nand4x1;

    signal not_cin : STD_LOGIC;
    signal decoder_result : STD_LOGIC_VECTOR(3 downto 0);
    signal nand_result : STD_LOGIC_VECTOR(3 downto 0);
    signal finall_result : STD_LOGIC;

begin
    not_cin <= not cin;

    decoder: decoder_adder
        port map(
            a => a,
            b => b,
            result => decoder_result
        );

    nand_gate1: nand_gate
        port map(
            a => decoder_result(0),
            b => cin,
            c => nand_result(0)
      );

    nand_gate2: nand_gate
        port map(
            a => decoder_result(1),
            b => not_cin,
            c => nand_result(1)
        );

    nand_gate3: nand_gate
        port map(
            a => decoder_result(2),
            b => not_cin,
            c => nand_result(2)
        );

    nand_gate4: nand_gate
        port map(
            a => decoder_result(3),
            b => cin,
            c => nand_result(3)
    );

    nand4x1_1: nand4x1
        port map(
            a => nand_result(0),
            b => nand_result(1),
            c => nand_result(2),
            d => nand_result(3),
            result => finall_result
        );
        
    sum <= not finall_result;

end structure ; -- structure