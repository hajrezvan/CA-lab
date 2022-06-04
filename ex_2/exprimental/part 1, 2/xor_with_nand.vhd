----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:11 02/28/2022 
-- Design Name: 
-- Module Name:    xor_with_nand - Behavioral 
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

entity xor_with_nand is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end xor_with_nand;

architecture Behavioral of xor_with_nand is

component gate_nand is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end component gate_nand;

signal w1,w2,w3:STD_LOGIC;
begin
instance0: gate_nand port map ( a => a, b => b, c => w1);
instance1: gate_nand port map ( a => a, b => w1, c => w2);
instance2: gate_nand port map ( a => b, b => w1, c => w3);
instance3: gate_nand port map ( a => w2, b => w3, c => c);


end Behavioral;

