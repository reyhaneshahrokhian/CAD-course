library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity q3 is
    port(
        input : in std_logic_vector(15 downto 0);
        output : out std_logic_vector(1 downto 0)
    );
end entity q3;

architecture Behavioral of q3 is
begin
    process(input)
        variable temp : unsigned(15 downto 0);
        variable odd : unsigned(3 downto 0) := "0000";
        variable even : unsigned(3 downto 0) := "0000";
    begin
        temp := unsigned(input);
        if temp(15) = '1' then
            even := even + "1";
        end if;
        if temp(13) = '1' then
            even := even + "1";
        end if;
        if temp(11) = '1' then
            even := even + "1";
        end if;
        if temp(9) = '1' then
            even := even + "1";
        end if;
        if temp(7) = '1' then
            even := even + "1";
        end if;
        if temp(5) = '1' then
            even := even + "1";
        end if;
        if temp(3) = '1' then
            even := even + "1";
        end if;
        if temp(1) = '1' then
            even := even + "1";
        end if;

        if temp(14) = '1' then
            odd := odd + "1";
        end if;
        if temp(12) = '1' then
            odd := odd + "1";
        end if;
        if temp(10) = '1' then
            odd := odd + "1";
        end if;
        if temp(8) = '1' then
            odd := odd + "1";
        end if;
        if temp(6) = '1' then
            odd := odd + "1";
        end if;
        if temp(4) = '1' then
            odd := odd + "1";
        end if;
        if temp(2) = '1' then
            odd := odd + "1";
        end if;
        if temp(0) = '1' then
            odd := odd + "1";
        end if;

        output <= "00";
        if (to_integer(odd) mod 5) = 0 then
            output(0) <= '1';
        end if;
        if (to_integer(even) mod 3) = 0 then
            output(1) <= '1';
        end if;

    end process;
end architecture Behavioral;

library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
entity test3 is
end test3;

architecture testbench of test3 is
    component q3 is
        port(
            input : in std_logic_vector(15 downto 0);
            output : out std_logic_vector(1 downto 0)
        );
    end component;

    signal input : std_logic_vector(15 downto 0);
    signal output : std_logic_vector(1 downto 0);

begin
    cal : q3 port map (input => input, output => output);
    process is
    begin
        input <= "1100110000111111";

        wait for 10 ps;

        input <= "1111111111111111";

        wait for 10 ps;
        wait;

    end process;

end testbench;