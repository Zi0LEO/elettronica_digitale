library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity moltiplicatore is
    generic (nbit : INTEGER := 16);
    Port ( A : in STD_LOGIC_VECTOR (nbit-1 downto 0);
           B : in STD_LOGIC_VECTOR (nbit-1 downto 0);
           prod : out STD_LOGIC_VECTOR ((nbit*2)-1 downto 0));
end moltiplicatore;

architecture Behavioral of moltiplicatore is
    type MAT is array ( nbit-1 downto 0 ) of STD_LOGIC_VECTOR((nbit*2)-1 downto 0);
    signal p : MAT;
begin 
    logicand: for i in nbit-2 downto 0 generate
           p(i) <= A and B(i);
    end generate;
    p(nbit-1) <= B(nbit-1 downto 0);
    
    outer :for i in nbit-2 downto 0 generate
        inner_left : for k in i downto 0 generate 
            p(i) <= p(i) & "0";
        end generate;
        
        inner_right : for k in nbit*2-(i+1) downto 1 generate
            p(i) <= "0" & p(i);
        end generate;
        
    end generate;
    
    
    
end Behavioral;
