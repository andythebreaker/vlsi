module addSub4(input op, input signed [3:0] a, input signed [3:0] b,input c_in, 
               output signed [3:0] sum, output c_out);

wire [3:0] contrast;
wire [3:0] sum_withoutP;
wire  Cout_withoutP;
wire co;
xor4 x1(b, {op,op,op,op}, contrast);
adder4 a1(a, contrast, c_in, sum_withoutP, Cout_withoutP);
half_adder4 ha1(sum_withoutP,op,sum,co);
or(c_out,co,Cout_withoutP);

endmodule
