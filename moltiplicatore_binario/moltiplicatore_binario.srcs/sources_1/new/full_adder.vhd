----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2024 03:52:01 PM
-- Design Name: 
-- Module Name: fulladder_1bit - Behavioral
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

entity fulladder_1bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           carry_out : out STD_LOGIC;
           sum : out STD_LOGIC);
end fulladder_1bit;

architecture Behavioral of fulladder_1bit is
signal p: STD_LOGIC;

begin
  p <= A xor B;
  carry_out <= A when p='0' else
               carry_in when p='1' else 'X';
sum <= p xor carry_in;

end Behavioral;