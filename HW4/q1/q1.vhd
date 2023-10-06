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