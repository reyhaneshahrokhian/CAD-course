library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Convolution_Layer.all;

library std;
use std.textio.all;

entity Testbench is
end entity Testbench;

architecture behavioral of Testbench is
  file Output_File: text open write_mode is "output.txt";
  variable Line: line;
  variable Value: real;
begin
  process
    variable Image: Convolution_Package.Pixel_Array(0 to 29, 0 to 29) := (others => (others => 0));
    variable Filter: Convolution_Package.Filter_Array(0 to 27, 0 to 2, 0 to 2) := (others => (others => (others => 0.0)));
    variable Feature_Map: Convolution_Package.Feature_Map(0 to 29, 0 to 29);
  begin
    Convolution_Layer: entity work.Convolution_Layer
      generic map (
        NUM_UNITS => 28
      )
      port map (
        Input_Image => Image,
        Filters => Filter,
        Output_Map => Feature_Map
      );
    for i in 0 to 29 loop
      for j in 0 to 29 loop
        write(Line, real'image(Feature_Map(i, j)));
        writeline(Output_File, Line);
      end loop;
    end loop;

    file_close(Output_File);
    wait;
  end process;
end architecture behavioral;
