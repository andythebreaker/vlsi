module subtractor_borrow(input targ,input sub,output out,output bor);
xor(out,targ,sub);
and (bor,sub,out);
endmodule
