----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2024 04:37:15 PM
-- Design Name: 
-- Module Name: carry_select_16bit - Behavioral
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

entity carry_select_16bit is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           sum : out STD_LOGIC_VECTOR (15 downto 0));
end carry_select_16bit;

architecture Behavioral of carry_select_16bit is

component ripplecarry_4bit is
    Port ( A_4 : in STD_LOGIC_VECTOR (3 downto 0);
           B_4 : in STD_LOGIC_VECTOR (3 downto 0);
           carry_in : in STD_LOGIC;
           carry_out : out STD_LOGIC;
           sum_4 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

shared variable carry_selector: STD_LOGIC;
signal carry_start: STD_LOGIC;
signal carry0, carry1: STD_LOGIC_VECTOR(2 downto 0);
signal sum_0, sum_1: STD_LOGIC_VECTOR(12 downto 0);

begin

ripplecarry0_0: ripplecarry_4bit PORT MAP (
  A_4 => A(3 downto 0),
  B_4 => B(3 downto 0), 
  carry_in => '0', 
  carry_out => carry_start, 
  sum_4 => sum(3 downto 0));

ripplecarry1_0: ripplecarry_4bit PORT MAP (A(7 downto 4), B(7 downto 4), '0', carry0(0), sum_0(3 downto 0));
ripplecarry1_1: ripplecarry_4bit PORT MAP (A(7 downto 4), B(7 downto 4), '1', carry1(0), sum_1(3 downto 0));

ripplecarry2_0: ripplecarry_4bit PORT MAP (A(11 downto 8), B(11 downto 8), '0', carry0(1), sum_0(7 downto 4));
ripplecarry2_1: ripplecarry_4bit PORT MAP (A(11 downto 8), B(11 downto 8), '1', carry1(1), sum_1(7 downto 4));

ripplecarry3_0: ripplecarry_4bit PORT MAP (A(15 downto 12), B(15 downto 12), '0', carry0(2), sum_0(11 downto 8));
ripplecarry3_1: ripplecarry_4bit PORT MAP (A(15 downto 12), B(15 downto 12), '1', carry1(2), sum_1(11 downto 8));

process(carry_start, sum_0, sum_1, carry_start) begin

  case carry_start is
    when '0' => 
      sum( 7 downto 4 ) <= sum_0(3 downto 0);
      carry_selector := carry0(0);
    when  others => 
      sum( 7 downto 4 ) <= sum_1(3 downto 0);
        carry_selector := carry1(0);
    end case;
    
    case carry_selector is
      when '0' => 
      sum( 11 downto 8 ) <= sum_0(7 downto 4);
      carry_selector := carry0(1);
    when  others => 
      sum( 11 downto 8 ) <= sum_1(7 downto 4);
        carry_selector := carry1(1);
    end case;
    
        case carry_selector is
      when '0' => 
      sum( 15 downto 12 ) <= sum_0(11 downto 8);
      carry_selector := carry0(2);
    when  others => 
      sum( 15 downto 12 ) <= sum_1(11 downto 8);
        carry_selector := carry1(2);
    end case;
    
  end process;
  
  
end Behavioral;
