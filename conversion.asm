# conversion.asm program
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
    li $v0, 0 # return value (z)


    li $t0, 0 #int i for the loop
    li $t1, 8 #for ending the loop

    li $t4, 2 #for if statement inside loop

    loop:
        beq $t0 $t1 jumpBack 

        mult $a0 $t1 #store value of x * 8 into $t2
        mflo $t2

        sub $v0 $v0 $t2 # subtract t2 from v0, store into v0
        add $v0 $v0 $a1 # add y to v0

        blt $a0 $t4 incX # if x < 2, branch to incrementX function

        sub $a1 $a1 1 #decrement Y by 1

        incX:
            addi $a0 1 # increment x by 1

        addi $t0 1 # increment counter by 1

        j loop

jumpBack:
    jr $ra

main:
	li $a0, 5
    li $a1, 7

    jal conv

	move $a0, $v0
    li $v0, 1
    syscall

exit:
    li $v0 10
    syscall
