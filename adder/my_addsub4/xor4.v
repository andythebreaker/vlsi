module xor4(input [3:0] a, input [3:0] b, output [3:0] y);
  //assign y = a ^ b;
	xor(y[0],a[0],b[0]);
	xor(y[1],a[1],b[1]);
	xor(y[2],a[2],b[2]);
	xor(y[3],a[3],b[3]);
endmodule
