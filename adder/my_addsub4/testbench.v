`include "adder4.v"
`include "fulladder.v"
`include "xor4.v"
`include "addSub4.v"
`include "half_adder.v"
`include "half_adder4.v"
module testbench;
reg signed [3:0] a;
reg signed [3:0] b;
wire signed [3:0] sum;
reg op;
reg c_in;
wire c_out;

addSub4 DUT (op, a, b,c_in, sum, c_out);

initial
begin
c_in=1'b0;
  a = 4'b0101;
  b = 4'b0000;
  op = 1'b0;
end

always #50 begin
  op=op+1;
  $monitor("%dns monitor: op=%d a=%d b=%d Cin=%b sum=%d Cout=%b num=%d", $stime, op, a, b,c_in, sum,c_out,(c_out*16+sum));
end

always #100 begin
  b=b+1;
end

initial #2050 $finish;

endmodule
