library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.AdderTree_Types.all;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
    component adder_tree is 
        generic ( nbit: INTEGER := 32);
        Port ( p : in MAT;
               ris : out STD_LOGIC_VECTOR(nbit-1 downto 0));
    end component;  
   
    signal Ip :MAT;
    signal Oris : STD_LOGIC_VECTOR(31 downto 0);
begin 
    CUT: adder_tree GENERIC MAP(32) PORT MAP (Ip,Oris);
process begin
        Ip(0)  <= (others => '0');
        Ip(1)  <= (others => '1');
        Ip(2)  <= "0000000000000000000000000000010";
        Ip(3)  <= "0000000000000000000000000000011";
        Ip(4)  <= "0000000000000000000000000000100";
        Ip(5)  <= "0000000000000000000000000000101";
        Ip(6)  <= "0000000000000000000000000000110";
        Ip(7)  <= "0000000000000000000000000000111";
        Ip(8)  <= "0000000000000000000000000001000";
        Ip(9)  <= "0000000000000000000000000001001";
        Ip(10) <= "0000000000000000000000000001010";
        Ip(11) <= "0000000000000000000000000001011";
        Ip(12) <= "0000000000000000000000000001100";
        Ip(13) <= "0000000000000000000000000001101";
        Ip(14) <= "0000000000000000000000000001110";
        Ip(15) <= "0000000000000000000000000001111";
        wait for 100ns;
end process;
end Behavioral;
