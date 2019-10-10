//MUX
//When you describe the top module ,you "must" follow the spec and do not increse/decrease the I/O pins by yourself
module MUX(Din1,Din2,Sel,Dout);
//define I/O pins
input  Din1;
input  Din2;
input  Sel ;
output Dout;
//define wires
wire Sel_ ,w1 ,w2;
//descibe your circuit
not (Sel_ ,Sel  );//make (derivative) a opposite sel, notice that orignal sel is needed too
and (w1   ,Din1 ,Sel  );//if sel = 1 -> "w1/Din1" goes
and (w2   ,Din2 ,Sel_ );//if sel = 0 -> "w2/Din2" goes
or  (Dout ,w1   ,w2   );
endmodule
