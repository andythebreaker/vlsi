module SR_latch_gate (input R, input S, output Q,output Qbar);
nor (Q , R,Qbar);
nor(Qbar,S,Q);
endmodule
