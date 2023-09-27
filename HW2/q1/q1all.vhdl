library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

PACKAGE array_type IS
    TYPE array_2d IS ARRAY(9 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
END array_type;


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

library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use work.array_type.all;
entity test1 is
end test1;

architecture testbench of test1 is
    component sorter is
        port(
            input : in array_2d;
            output : out array_2d
        );
    end component;

    signal input : array_2d;
    signal output : array_2d;

begin
    cal : sorter port map (input => input, output => output);
    process is
    begin
        input <= (
            ("00010000","01000010","00000001","00010000","00011000","00011000","00010000","00100000","11000000","00011100") 
        );

        wait for 10 ps;
        wait;

    end process;

end testbench;