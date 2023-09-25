library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;library ieee;
entity test2 is
end test2;

architecture testbench of test2 is
    component ALU is
        port(
            A : in std_logic_vector(1 downto 0);
            B : in std_logic_vector(1 downto 0);
            control : in std_logic_vector(1 downto 0);
            output : out integer
        );
    end component;

    signal A : std_logic_vector(1 downto 0);
    signal B : std_logic_vector(1 downto 0);
    signal control : std_logic_vector(1 downto 0);
    signal output: integer;

begin
    cal : ALU port map (A => A, B => B, control => control, output => output);
    process is
    begin
        A <= "10";
        B <= "01";
        control <= "00";

        wait for 10 ps;

        A <= "10";
        B <= "01";
        control <= "01";

        wait for 10 ps;

        A <= "10";
        B <= "01";
        control <= "10";

        wait for 10 ps;

        A <= "10";
        B <= "01";
        control <= "11";

        wait for 10 ps;
        wait;

    end process;

end testbench;