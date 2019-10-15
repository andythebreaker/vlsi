module sub_bor5(input [4:0] inp,input s/*for subtractor*/,output [4:0] a/*for ans*/,output c/*borrow*/);
wire [3:0] tmp;
subtractor_borrow sb1(inp[0],s,a[0],tmp[0]);
subtractor_borrow sb2(inp[1],tmp[0],a[1],tmp[1]);
subtractor_borrow sb3(inp[2],tmp[1],a[2],tmp[2]);
subtractor_borrow sb4(inp[3],tmp[2],a[3],tmp[3]);
subtractor_borrow sb5(inp[4],tmp[3],a[4],c);
endmodule
