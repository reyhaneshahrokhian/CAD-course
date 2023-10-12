library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use work.array_type.all;

entity sorter is
    port(
        input : in array_2d;
        output : out array_2d
    );
end entity;

architecture sorter_arch of sorter is
begin
    process(input)
        variable temp : array_2d;
        variable swap : boolean;
    begin
        temp := input;

        for i in 0 to 8 loop
            swap := false;
            
            for j in 0 to 8-i loop
                if temp(j+1) < temp(j) then
                    temp(j+1) := temp(j+1) xor temp(j);
                    temp(j) := temp(j+1) xor temp(j);
                    temp(j+1) := temp(j+1) xor temp(j);
                    swap := true;
                end if;
            end loop;
            
            if not swap then
                exit;
            end if;
        end loop;

        output <= temp;
    end process;
end architecture;