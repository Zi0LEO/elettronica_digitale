----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2024 15:31:04
-- Design Name: 
-- Module Name: testbench_fulladder - Behavioral
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

entity testbench_fulladder is
end testbench_fulladder;

architecture Behavioral of testbench_fulladder is
    component fulladder_1bit is
        Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             carry_in : in STD_LOGIC;
             carry_out : out STD_LOGIC;
             sum : out STD_LOGIC);
    end component;
    signal Ia,Ib,Icin,Ocout,Osum: STD_LOGIC;
begin
    CUT: fulladder_1bit port map (Ia,Ib,Icin,Ocout,Osum);
    process
    begin
        Ia <= '0';
        Ib <= '0';
        Icin <= '0';
        wait for 10ns;

        assert (Osum  = '0' and Ocout = '0')
        report "Test 1 Fallito" severity error;

        Ia <= '0';
        Ib <= '0';
        Icin <= '1';
        wait for 10ns;

        assert (Osum  = '1' and Ocout = '0')
        report "Test 2 Fallito" severity error;

        Ia <= '1';
        Ib <= '0';
        Icin <= '0';
        wait for 10ns;

        assert (Osum  = '1' and Ocout = '0')
        report "Test 3 Fallito" severity error;

        Ia <= '1';
        Ib <= '0';
        Icin <= '1';
        wait for 10ns;

        assert (Osum  = '0' and Ocout = '1')
        report "Test 4 Fallito" severity error;

        Ia <= '0';
        Ib <= '1';
        Icin <= '0';
        wait for 10ns;

        assert (Osum  = '1' and Ocout = '0')
        report "Test 5 Fallito" severity error;

        Ia <= '0';
        Ib <= '1';
        Icin <= '1';
        wait for 10ns;

        assert (Osum  = '0' and Ocout = '1')
        report "Test 6 Fallito" severity error;

        Ia <= '1';
        Ib <= '1';
        Icin <= '0';
        wait for 10ns;

        assert (Osum  = '0' and Ocout = '1')
        report "Test 7 Fallito" severity error;

        Ia <= '1';
        Ib <= '1';
        Icin <= '1';
        wait for 10ns;

        assert (Osum  = '1' and Ocout = '1')
        report "Test 8 Fallito" severity error;

    end process;

end Behavioral;
