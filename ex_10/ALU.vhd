library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;
-----------------------------------------------
---------- ALU 8-bit VHDL ---------------------
-----------------------------------------------
entity ALU is
  generic ( 
     constant N: natural := 1  -- number of shited or rotated bits
    );
  
    Port (
    A, B     : in  STD_LOGIC_VECTOR(7 downto 0);  -- 2 inputs 8-bit
    sel  : in  STD_LOGIC_VECTOR(2 downto 0);  -- 1 input 4-bit for selecting function
    ALU_Out   : out  STD_LOGIC_VECTOR(7 downto 0) -- 1 output 8-bit 
    );
end ALU;


architecture Behavioral of ALU is

    signal ALU_Result : std_logic_vector (7 downto 0);

begin
    process(A,B,sel)
    begin
        case(sel) is
            when "000" => -- Addition
                ALU_Result <= A + B ;
            when "101" => -- Logical shift left
                ALU_Result <= std_logic_vector(unsigned(A) sll N);
            when "010" => -- Logical and 
                ALU_Result <= A and B;
            when "001" => -- Logical or
                ALU_Result <= A or B;
            when "011" => -- Unchange
                ALU_Result <= A;
            when "100" => -- Increment
                ALU_Result <= A + "00000001";
            when others => ALU_Result <= A + B ; 
        end case;
    end process;
    ALU_Out <= ALU_Result; -- ALU out

end Behavioral;