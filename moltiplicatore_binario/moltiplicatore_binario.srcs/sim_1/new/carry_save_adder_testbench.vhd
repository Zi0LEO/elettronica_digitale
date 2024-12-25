library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Per conversioni numeriche se necessarie

entity tb_carry_save_adder is
-- Nessun porto nella testbench
end tb_carry_save_adder;

architecture Behavioral of tb_carry_save_adder is
    -- Component declaration
    component carry_save_adder is
        generic (nbit : INTEGER := 16);
        Port (
            A, B, C : in STD_LOGIC_VECTOR(nbit-1 downto 0);
            sum : out STD_LOGIC_VECTOR(nbit downto 0)
        );
    end component;

    -- Signal declaration
    constant nbit : INTEGER := 16; -- Definire il numero di bit
    signal A, B, C : STD_LOGIC_VECTOR(nbit-1 downto 0);
    signal sum : STD_LOGIC_VECTOR(nbit downto 0);

begin
    -- Instantiate the carry_save_adder
    uut: carry_save_adder
        generic map (nbit => nbit)
        port map (
            A => A,
            B => B,
            C => C,
            sum => sum
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Test case 1
        A <= (others => '0');
        B <= (others => '0');
        C <= (others => '0');
        wait for 10 ns;

        -- Test case 2
        A <= "0000000000000001"; -- Decimal 1
        B <= "0000000000000010"; -- Decimal 2
        C <= "0000000000000011"; -- Decimal 3
        wait for 10 ns;

        -- Test case 3
        A <= "1111111111111111"; -- Maximum value for 16 bits
        B <= "0000000000000001"; -- Decimal 1
        C <= "1111111111111110"; -- Decimal 65534
        wait for 10 ns;

        wait;
    end process;
end Behavioral;
