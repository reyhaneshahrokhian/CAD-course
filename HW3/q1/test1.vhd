library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use work.Complex_Matrix_Operations.all;

entity Test is
    generic (
        Matrix_Size1: natural := 3;
        Matrix_Size2: natural := 3
    );
end Test;

architecture Behavioral of Test is 
begin
process is
    variable Matrix1, Matrix2, Result: Complex_Matrix(0 to Matrix_Size1 - 1, 0 to Matrix_Size2 - 1);
begin
    Matrix1 := (
        (Complex'(1.0, 2.0), Complex'(3.0, 4.0), Complex'(5.0, 6.0)),
        (Complex'(7.0, 8.0), Complex'(9.0, 10.0), Complex'(11.0, 12.0)),
        (Complex'(13.0, 14.0), Complex'(15.0, 16.0), Complex'(17.0, 18.0))
    );
    
    Matrix2 := (
        (Complex'(1.0, 2.0), Complex'(3.0, 4.0), Complex'(5.0, 6.0)),
        (Complex'(7.0, 8.0), Complex'(9.0, 10.0), Complex'(11.0, 12.0)),
        (Complex'(13.0, 14.0), Complex'(15.0, 16.0), Complex'(17.0, 18.0))
    );

    Result := Add_Matrices(Matrix1, Matrix2);
    Print_Matrix(Result);
end process;
end Behavioral;
