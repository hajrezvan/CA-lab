Library ieee; 
use ieee.std_logic_1164.all;

entity carry_save_adder is
    port (
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        c : out std_logic_vector(7 downto 0)
    );
end carry_save_adder;

architecture arch of carry_save_adder is

    signal reg : std_logic_vector(23 downto 0);
    signal inp: std_logic_vector(7 downto 0);

    component half_adder is
        port (
            a : in std_logic;
            b : in std_logic;
            carry : out std_logic;
            sum : out std_logic
        );
    end component;

    component full_adder is
        port (
            a : in std_logic;
            b : in std_logic;
            cin : in std_logic;
            sum : out std_logic;
            carry : out std_logic
        );
    end component;

begin

    -- Level 1:
    c(0) <= a(0) and b(0);
    -- Half adder 1
    reg(0) <= a(0) and b(1);
    reg(1) <=a(1) and b(0);
    half1: half_adder
        port map (
            a => reg(0),
            b => reg(1),
            carry => reg(2),
            sum => c(1)
        );
    -- Half adder 2
    reg(3) <= a(0) and b(2);
    reg(4) <= a(1) and b(1);
    half2: half_adder
        port map (
            a => reg(3),
            b => reg(4),
            carry => reg(5),
            sum => reg(6)
        ); 
        -- Half adder 3
    reg(21) <= (a(0) and b(3));
    reg(22) <= (a(1) and b(2));
    half3: half_adder
        port map (
            a => reg(21),
            b => reg(22),
            carry => reg(8),
            sum => reg(7)
        );

    reg(23) <= (a(1) and b(3));
    -- Level 2:
    -- Full adder 1
    inp(0) <= (a(2) and b(0));
    full1: full_adder
        port map (
            a => reg(4),
            b => reg(5),
            cin => inp(0),
            sum => c(2),
            carry => reg(9)
        );
    -- Full adder 2
    inp(1) <= (a(2) and b(1));
    full2: full_adder
        port map (
            a => reg(6),
            b => reg(7),
            cin => inp(1),
            sum => reg(10),
            carry => reg(11)
        );
    -- Full adder 3
    inp(2) <= (a(2) and b(2));
    full3: full_adder
        port map (
            a => reg(8),
            b => reg(23),
            cin => inp(2),
            sum => reg(12),
            carry => reg(13)
        );

    -- level 3:
    -- Full adder 4
    inp(5) <= (a(3) and b(0));
    full4: full_adder
        port map (
            a => reg(10),
            b => reg(9),
            cin => inp(3),
            sum => c(3),
            carry => reg(14)
        );
    -- Full adder 5
    inp(6) <= (a(3) and b(1));
    full5: full_adder
        port map (
            a => reg(11),
            b => reg(12),
            cin => inp(4),
            sum => reg(15),
            carry => reg(16)
        );
    -- Full adder 6
    inp(7) <= (a(3) and b(2));
    inp(3) <= (a(2) and b(3));
    full6: full_adder
        port map (
            a => reg(13),
            b => inp(3),
            cin => inp(5),
            sum => reg(17),
            carry => reg(18)
        );

    -- level 4:
    -- Half adder 4
    half4: half_adder
        port map (
            a => reg(14),
            b => reg(15),
            carry => reg(19),
            sum => c(4)
        );
        -- full adder 7
        full7: full_adder
            port map (
                a => reg(16),
                b => reg(17),
                cin => reg(19),
                sum => c(5),
                carry => reg(20)
            );
        -- full adder 8
        inp(4) <= (a(3) and b(3));
        full8: full_adder
            port map (
                a => reg(18),
                b => inp(4),
                cin => reg(20),
                sum => c(6),
                carry => c(7)
            );

end arch ; -- arch