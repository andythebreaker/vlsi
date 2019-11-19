//MUX_tb
`timescale 1ns/10ps
`include "adder16.v"
`include "adder4.v"
`include "fulladder.v"
`include "xor16.v"
`include "half_adder.v"
`include "half_adder4.v"
`include "half_adder16.v"

module Tas16;

reg [15:0] a,b;
reg m;

wire [15:0] s;
wire o,c;
wire [15:0]tf;

adder_16bit_s as(a,b,m,o,c,s);
assign tf=a+b;

initial begin
a=16'd0;
b=16'd0;
m=1'b0;

$monitor($time," || a=%d | b=%d | s=%d | c=%b | ref=%d",a,b,s,c,tf);
end

always #10 begin
a=a+1'b1;
end

always #50 begin
b=b+1'b1;
end

initial # 5 begin
//a=16'b1111111111111111;
//b=1'b1;
# 5000 $finish;
end
  initial begin
    //generate waveform
	$dumpfile("Wxor.vcd");
	$dumpvars;
  end
  
endmodule
