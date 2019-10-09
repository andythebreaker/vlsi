module half_adder4(input signed [3:0] a, input b, 
              output signed [3:0] s, output c);
wire [3:0] o;
half_adder ha1 (a[0],b,s[0],o[0]);

endmodule
