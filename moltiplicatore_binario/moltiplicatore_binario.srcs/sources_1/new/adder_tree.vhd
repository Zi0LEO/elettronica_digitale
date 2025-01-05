library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.AdderTree_Types.all;

entity adder_tree is
    generic (nbit : INTEGER := 32);
    
    port ( p: MAT;
            ris : out STD_LOGIC_VECTOR(nbit+6 downto 0));
    
end adder_tree;

architecture Behavioral of adder_tree is
    -- genero più addizionatori perchè ogni volta l'output è esteso di 1 
    component carry_save_adder_lvl_0 is 
        generic (nbit : INTEGER := 32);
         Port ( 
           A,B,C: in STD_LOGIC_VECTOR (nbit-1 downto 0);
           sum: out STD_LOGIC_VECTOR (nbit downto 0);
           carry: out STD_LOGIC_VECTOR (nbit downto 0));
     end component;     
    component carry_save_adder_lvl_1 is 
        generic (nbit : INTEGER := 33);
         Port ( 
           A,B,C: in STD_LOGIC_VECTOR (nbit-1 downto 0);
           sum: out STD_LOGIC_VECTOR (nbit downto 0);
           carry: out STD_LOGIC_VECTOR (nbit downto 0));
     end component;     
    
    component carry_save_adder_lvl_2 is 
        generic (nbit : INTEGER := 34);
         Port ( 
           A,B,C: in STD_LOGIC_VECTOR (nbit-1 downto 0);
           sum: out STD_LOGIC_VECTOR (nbit downto 0);
           carry: out STD_LOGIC_VECTOR (nbit downto 0));
     end component; 
     
      component carry_save_adder_lvl_3 is 
        generic (nbit : INTEGER := 35);
         Port ( 
           A,B,C: in STD_LOGIC_VECTOR (nbit-1 downto 0);
           sum: out STD_LOGIC_VECTOR (nbit downto 0);
           carry: out STD_LOGIC_VECTOR (nbit downto 0));
     end component;     
      
      component carry_save_adder_lvl_4 is 
        generic (nbit : INTEGER := 36);
         Port ( 
           A,B,C: in STD_LOGIC_VECTOR (nbit-1 downto 0);
           sum: out STD_LOGIC_VECTOR (nbit downto 0);
           carry: out STD_LOGIC_VECTOR (nbit downto 0));
     end component; 
     
     component carry_save_adder_lvl_5 is 
        generic (nbit : INTEGER := 37);
         Port ( 
           A,B,C: in STD_LOGIC_VECTOR (nbit-1 downto 0);
           sum: out STD_LOGIC_VECTOR (nbit downto 0);
           carry: out STD_LOGIC_VECTOR (nbit downto 0));
     end component; 
     
     component generic_adder is 
        generic (nbit : INTEGER := 37);
        Port ( A_adder,B_adder: in STD_LOGIC_VECTOR (nbit downto 0);
         sum_adder : out STD_LOGIC_VECTOR (nbit+1 downto 0));
     
     end component;
            
    type MAT_0 is array ( 5 downto 0 ) of STD_LOGIC_VECTOR(nbit downto 0);
     signal sum_0 : MAT_0;
     signal carry_0: MAT_0;
    type MAT_1 is array ( 3 downto 0 ) of STD_LOGIC_VECTOR(nbit+1 downto 0);
     signal sum_1 : MAT_1;
     signal carry_1: MAT_1;
    type MAT_2 is array ( 1 downto 0 ) of STD_LOGIC_VECTOR(nbit+2 downto 0);
     signal sum_2 : MAT_2;
     signal carry_2: MAT_2;
     signal carry_1_ext: STD_LOGIC_VECTOR (nbit+2 downto 0);
     signal sum_1_ext: STD_LOGIC_VECTOR (nbit+2 downto 0);
     
    type MAT_3 is array ( 1 downto 0 ) of STD_LOGIC_VECTOR(nbit+3 downto 0);
     signal sum_3 : MAT_3;
     signal carry_3: MAT_3;
     
     signal sum_4 :STD_LOGIC_VECTOR ( nbit+4 downto 0);
     signal carry_4: STD_LOGIC_VECTOR ( nbit+4 downto 0);
     signal carry_3_ext : STD_LOGIC_VECTOR ( nbit+4 downto 0);

     signal carry_final : STD_LOGIC_VECTOR (nbit+5 downto 0);
     signal sum_final: STD_LOGIC_VECTOR (nbit+5 downto 0);
     
begin
    --lvl_0
       adder0: carry_save_adder_lvl_0 PORT MAP(p(0),p(1),p(2),sum_0(0),carry_0(0));
       adder1: carry_save_adder_lvl_0 PORT MAP(p(3),p(4),p(5),sum_0(1),carry_0(1));
       adder2: carry_save_adder_lvl_0 PORT MAP(p(6),p(7),p(8),sum_0(2),carry_0(2));
       adder3: carry_save_adder_lvl_0 PORT MAP(p(9),p(10),p(11),sum_0(3),carry_0(3));
       adder4: carry_save_adder_lvl_0 PORT MAP(p(12),p(13),p(14),sum_0(4),carry_0(4));
       adder5: carry_save_adder_lvl_0 PORT MAP(p(15),p(16),p(17),sum_0(5),carry_0(5));
    --lvl_1
       adder6: carry_save_adder_lvl_1 PORT MAP(sum_0(0),carry_0(0),sum_0(1),sum_1(0),carry_1(0)); 
       adder7: carry_save_adder_lvl_1 PORT MAP(sum_0(2),carry_0(1),carry_0(2),sum_1(1),carry_1(1)); 
       adder8: carry_save_adder_lvl_1 PORT MAP(sum_0(3),carry_0(3),sum_0(4),sum_1(2),carry_1(2)); 
       adder9: carry_save_adder_lvl_1 PORT MAP(sum_0(5),carry_0(4),carry_0(5),sum_1(3),carry_1(3));
    --lvl_2 
       adder10: carry_save_adder_lvl_2 PORT MAP(sum_1(0),carry_1(0),sum_1(1),sum_2(0),carry_2(0));
       adder11: carry_save_adder_lvl_2 PORT MAP(sum_1(2),carry_1(1),carry_1(2),sum_2(1),carry_2(1));
    --lvl_3 
       carry_1_ext <= '0' & carry_1(3); 
       sum_1_ext <= '0' & sum_1(3);
       adder12: carry_save_adder_lvl_3 PORT MAP(sum_2(0),carry_2(0),sum_2(1),sum_3(0),carry_3(0));
       adder13: carry_save_adder_lvl_3 PORT MAP(sum_1_ext,carry_2(1),carry_1_ext,sum_3(1),carry_3(1));
     --lvl_4 
       adder14: carry_save_adder_lvl_4 PORT MAP(sum_3(0),carry_3(0),sum_3(1),sum_4,carry_4);
     -- lvl_5
        carry_3_ext <= '0' & carry_3(1);
        adder15: carry_save_adder_lvl_5 PORT MAP(sum_4,carry_4,carry_3_ext,sum_final,carry_final);
        
        real_adder: generic_adder 
            GENERIC MAP( 37 )
            PORT MAP (sum_final,carry_final,ris);
end Behavioral;






