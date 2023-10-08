library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_arith.all;

entity q32 is
    Port ( 
        clk, reset, inp : in std_logic;
        outMoore        : out std_logic
        );
end q32;

architecture Behavioral of q32 is
TYPE state IS (S0, S1, S2, S3, S4); 
SIGNAL Moore_state: state;
begin
PROCESS (clk, reset)
begin
    IF (reset = '1') THEN
        Moore_state <= S0;
    ELSIF (clk'event AND clk='1') THEN
        CASE Moore_state IS
        WHEN S0 =>
            IF inp = '1' THEN 
                Moore_state <= S1; 
            ELSE
                Moore_state <= S0;
            END IF;
        WHEN S1 =>
            IF inp = '1' THEN 
                Moore_state <= S2; 
            ELSE
                Moore_state <= S0; 
            END IF;
        WHEN S2 =>
            IF inp = '1' THEN
                Moore_state <= S3; 
            ELSE 
                Moore_state <= S0; 
            END IF;
        WHEN S3 =>
            IF inp = '1' THEN
                Moore_state <= S3; 
            ELSE 
                Moore_state <= S4; 
            END IF;
        WHEN S4 =>
            IF inp = '1' THEN
                Moore_state <= S1; 
            ELSE 
                Moore_state <= S0; 
            END IF;
        END CASE;
    END IF;
END PROCESS;

outMoore <= '1' WHEN Moore_state = S4 ELSE '0';

end Behavioral;