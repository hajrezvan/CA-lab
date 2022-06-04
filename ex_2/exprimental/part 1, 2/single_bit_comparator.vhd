----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:57 02/28/2022 
-- Design Name: 
-- Module Name:    single_bit_comparator - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity single_bit_comparator is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           G : out  STD_LOGIC;
           E : out  STD_LOGIC;
           L : out  STD_LOGIC);
end single_bit_comparator;

architecture Behavioral of single_bit_comparator is

component and_2_input is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end component and_2_input;

component xor_with_nand is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end component xor_with_nand;
signal w1,w2,not_B,not_A:STD_LOGIC;
begin
not_B<= not(B);
not_A<= not(A);
xor_with_nand_instance0: xor_with_nand port map ( a => A, b => B, c => w1);
and_2_input_instance1: and_2_input port map ( a => A, b => not_B, c => G);
and_2_input_instance2: and_2_input port map ( a => not_A, b => B, c => L);
E<= not(w1);

end Behavioral;

