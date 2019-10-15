`timescale 1ns/1ps
`include "synchronous_ctr_b.v"
module testbench;

reg ct,clk,cn,rst;
wire [5:0] op;

synchronous_ctr_b scb(clk,ct,cn,rst,op);

integer i,j;

initial begin
rst = 0;
clk = 0;
cn = 0;
ct = 0;
end

initial begin
$monitor("Time= %d | op= %d",$time,op);
end

always #10 begin
clk=~clk;
end

//raw test
/*
initial #5 begin
rst = 1;
#10 rst =0;
#10 cn=1;
#10 cn=0;
#10 cn=1;
#10 cn=0;
#10 $finish;
end
*/

initial begin
# 5 rst=1;
#10 rst =0;
for(j=0;j<2;j=j+1)
begin
	for(i=0;i<42;i=i+1)
	begin
		#10 cn=~cn;
	end
	ct=1;
	for(i=0;i<42;i=i+1)
	begin
		#10 cn=~cn;
	end
	ct=~ct;
end
//#10 $finish;
end

initial begin
#1000 rst=1;
#10 rst = 0;
#190 rst = 1;
#10 rst =0;
end

initial #1985 begin
for(j=0;j<50;j=j+1)
begin
//+4
#15 ct=0;
#15 for(i=0;i<8;i=i+1)
begin
#10 cn=~cn;
end
//-2
#10 ct=1;
#10 for(i=0;i<4;i=i+1)
begin
#10 cn=~cn;
end
//+8
#10 ct=0;
#10 for(i=0;i<16;i=i+1)
begin
#10 cn=~cn;
end
//-6
#10 ct=1;
#10 for(i=0;i<11;i=i+1)
begin
#10 cn=~cn;
end
end
#10 $finish;
end

initial begin
$dumpfile("scb.vcd");
$dumpvars;
end

endmodule
