library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SDM101X_Moore is
    port(
        clk : in STD_LOGIC;
        input_data : in STD_LOGIC;
        output_data : out STD_LOGIC_VECTOR(1 downto 0)
    );
end entity;

architecture Behavioral of SDM101X_Moore is

    type state is (s0, s1, s2, s3, s4, s5);
    signal present_state : state := s0;
    signal next_state : state := s0;

begin

    CDM: process(present_state, input_data)
    begin
        next_state <= s0;
        case present_state is
            when s0 =>
                if input_data = '1' then
                    next_state <= s1;
                else
                    next_state <= s0;
                end if;
            when s1 =>
                if input_data = '1' then
                    next_state <= s1;
                else
                    next_state <= s2;
                end if;
            when s2 =>
                if input_data = '1' then
                    next_state <= s3;
                else
                    next_state <= s0;
                end if;
            when s3 =>
                if input_data = '1' then
                    next_state <= s4;
                else
                    next_state <= s5;
                end if;
            when s4 =>
                if input_data = '1' then
                    next_state <= s1;
                else
                    next_state <= s2;
                end if;
            when s5 =>
                if input_data = '1' then
                    next_state <= s3;
                else
                    next_state <= s0;
                end if;
        end case;
    end process;

    NED : process( present_state)
    begin
        case (present_state) is
            when s0 =>
            output_data <= "00";
            when s1 =>
            output_data <= "00";
            when s2 =>
            output_data <= "00";
            when s3 =>
            output_data <= "00";
            when s4 =>
            output_data <= "11";
            when s5 =>
            output_data <= "10";
        end case;
    end process ; -- REG

    REG : process( clk )
    begin
        if (clk'event and clk = '1') then
            present_state <= next_state;
        end if;
    end process ; -- REG

end Behavioral ; -- Behavioral