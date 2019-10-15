module ff5(input clk,input [4:0] d, output [4:0] q);
rising_edge_trigger_ff r1 (d[0],clk,q[0]);
rising_edge_trigger_ff r2 (d[1],clk,q[1]);
rising_edge_trigger_ff r3 (d[2],clk,q[2]);
rising_edge_trigger_ff r4 (d[3],clk,q[3]);
rising_edge_trigger_ff r5 (d[4],clk,q[4]);
endmodule


