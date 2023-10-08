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

library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity Test31 is
end Test31;

architecture testbench of Test31 is  
    component q31 is
        Port ( 
            clk, reset, inp : in std_logic;
            outMealy        : out std_logic
        );
    end component;

    signal clk, reset, inp : std_logic;
    signal outMealy        : std_logic;
    constant CLK_PERIOD    : time := 10 ns;
begin
    cal : q31 port map (clk => clk, reset => reset, inp => inp, outMealy => outMealy);

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

        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '0';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '0';
        wait for CLK_PERIOD;

        wait;

    end process;
end testbench;

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

library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity Test32 is
end Test32;

architecture testbench of Test32 is  
    component q32 is
        Port ( 
            clk, reset, inp : in std_logic;
            outMoore        : out std_logic
        );
    end component;

    signal clk, reset, inp : std_logic;
    signal outMoore        : std_logic;
    constant CLK_PERIOD    : time := 10 ns;
begin
    cal : q32 port map (clk => clk, reset => reset, inp => inp, outMoore => outMoore);

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

        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '0';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '1';
        wait for CLK_PERIOD;
        inp <= '0';
        wait for CLK_PERIOD;

        wait;

    end process;
end testbench;