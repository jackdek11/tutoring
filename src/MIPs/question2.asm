.data
    prompt_1:    .asciiz "Enter a sum:\n"
    prompt_2:    .asciiz "The value is:\n"
    user_input:    .space 256        # string containing sum to calculate
    answer:    .byte 0        # integer answer
    position:    .byte 0
    currentValue: .byte 0
    null:        .asciiz ""
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

    # let $s0 point to position

    # $s1 points to currentValue

    # $s2 points to null

    # $s3 points to answer

    # $s4 points to user_input
    
    jar    calcSum    #1+2+3

    # print answer

calcSum:
    # if value at position is null character then we jump back to main
    # make position point to next +
    jar    findPlus
    # now we want to read in the number up to the position
    # store that in currentValue
    # add currentValue to answer
    

findPlus:
    # reads in bit at position
    
    # if it is a null character, TODO

    # if bit is plus
        # return position
    # else increment position and call findPlus
    

exit:
    li    $v0, 10
    syscall