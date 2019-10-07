Accroding to the codes from TA, you have to design the component of 16-bit adder/subtractor 

inputs
 
   A: augend/minuend
   B: addend/subtrahend
   Add_ctrl: 1/0 for subtractor/adder

outputs

   O: Overflow
   SUM: SUM
   C_out: C_out(C_out not equal to Overflow) 



假如你的critical path(delay 設定所造成的)所需要的時間大於20個基本單位
則可修改TA的testbench 第7行 去更改數值大小
此數值的目的是多久抓取你運算的結果
