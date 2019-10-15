module rising_edge_trigger_ff(input d,input clk ,output q);
wire p,n,un,uc;
not(n,clk);
enable_sr sr1(d,n,p,nu);
enable_sr sr2(p,clk,q,nc);
endmodule
