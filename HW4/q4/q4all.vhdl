library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_arith.all;

entity q4 is
    Port ( 
        inp  : in STD_LOGIC_VECTOR(2 downto 0);
        outp : out STD_LOGIC_VECTOR(7 downto 0)
        );
end q4;

architecture Behavioral of q4 is
begin
    outp <= "00000000" when inp="000" else
            "00000001" when inp="001" else
            "00000011" when inp="010" else
            "00000111" when inp="011" else
            "00001111" when inp="100" else
            "00011111" when inp="101" else
            "00111111" when inp="110" else
            "01111111" when inp="111";
end Behavioral;


library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;


entity Test4 is
end Test4;

architecture testbench of Test4 is  
    component q4 is
        Port ( 
            inp  : in STD_LOGIC_VECTOR(2 downto 0);
            outp : out STD_LOGIC_VECTOR(7 downto 0)
            );
    end component;

    signal inp  : STD_LOGIC_VECTOR(2 downto 0);
    signal outp : STD_LOGIC_VECTOR(7 downto 0);
begin
    cal : q4 port map (inp => inp, outp => outp);
    process is
    begin
        inp <= ("101");
        wait for 10 ps;

        inp <= ("110");
        wait for 10 ps;

        inp <= ("001");
        wait for 10 ps;

        wait;

    end process;
end testbench;