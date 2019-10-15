module D_latch_behavior (input D,input Enable,output Q,output Qbar);

always @ (D or Enable)
if(Enable)
begin
Q<=D;
Qbar<=~D;
end
endmodule
