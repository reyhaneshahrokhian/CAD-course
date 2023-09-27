library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity SqrtCeil is
    port(
        input : in std_logic_vector(9 downto 0);
        output : out std_logic_vector(5 downto 0)
    );
end entity SqrtCeil;

architecture Behavioral of SqrtCeil is
begin
    process(input)
        variable temp : unsigned(11 downto 0);
        variable result : unsigned(5 downto 0) := "000001";
        variable square : unsigned(11 downto 0);
    begin
        temp := ("00" & unsigned(input));

        for i in to_integer(temp) downto 0 loop
            result := result + "1";
            square := result * result;
            
            if square > temp then
            
                result := result - "1";
            end if;
        end loop;
        square := result * result;
        if square < temp then
            result := result + "1";
        end if;

        output <= std_logic_vector(result);
    end process;
end architecture Behavioral;
