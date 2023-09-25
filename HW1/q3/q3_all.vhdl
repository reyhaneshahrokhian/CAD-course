library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity q3 is
    port(
        A : in std_logic_vector(15 downto 0);
        output : out std_logic_vector(3 downto 0)
    );
end entity;

architecture q3_arch of q3 is
begin
    process(A)
    begin
        case A is
            when "0000000000000000" =>
            output <= "0000"; 
            when "0000000000000001" =>
            output <= "0001"; 
            when "0000000000000011" =>
            output <= "0010"; 
            when "0000000000000111" =>
            output <= "0011"; 
            when "0000000000001111" =>
            output <= "0100"; 
            when "0000000000011111" =>
            output <= "0101"; 
            when "0000000000111111" =>
            output <= "0110"; 
            when "0000000001111111" =>
            output <= "0111"; 
            when "0000000011111111" =>
            output <= "1000"; 
            when "0000000111111111" =>
            output <= "1001"; 
            when "0000001111111111" =>
            output <= "1010"; 
            when "0000011111111111" =>
            output <= "1011"; 
            when "0000111111111111" =>
            output <= "1100"; 
            when "0001111111111111" =>
            output <= "1101"; 
            when "0011111111111111" =>
            output <= "1110"; 
            when "0111111111111111" =>
            output <= "1111"; 
            when others =>
            output <= "0000";
        end case;
    end process;
end architecture;

library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;library ieee;
entity test3 is
end test3;

architecture testbench of test3 is
    component q3 is
        port(
            A : in std_logic_vector(15 downto 0);
            output : out std_logic_vector(3 downto 0)
        );
    end component;

    signal A : std_logic_vector(15 downto 0);
    signal output: std_logic_vector(3 downto 0);

begin
    cal : q3 port map (A => A, output => output);
    process is
    begin
        A <= "0000000000000011";

        wait for 10 ps;

        A <= "0000000000001111";

        wait for 10 ps;

        A <= "0000000011111111";

        wait for 10 ps;
        wait;

    end process;

end testbench;