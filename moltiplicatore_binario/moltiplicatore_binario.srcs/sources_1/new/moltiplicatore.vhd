library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.AdderTree_Types.all;

entity moltiplicatore is
    generic (nbit : INTEGER := 16);
    Port ( A : in STD_LOGIC_VECTOR (nbit-1 downto 0); --16bit
           B : in STD_LOGIC_VECTOR (nbit-1 downto 0); --16bit
           prod : out STD_LOGIC_VECTOR ((nbit*2)-1 downto 0)); --32bit
end moltiplicatore;

architecture Behavioral of moltiplicatore is
  component adder_tree is
    port ( p: MAT;
            ris : out STD_LOGIC_VECTOR(nbit*2-1 downto 0));
  end component;
  
    signal p : MAT; --32bit
  begin 
  -- Generate partial products
  outer: for i in 0 to nbit-1 generate
    inner: for j in 0 to nbit-1 generate
        -- Clear the higher part of p(i)
        p(i)(nbit*2-2 downto nbit+i) <= (others => '0');
        
        -- Set the middle part of p(i) with the partial product A(i) and B(j)
        p(i)(i+j) <= (A(i) and B(j));
        
        -- Clear the lower part of p(i)
        p(i)(i downto 0) <= (others => '0');
    end generate inner;
  end generate outer; 
      
  adder:adder_tree
    PORT MAP(p, prod);
  
end Behavioral;
