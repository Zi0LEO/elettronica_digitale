library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity generic_adder is
    generic (bit_number : INTEGER);
    Port ( A_adder,B_adder: in STD_LOGIC_VECTOR (bit_number-1 downto 0);
         sum_adder : out STD_LOGIC_VECTOR (bit_number downto 0));
end generic_adder;

architecture Behavioral of generic_adder is
component fulladder_1bit is
        Port ( 
             A : in STD_LOGIC;
             B : in STD_LOGIC;
             carry_in : in STD_LOGIC;
             carry_out : out STD_LOGIC;
             sum : out STD_LOGIC);
    end component;
    signal carry : STD_LOGIC_VECTOR( bit_number downto 0 );
begin  
    carry (0) <= '0';
    
    gen_adder: for i in 0 to bit_number-1 generate
         fa: fulladder_1bit
            PORT MAP(
                A         => A_adder(i),
                B         => B_adder(i),
                carry_in  => carry(i),
                carry_out => carry(i + 1),
                sum       => sum_adder(i)
            );
    end generate;
    
    sum_adder(bit_number) <= carry(bit_number-1);
    
end Behavioral;