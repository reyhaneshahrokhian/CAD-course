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