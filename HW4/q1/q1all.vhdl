library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity q1 is
    generic(
        n : integer := 8 
    );
    Port ( 
        clk, reset        : in std_logic;
        inp               : in std_logic_vector(n - 1 downto 0);
        start_index_fisrt : out std_logic_vector(n / 2 downto 0);
        last_index_first  : out std_logic_vector(n / 2 downto 0);
        start_index_end   : out std_logic_vector(n / 2 downto 0);
        last_index_end    : out std_logic_vector(n / 2 downto 0)
        );
end q1;

architecture Behavioral of q1 is
    TYPE state IS (S0, S1, S2, S3, S4); 
    SIGNAL states: state;
begin
PROCESS (clk, reset)
    variable count : integer := 0;
begin
    IF (clk'event AND clk='1') THEN
        IF (reset = '1' or count = n) THEN
            states <= S0;
            count := 0;
        ElSE
            CASE states IS
            WHEN S0 =>
                IF inp(count) = '1' THEN 
                    states <= S1;
                ELSE
                    states <= S0;
                END IF;
            WHEN S1 =>
                IF inp(count) = '1' THEN 
                    states <= S1;
                ELSE
                    states <= S2;
                    start_index_fisrt <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                    last_index_first <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                END IF;
            WHEN S2 =>
                IF inp(count) = '1' THEN
                    states <= S3; 
                ELSE 
                    states <= S2; 
                    last_index_first <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                END IF;
            WHEN S3 =>
                IF inp(count) = '1' THEN
                    states <= S3; 
                ELSE 
                    states <= S4; 
                    start_index_end <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                    last_index_end <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                END IF;
            WHEN S4 =>
                IF inp(count) = '1' THEN
                    states <= S3; 
                ELSE 
                    states <= S4; 
                    last_index_end <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                END IF;
            END CASE;
            count := count + 1;
        END IF;
    END if;
END PROCESS;
end Behavioral;

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