----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2024 15:08:24
-- Design Name: 
-- Module Name: testbench_carryselect - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench_carryselect is
    --  Port ( );
end testbench_carryselect;

architecture Behavioral of testbench_carryselect is
    component carry_select_16bit is
        Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
             B : in STD_LOGIC_VECTOR (15 downto 0);
             carry_in_start: in STD_LOGIC;
             carry_out_final: out STD_LOGIC;
             sum : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    signal Ia,Ib,Os: STD_LOGIC_VECTOR (15 downto 0);
    signal Icin,Ocout: STD_LOGIC;
begin
    CUT: carry_select_16bit port map(Ia,Ib,Icin,Ocout,Os);
    process
    begin

        -- Test 1: Addizione semplice senza carry in
        Ia <= "0000000000000001";
        Ib <= "0000000000000001";
        Icin <= '0';
        wait for 10 ns;

        -- Test dei Risultati
        assert (Os = "0000000000000010" AND Ocout = '0')
        report "Caso 1 Fallito" severity error;

        -- Test 2: Addizione semplice con carry in
        Ia <= "0000000000000001";
        Ib <= "0000000000000001";
        Icin <= '1';
        wait for 10 ns;

        assert (Os = "0000000000000011" AND Ocout = '0')
        report "Test 2 Fallito" severity error;

        -- Test 3: Grande valore per A senza carry in
        Ia <= "1111111111111111";
        Ib <= "0000000000000001";
        Icin <= '0';
        wait for 10 ns;

        assert (Os = "0000000000000000" AND Ocout = '1')
        report "Test 3 Fallito" severity error;

        -- Test 4: Somma dei valori massimi e carry in
        Ia <= "1111111111111111";
        Ib <= "1111111111111111";
        Icin <= '1';
        wait for 10 ns;

        assert (Os = "1111111111111111" AND Ocout = '1')
        report "Test 4 Fallito" severity error;
        
        -- Test Finiti
        report "Tutti i test sono stati completati con successo!" severity note;

    end process;

end Behavioral;







