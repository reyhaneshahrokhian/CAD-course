library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_arith.all;

entity q31 is
    Port ( 
        clk, reset, inp : in std_logic;
        outMealy        : out std_logic
        );
end q31;

architecture Behavioral of q31 is
TYPE state IS (S0, S1, S2, S3); 
SIGNAL Mealy_state: state;
begin
PROCESS (clk, reset)
begin
    IF (clk'event AND clk='1') THEN
        IF (reset = '1') THEN
            Mealy_state <= S0;
        ElSE
            CASE Mealy_state IS
            WHEN S0 =>
                IF inp = '1' THEN 
                    Mealy_state <= S1; 
                ELSE
                    Mealy_state <= S0;
                END IF;
            WHEN S1 =>
                IF inp = '1' THEN 
                    Mealy_state <= S2; 
                ELSE
                    Mealy_state <= S0; 
                END IF;
            WHEN S2 =>
                IF inp = '1' THEN
                    Mealy_state <= S3; 
                ELSE 
                    Mealy_state <= S0; 
                END IF;
            WHEN S3 =>
                IF inp = '1' THEN
                    Mealy_state <= S3; 
                ELSE 
                    Mealy_state <= S0; 
                END IF;
            END CASE;
        END IF;
    END if;
END PROCESS;

outMealy <= '1' WHEN (Mealy_state = S3 AND inp = '0') ELSE '0';

end Behavioral;