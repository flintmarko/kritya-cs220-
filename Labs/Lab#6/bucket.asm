.data
str_f: .asciiz "Enter values of n,p\n"
end_line: .asciiz "\n"
.text
.globl main
main:
    li $v0, 4
    la $a0, str_f
    syscall

    li $v0, 5
    syscall
    move $s0, $v0
    li $v0, 5
    syscall
    move $s1, $v0

    sll $a0, $s1, 2
    li $v0, 9
    syscall
    move $s2, $v0
    move $t0, $zero

    loop: 
        bge $t0, $s1, exit
        li $v0, 6
        syscall 
        sll $t1, $t0, 2
        add $t1, $t1, $s2
        swc1 $f0, 0($t1)
        addi $t0, 1
        j loop
    exit:
    addi $sp, $sp, -4
    #move $t2, $ra
    sw $ra, 0($sp)
    jal balti
    move $t0, $zero
    loop6:
        bge $t0, $s1, DEAD
        sll $t1, $t0, 2
        add $t1, $t1, $s5
        l.s $f12, 0($t1)
        li $v0, 2
        syscall	 
        addi $t0, 1
        li $v0, 4
        la $a0, end_line
        syscall
        j loop6
    DEAD:
    #move $ra, $t2
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

.text
balti:
    #mult $t0, $s0, $s1
    mult $s0,$s1
    mflo $t0
    sll $a0, $t0, 2
    li $v0, 9
    syscall
    move $s3, $v0

    #move $t0, $ra
    addi $sp, $sp, -8
    sw $ra, 0($sp)

    sll $a0, $s0, 2
    li $v0, 9
    syscall
    move $s4, $v0
    
    move $t1, $zero
    loop1: 
        bge $t1, $s0, done
        sll $t2, $t1, 2
        add $t2, $t2, $s4
        sw  $zero, 0($t2) 
        addi $t1, 1
        j loop1
    done:

    move $t1, $zero
    loop2:
        bge $t1, $s1, not_staying
        sll $t2, $t1, 2
        add $t2, $s2, $t2
        l.s $f0, 0($t2)
        mtc1 $s0, $f1
        cvt.s.w $f1, $f1
        mul.s $f1, $f0, $f1
        cvt.w.s $f1, $f1 
        mfc1 $t3, $f1
        sll $t3, $t3, 2
        add $t4, $t3, $s4
        lw $t5, 0($t4)
        #mult $t6, $t3, $s1
        mult $t3, $s1
        mflo $t6
        add $t6, $t6, $s3
        sll $t7, $t5, 2
        add $t6, $t6, $t7
        swc1 $f0, 0($t6)
        addi $t5, $t5, 1
        sw $t5, 0($t4)
        addi $t1, $t1, 1
        j loop2
    not_staying:

    move $t1, $zero
    loop3:
        bge $t1, $s0, tired
        sll $t2, $t1, 2
        #mult $t3, $s1, $t2
        mult $s1, $t2
        mflo $t3

        add $t3, $t3, $s3
        move $a0, $t3
        add $t2, $t2, $s4
        lw $t4, 0($t2)
        move $a1, $t4
        sw $t1, 4($sp)
        jal ins_srt
        lw $t1, 4($sp)
        addi $t1, $t1, 1
        j loop3
    tired:

    sll $a0, $s1, 2
    li $v0, 9
    syscall
    move $s5, $v0
    move $t3, $zero
    li $t1, -1
    loop5:
        addi $t1, $t1, 1
        bge $t1, $s0, drained
        move $t2, $zero
        sll $t4, $t1, 2
        add $t4, $t4, $s4
        lw $t5, 0($t4)
        innerloop1:
            bge $t2, $t5, loop5
            sll $t4, $t3, 2
            add $t4, $s5, $t4
            #mult $t6, $t1, $s1
            mult $t1, $s1
            mflo $t6
            sll $t6, $t6, 2
            add $t6, $t6, $s3
            sll $t7, $t2, 2
            add $t6, $t6, $t7
            l.s $f0, 0($t6)
            swc1 $f0, 0($t4)
            addi $t3, $t3, 1
            addi $t2, $t2, 1
            j innerloop1
    drained:
    #move $ra, $t0
    lw $ra, 0($sp)
    addi $sp, $sp, 8
    jr $ra

.text
ins_srt:
    move $t0, $zero
    loop4:
        addi $t0, $t0, 1
        bge $t0, $a1, betrayed
        addi $t1, $t0, -1
        innerloop:
            slt $t2, $t1, $zero
            bne $t2, $zero, loop4
            sll $t2, $t1, 2
            add $t2, $t2, $a0
            l.s $f0, 0($t2)
            l.s $f1, 4($t2)
            c.lt.s $f0, $f1
            bc1t loop4
            swc1 $f0, 4($t2)
            swc1 $f1, 0($t2)
            addi $t1, $t1, -1
            j innerloop
    betrayed:
    jr $ra