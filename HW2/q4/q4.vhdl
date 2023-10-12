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