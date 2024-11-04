library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_carryselect is
end testbench_carryselect;

architecture Behavioral of testbench_carryselect is
    component carry_select_16bit is
        Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
             B : in STD_LOGIC_VECTOR (15 downto 0);
             carry_in_start: in STD_LOGIC;
             sum : out STD_LOGIC_VECTOR (16 downto 0));
    end component;
    signal Ia,Ib: STD_LOGIC_VECTOR (15 downto 0);
    signal Os: STD_LOGIC_VECTOR (16 downto 0);
    signal Icin: STD_LOGIC;
begin
    CUT: carry_select_16bit port map(Ia,Ib,Icin,Os);
    process
    begin

        --Test 1: A = 0000000000000001, B = 0000000000000001, carry_in = 0
        Ia <= "0000000000000001"; Ib <= "0000000000000001"; Icin <= '0';
        wait for 10 ns;
        assert (Os = "00000000000000010")
        report "Test 1 Fallito" severity error;

        --Test 2: A = 0000000000000001, B = 0000000000000001, carry_in = 0
        Ia <= "0000000000000001"; Ib <= "0000000000000001"; Icin <= '1';
        wait for 10 ns;
        assert (Os = "00000000000000011")
        report "Test 2 Fallito" severity error;

        --Test 3: A = 1111111111111111, B = 0000000000000001, carry_in = 0
        Ia <= "1111111111111111"; Ib <= "0000000000000001"; Icin <= '0';
        wait for 10 ns;
        assert (Os = "10000000000000000")
        report "Test 3 Fallito" severity error;

        --Test 4: A = 1111111111111111, B = 1111111111111111, carry_in = 1
        Ia <= "1111111111111111"; Ib <= "1111111111111111"; Icin <= '1';
        wait for 10 ns;
        assert (Os = "11111111111111111")
        report "Test 4 Fallito" severity error;
        
        --Test Finiti
        report "Tutti i test sono stati completati con successo!" severity note;

    end process;

end Behavioral;







