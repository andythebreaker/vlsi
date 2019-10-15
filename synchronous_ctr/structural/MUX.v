module MUX(Din1,Din2,Sel,Dout);
input  [4:0] Din1;
input  [4:0] Din2;
input  Sel ;
output [4:0] Dout;

wire Sel_;
wire [4:0] w1 ,w2;

not (Sel_ ,Sel  );

and (w1[0]   ,Din1[0] ,Sel  );
and (w2[0]   ,Din2[0] ,Sel_ );
or  (Dout[0] ,w1[0]   ,w2[0]   );

and (w1[1]   ,Din1[1] ,Sel  );
and (w2[1]   ,Din2[1] ,Sel_ );
or  (Dout[1] ,w1[1]   ,w2[1]   );

and (w1[2]   ,Din1[2] ,Sel  );
and (w2[2]   ,Din2[2] ,Sel_ );
or  (Dout[2] ,w1[2]   ,w2[2]   );

and (w1[3]   ,Din1[3] ,Sel  );
and (w2[3]   ,Din2[3] ,Sel_ );
or  (Dout[3] ,w1[3]   ,w2[3]   );

and (w1[4]   ,Din1[4] ,Sel  );
and (w2[4]   ,Din2[4] ,Sel_ );
or  (Dout[4] ,w1[4]   ,w2[4]   );
endmodule
