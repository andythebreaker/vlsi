module enable_sr(
input d,/*data*/
input e,/*enable*/
output q,
output p/*q bar*/);

//=======================
//use "nor" to do latch
//the thing that lay out with q is r
//and p is with s
//=======================


wire od,s,r;

not(od,d);
and(r,od,e);
and(s,e,d);
SR_latch_gate sr1(r,s,q,p);

endmodule
