module addSub4(input op, input signed [3:0] a, input signed [3:0] b, 
               output signed [3:0] sum, output c_out);

wire [3:0] bop;

xor4 x1(b, {op,op,op,op}, bop);
adder4 a1(a, bop, op, sum, c_out);

endmodule