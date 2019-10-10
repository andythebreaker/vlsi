`include "fourBitAdder.v"
`timescale 1 ns / 1 ps
module test_bench_4bit;
reg [3:0] a,b;//in
reg c_in;//in
wire [3:0] sum;//out
wire c_out;//out
fourBitAdder ad4 (c_in,a,b,sum,c_out);
initial
begin : first_init
$display("=========This is a test bench of 4 bit ADDER=========");
$monitor($time," || a= %d | b= %d | c= %b | s= %d | OC= %b | (ERR:%d)",a,b,c_in,sum,c_out,error_code);
a=4'd0;
b=4'd0;
c_in=1'b0;
end// : first_init
integer error_code=1;

initial
begin : main_test
		integer i;
	for (i=0;i<16;i=i+1)
	begin : for_loop_for_a_big
	integer k;
	for (k=0;k<16;k=k+1)
	begin : F_loop_b_small

	#5 b=b+4'd1;
	if ((sum+c_out*16)==(i+k))
	error_code=error_code*1;
	else
	error_code=error_code*0;

	end// : F_loop_b_small
	
	a=a+4'd1;

	end// : for_loop_for_a_big
#5 if(error_code==0)
$display("ERROR!");
else
$display("OK!");
#5 $finish;
end// : main_test

//=================================================
//NOTAM:
//if u name a begin-end block with ":" mark behind "begin"
//do not put the same stuff behind "end" -> will cuz ERROR
//=================================================

initial
begin : out_wave
$dumpfile("fourBitAdder.vcd");
$dumpvars;
end// : out_wave
endmodule
