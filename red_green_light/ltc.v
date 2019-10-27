//`timescale 1ns/10ps

module ltc(
output Jr,
output Pr,
output Cr,
output Jy,
output Cy,
output Jg,
output Pg,
output Cg,
input clk,
input N,
input rst
);
wire J,P,C,Jyw,Jgw,Cyw,Cgw;
main_ltc nm(
.J(J),
.P(P),
.C(C),
.clk(clk),
.N(N),
.rst(rst)
);
yg ny(
.J(J),
.P(P),
.C(C),
.clk(clk),
.N(N),
.Jy(Jyw),
.Jg(Jgw),
.Cy(Cyw),
.Cg(Cgw)
);
assign Pr=~P;
assign Pg=P;
assign Jy = Jyw;
assign Jg = Jgw;
assign Cy = Cyw;
assign Cg = Cgw;
assign Jr=(Jyw)?0:(Jgw)?0:1;
assign Cr= (Cyw)?0:(Cgw)?0:1;
endmodule
