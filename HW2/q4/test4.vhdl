library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
entity test4 is
end test4;

architecture testbench of test4 is
    component bellClk is
        port(
            clk         : in  std_logic;
            reset       : in  std_logic;
            clock_set   : in  std_logic;
            alarm_set   : in  std_logic;
            alarm_stop  : in  std_logic;
            minute_in   : in std_logic_vector(7 downto 0);
            hour_in     : in std_logic_vector(5 downto 0);
            alarm_on    : out std_logic
        );
    end component;

    signal clk       : std_logic := '0';
    signal reset     : std_logic := '0';
    signal clock_set : std_logic := '0';
    signal alarm_set : std_logic := '0';
    signal alarm_stop: std_logic := '0';
    signal minute_in : std_logic_vector(7 downto 0);
    signal hour_in   : std_logic_vector(5 downto 0);
    signal alarm_on  : std_logic;

    constant CLOCK_PERIOD : time := 10 ns; 

begin
    cal : bellClk port map (
        clk         => clk,
        reset       => reset,
        clock_set   => clock_set,
        alarm_set   => alarm_set,
        alarm_stop  => alarm_stop,
        minute_in   => minute_in,
        hour_in     => hour_in,
        alarm_on    => alarm_on
        );

    clk_process: process
    begin
        while now < 1000 ns loop
            clk <= not clk;
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    stimulus_process: process
    begin
        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        -- Test clock set(3:19)
        clock_set <= '1';
        minute_in <= "00010011";
        hour_in   <= "000011";
        wait for 10 ns;
        clock_set <= '0';
        wait for 100 ns;
        
        -- Test alarm set(2:15)
        alarm_set <= '1';
        minute_in <= "00001111";
        hour_in   <= "000010";
        wait for 10 ns;
        alarm_set <= '0';
        wait for 100 ns;
        
        -- Test alarm alert
        alarm_stop <= '0';
        wait for 500 ns;
        alarm_stop <= '1';
        wait for 200 ns;
        wait;

    end process;

end testbench;