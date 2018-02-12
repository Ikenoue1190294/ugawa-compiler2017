	.section .data
	@ 大域変数の定義
_Pi_var_x:
	.word 0
_Pi_var_y:
	.word 0
_Pi_var_answer:
	.word 0
	.section .text
	.global _start
_start:
	@ 式をコンパイルした命令列
	ldr r0, =#5
	ldr r1, =_Pi_var_x
	str r0, [r1, #0]
	ldr r0, =#10
	ldr r1, =_Pi_var_y
	str r0, [r1, #0]
	str r0, [sp, #-4]!
	str r1, [sp, #-4]!
	str r2, [sp, #-4]!
	str r3, [sp, #-4]!
	str r4, [sp, #-4]!
	str r5, [sp, #-4]!
	str r7, [sp, #-4]!
	ldr r0, =_Pi_var_y
	ldr r0, [r0, #0]
	str r1, [sp, #-4]!
	mov r1, r0
	ldr r0, =_Pi_var_x
	ldr r0, [r0, #0]
	udiv r0, r1, r0
	ldr r1, [sp], #4
	mov r1, #8
	mov r2, #16
	ldr r3, =buf + 8
L0:
	udiv r4, r0, r2
	mul r5, r4, r2
	sub r5, r0, r5
	cmp r5, #10
	bcs L1
	add r5, #48
L2:
	strb r5, [r3, #-1]!
	mov r0, r4
	subs r1, #1
	bne L0
	b L3
L1:
	add r5, #65
	sub r5, #10
	b L2
L3:
	mov r7, #4
	mov r0, #1
	ldr r1, =buf
	mov r2, #9
	swi #0
	ldr r7, [sp], #4
	ldr r5, [sp], #4
	ldr r4, [sp], #4
	ldr r3, [sp], #4
	ldr r2, [sp], #4
	ldr r1, [sp], #4
	ldr r0, [sp], #4
	@ EXITシステムコール
	ldr r0, =_Pi_var_answer
	ldr r0, [r0, #0]
	mov r7, #1
	swi #0
	.section .data
buf:
	.space 8, 0
	.byte 0x0a
