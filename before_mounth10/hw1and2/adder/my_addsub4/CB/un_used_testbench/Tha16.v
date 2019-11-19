//MUX_tb
`timescale 1ns/10ps
`include "half_adder16.v"

module Tha16;

reg [15:0] a;
reg b;
wire [15:0] s;
wire c;

half_adder16 h(a,b,s,c);

initial begin
a=16'd0;
b=1'b0;
$monitor($time," || a=%b | b=%b | s=%b | c=%b",a,b,s,c);
end

always #10 begin
a=a+1'b1;
end

always #50 begin
b=~b;
end

initial # 5 begin
a=16'b1111111111111111;
b=1'b1;
# 500 $finish;
end
  initial begin
    //generate waveform
	$dumpfile("Wxor.vcd");
	$dumpvars;
  end
  
endmodule
