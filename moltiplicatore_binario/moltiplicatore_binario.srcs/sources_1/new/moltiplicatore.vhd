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
        carry_in : in STD_LOGIC_VECTOR(1 downto 0);
        carry_out : out STD_LOGIC_VECTOR(1 downto 0);
        sum : out STD_LOGIC_VECTOR (nbit2+1 downto 0)); --34bit, because it adds 3 numbers   
  end component;
  
    type MAT is array ( nbit+1 downto 0 ) of STD_LOGIC_VECTOR((nbit*2)-1 downto 0); --32bit
    signal p : MAT; --32bit
    signal temp : STD_LOGIC_VECTOR(nbit-1 downto 0); --16bit
    signal temp_sum : STD_LOGIC_VECTOR(nbit*2 - 1 downto 0); --32bit
    signal carry: STD_LOGIC_VECTOR(nbit*2 - 1 downto 0);
    signal temp_carry_out: STD_LOGIC_VECTOR(1 downto 0);
    
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
    --p(i) <= ((nbit*2)-1 downto (nbit+i) => '0') & temp & (i downto 0 => '0');
  end generate outer;
  
  --Add them together
  prod <= (others => '0');
  add: for i in 0 to nbit-1 generate
    temp_sum <= (others => '0');
   
  --aggiungo gli ultimi due bit a p come tutti 0 e l'ultimo bit di B in mezzo
  p(nbit) <= ((nbit/2 downto 0 => '0') & B(nbit-1)) & ((nbit/2)-1  downto 0 => '0');
  --lo xor dell'ultimo prodotto parziale esteso con gli 0 alla fine
  p(nbit+1) <= (B(nbit-1) xor (B(nbit-1) and A)) & (((nbit/2)-1  downto 0 => '0'));
    
  --l'adder tree avrà 18 ingressi quindi 
    adder:carry_save_adder
      PORT MAP(
        A   => temp_sum, --32bit
        B   => p(i*2), --32bit
        C   => p(i*2+1), --32bit
        carry_in => carry(i*2) & carry(i*2+1),
        carry_out => temp_carry_out,
        sum => temp_sum); --32bit
    carry((i+1)*2) <= temp_carry_out(0);
    carry((i+1)*2+1) <= temp_carry_out(1);
   end generate add;
   prod <= temp_sum;

end Behavioral;
