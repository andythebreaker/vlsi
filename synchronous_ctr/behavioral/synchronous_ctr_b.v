module synchronous_ctr_b(
input clk,
input ct,/*control | '0' -> '+' |  '1' -> '-'*/
input cn,/*count*/
input rst,
output [5:0] op
);

reg [5:0] rop;
assign op=rop;

always@(posedge clk or posedge rst)
begin
rop=(rst==1)?5'd0:(cn==1)?(ct==0)?(rop==5'd20)?5'd20:(rop+cn):(rop==5'd0)?5'd0:rop-cn:rop;
end

endmodule
