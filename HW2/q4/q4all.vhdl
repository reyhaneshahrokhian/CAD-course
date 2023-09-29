library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity bellClk is
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
end entity bellClk;

architecture Behavioral of bellClk is
    signal second : integer       := 0;
    signal minute : integer       := 0;
    signal minute_alarm : integer := 0; 
    signal hour : integer         := 0;
    signal hour_alarm : integer   := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            second <= 0;
            minute <= 0;
            hour <= 0;
            alarm_on <= '0';
        elsif rising_edge(clk) then
            if clock_set = '1' then
                minute <= to_integer(unsigned(minute_in));
                hour <= to_integer(unsigned(hour_in));
            elsif alarm_set = '1' then
                minute_alarm <= to_integer(unsigned(minute_in));
                hour_alarm <= to_integer(unsigned(hour_in));
            else
                second <= second + 1;
                if second = 60 then
                    second <= 0;
                    minute <= minute + 1;
                end if;
                if minute = 60 then
                    minute <= 0;
                    hour <= hour + 1;
                end if;
                if hour = 24 then
                    hour <= 0;
                end if;

                if (hour = hour_alarm) and (minute = minute_alarm) then
                    alarm_on <= '1';
                elsif alarm_stop = '1' then
                    alarm_on <= '0';
                end if;
            end if;
        end if;

    end process;
end Behavioral;


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