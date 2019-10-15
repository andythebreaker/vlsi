module half_adder5(input [4:0] a, input b, 
              output [4:0] s,output c);
  wire [3:0] o;
half_adder ha1 (a[0],b,s[0],o[0]);
  half_adder ha2 (a[1],o[0],s[1],o[1]);
  half_adder ha3 (a[2],o[1],s[2],o[2]);
  half_adder ha4 (a[3],o[2],s[3],o[3]);
half_adder ha5 (a[4],o[3],s[4],c);
endmodule
