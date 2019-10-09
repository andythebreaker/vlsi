module half_adder(input a, input b, 
              output s, output o);
and(o,a,b);//Cout
xor(s,a,b);//sum
endmodule
