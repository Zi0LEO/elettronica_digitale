library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.constants.all;

entity mini_alu is
  generic (bit_number : INTEGER := nbit);
    Port ( A,B : in STD_LOGIC_VECTOR (bit_number-1 downto 0);
           C : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (bit_number downto 0));
end mini_alu;

architecture Behavioral of mini_alu is
  component generic_adder is
    generic (bit_number:INTEGER := nbit);
      Port ( 
        A_adder, B_adder : in STD_LOGIC_VECTOR (bit_number-1 downto 0);
        cin : in STD_LOGIC;
        sum : out STD_LOGIC_VECTOR (bit_number downto 0));
  end component;

signal B_internal: STD_LOGIC_VECTOR (bit_number-1 downto 0);
signal carry_in: STD_LOGIC;

begin
      
  process(A, B, C) begin
    case C is
      when '0' => 
      B_internal <= B;
            
      when others =>
      B_internal <= STD_LOGIC_VECTOR(not B);

    end case;
  end process;

generic_adder_alu: generic_adder
      GENERIC MAP (bit_number => bit_number)
      PORT MAP (
      A_adder => A,
      B_adder => B_internal,
      cin => C,
      sum => output);
end Behavioral;
