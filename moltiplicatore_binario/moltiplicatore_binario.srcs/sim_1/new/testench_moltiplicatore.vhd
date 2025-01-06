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
      clk: in STD_LOGIC;
      prod : out STD_LOGIC_VECTOR ((nbit*2)-1 downto 0)); --32bit
  end component;
  
  signal IA, IB : STD_LOGIC_VECTOR (15 downto 0);
  signal Oprod : STD_LOGIC_VECTOR(31 downto 0);
  signal Iclk: STD_LOGIC := '0';
  constant Tclk : time := 1000ns;
  
begin
  CUT: moltiplicatore GENERIC MAP(16) PORT MAP(IA,IB,Iclk,Oprod);

  process
  begin
    
    -- Test 1: A = 0, B = 0
    IA <= std_logic_vector(to_unsigned(65535, IA'length)); -- Assign 0 directly
    IB <= std_logic_vector(to_unsigned(65535, IB'length));
    wait for Tclk;
 
    -- Test 1: A = 0, B = 1
    IA <= (others => '0'); -- Assign 0 directly
    IB <= std_logic_vector(to_unsigned(1, IB'length));
    wait for Tclk;
    
      -- Test 1: A = 0, B = 1
    IA<= std_logic_vector(to_unsigned(3, IA'length)); -- Assign 0 directly
    IB <= std_logic_vector(to_unsigned(4, IB'length));
    wait for Tclk;
    
  end process;
  
  process
  begin
    wait for Tclk/2;
    Iclk <= not Iclk;
    end process;
end Behavioral;
