library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SDM is
    port(
        clk : in STD_LOGIC;
        input_data : in STD_LOGIC;
        output_data : out STD_LOGIC
    );
end entity;

architecture arch of SDM is

    type state is (s0, s1, s2);
    signal present_state : state := s0;
    signal next_state : state := s0; 

begin

    REG : process( clk )
    begin
        if (clk'event and clk = '1') then
            present_state <= next_state;
        end if;
    end process ; -- REG

    CMD : process( present_state, input_data )
    begin
        output_data <= '0';
        case present_state is
            when s0 =>
                if input_data = '1' then
                    output_data <= '0';
                    next_state <= s2;
                else
                    next_state <= s1;
                    output_data <= '0';
                end if;
            when s1 =>
                if input_data = '1' then
                    output_data <= '0';
                    next_state <= s2;
                else
                    next_state <= s1;
                    output_data <= '0';
                end if;
            when s2 =>
                if input_data = '1' then
                    output_data <= '1';
                    next_state <= s2;
                else
                    next_state <= s1;
                    output_data <= '1';
                end if;
            end case;
    end process ; -- CMD

end arch ; -- arch