.data
prompt: .asciiz "Enter n, followed by n lines of text:\n"
userInput: .space 20 #user is permitted to enter 20 characters

.globl main
.text
main:
    # user prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # getting the name of the user
    li $v0, 8
    la $a0, userInput
    li $a1, 20
    syscall 

    add $t1, $t0, $0      #t1 = string length
    strLength: 
        lbu   $t2, 0($t0)
        beq   $t2, $zero, Exit  # if reach the end of array, Exit
        addiu $t0, $t0,   1     # add 1 to count the length
        j strLength
    Exit:

    add $t1, $t0, $0      # t1 = string length
    li  $t2, 0            # counter i = 0

    li $v0, 11
    reverseString:
        slt  $t3, $t2, $t1    # if i < stringlength
        beq  $t3, $0,  Exit2  # if t3 reaches he end of the array
        addi $t0, $t0, -1     # decrement the array 
        lbu  $a0, 0($t0)      # load the array from the end
        syscall
        j reverseString
    Exit2:

    li $v0, 10
    syscall