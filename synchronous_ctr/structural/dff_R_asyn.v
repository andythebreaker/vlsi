module dff_R_asyn(input d,input clk,input clear,output q);
wire pc,ao,an;
rising_edge_trigger_ff retf(d,clk,pc);
or(ao,pc,clear);
not(an,clear);
and(q,an,ao);
endmodule
