library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity ALU is
    port(
        A : in std_logic_vector(1 downto 0);
        B : in std_logic_vector(1 downto 0);
        control : in std_logic_vector(1 downto 0);
        output : out integer
    );
end entity;

architecture ALU_arch of ALU is
begin
    process(A, B, control)
    begin
        case control is
            when "00" =>
            output <= to_integer(unsigned(A + B)); 
            when "01" =>
            output <= to_integer(unsigned(A - B));
            when "10" =>
            output <= to_integer(unsigned(A and B));
            when "11" =>
            output <= to_integer(unsigned(A or B));
            when others =>
            output <= 0;
        end case;
    end process;
end architecture;