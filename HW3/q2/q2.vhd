library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package Recursive_Functions is
    function BCD_to_Binary(BCD: in std_logic_vector) return std_logic_vector;
    function Binary_Reverser(Binary: in std_logic_vector) return std_logic_vector;

end Recursive_Functions;

package body Recursive_Functions is

    function BCD_to_Binary(BCD: in std_logic_vector) return std_logic_vector is
        variable Binary: std_logic_vector(BCD'length*4 - 1 downto 0);
    begin
        if BCD'length = 1 then
            Binary := "000" & BCD;
        else
            Binary := BCD_to_Binary(BCD(BCD'left-1 downto 0));
        end if;
        return Binary;
    end BCD_to_Binary;

    function Binary_Reverser(Binary: in std_logic_vector) return std_logic_vector is
        variable Reversed: std_logic_vector(Binary'length - 1 downto 0);
    begin
        if Binary'length = 1 then
            Reversed := Binary;
        else
            Reversed := Binary(Binary'left) & Binary_Reverser(Binary(Binary'left-1 downto 0));
        end if;
        return Reversed;
    end Binary_Reverser;

end Recursive_Functions;
