module adder_16bit_b(A , B ,Add_ctrl , O , C_out , SUM);

input [15:0] A , B ;
input Add_ctrl;//1 for sub ,0 for add

output [15:00] SUM ;
output C_out ;
output O ;

//=============================================
//all reg name start with a is just the reg for output
//cuz i can't assign value directly
//reg ws is no use (function same as sum, but it's not being practiced)
//bp is B's 2's complement (if Add_ctrl is tirg.ed
//pn check if (1 RPS. true)
//-> add mod : occurs both A & B is in same signs
//-> sub mod : occurs A & B in different signs
//'e' & 'r' : just for making the code more concise
//=============================================

reg aC_out;
reg aO;
reg [16:0] idx;
reg ws;
reg [15:0] bp;
reg [15:0] aSUM;
assign e=A[15];//it's something like a wire
assign r=B[15];
assign O=aO;
assign C_out=aC_out;
assign SUM=aSUM;

always@(A or B or Add_ctrl)
begin
	aSUM=(Add_ctrl==0)?(A+B):(A-B);
	bp=(((Add_ctrl==1)?~B:B)+Add_ctrl);
	aC_out=1'b0;
	for(idx=0;idx<16;idx=idx+1)begin//I don't think that this is a porper way lol
		{aC_out,ws}={1'b0,bp[idx]}+{1'b0,A[idx]}+{1'b0,aC_out};
	end
end

reg pn;
always@(A or B or Add_ctrl)
#1 begin
	pn=(Add_ctrl==1)?(((e==0)&&(r==1))||((e==1)&&(r==0)))?1:0:(((e==0)&&(r==0))||((e==1)&&(r==1)))?1:0;
	aO=(pn==1)?(C_out==SUM[15])?0:1:0;
end  

endmodule

//github andythebreaker/vlsi
