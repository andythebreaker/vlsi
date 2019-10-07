`include "fulladder"
`timescale 1 ns / 1 ps
module test_bench;
reg a;
reg b;
reg c;
wire s;
wire co;
fulladder FA (a,b,c,s,co);
initial
begin
$display("=========This is a test bench of FULL ADDER=========");
$monitor($time," || a= %b | b= %b | c= %b | s= %b | os= %b",a,b,c,s,co);
a=1'b0;
b=1'b0;
c=1'b0;
#5 a=
end
//====================chart========================
//for all abc -> output S/C
//000->0/0
//001->1/0
//011->0/1
//111->1/1
//a|b|c/S-c
//000/0-0
//001/1-0
//010/1-0
//100/1-0
//011/0-1
//110/0-1
//101/0-1
//111/1-1
//============all we need to test==================
//always #50 begin
//if
endmodule
