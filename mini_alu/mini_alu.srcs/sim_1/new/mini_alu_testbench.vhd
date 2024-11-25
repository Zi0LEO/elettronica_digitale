library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mini_alu_testbench is
    generic (bit_number: integer := 4);
end mini_alu_testbench;

architecture Behavioral of mini_alu_testbench is
    component mini_alu is
    generic (bit_number : INTEGER := 4);
    Port ( A,B : in STD_LOGIC_VECTOR (bit_number-1 downto 0);
           C : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (bit_number downto 0));
    end component;
    
    signal Ia,Ib: STD_LOGIC_VECTOR (bit_number-1 downto 0);
    signal Ic: STD_LOGIC;
    signal Ooutput: STD_LOGIC_VECTOR(bit_number downto 0);
begin 
    CUT: mini_alu port map(Ia,Ib,Ic, Ooutput);
    
    process begin
      for
    
       
        
    end process;
end Behavioral;

