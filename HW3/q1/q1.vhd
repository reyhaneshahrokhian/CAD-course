library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.MATH_REAL.ALL;

package Complex_Matrix_Operations is
    type Complex is record
        real_part: real;
        imag_part: real;
    end record;
    type Complex_Matrix is array (natural range <>, natural range <>) of Complex;

    function Add_Matrices(Matrix1, Matrix2: Complex_Matrix) return Complex_Matrix;
    function Multiply_Matrices(Matrix1, Matrix2: Complex_Matrix) return Complex_Matrix;
    impure function rand_real return real;
    procedure Fill_Matrix_Random(Matrix: out Complex_Matrix);
    procedure Print_Matrix(Matrix: Complex_Matrix);

end Complex_Matrix_Operations;

package body Complex_Matrix_Operations is
    function Add_Matrices(Matrix1, Matrix2: Complex_Matrix) return Complex_Matrix is
        variable Result: Complex_Matrix(Matrix1'range(1), Matrix1'range(2));
    begin
        for i in Matrix1'range(1) loop
            for j in Matrix1'range(2) loop
                Result(i, j).real_part := Matrix1(i, j).real_part + Matrix2(i, j).real_part;
                Result(i, j).imag_part := Matrix1(i, j).imag_part + Matrix2(i, j).imag_part;
            end loop;
        end loop;
        return Result;
    end Add_Matrices;

    function Multiply_Matrices(Matrix1, Matrix2: Complex_Matrix) return Complex_Matrix is
        variable Result: Complex_Matrix(Matrix1'range(1), Matrix2'range(2));
        variable Temp: Complex;
    begin
        for i in Matrix1'range(1) loop
            for j in Matrix2'range(2) loop
                Temp.real_part := 0.0;
                Temp.imag_part := 0.0;
                for k in Matrix1'range(2) loop
                    Temp.real_part := Temp.real_part + Matrix1(i, k).real_part * Matrix2(k, j).real_part - Matrix1(i, k).imag_part * Matrix2(k, j).imag_part;
                    Temp.imag_part := Temp.imag_part + Matrix1(i, k).real_part * Matrix2(k, j).imag_part + Matrix1(i, k).imag_part * Matrix2(k, j).real_part;
                end loop;
                Result(i, j) := Temp;
            end loop;
        end loop;
        return Result;
    end Multiply_Matrices;

    impure function rand_real return real is
        variable r : real;
        variable seed1, seed2 : integer := 999;
      begin
        uniform(seed1, seed2, r);
        return r * real(100 - 1) + real(1);
      end function;

    procedure Fill_Matrix_Random(Matrix: out Complex_Matrix) is
        variable Random_Real: real;
        variable Random_Imag: real;
    begin
        for i in Matrix'range(1) loop
            for j in Matrix'range(2) loop
                Random_Real := rand_real;
                Random_Imag := rand_real;
                Matrix(i, j).real_part := Random_Real;
                Matrix(i, j).imag_part := Random_Imag;
            end loop;
        end loop;
    end Fill_Matrix_Random;

    procedure Print_Matrix(Matrix: Complex_Matrix) is
    begin
        for i in Matrix'range(1) loop
            for j in Matrix'range(2) loop
                report "Matrix(" & integer'image(i) & ", " & integer'image(j) & "): " & real'image(Matrix(i, j).real_part) & " + " & real'image(Matrix(i, j).imag_part) & "i";
            end loop;
        end loop;
    end Print_Matrix;

end Complex_Matrix_Operations;
