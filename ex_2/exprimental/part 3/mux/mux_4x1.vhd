library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux_4x1 is
port (
    inp : in std_logic_vector(1 downto 0);
    sel : in std_logic_vector(1 downto 0);
    y : out std_logic
);
end entity mux_4x1;

architecture structure of mux_4x1 is
    component decoder is
        port (
            a : in std_logic_vector(1 downto 0);
            b : out std_logic_vector(3 downto 0)
        );
    end component decoder;

    component and_3x1 is
        port (
            a : in std_logic;
            b : in std_logic;
            c : in std_logic;
            d : out std_logic
        );
    end component and_3x1;

    component or_4x1 is
        port (
            inp : in std_logic_vector(3 downto 0);
            outp : out std_logic
        );
    end component or_4x1;

    signal decoder_out: std_logic_vector(3 downto 0);
    signal or_gate: std_logic_vector(3 downto 0);

    signal not_sel_0 : std_logic;
    signal not_sel_1 : std_logic;

    begin
        not_sel_0 <= not sel(0);
        not_sel_1 <= not sel(1);

        decoder_instance: decoder port map (a => inp, b => decoder_out);

        and_3x1_instance1: and_3x1 port map (a => decoder_out(0), b => not_sel_0, c=> not_sel_1, d => or_gate(0));
        and_3x1_instance2: and_3x1 port map (a => decoder_out(1), b => not_sel_0, c=> sel(1), d => or_gate(1));
        and_3x1_instance3: and_3x1 port map (a => decoder_out(2), b => sel(0), c=> not_sel_1, d => or_gate(2));
        and_3x1_instance4: and_3x1 port map (a => decoder_out(3), b => sel(0), c=> sel(1), d => or_gate(3));

        or_instance: or_4x1 port map (inp => or_gate, outp => y);

end architecture structure;
