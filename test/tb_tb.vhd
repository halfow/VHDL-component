library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_tb is
    generic (runner_cfg : string := runner_cfg_default);
end entity tb_tb;

architecture tb of tb_tb is
    constant clk_period : time := 10 ns;
    signal clk : std_logic := '1'; 
    signal rst : std_logic := '0';
begin
    clk <=  not clk after clk_period/2;

    main : process is
    begin
        test_runner_setup(runner, runner_cfg);
        
        if run("pass_test") then
            check(true);
        
        elsif run("fail_test") then
            check(false);
        end if;
        test_runner_cleanup(runner);
    end process;
end architecture tb;