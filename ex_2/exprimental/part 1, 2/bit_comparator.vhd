----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:23 02/28/2022 
-- Design Name: 
-- Module Name:    bit_comparator - Behavioral 
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

entity bit_comparator is
    Port ( A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end bit_comparator;

architecture Behavioral of bit_comparator is

COMPONENT and_2_input is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end COMPONENT and_2_input;

COMPONENT or_2_input is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end COMPONENT or_2_input; 

COMPONENT xor_gate is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end COMPONENT xor_gate;

COMPONENT Mux4_1 is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);     -- select input
           A   : in  STD_LOGIC_VECTOR (3 downto 0);     -- inputs
           X   : out STD_LOGIC);                        -- output
end COMPONENT  Mux4_1;

signal w1,w2:STD_LOGIC;

begin
instance_xor: xor_gate port map(a=>A0 , b=>B0 , c=> w1);
instance_and: and_2_input port map(a=>w1 , b=>B0 , c=> w2);
instance: Mux4_1 port map ( SEL(0) =>B1 , SEL(1) =>A1  ,A(0) => w2, A(1) => '1', A(2) => '0', A(3) => w2, X =>Y);
end Behavioral;

