library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
 
entity JK_FF is
PORT(
   J,K,CLOCK: in std_logic;
   RESET: in std_logic;
   Q, QB: out std_logic
);
end JK_FF;
 
Architecture behavioral of JK_FF is
begin
   PROCESS(K,J,RESET)
   variable TMP: std_logic;
begin
   if(RESET='0') then
      if(J='0' and K='0')then
       TMP:=TMP;
      elsif(J='1' and K='1')then
         TMP:= not TMP;
      elsif(J='0' and K='1')then
         TMP:='0';
      else
         TMP:='1';
      end if;
   Q<=TMP;
   Q <=not TMP;
   elsif (RESET = '1') then
      TMP:='0';
   end if;
   end PROCESS;
end behavioral;

