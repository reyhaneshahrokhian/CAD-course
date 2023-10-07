library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;

entity q2 is
    generic(
        n : integer := 10
    );
    Port ( 
        clk, reset : in std_logic;
        inp        : in std_logic_vector(n - 1 downto 0);
        outp       : out std_logic_vector(n - 1 downto 0)
        );
end q2;

architecture Behavioral of q2 is
    TYPE state1 IS (S0, S1, S2, S3, S4, S5, S6, S7); 
    TYPE state2 IS (S0, S1, S2, S3, S4, S5);
    SIGNAL states1: state1;
    SIGNAL states2: state2;
    SIGNAL check1 : bit;
    SIGNAL check2 : bit;
begin
PROCESS (clk, reset)
    variable i : integer := 0;
begin
    IF (clk'event AND clk='1') THEN
        IF (reset = '1' or i = n) THEN
            states1 <= S0;
            states2 <= S0;
            i := 0;
        ElSE
            CASE states1 IS
            WHEN S0 =>
                IF inp(i) = '1' THEN 
                    states1 <= S1;
                ELSE
                    states1 <= S0;
                END IF;
            WHEN S1 =>
                IF inp(i) = '1' THEN 
                    states1 <= S1;  
                ELSE
                    states1 <= S2;
                END IF;
            WHEN S2 =>
                IF inp(i) = '1' THEN
                    states1 <= S2; 
                ELSE 
                    states1 <= S3; 
                END IF;
            WHEN S3 =>
                IF inp(i) = '1' THEN
                    states1 <= S4; 
                ELSE 
                    states1 <= S3; 
                END IF;
            WHEN S4 =>
                IF inp(i) = '1' THEN
                    states1 <= S4; 
                ELSE 
                    states1 <= S5; 
                END IF;
            WHEN S5 =>
                IF inp(i) = '1' THEN
                    states1 <= S5; 
                ELSE 
                    states1 <= S6; 
                END IF;
            WHEN S6 =>
                IF inp(i) = '1' THEN
                    states1 <= S7; 
                ELSE 
                    states1 <= S6; 
                END IF;
            WHEN S7 =>
                states1 <= S7;   
            END CASE;

            CASE states2 IS
            WHEN S0 =>
                IF inp(i) = '1' THEN 
                    states2 <= S0;
                ELSE
                    states2 <= S1;
                END IF;
            WHEN S1 =>
                IF inp(i) = '1' THEN 
                    states2 <= S1;  
                ELSE
                    states2 <= S2;
                END IF;
            WHEN S2 =>
                IF inp(i) = '1' THEN
                    states2 <= S3; 
                ELSE 
                    states2 <= S2; 
                END IF;
            WHEN S3 =>
                IF inp(i) = '1' THEN
                    states2 <= S3; 
                ELSE 
                    states2 <= S4; 
                END IF;
            WHEN S4 =>
                IF inp(i) = '1' THEN
                    states2 <= S4; 
                ELSE 
                    states2 <= S5; 
                END IF;
            WHEN S5 =>
                states2 <= S5;   
            END CASE;

            i := i + 1;      
        END IF;
    END if;
END PROCESS;

check1 <= '1' WHEN states1 = S7 ELSE '0';
check2 <= '1' WHEN states2 = S5 ELSE '0';

PROCESS (check1, check2)
begin
    IF (check1 = '1') THEN
        outp <= inp;
        for j in 0 to (n - 1) loop
            if inp(j) = '1' then
                outp(j) <= '0';
            else
                outp(j) <= '1';
            end if;
        end loop;
    ELSIF(check2 = '1') THEN 
        outp <= inp + 1;
    ELSE 
        outp <= inp;
    END IF;        
END PROCESS;
end Behavioral;