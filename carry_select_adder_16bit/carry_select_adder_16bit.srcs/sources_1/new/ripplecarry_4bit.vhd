----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2024 04:07:55 PM
-- Design Name: 
-- Module Name: ripplecarry_4bit - Behavioral
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

entity ripplecarry_4bit is
    Port ( A_4 : in STD_LOGIC_VECTOR (3 downto 0);
         B_4 : in STD_LOGIC_VECTOR (3 downto 0);
         carry_in : in STD_LOGIC;
         carry_out : out STD_LOGIC;
         sum_4 : out STD_LOGIC_VECTOR (3 downto 0));
end ripplecarry_4bit;

architecture Behavioral of ripplecarry_4bit is

    component fulladder_1bit is
        Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             carry_in : in STD_LOGIC;
             carry_out : out STD_LOGIC;
             sum : out STD_LOGIC);
    end component;

    signal sum, carry: STD_LOGIC_VECTOR(3 downto 0);
begin
    fa0: fulladder_1bit PORT MAP( A_4(0), B_4(0), carry_in, carry(0), sum(0) );
    fa1: fulladder_1bit PORT MAP( A_4(1), B_4(1), carry(0), carry(1), sum(1) );
    fa2: fulladder_1bit PORT MAP( A_4(2), B_4(2), carry(1), carry(2), sum(2) );
    fa3: fulladder_1bit PORT MAP( A_4(3), B_4(3), carry(2), carry(3), sum(3) );
    sum_4 <= sum;
    carry_out <= carry(3);

end Behavioral;
