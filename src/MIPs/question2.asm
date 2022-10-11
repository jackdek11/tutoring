.data
    prompt_1:    .asciiz "Enter a sum:\n"
    prompt_2:    .asciiz "The value is:\n"
    user_input:  .space 256        # string containing sum to calculate
    answer:      .space 256        # integer answer
.text

.globl main

main:
    # prompt user to enter sum
    la    $a0, prompt_1
    li    $v0, 4
    syscall

    # get sum from user
    la    $a0, user_input
    li    $a1, 255
    li    $v0, 8
    syscall
    
    

exit:
    li    $v0, 10
    syscall