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
    process begin
        Ia <= "0001";
        Ib <= "0000";
        Icin <= '0';
        wait for 20ns;
        Icin <= '1';
        wait for 20ns;
        Ib <= "0001";
    end process;
end Behavioral;












