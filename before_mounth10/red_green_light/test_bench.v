`timescale 1us/10ns
`include "ltc.v"
`include "main_ltc.v"
`include "yg.v"
module test_bench;

parameter SNT = 1000000;//1 seconed
//=========Method of simulating time============
//SNT:
//timescale = 1 ns ;;; which is 10^-9 seconed
//so if i need 1 sec. then i need run 10^9 ns
//FIN:
//over all simulating time (how long after start do we need to cut it off)
//FINSNT:
//change FIN (in sec. unit) to "ns" (*10^9)
//HCY:
//If I want to get a wave with a period (wavelength) of 1, I will need a half-cycle 0.5 conversion interval.
//~
//because cycle of HCY is 1 sec. 
//it will cause timer to be not accurate
//UHC:
//make cycle into 1 us (10^6)
//==============================================
parameter FIN = 200;
parameter FINSNT = SNT * FIN;
parameter HCY = SNT / 2;
parameter UHC = HCY;
parameter HOW_LONG_TO_N = 0;
parameter disableN = 1;

integer i;

reg clk,N,rst;

wire Jy,Jg,Cy,Cg,Jr,Pr,Cr,Pg;

ltc nl(
.Jr(Jr),
.Pr(Pr),
.Cr(Cr),
.Jy(Jy),
.Cy(Cy),
.Jg(Jg),
.Pg(Pg),
.Cg(Cg),
.clk(clk),
.N(N),
.rst (rst)
);

initial
begin
clk=0;
N=0;
#1 rst=1;
#1 rst=0;
end

//clock producer
always
begin
#UHC clk=~clk;
end

initial
begin
#FINSNT $finish;
end

always
begin
for(i=0;i<HOW_LONG_TO_N;i=i+1)
begin
#SNT i=i+0;
end
N=(disableN)?0:1;
#3 N=0;
end

initial 
begin
$monitor($time," | N=%b | Jg=%b | Jy=%b | Jr=%b | Pg=%b | Pr=%b | Cg=%b | Cy=%b | Cr=%b",N,Jg,Jy,Jr,Pg,Pr,Cg,Cy,Cr);
end

initial
begin
$dumpfile("ltc.vcd");
$dumpvars;
end
endmodule
