module adder4(input signed [15:0] a, input signed [15:0] b, input c_in, 
              output signed [15:0] sum, output c_out);
wire [3:0] c;

adder4 a1(a[3:0],b[3:0],c_in,sum[3:0],c[0]);
  adder4 a2(a[7:4],b[7:4],c[0],sum[7:4],c[1]);
  adder4 a3(a[11:8],b[11:8],c[1],sum[11:8],c[2]);
  adder4 a4(a[15:12],b[15:12],c[2],sum[15:12],c_out);

endmodule
