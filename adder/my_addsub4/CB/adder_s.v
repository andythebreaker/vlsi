//need include a lot of things (all worte in "testbench")
module adder_16bit_s(A , B ,Add_ctrl , O , C_out , SUM);

input [15:0] A , B ;
input Add_ctrl;//1 for sub ,0 for add

output [15:0] SUM ;
output C_out ;
output O ;
  
wire [15:0] contrast;//
wire [15:0] comp2;
//===================
//co is no use
//'e' & 'r' is just for fast coding
//===================
wire co,e,r;//co can't be O!
wire p0,p1,p2,p3,p4,p5,p6;//for overflow part

xor16 x1(B,{Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl},contrast);//do B's 2's complement if necessary
half_adder16 ha1(contrast,Add_ctrl,comp2,co);
adder16 a1(A,comp2,0,SUM,C_out);//main add!

assign e=A[15];
assign r=B[15];

//overflow part
xor(p0,C_out,SUM[15]);
xor(p1,e,r);
not(p2,p1);
and(p3,Add_ctrl,p1);
not(p4,Add_ctrl);
and(p5,p2,p4);
or(p6,p5,p3);
and(O,p0,p6);

endmodule
