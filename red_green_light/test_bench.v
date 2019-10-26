`timescale 1ns/10ps
`include "main_ltc.v"

module test_bench;

parameter SNT = 1000000000;//1 seconed
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
//==============================================
parameter FIN = 100;
parameter FINSNT = SNT * FIN;
parameter HCY = SNT / 2;

reg clk,N,rst;

wire J,P,C;

main_ltc N_main_ltc(
.J(J),
.P(P),
.C(C),
.clk(clk),
.N(N),
.rst(rst)
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
#HCY clk=~clk;
end

initial
begin
#FINSNT $finish;
end

initial 
begin
$monitor($time," | J=%b | P=%b | C=%b",J,P,C);
end

endmodule
