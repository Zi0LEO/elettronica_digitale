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
  
  signal p: MAT;
  signal IA, IB: STD_LOGIC_VECTOR(nbit-1 downto 0);
  signal Oprod: STD_LOGIC_VECTOR((nbit*2)-1 downto 0);
  signal zeros: STD_LOGIC_VECTOR(nbit-1 downto 0);
  begin     
  
  partial_products:process(clk)
  variable bucket: STD_LOGIC_VECTOR((nbit*2)-2 downto 0);

  begin
    
    zeros <= (others => '0');
    if rising_edge(clk) then
      IA <= A;
      IB <= B;
      prod <= Oprod;
      
      outer: for i in nbit-1 downto 0 loop
        inner: for j in nbit-1 downto 0 loop
          bucket(j) := IA(i) and IB(j);
        end loop inner;
        
        bucket := zeros(nbit-1-i downto 0) & bucket((nbit*2-2)-(nbit-i) downto 0);
        bucket := bucket(nbit*2-2 downto i) & zeros(i-1 downto 0);
        
        p(i) <= bucket;
        
      end loop outer; 
      end if;
  end process;
  
  adder:adder_tree
    PORT MAP(p, Oprod);
    
end Behavioral;
