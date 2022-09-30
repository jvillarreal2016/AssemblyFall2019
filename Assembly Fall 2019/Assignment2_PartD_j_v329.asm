###########################################################################################
# Javier Villarreal, CS 2318-003, Assignment 2 Part D
###########################################################################################
# Program finds the average score of exams 1, 2, and a final exam.
############################ data segment #################################################
.data 

exam1Score:	.asciiz "Exam 1's score is: "
exam2Score:	.asciiz "Exam 2's score is: "
finalExamScore: .asciiz "Final Exam's score is: "
averageScore:	.asciiz "Average score is: "

############################ Code segment #################################################		
.text
		.globl main
		
		main:
		
		li $v0, 4	#Print Exam1Score
		la $a0, exam1Score
		syscall
		
		li $v0, 5	#read int input
		syscall
		
		move $t0, $v0
		
		 li $v0, 4	#Print Exam2Score
		 la $a0, exam2Score
		 syscall
		 
		 li $v0, 5	#read int input
		 syscall
		 
		 move $t1, $v0
		  
		 li $v0, 4	#print finalExamScore
		 la $a0, finalExamScore
		 syscall
		 
		 li $v0, 5	#read int input
		 syscall
		 
		 move $t2, $v0	   
		 
		 li $t3, 205
		 mult $t0, $t3		#Exam1 * 205
		 mflo $t4
		 sra $t4, $t4, 10	#$t4 has E1 * 205/1024
		 
		 sll $t1, $t1, 8 	#Exam2 * 256
		 li  $t5, 854
		 div $t1, $t5	
		 mflo $t6		#t6 = E2 * 256/854
		 
		 add $t6, $t6, $t4, 	#$t6 = (E2*256/854)+(E1*205/1024)
		 
		 sra $t2, $t2, 1	#t2 = FinalExam/2
		 add $t6, $t6, $t2	#$t6 = ((205/1024)Exam1)+((256/854)Exam2)+(FinalScore/2))
		 
		 li $v0, 4 		#Print average
		 la $a0, averageScore
		 syscall
		 
		 li $v0, 1		#Print average
		 move $a0, $t6
		 syscall
		 
		 li $v0, 10		#exit
		 syscall
