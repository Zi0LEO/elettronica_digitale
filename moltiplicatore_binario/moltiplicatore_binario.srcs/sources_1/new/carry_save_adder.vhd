library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
    
entity carry_save_adder is
 generic (nbit : INTEGER := 32);
     Port ( 
       A,B,C: in STD_LOGIC_VECTOR (nbit-1 downto 0);
       sum: out STD_LOGIC_VECTOR (nbit downto 0);
       carry: out STD_LOGIC_VECTOR (nbit downto 0));
end carry_save_adder;
    
architecture Behavioral of carry_save_adder is
  component generic_adder 
    generic (bit_number : INTEGER := nbit);
    Port ( 
      A_adder, B_adder : in STD_LOGIC_VECTOR (bit_number downto 0);
      sum_adder : out STD_LOGIC_VECTOR (bit_number+1 downto 0));
  end component;

    signal sub_sum,sub_carry : STD_LOGIC_VECTOR (nbit-1 downto 0);
    signal sub_sum_ext,carry_ext : STD_LOGIC_VECTOR (nbit downto 0);
        
  begin
    sub_sum  <= A xor B xor C;
    sub_carry <= (A and B) or (B and C) or (C and A);
    carry <= carry & '0';
    sum <= '0' & sub_sum;
    
end Behavioral;
