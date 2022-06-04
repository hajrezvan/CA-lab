library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity encoder2 is
 port(
 a : in STD_LOGIC_VECTOR(3 downto 0);
 b : out STD_LOGIC_VECTOR(1 downto 0)
 );
end encoder2;
 
architecture bhv of encoder2 is
begin
 
b(0) <= a(1) or a(2);
b(1) <= a(1) or a(3);
 
end bhv;
