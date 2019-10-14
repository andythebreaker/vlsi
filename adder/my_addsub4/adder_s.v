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
wire co,e,r,pn;//co can't be O!

  /** your code **/
  xor16 x1(B,{Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl},contrast);
half_adder16 ha1(contrast,Add_ctrl,comp2,co);
adder16 a1(A,comp2,0,SUM,C_out);
//assign O=(Add_ctrl==0)?(SUM[15]==1)?(C_out==1)?0:1:0:(A[15]==0)?(B[15]==1)?1:0:0;
assign e=A[15];
assign r=B[15];
assign pn=(Add_ctrl==1)?(((e==0)&&(r==1))||((e==1)&&(r==0)))?1:0:(((e==0)&&(r==0))||((e==1)&&(r==1)))?1:0;
assign O=(pn==1)?(C_out==SUM[15])?0:1:0;
endmodule
