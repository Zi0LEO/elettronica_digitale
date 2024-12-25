library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity generic_adder is
    generic (bit_number : INTEGER);
    Port ( A_adder,B_adder: in STD_LOGIC_VECTOR (bit_number-1 downto 0);
         sum : out STD_LOGIC_VECTOR (bit_number downto 0));
end generic_adder;

architecture Behavioral of generic_adder is
    signal p,g : STD_LOGIC_VECTOR (bit_number downto 0);
    signal carry : STD_LOGIC_VECTOR (bit_number+1 downto 0);
begin
    carry(0) <= '0';
    p_g: for i in 0 to bit_number generate
        p_gMSB: if (i=bit_number) generate
            p(i) <= A_adder(bit_number-1) xor B_adder(bit_number-1);
            g(i) <= A_adder(bit_number-1) and B_adder(bit_number-1);
        end generate;
        p_gLSB: if i<bit_number generate
            p(i) <= A_adder(i) xor B_adder(i);
            g(i) <= A_adder(i) and B_adder(i);
        end generate;
        carry(i+1) <= (g(i) or (p(i) and carry(i)));
        sum(i) <= carry(i) xor p(i);
    end generate;
end Behavioral;