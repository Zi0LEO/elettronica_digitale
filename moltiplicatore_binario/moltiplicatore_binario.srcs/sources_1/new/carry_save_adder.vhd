library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
    
entity carry_save_adder is
 generic (nbit : INTEGER := 32);
     Port ( 
       A,B,C: in STD_LOGIC_VECTOR (nbit-1 downto 0);
       carry_in: in STD_LOGIC_VECTOR(1 downto 0);
       carry_out: out STD_LOGIC_VECTOR(1 downto 0);
       sum: out STD_LOGIC_VECTOR (nbit-1 downto 0));
end carry_save_adder;
    
architecture Behavioral of carry_save_adder is
  component generic_adder 
    generic (bit_number : INTEGER := nbit);
    Port ( 
      A_adder, B_adder : in STD_LOGIC_VECTOR (bit_number downto 0);
      sum_adder : out STD_LOGIC_VECTOR (bit_number downto 0));
  end component;

    signal sub_sum,carry : STD_LOGIC_VECTOR (nbit-1 downto 0);
    signal sub_sum_ext,carry_ext : STD_LOGIC_VECTOR (nbit downto 0);
        
  begin
    ext_carry_in <= (nbit-3 downto 0 => '0') & carry_in;
    sub_sum  <= A xor B xor C xor ext_carry_in;
    carry <= (A and B) or (B and C) or (C and A) or (ext_carry_in and A) or (ext_carry_in and B) or (ext_carry_in and C);
    carry_ext <= carry & '0';
    sub_sum_ext <= '0' & sub_sum;
       
    adder : generic_adder
      GENERIC MAP (nbit)
      PORT MAP (
        A_adder => carry_ext,
        B_adder => sub_sum_ext,
        sum_adder => temp_sum);
       
    sum <= temp_sum(nbit-1 downto 0);
    carry_out <= temp_sum(nbit+1 downto nbit-1); 
end Behavioral;
