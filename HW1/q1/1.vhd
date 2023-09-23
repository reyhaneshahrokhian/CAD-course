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
