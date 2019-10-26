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
input N,
input rst);

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

//=========Annotated annotation============
//fi : means end of if
//=========================================

//~

reg [11:0] counter;
always@(rst)
begin
counter=12d'0;
Jr=0;
Pr=0;
Cr=0;
end

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

endmodule

//github andythebreaker/vlsi
