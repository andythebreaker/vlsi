//`timescale 1ns/10ps

module main_ltc(
output J,
output P,
output C,
input clk,
input N,
input rst);

//parameter SNT = 1000000000;
parameter UCY = 1000;//require clock cycle = 1 us
//==================count clock======================
//count 1000 clock of us make 1 sec.
//===================================================
parameter L = 10;
parameter S = 3;
parameter DEBUG_CLK = 0;
parameter DEBUG_VIEW_TIME = 0;
parameter DEBUG_PRINT_COUNTER = 0;
parameter DEBUG_ABLE_ERROR = 1;

reg Jr,Pr,Cr,Nr,Nd;
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

//=========Annotated annotation============
//fi : means end of if
//=========================================

//~

reg [11:0] counter;
reg [11:0] thcount;//count 1000

always@(rst)
begin
counter=12'd0;
thcount=12'd0;
Jr=1;
Pr=0;
Cr=0;
Nr=0;
Nd=1;
end

always@(posedge clk or posedge N)
begin//always
if(N || Nr)
	//debug.info
	begin//N
		if(DEBUG_CLK) $display("debug.info=always@N||Nr! N=%b | Nr=%b",N,Nr);
		Nr=(Nd)?N:Nr;
		thcount=(Nd)?12'd0:thcount;
		counter=(Nd)?12'd0:counter;
		Nd=0;
		if(Pr)
			begin
				Pr=~Pr;
				Cr=~Cr;
				Nr=0;
				Nd=1;
				counter=12'd0;
				thcount=12'd0;
			end
		else if(counter<S)
			begin//if(S)
				if(thcount<UCY)//if(ucy)
					thcount=thcount+12'd1;
				else//else(ucy)
					begin//else(ucy)
						thcount=12'd0;
						counter=counter+12'd1;
					end//else(ucy)
			end
		else//if(s)
			begin//s
				if(Jr)
					begin//jr
						Cr=0;
						Pr=1;
						Jr=0;
					end//jr
				else if(Cr)
					begin//cr
						Jr=1;
						Pr=0;
						Cr=0;
					end//cr
				else//error!
					if(DEBUG_ABLE_ERROR) $display("ERROR.info=@N[Jr,Cr](all!=1)!");
				Nr=0;
				Nd=1;
				counter=12'd0;
				thcount=12'd0;
			end//s
	end//N
else if (Jr)
begin//J

//debug into case
if(DEBUG_CLK) $display("debug.info=always@pos[clk]!J_is_high");
//end of debug

if(counter<(L+S))//Here can be changed %%% if need change time relationship
begin//if
if (thcount<UCY)//count to 1000
thcount=thcount+12'd1;
else
begin//ct 1000
counter=counter+12'd1;
thcount=12'd0;
end//end 1000
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
if (thcount<UCY)//count to 1000
thcount=thcount+12'd1;
else
begin//ct 1000
counter=counter+12'd1;
thcount=12'd0;
end//end 1000
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
if (thcount<UCY)//count to 1000
thcount=thcount+12'd1;
else
begin//ct 1000
counter=counter+12'd1;
thcount=12'd0;
end//end 1000
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

//view time
if(DEBUG_VIEW_TIME) $display($time);
if(DEBUG_PRINT_COUNTER) $display("%d",counter);
//end debug

end//always
//~

endmodule

//github andythebreaker/vlsi
