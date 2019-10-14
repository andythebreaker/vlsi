module xor16(input [15:0] a, input [15:0] b, output signed [15:0] y);
 // assign y = a ^ b;

	xor(y[0],a[0],b[0]);
	xor(y[1],a[1],b[1]);
	xor(y[2],a[2],b[2]);
	xor(y[3],a[3],b[3]);
	xor(y[4],a[4],b[4]);
	xor(y[5],a[5],b[5]);
	xor(y[6],a[6],b[6]);
	xor(y[7],a[7],b[7]);
	xor(y[8],a[8],b[8]);
	xor(y[9],a[9],b[9]);
	xor(y[10],a[10],b[10]);
	xor(y[11],a[11],b[11]);
	xor(y[12],a[12],b[12]);
	xor(y[13],a[13],b[13]);
	xor(y[14],a[14],b[14]);
	xor(y[15],a[15],b[15]);

endmodule
