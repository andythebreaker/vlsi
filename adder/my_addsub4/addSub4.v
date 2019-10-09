module addSub4(input op, input signed [3:0] a, input signed [3:0] b,input c_in, 
               output signed [3:0] sum, output c_out);

wire [3:0] contrast;
wire [3:0] sum_withoutP;
wire [3:0] Cout_withoutP;

xor4 x1(b, {op,op,op,op}, contrast);
adder4 a1(a, contrast, c_in, sum_withoutP, Cout_withoutP);

adder4 a2(sum_withoutP,

endmodule
