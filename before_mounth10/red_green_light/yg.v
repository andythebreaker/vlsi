`timescale 1ns/10ps

module yg(
input J,
input P,
input C,
input clk,
input N,
input rst,
output Jy,
output Jg,
output Cy,
output Cg);

reg Jyr,Jgr,Cyr,Cgr;
assign Jy=Jyr;
assign Jg=Jgr;
assign Cy=Cyr;
assign Cg=Cgr;

parameter UCY = 1;
parameter L = 10;
parameter S = 3;
//parameter DEBUG_CLK = 0;
parameter DEBUG_VIEW_TIME = 0;
parameter DEBUG_PRINT_COUNTER = 0;
//parameter DEBUG_ABLE_ERROR = 1;

//reg Jr,Pr,Cr,Nr,Nd;
//assign J=Jr;
//assign P=Pr;
//assign C=Cr;

//~
reg SPnp,SPjc,sp,SPprev,SPkill;//split
reg lck;
//~

//~

reg [11:0] counter;
reg [11:0] thcount;//count 1000


always@(rst)
begin
Jyr=0;
Jgr=0;
Cyr=0;
Cgr=0;

SPnp=0;
SPjc=0;
sp=0;
SPprev=0;
SPkill=0;
lck=0;

counter=12'd0;
thcount=12'd0;
//Jr=1;
//Pr=0;
//Cr=0;
//Nr=0;
//Nd=1;

end

//split


always@(posedge N or posedge P)
begin
SPnp=~SPnp;
end

always@(posedge J or posedge C)
begin
SPjc=~SPjc;
end

always@(SPnp or SPjc)
begin 
sp=1;
end

always@(negedge clk /*or posedge N*/)
begin
	if(SPkill)
	begin
		sp=0;
		SPkill=0;
		SPprev=sp;
	end
	else
	begin
		if(SPprev!=sp)
			begin
			 SPkill=1;
			end
		else
		SPprev=sp;
	end
end

always@(posedge clk or posedge N or posedge C or posedge J or posedge P)
begin//always

counter=(sp)?12'd0:counter;
thcount=(sp)?12'd0:thcount;
Jgr=(sp)?(J)?(lck)?0:1:0:Jgr;
Cgr=(sp)?(C)?(lck)?0:1:0:Cgr;
Jyr=(sp)?0:Jyr;
Cyr=(sp)?0:Cyr;
lck=(sp)?0:lck;

//Jyr=~Jyr;

if(N || lck)
	//debug.info
	begin//N
		//if(DEBUG_CLK) $display("debug.info=always@N||Nr! N=%b | Nr=%b",N,Nr);
/*
	counter=(sp)?12'd0:counter;
	thcount=(sp)?12'd0:thcount;
	Jgr=(sp)?(J)?1:0:Jgr;
	Cgr=(sp)?(C)?1:0:Cgr;
	Jyr=(sp)?0:Jyr;
	Cyr=(sp)?0:Cyr;
*/
	lck=1;
	Jyr=(J)?1:0;
	Cyr=(C)?1:0;
	Jgr=0;
	Cgr=0;
	
	/*	
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
	*/
	end//N
else if (J/*r*/)
begin//J

//debug into case
//if(DEBUG_CLK) $display("debug.info=always@pos[clk]!J_is_high");
//end of debug

if(counter<L)//Here can be changed %%% if need change time relationship
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

Jgr=0;
Jyr=1;
end//time up

end//J

/*

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

*/

else if (C/*r*/)
begin//C

//debug into case
//if(DEBUG_CLK) $display("debug.info=always@pos[clk]!C_is_high");
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
Cgr=0;
Cyr=1;
end//time up

end//C
else
begin//default

//debug into case
//if(DEBUG_CLK) $display("ERROR.info=always@pos[clk]!got into default");
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
