`timescale 1ns/10ps
`define SNT 1000000000
`define L 10
`define S 3
`define DEBUG_CLK 1
module main_ltc(
output J,
output P,
output C,
input clk,
input N);

reg Jr,Pr,Cr;
assign J=Jr;
assign P=Pr;
assign C=Cr;
//===============Variable declaration===================
//C,J,P Three traffic lights
//If the logic of the above three variables is high, the vehicle/pedestrian in that direction can pass, that is, it may be green or yellow.
//clk : Clock (cycle = 1 Sec)
//N : change current state
//    that is:
//    if J can pass, then let P pass
//    P->C;C->J;
//=====================================================

/*DEL!!!prev_code
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
*/

//=========Annotated annotation============
//fi : means end of if
//=========================================

//~
reg [11:0] counter;
always@(posedge clk)
begin//always
if (Jr)
begin//J

//debug into case
if(DEBUG_CLK) $display("debug.info=always@pos[clk]!J_is_high");
//end of debug

if(counter<(L+S))//Here can be changed %%% if need change time relationship
begin//if
counter=counter+12'd1;
end//fi
else
begin//time up
counter=12'd0;
Jr=~Jr;
Pr=~Pr;
end//time up

end//J
else if (Pr)
begin//P

//debug into case
if(DEBUG_CLK) $display("debug.info=always@pos[clk]!P_is_high");
//end of debug

if(counter<(L-S))//Here can be changed %%% if need change time relationship
begin//if
counter=counter+12'd1;
end//fi
else
begin//time up
counter=12'd0;
Cr=~Cr;
Pr=~Pr;
end//time up

end//P
else if (Cr)
begin//C

//debug into case
if(DEBUG_CLK) $display("debug.info=always@pos[clk]!C_is_high");
//end of debug

if(counter<(L+2*S))//Here can be changed %%% if need change time relationship
begin//if
counter=counter+12'd1;
end//fi
else
begin//time up
counter=12'd0;
Jr=~Jr;
Cr=~Cr;
end//time up

end//C
else
begin//default

//debug into case
if(DEBUG_CLK) $display("ERROR.info=always@pos[clk]!got into default");
//end of debug

end//fi
end//always
//~

/*DEL!!!prev_code
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
*/

endmodule

//github andythebreaker/vlsi