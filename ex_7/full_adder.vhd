library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity full_adder 
    is port(
    a, b, c: in std_logic;
    sum, carry: out std_logic
    ); 
end full_adder;
  
architecture data of full_adder is
begin
   sum<= a xor b xor c; 
   carry <= ((a and b) or (b and c) or (a and c)); 
end data;