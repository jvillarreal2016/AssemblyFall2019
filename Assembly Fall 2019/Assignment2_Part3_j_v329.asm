###############################################################################
# Title: Assign02P3                   Author: <Javier Villarreal>
# Class: CS 2318-003, Fall 2019       Submitted: <date>
###############################################################################
# Program: MIPS tranlation of a given C++ program
###############################################################################
# Pseudocode description: supplied a2p2_SampSoln.cpp
###############################################################################

#include <iostream>
#using namespace std;
		.data
#int  a1[12],
iA1: 		.space 48
#     a2[12],
iA2:		.space 48
#     a3[12];
iA3:		.space 48
#char reply;
#int  used1,
#     used2,
#     used3,
#     remCount,
#     anchor;
#int* hopPtr1;
#int* hopPtr11;
#int* hopPtr2;
#int* hopPtr22;
#int* hopPtr222;
#int* hopPtr3;
#int* endPtr1;
#int* endPtr2;
#int* endPtr3;

#char begA1Str[] = "\nbeginning a1: ";
begA1Str:		.asciiz "\nBeginning a1: "
#char proA1Str[] = "processed a1: ";
proA1Str:		.asciiz "processed a1: "
#char comA2Str[] = "          a2: ";
comA2Str:		.asciiz "          a2: "
#char comA3Str[] = "          a3: ";
comA3Str:		.asciiz "          a3: "
#char einStr[]   = "Enter integer #";
einStr:		.asciiz "Enter integer #"
#char moStr[]    = "Max of ";
moStr:			.asciiz "Max of "
#char ieStr[]    = " ints entered...";
ieStr:			.asciiz "ints entered..."
#char emiStr[]   = "Enter more ints? (n or N = no, others = yes) ";
emiStr:			.asciiz "Enter more ints? (n or N = no, others = yes) "
#char dacStr[]   = "Do another case? (n or N = no, others = yes) ";
dacStr:			.asciiz "Do another case? (n or N = no, others = yes) "
#char dlStr[]    = "================================";
dlStr:			.asciiz "================================"
#char byeStr[]   = "bye...";
byeStr:			.asciiz "bye..."
#char colSpace[] = ": "
colSpace: 		.asciiz ": "
#int main()
#{
			.text
			.globl main
main:

###############################################
# Register Usage
###############################################
# $t0 = used1
# $t1 = hopPtr1
# $t2 = hopPtr2
# $t3 = used2
# $t5 = temp
# $t4 = reply / anchor
# $t8 = endPtr1
############################################### 
#//           do
begDW1:#//    {
#                used1 = 0;
			li $t2, 0
#                hopPtr1 = a1;
			la $t1, iA1
#//              do
begDW2:#//       {
#                   cout << einStr;
			li $v0, 4
			la $a0, einStr
			syscall
#                   cout << (used1 + 1);
                   	li $v0, 1
                   	addi $a0, $t2, 1
                   	syscall
#                   cout << ':' << ' ';
                  	li $v0, 4
                   	la $a0, colSpace
#                   cin >> *hopPtr1;
			li $v0, 5
			syscall
			sw $v0 0($t1)
#                   ++used1;
                   	addi $t2, $t2, 1
#                   ++hopPtr1;
                   	addi $t1, $t1, 4
#//                 if (used1 == 12)
#                   if (used1 != 12) goto else1;
			li $t0, 12
                   	bne $t2, $t0, else1
begI1:#//           {
#                      cout << moStr;
                      	li $v0, 4
                      	la $a0, moStr
                      	syscall
#                      cout << 12;
                      	li $v0, 1
                      	li $a0, 12
                      	syscall
#                     cout << ieStr;
 			li $v0, 4
 			la $a0, ieStr 
#                      cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#                       reply = 'n';
                       li $t4, 'n'   
#                   goto endI1;
                   	j endI1
#//                 }
else1:#//           else
#//                 {
#                      cout << emiStr;
                      li $v0, 4
                      la $a0, emiStr
                      syscall
