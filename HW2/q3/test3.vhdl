library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
entity test3 is
end test3;

architecture testbench of test3 is
    component q3 is
        port(
            input : in std_logic_vector(15 downto 0);
            output : out std_logic_vector(1 downto 0)
        );
    end component;

    signal input : std_logic_vector(15 downto 0);
    signal output : std_logic_vector(1 downto 0);

begin
    cal : q3 port map (input => input, output => output);
    process is
    begin
        input <= "1100110000111111";

        wait for 10 ps;

        input <= "1111111111111111";

        wait for 10 ps;
        wait;

    end process;

end testbench;