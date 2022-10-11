# Store the first input in a register


#
# question1.asm
#

	.data
input:	.space	256
output:	.space	256

	.text
	.globl main
main:
	li	$v0, 8			# Ask the user for the string they want to reverse
	la	$a0, input		# We'll store it in 'input'
	li	$a1, 256		# Only 256 chars/bytes allowed
	syscall
	
	li	$v0, 4			# We output the string to verify
	la	$a0, input
	syscall
	
	jal	strlen			# JAL to strlen function, saves return address to $ra
	
	add	$t1, $zero, $v0		# Copy some of our parameters for our reverse function
	add	$t2, $zero, $a0		# We need to save our input string to $t2, it gets
	add	$a0, $zero, $v0		# butchered by the syscall.
	li	$v0, 1			# This prints the length that we found in 'strlen'
	syscall