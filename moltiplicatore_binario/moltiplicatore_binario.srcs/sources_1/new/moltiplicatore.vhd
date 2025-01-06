library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.AdderTree_Types.all;

entity moltiplicatore is
    generic (nbit : INTEGER := 16);
    Port ( 
      A,B : in STD_LOGIC_VECTOR (nbit-1 downto 0); --16bit
      clk: in STD_LOGIC;
      prod : out STD_LOGIC_VECTOR ((nbit*2)-1 downto 0)); --32bit
end moltiplicatore;

architecture Behavioral of moltiplicatore is
  component adder_tree is
    port ( p: MAT;
            ris : out STD_LOGIC_VECTOR(nbit*2-1 downto 0));
  end component;
  
  signal p: MAT; --signal
  signal IA, IB: STD_LOGIC_VECTOR(nbit-1 downto 0);
  signal Oprod: STD_LOGIC_VECTOR(nbit*2 -1 downto 0);
  
  begin     
  
  partial_products:process(clk)
  begin
    if rising_edge(clk) then
      outer: for i in 0 to nbit-1 loop
        p(i) <= (others => '0');
        inner: for j in 0 to nbit-1 loop
          p(i)(j) <= IA(i) and IB(j);
        end loop inner;
        p(i) <= std_logic_vector(shift_left(unsigned(p(i)), i));
      end loop outer; 
      end if;
  end process;
  
  process(clk)
  begin
    if rising_edge(clk) then
      IA <= A;
      IB <= B;
      prod <= Oprod;
    end if;
  end process;
  adder:adder_tree
    PORT MAP(p, Oprod);
    
end Behavioral;