#                      cin >> reply;
                      li $v0, 12
                      syscall 
                      move $t4, $v0
endI1:#//           }
#//              }
DWTest2:
#//              while (reply != 'n' && reply != 'N');
#////            if (reply != 'n' && reply != 'N')goto begDW2
#                if (reply == 'n') goto xitDW2;
                	li $t0, 'n'
                	beq $t4, $t0, xitDW2
#                if (reply != 'N')goto begDW2;
                	li $t0, 'N'
                	bne $t4, $t0, begDW2
xitDW2:
#                cout << begA1Str;
			li $v0, 4
			la $a0, begA1Str
			syscall
#                hopPtr1 = a1;
                	la $t1, iA1
#                endPtr1 = a1 + used1;
                	la $a1, iA1
                	sll $t0, $t2, 2
                	add $a1, $a1, $t0
#//              while (hopPtr1 < endPtr1)
#                goto WTest1;
                	j WTest1
begW1:#//        {
#//                 if (hopPtr1 == endPtr1 - 1)
#                   if (hopPtr1 != endPtr1 - 1) goto else2;
                   	addi $t0, $a1, -4
                   	bne $t1, $t0, else2
begI2:#//           {
#                      cout << *hopPtr1 << endl;
                      	li $v0, 1
                      	lw $a0, 0($t1)
                      	syscall
                      	li $v0, 11
                      	li $a0, '\n'
#                   goto endI2;
                   	j endI2
#//                 }
else2:#//           else
#//                 {
#                      cout << *hopPtr1 << ' ';
                      li $v0, 1
                      lw $a0, 0($t1)
                      syscall
                      li $v0, 11
                      li $a0, ' '
                      syscall
endI2:#//           }
#                   ++hopPtr1;
                      addi $t1, $t1, 4
#//              }
WTest1:
#                if (hopPtr1 < endPtr1) goto begW1;
                	blt $t1, $a1, begW1
#//              for (hopPtr1 = a1, hopPtr2 = a2, used2 = 0; // multiple initializations
#//                   hopPtr1 < endPtr1;                     // loop test
#//                   ++hopPtr1, ++hopPtr2, ++used2)         // multiple updates
#                hopPtr1 = a1;
                	la $t1, iA1
#                hopPtr2 = a2;
                	la $t5, iA2
#                used2 = 0; // multiple initializations
                	li $t3, 0
#                goto FTest1;
                	j FTest1
begF1:#//        {
#                   *hopPtr2 = *hopPtr1;
			lw $t0, 0($t1)
			sw $t0, 0($t5)
#                ++hopPtr1;
			addi $t1, $t1, 4
#                ++hopPtr2;
			addi $t5, $t5, 4
#                ++used2;         // multiple updates
			addi $t3, $t3, 1
#//              }
FTest1:
#                if (hopPtr1 < endPtr1) goto begF1;                     // loop test
			blt $t1, $a1, begF1
#                hopPtr2 = a2;
			la $t5, iA2
#                endPtr2 = a2 + used2;
			la $a2, iA2
			sll $t0, $t3, 2
			add $a2, $a2, $t0
#//              while (hopPtr2 < endPtr2)
#                goto WTest2;
			j WTest2
begW2:#//        {
#                   anchor = *hopPtr2;
			lw $t4, 0($t5)
#//                 for (hopPtr22 = hopPtr2 + 1; hopPtr22 < endPtr2; ++hopPtr22)
#                   hopPtr22 = hopPtr2 + 1; 
			addi $t6, $t5, 4
#                   goto FTest2;
			j FTest2
begF2:#//           {
#//                    if (*hopPtr22 == anchor)
#                      if (*hopPtr22 != anchor) goto endI3;
			lw $t0, 0($t6)
			bne $t0, $t8, endI3
