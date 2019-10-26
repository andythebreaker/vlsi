`timescale 1ns/1ps
`include "sub_bor5.v"
module Tsb5;

reg [4:0] inp;
reg s;
wire [4:0] a;
wire c;

sub_bor5 sb51(inp,s,a,c);

initial begin
inp = 5'd0;
s = 1'b0;
end

initial begin
$monitor("Time= %d | inp= %d | oup= %d",$time,inp,a);
end

always #10 begin
inp=inp+5'd1;
end

initial begin
#204 s=1;
#406 $finish;
end

initial begin
$dumpfile("scb.vcd");
$dumpvars;
end

endmodule
