module adder_16bit_b(A , B ,Add_ctrl , O , C_out , SUM);

input [15:00] A , B ;
input Add_ctrl;//1 for sub ,0 for add

output [15:00] SUM ;
output C_out ;
output O ;

/** your code **/
  assign SUM=(Add_ctrl==0)?(A+B):(A-B);
wire pn;
assign e=A[15];
assign r=B[15];
assign pn=(Add_ctrl==1)?(((e==0)&&(r==1))||((e==1)&&(r==0)))?1:0:(((e==0)&&(r==0))||((e==1)&&(r==1)))?1:0;
assign O=(pn==1)?(C_out==SUM[15])?0:1:0;
  
endmodule
