`timescale 1ns/1ps
`include "enable_sr.v"
`include "SR_latch_gate.v"
module Tes;

reg d,e;
wire q,p;

enable_sr es1(d,e,q,p);

initial begin
d=1'b0;
e=1'b0;
#10 d=1'b1;
#10 d=1'b0;
#10 e=1'b1;
#10 d=1'b1;
#10 e=1'b0;
#10 d=1'b0;
#10 e=1'b1;
#10 d=1'b1;
#10 $finish;
end

initial begin
$monitor("Time= %d | d= %b | e= %b | q= %b | p= %b",$time,d,e,q,p);
end

initial begin
$dumpfile("Tes.vcd");
$dumpvars;
end

endmodule
