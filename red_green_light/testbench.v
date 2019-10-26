`timescale 1ns/10ps
`define SNT 1000000000
`include "main_ltc.v"

module test_bench;

reg clk,N,rst;

wire J,P,C;

main_ltc N_main_ltc(
.J(J),
.P(P),
.C(C),
.clk(clk),
.N(N),
.rst(rst)
);

initial
begin
clk=0;
N=0;
#1 rst=1;
#1 rst=0;
end

//clock producer
always
begin
#SNT clk=~clk;
end

initial 
begin
$monitor($time," | J=%b | P=%b | C=%b",J,P,B);
end

reg Add_ctrl ;

wire [15:0] SUM;
wire C_out ;
wire O ;


reg [15:0] mem_A [9999:0] ;
reg [15:0] mem_B [9999:0] ;
reg mem_add_ctrl [9999:0] ;
reg [17:0] expect [9999:0] ;

reg    [16:0] error = 0;
integer i ;

initial 
begin
	$readmemh("A.txt", mem_A);
	$readmemh("B.txt", mem_B);
	$readmemh("Add_ctrl.txt", mem_add_ctrl);
	$readmemh("Result.txt", expect);
end


adder_16bit_b u_adder(        .A            (A        ),
                .B            (B        ),
                .Add_ctrl     (Add_ctrl ),
                .O            (O        ),
                .C_out        (C_out    ),
                .SUM          (SUM      )
);

initial 
begin

	for (i =0 ; i <= 9999; i = i + 1 )          
  begin
    A = mem_A[i] ;
	B = mem_B[i] ;
	Add_ctrl = mem_add_ctrl[i] ;
    
    #10;
    if (SUM !== expect[i][15:0])
        begin
           $display ("ERROR at time=%d(pattern%d): SUM(%h)!= expect(%h)",
                      $time, i+1, SUM, expect[i][15:0]);
           error = error + 1;
	end
		
    if (C_out !== expect[i][16])
	begin
           $display ("ERROR at time=%d(pattern%d): C_out(%b)!= expect(%b)", 
                      $time,  i+1, C_out, expect[i][16]);
           error = error + 1;
	end

    if ( O !== expect[i][17])
	begin
           $display ("ERROR at time=%d(pattern%d): O(%b)!= expect(%b)",
                      $time, i+1, O , expect[i][17]);
	    error = error + 1;
	end
    end

     if(error == 17'b0)
     begin
      $display ("=============================================================");
      $display ("Congratulation!, Your design PASSed all the test patterns ");
	  $display ("^     ^");
	  $display (" +++++");
      $display ("=============================================================");
      end
      else
      begin
      $display ("=================================================");
      $display ("There're %d errors in your design", error); 
      $display ("=================================================");
      end

	$finish ;
end

initial
begin
	$dumpfile("addS16_new.vcd");
	$dumpvars;
end
	
endmodule
