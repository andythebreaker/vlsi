move $t0, $zero   # i = $t0
move $t1, $zero   # sum = $t1		  	
move $t2, $zero	  # $t2: temp variable  	
addi $t2, $t2, 11 #	we compare $t2 with $t0(i), i.e i <= 10

loop:		
# write your code here
#for(i = 1; i <= 10; i++)
#sum = sum + i;

addi $t0, $t0, 1
Loop: 
     bne $t0, $t2, EXE
	 j Exit
EXE: add $t1, $t0, $t1 
	 addi $t0, $t0, 1
	 j  Loop
Exit: