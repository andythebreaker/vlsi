`timescale 1ns/1ps
`include "latch.v"
module Tlatch;

reg s,r;
wire q,p;

SR_latch_gate l(s,r,q,p);

initial begin
s=1'b0;
r=1'b0;
#10 s=1'b1;
#10 s=1'b0;
#10 r=1'b1;
#10 r=1'b0;
#10 s=1'b1;
r=1'b1;
#10 s=1'b0;
r=1'b0;
#10 $finish;
end

initial begin
$monitor("Time= %d | s= %b | r= %b | q= %b | p= %b",$time,s,r,q,p);
end

initial begin
$dumpfile("Tlatch.vcd");
$dumpvars;
end

endmodule
