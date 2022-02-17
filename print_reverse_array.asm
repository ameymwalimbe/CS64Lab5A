# print_array.asm program
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	array: .word 1 2 3 4 5 6 7 8 9 10
	cout: .asciiz "The contents of the array in reverse order are:\n"
	newline: .asciiz "\n"

.text
printA:

	li $t2 1
	li $t4 4
	mult $a1 $t4
	mflo $t5
	sub $t5 $t5 $t4 #t5 has value 36 rn

	move $t3 $a0
	add $t3 $t3 $t5 #t3 should have value 36 now

	loop:
		blez $a1 exit

		lw $t1 0($t3) #load from array into t1
		li $v0 1
		move $a0 $t1 #move into arg to print
		syscall

		li $v0 4
		la $a0 newline
		syscall 

		sub $t3 $t3 4
		sub $a1 $a1 $t2
		j loop


main:
	li $v0, 4
	la $a0, cout
	syscall

	la $a0, array
	li $a1, 10

	jal printA

exit:
	li $v0 10
	syscall
	

