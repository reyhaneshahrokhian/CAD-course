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
