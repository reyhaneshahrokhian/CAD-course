library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

PACKAGE array_type IS
    TYPE array_1d IS ARRAY(0 TO 7) OF integer;
END array_type;

library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.array_type.all;
entity array_mul is
    port(
        arr1 : in array_1d;
        arr2 : in array_1d;
        output : out integer
    );
end entity;

architecture arra_mul_arch of array_mul is
begin
    output <= arr1(0) * arr2(0) + arr1(1) * arr2(1) + arr1(2) * arr2(2) + arr1(3) * arr2(3) +
        arr1(4) * arr2(4) + arr1(5) * arr2(5) + arr1(6) * arr2(6) + arr1(7) * arr2(7);
end architecture;

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