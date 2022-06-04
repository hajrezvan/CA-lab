library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity UNIT is
  port (
    CLK : in STD_LOGIC;
    reset : in STD_LOGIC;
    ROM_adder : in STD_LOGIC_VECTOR(0 downto 0);
    RAM_adder : in STD_LOGIC_VECTOR(0 downto 0);
    ALU_selector : in STD_LOGIC_VECTOR(2 downto 0);
    reg_2_input : in STD_LOGIC_VECTOR (7 downto 0);
    reg_4_output : out STD_LOGIC_VECTOR (7 downto 0)
  );
end UNIT;

architecture arch of UNIT is 

  signal ROM_input : STD_LOGIC_VECTOR(4 downto 0):= "00001";
  signal ROM_output : STD_LOGIC_VECTOR (7 downto 0);

  signal Register_1_input : STD_LOGIC_VECTOR (7 downto 0);
  signal Register_2_input : STD_LOGIC_VECTOR (7 downto 0);
  signal Register_3_input : STD_LOGIC_VECTOR (7 downto 0);
  signal Register_4_input : STD_LOGIC_VECTOR (7 downto 0);

  signal ALU_input_1 : STD_LOGIC_VECTOR (7 downto 0);
  signal ALU_input_2 : STD_LOGIC_VECTOR (7 downto 0);
  signal ALU_output : STD_LOGIC_VECTOR (7 downto 0);
  

  signal RAM_address : STD_LOGIC_VECTOR(4 downto 0) := "00010";
  signal RAM_input : STD_LOGIC_VECTOR (7 downto 0);
  signal RAM_output : STD_LOGIC_VECTOR (7 downto 0);

  signal tmp : STD_LOGIC_VECTOR (7 downto 0);

  component ROM is
    port (
      CLK : in STD_LOGIC;
      address : in STD_LOGIC_VECTOR (4 downto 0);
      data_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
  end component;

  component REG is
    port (
      CLK : in STD_LOGIC;
      data_in : in STD_LOGIC_VECTOR (7 downto 0);
      data_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
  end component;

  component ALU is
    port (
      sel  : in  STD_LOGIC_VECTOR(2 downto 0);
      A : in STD_LOGIC_VECTOR (7 downto 0);
      B : in STD_LOGIC_VECTOR (7 downto 0);
      ALU_Out : out STD_LOGIC_VECTOR (7 downto 0)
    );
  end component;

  component RAM is
    port (
      CLK : in STD_LOGIC;
      RD : in STD_LOGIC;
      address : in STD_LOGIC_VECTOR (4 downto 0);
      data_in : in STD_LOGIC_VECTOR (7 downto 0);
      data_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
  end component;

begin 
  rom1 : ROM port map(
    CLK => CLK,
    address => ROM_input,
    data_out => ROM_output
  );

  reg_1 : REG port map(
    CLK => CLK,
    data_in => ROM_output,
    data_out => ALU_input_1
  );

  reg_2 : REG port map(
    CLK => CLK,
    data_in => reg_2_input,
    data_out => Register_2_input
  );

  ALU1 : ALU port map(
    sel => ALU_selector,
    A => ALU_input_1,
    B => ALU_input_2,
    ALU_Out => ALU_output
  );

  reg_3 : REG port map(
    CLK => CLK,
    data_in => ALU_output,
    data_out => Register_3_input
  );

  ram1 : RAM port map(
    CLK => CLK,
    RD => '0',
    address => RAM_address,
    data_in => Register_3_input,
    data_out => Register_4_input
  );

  reg_4 : REG port map(
    CLK => CLK,
    data_in => Register_4_input,
    data_out => reg_4_output
  );

  SC : process( CLK, ROM_adder, RAM_adder )
  begin
    if (rising_edge(CLK)) then
      tmp <= ROM_input + ROM_adder;
      ROM_input <= tmp;
      tmp <= RAM_address + RAM_adder;
      RAM_address <= tmp;
    end if ;
  end process ; -- SC

end arch ; -- arch