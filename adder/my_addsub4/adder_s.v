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
wire co,e,r;//co can't be O!
wire pn;
wire p0,p1,p2,p3,p4,p5,p6;
  /** your code **/
  xor16 x1(B,{Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl},contrast);
half_adder16 ha1(contrast,Add_ctrl,comp2,co);
adder16 a1(A,comp2,0,SUM,C_out);
//assign O=(Add_ctrl==0)?(SUM[15]==1)?(C_out==1)?0:1:0:(A[15]==0)?(B[15]==1)?1:0:0;

assign e=A[15];
assign r=B[15];

/*
assign pn=(Add_ctrl==1)?(((e==0)&&(r==1))||((e==1)&&(r==0)))?1:0:(((e==0)&&(r==0))||((e==1)&&(r==1)))?1:0;
assign O=(pn==1)?(C_out==SUM[15])?0:1:0;
*/
xor(p0,C_out,SUM[15]);
xor(p1,e,r);
not(p2,p1);
and(p3,Add_ctrl,p1);
not(p4,Add_ctrl);
and(p5,p2,p4);
or(p6,p5,p3);
and(O,p0,p6);


endmodule
