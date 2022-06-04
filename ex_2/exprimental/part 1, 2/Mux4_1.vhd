----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:13 02/28/2022 
-- Design Name: 
-- Module Name:    Mux4_1 - Behavioral 
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

entity Mux4_1 is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);     -- select input
           A   : in  STD_LOGIC_VECTOR (3 downto 0);     -- inputs
           X   : out STD_LOGIC);                        -- output
end Mux4_1;

architecture Behavioral of Mux4_1 is
begin
    X <= A(0) when (SEL = "00") else
         A(1) when (SEL = "01") else
         A(2) when (SEL = "10") else
         A(3) when (SEL = "11") else A(0);
end Behavioral;
