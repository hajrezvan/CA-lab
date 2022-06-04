-- tb_RAM Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_RAM IS
END tb_RAM;

ARCHITECTURE behavior OF tb_RAM IS 

-- Component Declaration
        COMPONENT RAM
        PORT(
            CLK: in STD_LOGIC;
            RD: in STD_LOGIC;
            address: in STD_LOGIC_VECTOR(4 downto 0);
            data_in: in STD_LOGIC_VECTOR(7 downto 0);
            data_out: out STD_LOGIC_VECTOR(7 downto 0)
                );
        END COMPONENT;

        SIGNAL CLK :  std_logic := '0';
        SIGNAL RD :  std_logic  := '0';
        SIGNAL address :  std_logic_vector(4 downto 0)  := "00000";
        SIGNAL data_in : std_logic_vector(7 downto 0) := "00000000";
        SIGNAL data_out : std_logic_vector(7 downto 0);
        
        constant CLK_PRIOD : time  := 200ns;

BEGIN

-- Component Instantiation
        uut: RAM PORT MAP(
                CLK => CLK,
                address => address,
                RD => RD,
                data_in => data_in,
                data_out => data_out
        );


-- CLOCK Process
CLK_PR : process
begin
    CLK <= '0';
    wait for CLK_PRIOD/2;
    CLK <= '1';
    wait for CLK_PRIOD/2;
    
end process ; -- CLK_PR 

--  Test Bench Statements
   tb : PROCESS
   BEGIN
   wait for CLK_PRIOD;
   RD <= '1';
   address <= "00100";
   wait for CLK_PRIOD;
   RD <= '0';
   address <= "00100";
   data_in <= "11111111";
   wait for CLK_PRIOD;
   END PROCESS tb;
--  End Test Bench 

END;
