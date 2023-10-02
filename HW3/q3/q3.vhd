library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package Convolution_Package is
  type Pixel_Array is array (natural range <>) of integer range 0 to 255;
  type Filter_Array is array (natural range <>) of real range 0.0 to 1.0;
  type Feature_Map is array (natural range 0 to 29, natural range 0 to 29) of real range 0.0 to 255.0;

  function Convolution_Unit(Window: Pixel_Array; Filter: Filter_Array) return real;
  procedure Convolution_Layer(Input_Image: Pixel_Array; Filters: Filter_Array; Output_Map: out Feature_Map);
end package Convolution_Package;


entity Convolution_Unit is
  generic (
    WIDTH: integer := 3
  );
  port (
    Window: in Convolution_Package.Pixel_Array(0 to WIDTH-1);
    Filter: in Convolution_Package.Filter_Array(0 to WIDTH-1);
    Result: out real range 0.0 to 255.0
  );
end entity Convolution_Unit;

architecture behavioral of Convolution_Unit is
begin
  process(Window, Filter)
    variable Temp_Result: real range 0.0 to 255.0;
  begin
    Temp_Result := 0.0;
    for i in 0 to WIDTH-1 loop
      Temp_Result := Temp_Result + real(Window(i)) * Filter(i);
    end loop;
    Result <= Temp_Result / real(WIDTH);
  end process;
end architecture behavioral;

entity Convolution_Layer is
  generic (
    NUM_UNITS: integer := 1
  );
  port (
    Input_Image: in Convolution_Package.Pixel_Array(0 to 29, 0 to 29);
    Filters: in Convolution_Package.Filter_Array(0 to NUM_UNITS-1, 0 to 2, 0 to 2);
    Output_Map: out Convolution_Package.Feature_Map(0 to 29, 0 to 29)
  );
end entity Convolution_Layer;

architecture behavioral of Convolution_Layer is
  signal Windows: Convolution_Package.Pixel_Array(0 to NUM_UNITS-1, 0 to 2, 0 to 2);
  signal Results: Convolution_Package.Feature_Map(0 to 29, 0 to 29);
begin
  -- Generate the windows for each unit
  process (Input_Image, Filters)
  begin
    for i in 0 to NUM_UNITS-1 loop
      for j in 0 to 2 loop
        for k in 0 to 2 loop
          Windows(i, j, k) <= Input_Image(j, k);
        end loop;
      end loop;
    end loop;
  end process;

  -- Instantiate the Convolution_Units
  unit: for i in 0 to NUM_UNITS-1 generate
    Conv_Unit: entity work.Convolution_Unit
      generic map (
        WIDTH => 3
      )
      port map (
        Window => Windows(i),
        Filter => Filters(i),
        Result => Results(i+1, 1 to 28, 1 to 28)
      );
  end generate unit;

  -- Assign the results to the output map
  process (Results)
  begin
    for i in 0 to 29 loop
      for j in 0 to 29 loop
        if i = 0 or j = 0 or i = 29 or j = 29 then
          Output_Map(i, j) <= 0.0;
        else
          Output_Map(i, j) <= Results(1, i, j);
        end if;
      end loop;
    end loop;
  end process;
end architecture behavioral;
