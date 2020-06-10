library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity test is
    generic(
        n : natural
    );
    port (
        clk    : in std_logic;
        input  : in std_logic_vector;
        output : out std_logic_vector
    );
end entity test;

architecture rtl of test is
    type delay_t is array (natural range <>) of std_logic_vector;

    -- TODO: confirm 2 to n, is the function wanted
    signal delay : delay_t(2 to n)(input'range);
begin
    assert input'length = output'length report "inbput and out put should have the same length" severity error;

    process begin
        wait until rising_edge(clk);
        (output, delay) <=  delay & input;
    end process;
    
end architecture rtl;