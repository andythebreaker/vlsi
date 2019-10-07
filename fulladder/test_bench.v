module test_bench;
reg a;
reg b;
reg c;
wire s;
wire co;
fulladder FA (a,b,c,s,co);
initial
begin
$display("=========This is a test bench of FULL ADDER=========");
$monitor($time," || a= %b | b= %b | c= %b | s= %b | os= %b",a,b,c,s,co);
a=1'b0;
b=1'b0;
c=1'b0;
end
//always #50 begin
//if
endmodule
