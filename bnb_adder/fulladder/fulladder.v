`timescale 1 ns / 1 ps
module fulladder (input a,b,c_in,output sum,c_out);
wire s1,c1,c2;
xor(s1,a,b);
xor(sum,s1,c_in);
and(c1,a,b);
and(c2,s1,c_in);
xor(c_out,c1,c2);
endmodule
