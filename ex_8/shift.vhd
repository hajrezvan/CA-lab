library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register is
  port (
    sel, data, clk: in std_logic;
    parallel: in std_logic_vector(3 downto 0);
    reg_out: out std_logic
  );
end entity shift_register;

architecture arch of shift_register is

  signal reg_in: std_logic_vector(6 downto 0);

    component mux is
        port (
            data, inp, sel: in std_logic;
            omux: out std_logic
        );
        end component;

        component D_FF is
            port (
                data: in std_logic;
                clk: in std_logic;
                Q: out std_logic
            );
        end component;

begin

  DFF0: D_FF port map (data => reg_in(0), clk => clk, Q => reg_in(1));
  DFF1: D_FF port map (data => reg_in(2), clk => clk, Q => reg_in(3));
  DFF2: D_FF port map (data => reg_in(4), clk => clk, Q => reg_in(5));
  DFF3: D_FF port map (data => reg_in(6), clk => clk, Q => reg_out);

  mux0: mux port map (
    data => data,
    inp => parallel(0),
    sel => sel,
    omux => reg_in(0)
  );

  mux1: mux port map (
    data => reg_in(1),
    inp => parallel(1),
    sel => sel,
    omux => reg_in(2)
  );

  mux2: mux port map (
    data => reg_in(3),
    inp => parallel(2),
    sel => sel,
    omux => reg_in(4)
  );

  mux3: mux port map (
    data => reg_in(5),
    inp => parallel(3),
    sel => sel,
    omux => reg_in(6)
  );

end arch ; -- arch