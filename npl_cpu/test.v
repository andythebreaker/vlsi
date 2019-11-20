`timescale 10ns/1ns
module test;
reg[3:0] memory[0:7];//八個大小為4的記憶體
reg[4:0] n;
initial
	begin
		$readmemb("file1.txt",memory); //讀file1.txt中中數字到memory
	for(n=0;n<=7;n=n+1)   //把8個mem都讀出來，(空接會存成X)
		$display("%b",memory[n]);
	end
endmodule
/*長這樣
1111
1111
1111
1111
1111
1111
1111
1111
*/
