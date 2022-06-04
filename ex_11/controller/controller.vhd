
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controller is
    port (clk: in std_logic;
          ROM_adder: in std_logic_vector(3 downto 0);
          RAM_adder: in std_logic_vector(3 downto 0);
          ALU_selector: in std_logic_vector(2 downto 0);
          regitster2_input: in std_logic_vector(7 downto 0);
          reset: in std_logic;
          register_out: inout std_logic_vector(7 downto 0);
          carry: out std_logic);
end controller;

architecture Behavioral of controller is
    component ROM is
        port (clk: in std_logic;
              rd: in std_logic;
              address: in std_logic_vector(3 downto 0);
              data_out: out std_logic_vector(7 downto 0));
    end component;
    component ALU is
        port(a: in std_logic_vector(7 downto 0);
             b: in std_logic_vector(7 downto 0);
             sel: in std_logic_vector(2 downto 0);
             carry: out std_logic;
             res: out std_logic_vector(7 downto 0));
    end component;
    component reg is
        port (data_in: in std_logic_vector(7 downto 0);
              clk: in std_logic;
              data_out: inout std_logic_vector(7 downto 0));
    end component;
    component RAM is
        port (clk: in std_logic;
              rd: in std_logic;
              wr: in std_logic;
              data_in: in std_logic_vector(7 downto 0);
              address: in std_logic_vector(3 downto 0);
              data_out: out std_logic_vector(7 downto 0));
    end component;
    signal ROM_data: std_logic_vector(7 downto 0);
    signal regitster1_data, regitster2_data: std_logic_vector(7 downto 0);
    signal ALU_res: std_logic_vector(7 downto 0);
    signal register_out_data: std_logic_vector(7 downto 0);
    signal RAM_data: std_logic_vector(7 downto 0);
begin
    ROM1: ROM port map(
            clk=>clk,
            rd=>'1',
            address=>ROM_adder,
            data_out=>ROM_data
        );

    regitster1: reg port map(
            data_in=> ROM_data,
            clk=> clk,
            data_out=> regitster1_data
        );

    regitster2: reg port map(
            data_in=>regitster2_input,
            clk=>clk,
            data_out=>regitster2_data
        );

    ALU_instance: ALU port map(
            a=>regitster1_data,
            b=>regitster2_data,
            sel=>ALU_selector, carry=>carry,
            res=>ALU_res
        );

    register_out: reg port map(
            data_in=>ALU_res,
            clk=>clk,
            data_out=>register_out_data
        );

    RAM1: RAM port map(
            clk=>clk,
            rd=>'1',
            wr=>'1',
            data_in=>register_out_data,
            address=>RAM_adder,
            data_out=>RAM_data
        );

    reg_out: reg port map(
            data_in=>RAM_data,
            clk=>clk,
            data_out=>register_out
        );

end Behavioral;
