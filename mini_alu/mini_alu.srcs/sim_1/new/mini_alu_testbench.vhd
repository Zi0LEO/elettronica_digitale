library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mini_alu_testbench is
    generic (n: integer := 8);
end mini_alu_testbench;

architecture Behavioral of mini_alu_testbench is
    component mini_alu is
    generic (n : INTEGER := 8);
    Port ( A,B : in STD_LOGIC_VECTOR (n-1 downto 0);
           C : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (n downto 0));
    end component;
    signal Ia,Ib: STD_LOGIC_VECTOR (n-1 downto 0);
    signal Ic: STD_LOGIC;
    signal Ooutput: STD_LOGIC_VECTOR(n downto 0);
begin 
    CUT: mini_alu port map(Ia,Ib,Ic, Ooutput);
    
    process begin
    Ia <= "00000001"; Ib <= "00000000"; Ic <= '0';
    wait for 10ns;
    assert (Ooutput = "00000001") 
    report "Test fallito" severity ERROR;
    
    end process;
end Behavioral;
