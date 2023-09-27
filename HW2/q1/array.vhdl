library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

PACKAGE array_type IS
    TYPE array_2d IS ARRAY(9 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
END array_type;
