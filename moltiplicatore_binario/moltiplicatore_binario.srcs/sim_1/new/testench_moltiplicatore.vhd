library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testench_moltiplicatore is
end testench_moltiplicatore;

architecture Behavioral of testench_moltiplicatore is
  component moltiplicatore is
    generic (nbit : INTEGER := 16);
    port ( 
      A : in STD_LOGIC_VECTOR (nbit-1 downto 0); --16bit
      B : in STD_LOGIC_VECTOR (nbit-1 downto 0); --16bit
      prod : out STD_LOGIC_VECTOR ((nbit*2)-1 downto 0)); --32bit
  end component;
  
  signal IA, IB : STD_LOGIC_VECTOR (15 downto 0);
  signal Oprod : STD_LOGIC_VECTOR(31 downto 0);
  
begin
  CUT: moltiplicatore port map(IA,IB,Oprod);

  process
  begin
    
    -- Test 1: A = 0, B = 0
    IA <= std_logic_vector(to_unsigned(65535, IA'length)); -- Assign 0 directly
    IB <= std_logic_vector(to_unsigned(65535, IB'length));
    wait for 100 ms;
--    assert (Oprod = std_logic_vector(to_unsigned(0,Oprod'length))
--    report "Test 1 Fallito." severity error;
        
    -- Test 1: A = 0, B = 1
    IA <= (others => '0'); -- Assign 0 directly
    IB <= std_logic_vector(to_unsigned(1, IB'length));
    wait for 100 ms;
--    assert (Oprod = (others => '0'))
--    report "Test 2 Fallito." severity error;
    
  end process;
end Behavioral;
