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
