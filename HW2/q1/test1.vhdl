library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use work.array_type.all;
entity test1 is
end test1;

architecture testbench of test1 is
    component sorter is
        port(
            input : in array_2d;
            output : out array_2d
        );
    end component;

    signal input : array_2d;
    signal output : array_2d;

begin
    cal : sorter port map (input => input, output => output);
    process is
    begin
        input <= (
            ("00010000","01000010","00000001","00010000","00011000","00011000","00010000","00100000","11000000","00011100") 
        );

        wait for 10 ps;
        wait;

    end process;

end testbench;