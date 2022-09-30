##########################################################################
# <your name>, CS 2318-00?, Assignment 2 Part 1 Program B
############################
# prompt user to enter 2 alphabets (letters), read the alphabets, and
# display if the characters differ case insensitively by 0 or non-0 amount
############################ data segment ################################
			.data
outputLegend1:		.asciiz "case-insensitively identical if differ by 0, \n"
outputLegend2:		.asciiz "case-insensitively different if differ by 1 or more\n"
inputPrompt1:		.asciiz "Enter 1st alphabet (letter): "
inputPrompt2:		.asciiz "Enter 2nd alphabet (letter): "
outputLabel:		.asciiz "Alphabets entered case-insensitively differ by "
############################ code segment ################################
			.text
			.globl main
main:
			li $v0, 4
			la $a0, outputLegend1        
			syscall			# print output legend part 1
			la $a0, outputLegend2        
			syscall			# print output legend part 2
			la $a0, inputPrompt1        
			syscall			# print 1st alphabet prompt
			li $v0, 12
			syscall			# read 1st alphabet input
			move $t1, $v0		# save 1st alphabet read in $t1
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0, 4
			la $a0, inputPrompt2        
			syscall			# print 2nd alphabet prompt
			li $v0, 12
			syscall			# read 2nd alphabet input
			move $t2, $v0		# save 2nd alphabet read in $t2
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0, 4
			la $a0, outputLabel        
			syscall			# print output label

			li $v0, 1

			##########################################################
			# Insert NO MORE THAN 4 lines of code that involve ONLY 
			#   bit manipulating instructions (ANDing, ORing, XORing,
			#   NORing and shifting - only whatever that are needed)
			# so that the program will work just like the sample runs 
			# shown at the bottom (some blank lines edited out).
			# HINT: Risking telling the obvious, the instructions you
			#       insert are to cause content of $a0 to become the
			#       desired value (0 or non-0) when printed as integer.
			# You MUST test your completed program for AT LEAST the 
			# test cases shown (and include the result in hardcopy).
			##########################################################
			
			ori $a0, $t1, 0x20
			ori $a1, $t2, 0x20
			xor $a0, $a1, $a0 
			
			
			syscall			# display desired output
			
	                ##########################################################
                                                
			li $v0, 10		# exit gracefully
                	syscall
			
########################## sample test runs ##############################
# case-insensitively identical if differ by 0, 
# case-insensitively different if differ by 1 or more
# Enter 1st alphabet (letter): a
# Enter 2nd alphabet (letter): A
# Alphabets entered case-insensitively differ by 0
# -- program is finished running --
# 
# Reset: reset completed.
# 
# case-insensitively identical if differ by 0, 
# case-insensitively different if differ by 1 or more
# Enter 1st alphabet (letter): Z
# Enter 2nd alphabet (letter): z
# Alphabets entered case-insensitively differ by 0
# -- program is finished running --
# 
# Reset: reset completed.
# 
# case-insensitively identical if differ by 0, 
# case-insensitively different if differ by 1 or more
# Enter 1st alphabet (letter): a
# Enter 2nd alphabet (letter): z
# Alphabets entered case-insensitively differ by 27
# -- program is finished running --
# 
# Reset: reset completed.
# 
# case-insensitively identical if differ by 0, 
# case-insensitively different if differ by 1 or more
# Enter 1st alphabet (letter): c
# Enter 2nd alphabet (letter): c
# Alphabets entered case-insensitively differ by 0
# -- program is finished running --
# 
# Reset: reset completed.
# 
# case-insensitively identical if differ by 0, 
# case-insensitively different if differ by 1 or more
# Enter 1st alphabet (letter): S
# Enter 2nd alphabet (letter): S
# Alphabets entered case-insensitively differ by 0
# -- program is finished running --
# 
# Reset: reset completed.
# 
# case-insensitively identical if differ by 0, 
# case-insensitively different if differ by 1 or more
# Enter 1st alphabet (letter): T
# Enter 2nd alphabet (letter): x
# Alphabets entered case-insensitively differ by 12
# -- program is finished running --
######################## end sample test runs ############################
