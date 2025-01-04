library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
library work;
use work.constants.all;

entity mini_alu_testbench is
    generic (bit_number: integer := nbit);
end mini_alu_testbench;

architecture Behavioral of mini_alu_testbench is
    component mini_alu is
    Port ( A,B : in STD_LOGIC_VECTOR (bit_number-1 downto 0);
           C : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (bit_number downto 0));
    end component;
    
    constant min_value : integer := -(2**(bit_number-1));
    constant max_value : integer := (2**(bit_number-1))-1;

    signal Ia,Ib: STD_LOGIC_VECTOR (bit_number-1 downto 0);
    signal Ic: STD_LOGIC;
    signal Ooutput: STD_LOGIC_VECTOR(bit_number downto 0);
begin 
    CUT: mini_alu port map(Ia,Ib,Ic, Ooutput);
    process 
    begin
      external: for i in min_value to max_value loop
          Ia <= (STD_LOGIC_VECTOR((TO_SIGNED(i,bit_number))));
          internal: for j in min_value to max_value loop
            Ic <= '0';
            Ib <= (STD_LOGIC_VECTOR((TO_SIGNED(j,bit_number))));
            wait for 10ns;
            Ic <= '1';
            wait for 10ns;
         end loop internal;
       end loop external;   
    end process;
end Behavioral;