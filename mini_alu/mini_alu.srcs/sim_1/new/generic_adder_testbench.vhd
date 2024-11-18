library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity generic_adder_testbench is
    generic(n:integer :=4);
end generic_adder_testbench;

architecture Behavioral of generic_adder_testbench is

    component generic_adder is
        Port ( A,B : in STD_LOGIC_VECTOR (n-1 downto 0);
             cin : in STD_LOGIC;
             sum : out STD_LOGIC_VECTOR (n downto 0));
    end component;

    signal Ia,Ib: STD_LOGIC_VECTOR (n-1 downto 0);
    signal Icin: STD_LOGIC;
    signal Osum: STD_LOGIC_VECTOR (n downto 0);

begin
    CUT: generic_adder PORT MAP(Ia, Ib, Icin, Osum);
    process begin
        Ia <= "0000"; Ib <= "0001"; Icin <='0';
        wait for 10ns;
        assert Osum = "00001"
        report "Test 1 Fallito." severity error;
       
    end process;
    
end Behavioral;
