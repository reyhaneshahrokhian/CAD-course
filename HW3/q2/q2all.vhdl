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

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.Recursive_Functions.all;

entity test2 is
end test2;

architecture Behavioral of test2 is
    constant BCD_input: std_logic_vector(3 downto 0) := "0101";
    signal Binary_output: std_logic_vector(BCD_input'length*4 - 1 downto 0);
    signal Binary_reversed: std_logic_vector(BCD_input'length*4 - 1 downto 0);
begin

    process
    begin
        Binary_output <= BCD_to_Binary(BCD_input);
        Binary_reversed <= Binary_Reverser(Binary_output);
        wait for 1 ns;

        -- report "BCD Input: " & to_string(unsigned(BCD_input));
        -- report "Binary Output: " & to_string(unsigned(Binary_output));
        -- report "Reversed Binary: " & to_string(unsigned(Binary_reversed));
        
        wait;
    end process;

end Behavioral;
