.data
a: .word 2, 3, 1, 5, 2, 3, 1, 1, 7, 5, 3
n: .asciiz "\n"
.text
.globl main
main:
    la $s0, a
    li $s1, 11
    addi $t1, $zero, 0
    loop1:
        bge $t1, $s1, end1
        addi $t2, $zero, 0
        loop2:
            bge $t2, $s1, end2
            sll $t3, $t2, 2
            add $t4, $s0, $t3
            lw $t5, 0($t4)
            lw $t6, 4($t4)
            ble $t5, $t6, ifend
                sw $t5, 4($t4)
                sw $t6, 0($t4)
            ifend:
            addi $t2, $t2, 1
            j loop2 
        end2:
        addi $t1, $t1, 1
        j loop1
    end1:
    addi $t0, $zero, 0
    loop3:
        bge $t0, $s1, end3
        sll $t7, $t0, 2
        add $t8, $s0, $t7
        lw $a0, 0($t8)
        li $v0, 1
        syscall
        la $a0, n
        li $v0, 4
        syscall
        addi $t0, $t0, 1
        j loop3
    end3:
    jr $ra
