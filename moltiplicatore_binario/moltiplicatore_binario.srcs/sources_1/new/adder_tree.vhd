library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.AdderTree_Types.all;

entity adder_tree is
    generic (nbit : INTEGER := 32);
    
    port ( p: MAT;
            ris : out STD_LOGIC_VECTOR(nbit-1 downto 0));
    
end adder_tree;

architecture Behavioral of adder_tree is

    component carry_save_adder is 
        generic (nbit_csa : INTEGER := 31);
         Port ( 
           A,B,C: in STD_LOGIC_VECTOR (nbit_csa-1 downto 0);
           sum: out STD_LOGIC_VECTOR (nbit_csa downto 0);
           carry: out STD_LOGIC_VECTOR (nbit_csa downto 0));
     end component;     
   
     component generic_adder is 
        generic (bit_number : INTEGER := 32);
        Port ( A_adder,B_adder: in STD_LOGIC_VECTOR (bit_number-2 downto 0);
         sum_adder : out STD_LOGIC_VECTOR (bit_number-1 downto 0));
     end component;
    
    type MAT_0 is array ( 4 downto 0 ) of STD_LOGIC_VECTOR(nbit-2 downto 0);
     signal sum_0 : MAT_0;
     signal carry_0: MAT_0;
    type MAT_1 is array ( 2 downto 0 ) of STD_LOGIC_VECTOR(nbit-2 downto 0);
     signal sum_1 : MAT_1;
     signal carry_1: MAT_1;
    type MAT_2 is array ( 1 downto 0 ) of STD_LOGIC_VECTOR(nbit-2 downto 0);
     signal sum_2 : MAT_2;
     signal carry_2: MAT_2;
     
    type MAT_3 is array ( 1 downto 0 ) of STD_LOGIC_VECTOR(nbit-2 downto 0);
     signal sum_3 : MAT_3;
     signal carry_3: MAT_3;
     
     signal sum_4 :STD_LOGIC_VECTOR ( nbit-2 downto 0);
     signal carry_4: STD_LOGIC_VECTOR ( nbit-2 downto 0);
     
     signal carry_final : STD_LOGIC_VECTOR (nbit-2 downto 0);
     signal sum_final: STD_LOGIC_VECTOR (nbit-2 downto 0);
     
     signal garbage: STD_LOGIC;
     
begin
    --lvl_0
    level0_adder: for i in 0 to (nbit/2)/3 - 1 generate
      adder0: carry_save_adder 
      PORT MAP(p(i*3), p(i*3+1),p(i*3+2), sum(30 downto 0) => sum_0(i), sum(31) => garbage, carry(30 downto 0) => carry_0(i), carry(31) => garbage);
    end generate;
    
    --lvl_1
    adder10: carry_save_adder PORT MAP(sum_0(0), sum_0(1), sum_0(2),sum(30 downto 0) => sum_1(0), sum(31) => garbage, carry(30 downto 0) => carry_1(0), carry(31) => garbage);
    adder11: carry_save_adder PORT MAP(carry_0(0), carry_0(1), carry_0(2),sum(30 downto 0) => sum_1(1), sum(31) => garbage, carry(30 downto 0) => carry_1(1), carry(31) => garbage);
    adder12: carry_save_adder PORT MAP(sum_0(3), carry_0(3), sum_0(4),sum(30 downto 0) => sum_1(2), sum(31) => garbage, carry(30 downto 0) => carry_1(2), carry(31) => garbage);
      
    --lvl_2 
    adder20: carry_save_adder PORT MAP(sum_1(0), sum_1(1), sum_1(2),sum(30 downto 0) => sum_2(0), sum(31) => garbage, carry(30 downto 0) => carry_2(0), carry(31) => garbage);
    adder21: carry_save_adder PORT MAP(carry_1(0), carry_1(1), carry_1(2),sum(30 downto 0) => sum_2(1), sum(31) => garbage, carry(30 downto 0) => carry_2(1), carry(31) => garbage);
    
    --lvl_3 
    adder30: carry_save_adder PORT MAP(sum_2(0), sum_2(1), carry_2(0),sum(30 downto 0) => sum_3(0), sum(31) => garbage, carry(30 downto 0) => carry_3(0), carry(31) => garbage);
    adder31: carry_save_adder PORT MAP(carry_2(0), carry_0(4), p(15),sum(30 downto 0) => sum_3(1), sum(31) => garbage, carry(30 downto 0) => carry_3(1), carry(31) => garbage);

     --lvl_4 
    adder40: carry_save_adder PORT MAP(sum_3(0), sum_3(1), carry_3(0),sum(30 downto 0) => sum_4, sum(31) => garbage, carry(30 downto 0) => carry_4, carry(31) => garbage);
 
     -- lvl_5
    adder50: carry_save_adder PORT MAP(sum_4, carry_4, carry_3(1),sum(30 downto 0) => sum_final, sum(31) => garbage, carry(30 downto 0) => carry_final, carry(31) => garbage);

    final_adder: generic_adder
      PORT MAP (sum_final, carry_final,ris);
end Behavioral;






