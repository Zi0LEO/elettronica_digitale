library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity moltiplicatore is
    generic (nbit : INTEGER := 16);
    Port ( A : in STD_LOGIC_VECTOR (nbit-1 downto 0); --16bit
           B : in STD_LOGIC_VECTOR (nbit-1 downto 0); --16bit
           prod : out STD_LOGIC_VECTOR ((nbit*2)-1 downto 0)); --32bit
end moltiplicatore;

architecture Behavioral of moltiplicatore is
  component carry_save_adder
    generic (nbit2 : INTEGER := nbit*2);
      Port (
        A,B,C : in STD_LOGIC_VECTOR (nbit2-1 downto 0); --32 bit
        sum : out STD_LOGIC_VECTOR (nbit2+1 downto 0)); --34bit, because it adds 3 numbers   
  end component;
  
    type MAT is array ( nbit-1 downto 0 ) of STD_LOGIC_VECTOR((nbit*2)-1 downto 0); --32bit
    signal p : MAT; --32bit
    signal temp : STD_LOGIC_VECTOR(nbit-1 downto 0); --16bit
    signal temp_sum : STD_LOGIC_VECTOR(nbit*2+1 downto 0); --32bit
  begin 
  -- Generate partial products
  outer: for i in 0 to nbit-1 generate
    temp <= (others => '0'); --16bit
    inner: for j in 0 to nbit-1 generate
      temp(j) <= A(i) and B(j);
    end generate inner;
    --Shift to the left
    p(i) <= (others => '0') when i = 0 else
         ((nbit*2)-1 downto (nbit+i) => '0') & temp & (i-1 downto 0 => '0');
  end generate outer;
  
  --Add them together
  prod <= (others => '0');
  add: for i in 0 to (nbit-1)/3 - 1 generate  --p(15) does not get computed
    temp_sum <= (others => '0');
    adder: carry_save_adder -- iter0 = 18bit in, 20bit out. iter1 = 21bit in, 23 bit out. iter2 = 24 bit in, 26 bit out, iter3 = 26bit in, 28 bit out;
      PORT MAP(
        A   => p(i*3),
        B   => p(i*3+1),
        C   => p(i*3+2),
        sum => temp_sum);
      p(i) <= temp_sum(nbit*2 -1 downto 0);
    end generate add;

  level2_adder: carry_save_adder --26bit in, 28bit out
    PORT MAP(
      A   => p(0)(nbit+9 downto 0),
      B   => p(1)(nbit+9 downto 0),
      C   => p(2)(nbit+9 downto 0),
      sum => p(0));
      
  level2_adder2: carry_save_adder --20bit in, 22bit out
    PORT MAP(
      A   => p(3)(nbit+3 downto 0),
      B   => p(4)(nbit+3 downto 0),
      C   => p(15)(nbit*2-1 downto nbit-3),
      sum => p(1));
      
  level3_adder: carry_save_adder --22bit in, 24bit out
    PORT MAP(
      A   => p(0)(nbit+1 downto 0),
      B   => p(1)(nbit+1 downto 0),
      C   => (others => '0'),
      sum => prod);
      
end Behavioral;
