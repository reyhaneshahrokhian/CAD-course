library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

PACKAGE array_type IS
    TYPE array_2d IS ARRAY(0 TO 2, 2 DOWNTO 0) OF STD_LOGIC_VECTOR(3 DOWNTO 0);
END array_type;

library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use work.array_type.all;
entity array_sum is
    port(
        input_arr : in array_2d;
        output_sum : out integer
    );
end entity;

architecture array_sum_arch of array_sum is
begin
    output_sum <= to_integer(unsigned(input_arr(0, 0) + input_arr(0, 1) + input_arr(0, 2)+ input_arr(1, 0) + input_arr(1, 1) + input_arr(1, 2) +
               input_arr(2, 0) + input_arr(2, 1)+ input_arr(2, 2))); 
end architecture;

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