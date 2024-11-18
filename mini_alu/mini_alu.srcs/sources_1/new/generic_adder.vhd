library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity generic_adder is
    generic (n:INTEGER);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           cin : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (n downto 0));
end generic_adder;

architecture Behavioral of generic_adder is
signal p,g : STD_LOGIC_VECTOR (n downto 0);
signal carry : STD_LOGIC_VECTOR (n+1 downto 0);
begin
    p_g: for i in 0 to n generate
        p_gMSB: if (i=n) generate 
           p(n) <= A(n-1) xor B(n-1);    
           g(n) <= A(n-1) and B(n-1);
        end generate; 
        p_gLSB: if i<n generate
            p(i) <= A(i) xor B(i);
            g(i) <= A(i) and B(i);
        end generate;
        carry(i+1) <= (g(i) or (p(i) and carry(i)));
        sum(i) <= carry(i) xor p(i);
    end generate;
end Behavioral;
