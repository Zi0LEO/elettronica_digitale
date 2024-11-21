library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mini_alu_testbench is
    generic (n: integer := 4);
end mini_alu_testbench;

architecture Behavioral of mini_alu_testbench is
    component mini_alu is
    generic (n : INTEGER := 4);
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
        --Test 1: Addizione zeri
        Ia <= (others => '0'); Ib <= (others => '0');
        Ic <= '0';
        wait for 10 ns;
       
        --Test 2: Sottrazione zeri
        Ia <= (others => '0'); Ib <= (others => '0');
        Ic <= '1';
        wait for 10 ns;
        
        --Test 3: Addizione tra i valori massimi
        Ia <= ('0', others => '1'); Ib <= ('0', others => '1');
        Ic <= '0';
        wait for 10 ns;
        
        --Test 4:Sottrazione tra i valori massimi
        Ia <= ('0', others => '1'); Ib <= ('0', others => '1');
        Ic <= '1';
        wait for 10 ns;
        
        --Test 5: Addizione tra i valori minimi
        Ia <= ('1', others => '0'); Ib <= ('1', others => '0');
        Ic <= '0';
        wait for 10 ns;

        --Test 6: Sottrazione tra i valori minimi
        Ia <= ('1', others => '0'); Ib <= ('1', others => '0');
        Ic <= '1';
        wait for 10 ns;
        
    end process;
end Behavioral;

