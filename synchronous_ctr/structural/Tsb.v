`timescale 1ns/1ps
`include "subtractor_borrow.v"
module Tsb;

reg targ,sub;
wire out,bor;

subtractor_borrow sb1(targ,sub,out,bor);

initial begin
targ=1'b0;
sub=1'b0;
#10 targ=1'b1;
#10 sub=1'b1;
#10 targ=1'b0;
#10 $finish;
end

initial begin
$monitor("Time= %d | targ= %b | sub= %b | out= %b | bor= %b",$time,targ,sub,out,bor);
end

initial begin
$dumpfile("Tsb.vcd");
$dumpvars;
end

endmodule
