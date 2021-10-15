-- Testbench for 32 bits adder
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity testbench is

end testbench;

architecture tb of testbench is

signal a, b, sum: std_logic_vector(31 downto 0) := (others => '0');
signal cout, cin: std_logic := '0';

-- DUT component
component full_adder_32 is
port(a : in std_logic_vector(31 downto 0);
     b : in std_logic_vector(31 downto 0);
     cin: in std_logic;
     sum : out std_logic_vector(31 downto 0);
     cout : out std_logic);
end component;

begin

  -- Connect DUT
  DUT: full_adder_32 port map(a => a, b => b, cin => cin, sum => sum, cout => cout);
  process
  begin
    a <= "00000000000000000000000000000001";
    b <= "00000000000000000000000000000000";
    cin <= '0';
    wait for 10 ns;

    a <= "00000000000000000000000000000000";
    b <= "00000000000000000000000000000000";
    cin <= '0';
    wait for 10 ns;

    a <= "10000000000000000000000000000001";
    b <= "10000000000000000000000000000000";
    cin <= '0';
    wait for 10 ns;

    a <= "10000000010001000001000011100001";
    b <= "10000000000100010001000101110001";
    cin <= '0';
    wait for 10 ns;

    a <= "10000000010001000001000011100000";
    b <= "10000000000100010001000101110000";
    cin <= '1';
    wait for 10 ns;


  end process;

end tb;