befI3:#//              {
#//                       for (hopPtr222 = hopPtr22 + 1; hopPtr222 < endPtr2; ++hopPtr222)
#                         hopPtr222 = hopPtr22 + 1;
			addi $t7, $t6, 4
#                         goto FTest3;
                       j FTest3
begF3:#//                 {
#                            *(hopPtr222 - 1) = *hopPtr222;
			lw $t0, 0($t7)
			sw $t0, -4($t7)
#                         ++hopPtr222;
			addi $t7, $t7, 4
#//                       }
FTest3:
#                         if (hopPtr222 < endPtr2) goto begF3;
			blt $t7, $a2 begF3
#                         --used2;
			addi $t3, $t3, -1
#                         --endPtr2;
			addi $a2, $a2, -4
#                         --hopPtr22;
                       addi $t6, $t6, -4
endI3:#//              }
#                   ++hopPtr22;
			addi $t6, $t6, 4
#//                 }
FTest2:
#                   if (hopPtr22 < endPtr2) goto begF2;
			blt $t6, $a2, begF2
#                   ++hopPtr2;
			addi $t5, $t5, 4
#//              }
WTest2:
#                if (hopPtr2 < endPtr2) goto begW2;
			blt $t5, $a2, begW2
#                used3 = 0;
			li $t8, 0
#                hopPtr3 = a3;
			la $t7, iA3
#                hopPtr1 = a1;
			la $t1, iA1
#//              while (hopPtr1 < endPtr1)
#                goto WTest3;
			j WTest3
begW3:#//        {
#                   *hopPtr3 = *hopPtr1;
			lw $t0, 0($t1)
			sw $t0, 0($t7)
#                   ++used3;
			addi $t8, $t8, 1
#                   ++hopPtr3;
			addi $t7, $t7, 4
#                   anchor = *hopPtr1;
			lw $t4, 0($t1)
#                   remCount = 0;
			li $t5, 0
#//                 for (hopPtr11 = hopPtr1 + 1; hopPtr11 < endPtr1; ++hopPtr11)
#                   hopPtr11 = hopPtr1 + 1;
			addi $t6, $t6, 4
#                   goto FTest4;
			j FTest4
begF4:#//           {
#//                    if (*hopPtr11 == anchor)
#                      if (*hopPtr11 != anchor) goto else4;
			lw $t0, 0($t6)
			bne $t0, $t4, else4
begI4:#//              {
#                         ++remCount;
			addi $t5, $t5, 1
#                      goto endI4;
			j endI4
#//                    }
else4:#//              else
#//                    {
#                         *(hopPtr11 - remCount) = *hopPtr11;
			lw $t0, 0($t6)
			sll $9, $t5, 2
			sub $t9, $t6, $t9
			sw $t0, 0($t9)
endI4:#//              }
#                   ++hopPtr11;
			addi $t6, $t6, 4
#//                 }
FTest4:
#                   if (hopPtr11 < endPtr1) goto begF4;
			blt $t6, $a1, begF4
#                   used1 -= remCount;
			sub $t2, $t2, $t5
#                    endPtr1 -= remCount;
			sll $t0, $t5, 2
			sub $a1, $a1, $t0
#                   ++hopPtr1;
			addi $t1, $t1, 4
#//              }
WTest3:
#                if (hopPtr1 < endPtr1) goto begW3;
			blt $t1, $a1, begW3
#                cout << proA1Str;
			li $v0, 4
			la $a0, proA1Str
			syscall
#//              for (hopPtr1 = a1; hopPtr1 < endPtr1; ++hopPtr1)
#                hopPtr1 = a1;
			la $t1, iA1
#                goto FTest5;
			j FTest5
begF5:#//         {
#//                 if (hopPtr1 == endPtr1 - 1)
#                   if (hopPtr1 != endPtr1 - 1) goto else5;
			addi $t0, $a1, -4
			bne $t1, $t0, else5
