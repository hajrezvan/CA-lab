library IEEE; 
use IEEE.STD_LOGIC_1164.all;  

entity T_FF is 
   port( 
      t : in STD_LOGIC; 
      clk : in STD_LOGIC; 
      reset : in STD_LOGIC; 
      dout : out STD_LOGIC
   ); 
end T_FF;  

architecture structure of T_FF is 
begin 
   t_ff : process (t,clk,reset) is 
   variable m : std_logic : = '0'; 
   
   begin 
      if (reset = '1') then 
         m : = '0'; 
      elsif (rising_edge (clk)) then 
         if (t = '1') then 
            m : = not m;        
         end if; 
      end if; 
      dout < = m; 
   end process t_ff; 
end structure; 