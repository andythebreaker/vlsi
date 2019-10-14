//MUX_tb
//`timescale 1ns/10ps
`include "xor16.v"

module tytb;

reg [15:0] a,b;
wire [15:0] y;

xor16 x(a,b,y);

initial begin
#10
a=16'b1111111100000000;
b=16'b0000000000000000;
#10
$display("a=%b",a);
$display("b=%b",b);
$display("y=%b",y);
#10
b=16'b1111111111111111;
#10
$display("a=%b",a);
$display("b=%b",b);
$display("y=%b",y);
#10 $finish;
end

  initial begin
    //generate waveform
	$dumpfile("Wxor.vcd");
	$dumpvars;
  end
  
endmodule
