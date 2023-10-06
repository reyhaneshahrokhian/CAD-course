library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity Test1 is
    generic(
        n : integer := 8 
    );
end Test1;

architecture testbench of Test1 is  
    component q1 is
        Port ( 
            clk, reset        : in std_logic;
            inp               : in std_logic_vector(n - 1 downto 0);
            start_index_fisrt : out std_logic_vector(n / 2 downto 0);
            last_index_first  : out std_logic_vector(n / 2 downto 0);
            start_index_end   : out std_logic_vector(n / 2 downto 0);
            last_index_end    : out std_logic_vector(n / 2 downto 0)
        );
    end component;

    signal clk, reset        : std_logic;
    signal inp               : std_logic_vector(n - 1 downto 0);
    signal start_index_fisrt : std_logic_vector(n / 2 downto 0);
    signal last_index_first  : std_logic_vector(n / 2 downto 0);
    signal start_index_end   : std_logic_vector(n / 2 downto 0);
    signal last_index_end    : std_logic_vector(n / 2 downto 0);

    constant CLK_PERIOD    : time := 10 ns;
begin
    cal : q1 port map (clk => clk, reset => reset, inp => inp, start_index_fisrt => start_index_fisrt, last_index_first => last_index_first, start_index_end => start_index_end, last_index_end => last_index_end);

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

        inp <= "01001010";
        wait for 100 ns;
        wait;

    end process;
end testbench;