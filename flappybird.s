#####################################################################
#
# CSC258H5S Winter 2020 Assembly Programming Project
# University of Toronto Mississauga
#
# Group members:
# - Student 1: Litao Chen, 1004545842
# - Student 2 (if any): Name, Student Number
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8					     
# - Unit height in pixels: 8
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestone is reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1/2/3/4/5 (choose the one the applies)
#
# Which approved additional features have been implemented?
# (See the assignment handout for the list of additional features)
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# 3. (fill in the feature, if any)
# ... (add more if necessary)
#
# Any additional information that the TA needs to know:
# - (write here, if any)
#
#####################################################################
.data 
    displayAddress: .word  0x10008000
    green: .word 0x4bff7b
    yellow: .word 0xfff86b
    white: .word 0xffffff
    balck : .word 0x000000
    birdBlock: .word 1688,1696,1816,1820,1824,1828,1944,1952

.text
.globl main

main:
    LOOPINIT:
        li $t0, 0		# Index of the loop
        li $t1, 0		# Index of the birdBlock array
        lw $t2, displayAddress	# $t2 = displayAddress
        la $t6, birdBlock	# $t6 = &birdBlock or birdBlock[0]
        lw $t3, yellow		# $t3 = yellow
    WHILE:
        beq $t0, 8, DONE	# if $t0 = 8, Done
        addi $t0, $t0, 1	# $t0 = $t0 + 1
        add $t4, $t1, $t1	# $t4 = 2 * $t1 (index)
        add $t4, $t4, $t4	# $t4 = 4 * $t1 
        add $t7, $t6, $t4	# $t7 = &birdBlock + 4 * Index
        lw $t4, 0($t7)		# $t4 = birdBlock[Index]
        add $t5, $t4, $t2	# $t5 = birdBlock[Index] + displayAddress
        sw $t3, 0($t5)		# load yellow on the bit map at $t5
        addi $t1, $t1, 1	# Index = Index + 1
        j WHILE
    DONE:
    
        
            

li $v0, 10
syscall



        
    
