library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
entity test2 is
end test2;

architecture testbench of test2 is
    component SqrtCeil is
        port(
            input : in std_logic_vector(9 downto 0);
            output : out std_logic_vector(5 downto 0)
        );
    end component;

    signal input : std_logic_vector(9 downto 0);
    signal output : std_logic_vector(5 downto 0);

begin
    cal : SqrtCeil port map (input => input, output => output);
    process is
    begin
        input <= "0000010000";

        wait for 10 ps;

        input <= "0001110000";

        wait for 10 ps;
        wait;

    end process;

end testbench;