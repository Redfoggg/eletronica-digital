library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity full_adder_32 is
port(a : in std_logic_vector(31 downto 0);
     b : in std_logic_vector(31 downto 0);
     cin: in std_logic;
     sum : out std_logic_vector(31 downto 0);
     cout : out std_logic);
end full_adder_32;


architecture full_adder_32_behavior of full_adder_32 is
    signal result: std_logic_vector(32 downto 0);
begin
    result <= ('0' & a) + ('0' & b) + cin;
    sum <= result(31 downto 0);
    cout <= result(32);
end full_adder_32_behavior;
