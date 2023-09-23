library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;library ieee;
use work.array_type.all;
entity test1 is
end test1;

architecture testbench of test1 is
    component array_sum is
        port(
            input_arr : in array_2d;
            output_sum : out integer
        );
    end component;

    signal input_arr : array_2d;
    signal output_sum : integer;

begin
    cal : array_sum port map (input_arr => input_arr, output_sum => output_sum);
    process is
    begin
        input_arr <= (
            ("0001","0001","0000"),
            ("0001","0001","0001"),
            ("0000","0001","0001")  
        );

        wait for 10 ps;

        input_arr <= (
            ("0001","0010","0001"),
            ("0000","0001","0001"),
            ("0000","0010","0010")  
        );

        wait for 10 ps;

        input_arr <= (
            ("0000","0010","0001"),
            ("0001","1001","0000"),
            ("0001","0000","0000")  
        );

        wait for 10 ps;
        wait;

    end process;

end testbench;
