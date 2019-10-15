`timescale 1ns/1ps
`include "SR_latch_gate.v"
`include "enable_sr.v"
`include "rising_edge_trigger_ff.v"
//`include "dff_R_asyn.v"
module Tretf;

reg d,clk;
wire q;

rising_edge_trigger_ff retf1(d,clk,q);

always #10 begin
clk=~clk;
end

initial begin
clk=0;
d=1'b0;
//clear=1'b0;
#15 d=1'b1;
#16 d=1'b0;
#20 d=1'b1;
#3 d=1'b0;
//#10 clear=1'b1;
//#10 clear=1'b0;
#10 $finish;
end

initial begin
$monitor("Time= %d | d= %b | q= %b",$time,d,q);
end

initial begin
$dumpfile("Tretf.vcd");
$dumpvars;
end

endmodule
