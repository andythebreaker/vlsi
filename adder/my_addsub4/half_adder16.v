module half_adder16(input [15:0] a, input b, 
              output [15:0] s,output c);
  wire [2:0] o;
half_adder4 ha1 (a[3:0],b,s[3:0],o[0]);
  half_adder4 ha2 (a[7:4],o[0],s[7:4],o[1]);
  half_adder4 ha3 (a[11:8],o[1],s[11:8],o[2]);
  half_adder4 ha4 (a[15:12],o[2],s[15:12],c);
endmodule
