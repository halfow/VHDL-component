library IEEE;
use IEEE.std_logic_1164.all;

entity test is
    generic(
        n : positive
    );
    port (
        clk    : in std_logic;
        input  : in std_logic_vector;
        output : out std_logic_vector
    );
end entity test;

architecture rtl of test is
    type delay_t is array (natural range <>) of std_logic_vector(input'range);
    signal delay : delay_t(n - 1 downto 0);
begin
    assert input'length = output'length report "inbput and output should have the same length" severity error;

    (output, delay) <= delay & input when rising_edge(clk); 
         
end architecture rtl;
