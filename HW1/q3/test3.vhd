library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;library ieee;
entity test3 is
end test3;

architecture testbench of test3 is
    component q3 is
        port(
            A : in std_logic_vector(15 downto 0);
            output : out std_logic_vector(3 downto 0)
        );
    end component;

    signal A : std_logic_vector(15 downto 0);
    signal output: std_logic_vector(3 downto 0);

begin
    cal : q3 port map (A => A, output => output);
    process is
    begin
        A <= "0000000000000011";

        wait for 10 ps;

        A <= "0000000000001111";

        wait for 10 ps;

        A <= "0000000011111111";

        wait for 10 ps;
        wait;

    end process;

end testbench;