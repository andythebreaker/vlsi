module eq5(input [4:0] a,input [4:0] b,output s);
//=====================
//output = 1 if occurs a != b
//else s = o
//====================
wire [4:0] c;
wire [2:0] d;
xor(c[0],a[0],b[0]);
xor(c[1],a[1],b[1]);
xor(c[2],a[2],b[2]);
xor(c[3],a[3],b[3]);
xor(c[4],a[4],b[4]);
or(d[0],c[0],c[1]);
or(d[1],d[0],c[2]);
or(d[2],d[1],c[3]);
or(s,d[2],c[4]);
endmodule
