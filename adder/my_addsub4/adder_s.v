module adder_16bit_s(A , B ,Add_ctrl , O , C_out , SUM);

input [15:00] A , B ;
input Add_ctrl;//1 for sub ,0 for add

output [15:00] SUM ;
output C_out ;
output O ;
  
  wire [15:0] contrast;

  /** your code **/
  xor x1(b,{Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl,Add_ctrl},contrast);
adder16 ()

endmodule
