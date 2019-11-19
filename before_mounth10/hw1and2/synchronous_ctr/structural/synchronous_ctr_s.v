module synchronous_ctr_s(
input clk,
input ct,/*control | '0' -> '+' |  '1' -> '-'*/
input cn,/*count*/
input rst,
output [4:0] op
);
wire [4:0] iop;
ff5 f1(clk,iop,op);
wire p0;
eq5 e1(op,5'd0,p0);
wire [4:0] p1;
wire nc1;
sub_bor5 s1(op,cn,p1,nc1);
wire [4:0] p2;
MUX m1(p1,5'd0,p0,p2);
wire p3;
eq5 e2(op,5'd20,p3);
wire [4:0] p4;
wire nc2;
half_adder5 h5(op,cn,p4,nc2);
wire [4:0] p5;
MUX m2(p2,p4,p3,p5);
wire [4:0] p6;
MUX m3(p5,op,cn,p6);
MUX m4(5'd0,p6,rst,iop);
endmodule
