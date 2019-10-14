module adder_16bit_b(A , B ,Add_ctrl , O , C_out , SUM);

input [15:00] A , B ;
input Add_ctrl;//1 for sub ,0 for add

output [15:00] SUM ;
output C_out ;
output O ;
  

/** your code **/
  wire [16:0] p16;
  assign p16=(Add_ctrl==0)?(A+B):(A-B);
  assign C_out=p16[16];
  assign SUM=p16[15:0];
  wire pn;
assign e=A[15];
assign r=B[15];
assign pn=(Add_ctrl==1)?(((e==0)&&(r==1))||((e==1)&&(r==0)))?1:0:(((e==0)&&(r==0))||((e==1)&&(r==1)))?1:0;
assign O=(pn==1)?(C_out==SUM[15])?0:1:0;
  
endmodule
