module dff_R_asyn(input d,input clk,input clear,output q);
wire no_use,pc,ao,an;
enable_sr es1(d,clk,pc,no_use);
or(ao,pc,clear);
not(an,clear);
and(q,an,ao);
endmodule
