module half_adder4(input [3:0] a, input b, 
              output [3:0] s, output c);
  wire [2:0] o;
half_adder ha1 (a[0],b,s[0],o[0]);
  half_adder ha2 (a[1],b,s[1],o[1]);
  half_adder ha3 (a[2],b,s[2],o[2]);
  half_adder ha4 (a[3],b,s[3],c);
endmodule
