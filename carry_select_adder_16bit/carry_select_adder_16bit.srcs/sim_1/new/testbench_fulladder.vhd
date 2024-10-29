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
--  Port ( );
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
Ia <= '1';
Ib <= '0';
Icin <= '0';
wait for 10ns;
Icin <='1';
wait for 10ns;
Ib <= '1';
wait for 10ns;
end process;

end Behavioral;
