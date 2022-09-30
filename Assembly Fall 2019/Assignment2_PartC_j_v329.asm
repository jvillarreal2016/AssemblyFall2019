###########################################################################################
# Javier Villarreal, CS 2318-003, Assignment 2 Part 1 Program C
###########################################################################################
# Program allocates a global array that stores 4 integers and prints each element.
# The program will swap elements 0 & 3, 1 & 2, then reverse the array and print the array.
############################ data segment #################################################

		.data
intArray:	.word 2, 3, 1, 8		#global int array size

originalOutput:	.asciiz "Original output is : "
swappedOutput:	.asciiz "Swapped output is : "
nextLine:	.asciiz "\n"
		
############################# Code Segment ################################################
		.text
		.globl main		
main:
		li $v0, 4
		la $a0, originalOutput
		syscall
		
		la $t0, intArray
		li $v0, 1
		lw $a0, 0($t0)
		syscall
		lw $a0, 4($t0)
		syscall
		lw $a0, 8($t0)
		syscall
		lw $a0, 12($t0)
		syscall
		
		#Begins swapping element 0 & 3
		lw $t1, 0($t0)
		lw $t2, 12($t0)
		sw $t1, 12($t0)
		sw $t2, 0($t0)
		
		#Begins swapping element 1 & 2
		lw $t4, 4($t0)
		lw $t5, 8($t0)
		sw $t4, 8($t0)
		sw $t5, 4($t0)
		
		addi $v0, $zero, 4
		la $a0, nextLine
		syscall
		
		li $v0, 4
		la $a0, swappedOutput
		syscall
		 
		li $v0, 1
		lw $a0, 12($t0)
		syscall
		lw $a0, 8($t0)
		syscall
		lw $a0, 4($t0)
		syscall
		lw $a0, 0($t0)
		syscall
		
		li $v0, 10
		syscall
		  
		