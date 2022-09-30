#Javier Villarreal, 2318-003, Assignment 2 Part 1 Program

			.data
inputString:		.space 16			
intPrompt:		.asciiz "Enter integer: "
intMessage:		.asciiz "Your integer is "
stringPrompt:		.asciiz "Enter string: "
stringMessage:		.asciiz "Your string is "
charPrompt:		.asciiz "Enter character: "
charMessage:		.asciiz "Your character is "

			.text
			.globl main
main:
			
			li $v0,4
			la $a0, intPrompt
			syscall
			li $v0,5
			syscall
			move $t0, $v0			# copy integer read (in $v0) to $t0
			li $v0,4
			la $a0, intMessage
			syscall
			li $v0,1
			move $a0, $t0
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			
			li $v0,4
			la $a0, stringPrompt
			syscall
			li $v0, 8
			la $a0, inputString
			li $a1, 16
			syscall
			
			li $v0,4
			la $a0, stringMessage
			syscall
			li $v0,4
			la $a0, inputString
			syscall
						
			li $v0,4
			la $a0, charPrompt
			syscall
			li $v0,12
			syscall
			move $t0, $v0
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0,4
			la $a0, charMessage
			syscall
			li $v0,11
			move $a0, $t0
			syscall
			

			li $v0, 10			# graceful exit
			syscall
			
			