begI5:#//           {
#                      cout << *hopPtr1 << endl;
                   	li $v0, 1
                   	lw $a0, 0($t1)
                   	syscall
                   	li $v0, 11
                   	li $a0, '\n'
                   	syscall
#                   goto endI5
			j endI5
#//                 }
else5:#//           else
#//                 {
#                      cout << *hopPtr1 << ' ';
			li $v0, 1
			lw $a0, 0($t1)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
endI5:#//           }
#                ++hopPtr1;
			addi $t1, $t1, 4
#//              }
FTest5:
#                if (hopPtr1 < endPtr1) goto begF5;
			blt $t1, $a1, begF5
#                cout << comA2Str;
			li $v0, 4
			la $a0, comA2Str
			syscall
#//              for (hopPtr2 = a2; hopPtr2 < endPtr2; ++hopPtr2)
#                hopPtr2 = a2;
			la $t5, iA2
#                goto FTest6;
			j FTest6
begF6:#//        {
#//                 if (hopPtr2 == endPtr2 - 1)
 #                  if (hopPtr2 != endPtr2 - 1) goto else6;
 			addi $t0, $a2, -4
 			bne $t5, $t0, else6
begI6:#//           {
#                      cout << *hopPtr2 << endl;
			li $v0, 1
			lw $a0, 0($t5)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
#                   goto endI6;
			j endI6
#//                 }
else6:#//           else
#//                 {
#                      cout << *hopPtr2 << ' ';
			lw $a0, 0($t5)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
endI6:#//           }
#                ++hopPtr2;
			addi $t5, $t5, 4
#//              }
FTest6:
#                if (hopPtr2 < endPtr2) goto begF6;
#                cout << comA3Str;
			li $v0, 4
			la $a0, comA3Str
			syscall
#                hopPtr3 = a3;
 			la $t7, iA3
#                endPtr3 = a3 + used3;
			la $a3, iA3
			sll $t0, $t8, 2
			add $a3, $a3, $t0
#//              while (hopPtr3 < endPtr3)
#                goto WTest4;
			j WTest4
begW4:#//        {
#//                 if (hopPtr3 == endPtr3 - 1)
#                   if (hopPtr3 != endPtr3 - 1) goto else7;
begI7:#//           {
#                      cout << *hopPtr3 << endl;
			li $v0, 1
			lw $a0, 0($t7)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
#                   goto endI7;
			j endI7
#//                 }
else7:#//           else
#//                 {
#                      cout << *hopPtr3 << ' ';
			li $v0, 1
			lw $a0, 0($t7)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
endI7:#//           }
#                   ++hopPtr3;
			addi $t7, $t7, 4
#//              }
WTest4:
#                if (hopPtr3 < endPtr3) goto begW4;
			blt $t7, $a0, begW4
#                cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#                cout << dacStr;
			li $v0, 4
			la $a0, dacStr
			syscall
#                cin >> reply;
			li $v0, 12
			syscall
			move $t4, $v0
#                cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#//           }
DWTest1:
#//           while (reply != 'n' && reply != 'N');
#////         if (reply != 'n' && reply != 'N') goto begDW1;
#             if (reply == 'n') goto xitDW1;
			li $t0, 'n'
			beq $t4, $t0, xitDW1
#             if (reply != 'N') goto begDW1;
			li $t0, 'N'
			bne $t4, $t0, begDW1
xitDW1:
#             cout << dlStr;
			li $v0, 4
			la $a0, dlStr
			syscall
#             cout << '\n';
			li $v0, 11
			li $a0, '\n'
			syscall
#             cout << byeStr;
			li $v0, 4
			la $a0, byeStr
			syscall
#             cout << '\n';
			li $v0, 11
			li $a0, '\n'
			syscall
#             cout << dlStr;
			li $v0, 4
			la $v0, dlStr
			syscall
#             cout << '\n';
			li $v0, 11
			li $a0, '\n'
			syscall
#             return 0;
#}
			li $v0, 10
			syscall
			
			#graceful exit