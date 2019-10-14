module addSub4(input op, input signed [3:0] a, input signed [3:0] b,input c_in, 
               output signed [3:0] sum, output c_out);

wire [3:0] contrast;
wire [3:0] comp2;
//wire  Cout_withoutP;
wire co;
xor4 x1(b, {op,op,op,op}, contrast);
half_adder4 ha1(contrast,op,comp2,co);
adder4 a1(a, comp2, c_in, sum,c_out);

//and(c_out,co,Cout_withoutP);
//2comp no dot over flow
endmodule
