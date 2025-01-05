library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder_1bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           carry_out : out STD_LOGIC;
           sum : out STD_LOGIC);
end fulladder_1bit;

architecture Behavioral of fulladder_1bit is
signal p: STD_LOGIC;

begin
  sum <= A xor B xor carry_in;
  carry_out <= (A and B) or (A and carry_in) or (B and carry_in);

end Behavioral;