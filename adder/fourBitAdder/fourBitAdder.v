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
fulladder f0 (
.a(),
.b(),
.c(),
.sum(),
.c_out()
);
	fulladder f0 (
.a(),
.b(),
.c(),
.sum(),
.c_out()
);
	fulladder f0 (
.a(),
.b(),
.c(),
.sum(),
.c_out()
);
	fulladder f0 (
.a(),
.b(),
.c(),
.sum(),
.c_out()
);

endmodule
