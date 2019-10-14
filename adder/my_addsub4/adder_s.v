//`include "half_adder4.v";
//`include "adder16.v";
module adder_16bit_s(A , B ,Add_ctrl , O , C_out , SUM);

input [15:0] A , B ;
input Add_ctrl;//1 for sub ,0 for add

output [15:0] SUM ;
output C_out ;
output O ;
  
  wire [15:0] contrast;
wire [15:0] comp2;

  /** your code **/
  xor16 x1(B,{Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl},contrast);
half_adder16 ha1(contrast,Add_ctrl,comp2,co);
adder16 a1(A,comp2,0,SUM,C_out);

endmodule
