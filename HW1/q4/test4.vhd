library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use work.array_type.all;
entity test4 is
end test4;

architecture testbench of test4 is
    component array_mul is
        port(
            arr1 : in array_1d;
            arr2 : in array_1d;
            output : out integer
        );
    end component;

    signal arr1 : array_1d;
    signal arr2 : array_1d;
    signal output: integer;

begin
    cal : array_mul port map (arr1 => arr1, arr2 => arr2, output => output);
    process is
    begin
        arr1 <= (
            (0, 1, 2, 3, 4, 5, 6, 7)
        );
        arr2 <= (
            (1, 1, 1, 1, 1, 1, 1, 1)
        );

        wait for 10 ps;

        arr1 <= (
            (2, 2, 2, 2, 2, 2, 2, 2)
        );
        arr2 <= (
            (10, 10, 1, 1, 1, 1, 1, 1)
        );

        wait for 10 ps;
        wait;

    end process;

end testbench;