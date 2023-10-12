library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity Test32 is
end Test32;

architecture testbench of Test32 is  
    component q32 is
        Port ( 
            clk, reset, inp : in std_logic;
            outMoore        : out std_logic
        );
    end component;

    signal clk, reset, inp : std_logic;
    signal outMoore        : std_logic;
    constant CLK_PERIOD    : time := 10 ns;
begin
    cal : q32 port map (clk => clk, reset => reset, inp => inp, outMoore => outMoore);

    clk_process : process
    begin
        while now < 1000 ns loop 
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    process is
    begin
        reset <= '1';
        wait for CLK_PERIOD;
        reset <= '0';

        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '0';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '0';
        wait for CLK_PERIOD;

        wait;

    end process;
end testbench;