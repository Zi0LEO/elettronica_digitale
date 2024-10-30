----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2024 15:50:27
-- Design Name: 
-- Module Name: testbench_ripplecarry - Behavioral
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

entity testbench_ripplecarry is
    --  Port ( );
end testbench_ripplecarry;

architecture Behavioral of testbench_ripplecarry is
    component ripplecarry_4bit is
        Port ( A_4 : in STD_LOGIC_VECTOR (3 downto 0);
             B_4 : in STD_LOGIC_VECTOR (3 downto 0);
             carry_in : in STD_LOGIC;
             carry_out : out STD_LOGIC;
             sum_4 : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal Ia,Ib,Osum: std_logic_vector (3 downto 0);
    signal Icin,Ocout:std_logic;
begin
    CUT: ripplecarry_4bit port map (Ia,Ib,Icin,Ocout ,Osum);
    process
    begin

        --Test 1: caso base, A = 0, B = 0, carry = 0
        Ia <= "0000";
        Ib <= "0000";
        Icin <= '0';
        wait for 10ns;
        assert ( Osum = "0000" and Ocout = '0')
        report "Test case 1 Failed" severity error;

        --Test 2: A = 1, B = 1, carry = 0
        Ia <= "0001";
        Ib <= "0001";
        Icin <= '0';
        wait for 10ns;
        assert ( Osum = "0010" and Ocout = '0')
        report "Test case 2 Failed" severity error;

        --Test case 3: A = 0101, B = 0011, carry_in = 0
        Ia <= "0101"; Ib <= "0011"; Icin <= '0';
        wait for 10 ns;
        assert (Osum = "1000" and Ocout= '0') 
        report "Test case 3 failed";

        -- Test case 4: A = 1111, B = 0001, carry_in = 0
        Ia <= "1111"; Ib <= "0001"; Icin <= '0';
        wait for 10 ns;
        assert (Osum = "0000" and Ocout = '1') 
        report "Test case 4 failed" severity error;

        -- Test case 5: Ia = 1111, Ib = 1111, cin = 0
        Ia <= "1111"; Ib <= "1111"; Icin <= '0';
        wait for 10 ns;
        assert (Osum = "1110" and Ocout = '1') 
        report "Test case 5 failed" severity error;

        -- Test case 6: Ia = 1010, Ib = 0101, cin = 1
        Ia <= "1010"; Ib <= "0101"; Icin <= '1';
        wait for 10 ns;
        assert (Osum = "0000" and Ocout = '1') 
        report "Test case 6 failed" severity error;

        -- Test case 7: Ia = 1001, Ib = 1001, cin = 0
        Ia <= "1001"; Ib <= "1001"; Icin <= '0';
        wait for 10 ns;
        assert (Osum = "0010" and Ocout = '1') 
        report "Test case 7 failed" severity error;

        -- Test case 8: Ia = 0110, Ib = 1001, cin = 1
        Ia <= "0110"; Ib <= "1001"; Icin <= '1';
        wait for 10 ns;
        assert (Osum = "0000" and Ocout = '1') 
        report "Test case 8 failed" severity error;
    end process;
end Behavioral;