library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity Test2 is
    generic(
        n : integer := 10
    );
end Test2;

architecture testbench of Test2 is  
    component q2 is
        Port ( 
            clk, reset : in std_logic;
            inp        : in std_logic_vector(n - 1 downto 0);
            outp       : out std_logic_vector(n - 1 downto 0)
        );
    end component;

    signal clk, reset : std_logic;
    signal inp        : std_logic_vector(n - 1 downto 0);
    signal outp       : std_logic_vector(n - 1 downto 0);

    constant CLK_PERIOD: time := 10 ns;
begin
    cal : q2 port map (clk => clk, reset => reset, inp => inp, outp => outp);

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
       
        -- inp <= "1100011100";
        -- wait for 100 ns;

        -- reset <= '1';
        -- wait for CLK_PERIOD;
        -- reset <= '0';

        -- inp <= "1111011100";
        -- wait for 100 ns;

        -- reset <= '1';
        -- wait for CLK_PERIOD;
        -- reset <= '0';
        
        inp <= "1000111001";
        wait for 100 ns;

    end process;
end testbench;