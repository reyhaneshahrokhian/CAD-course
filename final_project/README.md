# Pioelined and NonPipelined Convolver
## Non-pipelined Convolver
![image](https://user-images.githubusercontent.com/47431356/106899375-88f4a380-670a-11eb-97c0-e16a582639f3.png)\
it convolves two matrices which are 7x7 array of 8-bit vectors. the output is a single 16-bit vector. the HMM unit multiplies the array with length 7 of 8-bit vectors to another array with the same format. each HMM outputs an array length 7 of 16-bit vectors. since we have seven HMMs, we have a big array length 49. in adderTree unit, we add them each 2 of them.\
you can use [mypack](https://github.com/idataaki/vhdl-projects/blob/main/non%20piplined%20convolver/vhd%20files/mypack.vhd) file to customize your datatype.

## Pipelined Convolver
![image](https://user-images.githubusercontent.com/47431356/106900900-5350ba00-670c-11eb-9a2e-8eec23216d90.png)\
It does the same thing, with the 7x7 matrix and a 7x1 array instead.\
it also has a register which works with the rising edge of the clock after each unit, to work pipeline.
