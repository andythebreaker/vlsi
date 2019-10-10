`timescale 1 ns /1 ps
`include "fulladder.v"
module fourBitAdder(
	c_in,a,b,//in
	sum,c_out//out
);
//=============================================
//NOTAM:
//do not write:
//
//module fourBitAdder(
//	input c_in,a,b,
//	output sum,c_out
//);
//
//input [3:0] a,b;
//...~
//
//==> repeat announcement :: u can't do "input" on smae varib. two times
//<!will cause error>
//
//(2019.10.7)
//
//============================================= 
input [3:0] a,b;
input c_in;
output [3:0] sum;
output c_out;
wire f0Cout,f1Cout,f2Cout;
fulladder f0 (
.a(a[0]),
.b(b[0]),
.c_in(c_in),
.sum(sum[0]),
.c_out(f0Cout)
);
	fulladder f1 (
.a(a[1]),
.b(b[1]),
.c_in(f0Cout),
.sum(sum[1]),
.c_out(f1Cout)
);
	fulladder f2 (
.a(a[2]),
.b(b[2]),
.c_in(f1Cout),
.sum(sum[2]),
.c_out(f2Cout)
);
	fulladder f3 (
.a(a[3]),
.b(b[3]),
.c_in(f2Cout),
.sum(sum[3]),
.c_out(c_out)
);

endmodule
