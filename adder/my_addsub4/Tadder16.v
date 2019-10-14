//MUX_tb
`timescale 1ns/10ps
`include "adder16.v"
`include "adder4.v"
`include "fulladder.v"

module Tadder16;

reg [15:0] a,b;
reg c_in;
wire [15:0] sum;
wire c_out;
wire [15:0]tf;

adder16 h(a,b,c_in,sum,c_out);
assign tf=a+b;

initial begin
a=16'd0;
b=16'd0;
c_in=1'b0;

$monitor($time," || a=%d | b=%d | s=%d | c=%b | ref=%d",a,b,sum,c_out,tf);
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
