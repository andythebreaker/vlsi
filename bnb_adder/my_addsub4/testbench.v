`include "adder4.v"
`include "fulladder.v"
`include "xor4.v"
`include "addSub4.v"
`include "half_adder.v"
`include "half_adder4.v"
module testbench;
reg signed [3:0] a;
reg signed [3:0] b;
wire signed [4:0] sum;
reg op;
reg c_in;
wire c_out;
//wire signed [5:0] n;
//wire signed [4:0] num;
//wire 

addSub4 DUT (op, a, b,c_in, sum, c_out);

initial
begin
c_in=1'b0;
  a = 4'b0101;
  b = 4'b0000;
  op = 1'b0;
  $monitor("%dns monitor: op=%d a=%d b=%d Cin=%b sum=%d Cout=%b num=%d", $stime, op, a, b,c_in, sum,c_out,sum);
for()
end
//assign num[5] = ( op == 1'b0 ) ? 1'b0 : ( sum[3] == 1'b1 ) ? 1'b1 : 1'b0;
//assign num[4] = (op==1'b0)?c_out:;
//assign num[3:0] = sum;

//always #50 begin
  //op=op+1;
//end

//always #100 begin
  //b=b+1;
//end

//initial #5000 $finish;

endmodule
