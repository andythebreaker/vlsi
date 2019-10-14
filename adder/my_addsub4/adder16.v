module adder4(input signed [15:0] a, input signed [15:0] b, input c_in, 
              output signed [15:0] sum, output c_out);
wire [3:0] c;

adder4 a1(a[3:0],b[3:0],c_in,sum[3:0],c[0]);

endmodule
