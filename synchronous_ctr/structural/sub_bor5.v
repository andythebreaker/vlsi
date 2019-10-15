module sub_bor5(input [4:0] in,input s/*for subtractor*/,output [4:0] a/*for ans*/,output c/*borrow*/);
reg [3:0] tmp;
subtractor_borrow sb1(in[0],s,a[0],tmp[0]);
subtractor_borrow sb1(in[1],tmp[0],a[1],tmp[1]);
subtractor_borrow sb1(in[2],tmp[1],a[2],tmp[2]);
subtractor_borrow sb1(in[3],tmp[2],a[3],tmp[3]);
subtractor_borrow sb1(in[4],tmp[3],a[4],c);
endmodule
