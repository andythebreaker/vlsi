`timescale 1ns/1ps
`include "eq5.v"
module Teq5;

reg [4:0] a,b;
wire s;

eq5 e(a,b,s);

initial begin
a=5'd0;
b=5'd0;
#10 a=5'd20;
b=5'd20;
#10 a=5'd19;
#10 b=5'd0;
#10 a=5'd0;
#10 $finish;
end

initial begin
$monitor("Time= %d | a= %d | b= %d | s= %b",$time,a,b,s);
end

initial begin
$dumpfile("Teq5.vcd");
$dumpvars;
end

endmodule
