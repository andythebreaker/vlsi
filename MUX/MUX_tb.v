//MUX_tb
`timescale 1ns/10ps
`include "MUX.v"

module MUX_tb;
//define wires/ regs
reg  A;
reg  B;
reg  sel;
wire C;
integer i;
//verify automatically
wire j;
assign j=(sel)?A:B;

MUX MUX0(.Din1  (A)   ,
         .Din2  (B)   ,
		 .Sel   (sel) ,
		 .Dout  (C)   );
	 
  initial begin 
    // You must give every input an initial value.
    // Otherwise, the value of input will be unknown.
    /////////////
    //         //
       A=   0;
       B=   0;
       sel= 0;
    //         //
    /////////////

    #10 B  = 1;
    #10 sel= 1;
    #10 A  = 1;
	#20 $finish;//important
  end

  initial begin
   //monitor these signals
   $monitor ("%d,sel=%b,A=%b,B=%b,C=%b",$time,sel,A,B,C);
  end
  
  initial begin 
    for(i=0;i<4;i=i+1)
	    begin #1;
		    if(C==j)
			$display("                    Correct");
			else
			$display("                    Error!!!\nYou have to check your circuit.");
		#9;
		end
  end
  
  initial begin
    //generate waveform
	$dumpfile("MUX.vcd");
	$dumpvars;
  end
  
endmodule
