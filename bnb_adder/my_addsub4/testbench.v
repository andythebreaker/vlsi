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
wire signed [4:0] n;
wire signed [4:0] num;

addSub4 DUT (op, a, b,c_in, sum, c_out);

initial
begin
c_in=1'b0;
  a = 4'b0101;
  b = 4'b0000;
  op = 1'b0;
  $monitor("%dns monitor: op=%d a=%d b=%d Cin=%b sum=%d Cout=%b num=%d", $stime, op, a, b,c_in, sum,c_out,num);

end
assign n = c_out ? 5'd16 : 5'd0;
assign num = n + sum;

always #50 begin
  op=op+1;
end

always #100 begin
  b=b+1;
end

initial #5000 $finish;

endmodule
