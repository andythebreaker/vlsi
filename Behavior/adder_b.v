module adder_16bit_b(A , B ,Add_ctrl , O , C_out , SUM);

input [15:0] A , B ;
input Add_ctrl;//1 for sub ,0 for add

output [15:00] SUM ;
output C_out ;
output O ;
reg aC_out;
reg aO;
reg [16:0] idx;
reg ws;
reg [15:0] bp;
reg [15:0] aSUM;
assign e=A[15];
assign r=B[15];
assign O=aO;
assign C_out=aC_out;
assign SUM=aSUM;

/** your code **/

always@(A or B or Add_ctrl)
begin

aSUM=(Add_ctrl==0)?(A+B):(A-B);
bp=(((Add_ctrl==1)?~B:B)+Add_ctrl);
aC_out=1'b0;
for(idx=0;idx<16;idx=idx+1)begin
{aC_out,ws}={1'b0,bp[idx]}+{1'b0,A[idx]}+{1'b0,aC_out};
//$display("this is test : idx= %d | aO= %b",idx,aO);
end

end



reg pn;
always@(A or B or Add_ctrl)
#1 begin
pn=(Add_ctrl==1)?(((e==0)&&(r==1))||((e==1)&&(r==0)))?1:0:(((e==0)&&(r==0))||((e==1)&&(r==1)))?1:0;
aO=(pn==1)?(C_out==SUM[15])?0:1:0;
end  

endmodule
