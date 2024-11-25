library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mini_alu is
  generic (n : INTEGER := 4);
    Port ( A,B : in STD_LOGIC_VECTOR (n-1 downto 0);
           C : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (n downto 0));
end mini_alu;

architecture Behavioral of mini_alu is
  component generic_adder is
    generic (n:INTEGER := 4);
      Port ( 
        A_adder, B_adder : in STD_LOGIC_VECTOR (n-1 downto 0);
        cin : in STD_LOGIC;
        sum : out STD_LOGIC_VECTOR (n downto 0));
  end component;

signal B_internal: STD_LOGIC_VECTOR (n-1 downto 0);

begin
      
  process(A, B, C) begin
    case C is
      when '0' => 
      B_internal <= B;
      
      when others =>
      B_internal <= STD_LOGIC_VECTOR(UNSIGNED(not B) + "1");
    end case;
  end process;

generic_adder_alu: generic_adder 
      GENERIC MAP (n => n)
      PORT MAP (
      A_adder => A,
      B_adder => B_internal,
      cin => '0',
      sum => output);
end Behavioral;
