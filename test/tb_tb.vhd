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
    constant delay      : natural := 20;
    signal clk          : std_logic := '1'; 
    --signal rst          : std_logic := '0';
    signal a, b         : std_logic_vector(15 downto 0);
    
begin
    clk <=  not clk after clk_period/2;

    main : process is
    begin
        test_runner_setup(runner, runner_cfg);
        
        if run("pass_test") then
            check(true);
        
        elsif run("fail_test") then
            check(false);

        elsif run("run delay") then
            wait until clk;
            a <= x"BEEF";
            wait for clk_period*(delay);
            check(true);
        end if;
        test_runner_cleanup(runner);
    end process;

    c0: entity work.test generic map (delay) port map (clk,a,b);
end architecture tb;
