	.equ nchar, 8
	.equ N,	100
        .section .text
        .global  _start
_start:
	ldr	r1, =N
	mov	r2, #nchar
	mov 	r3, #16
	ldr 	r4, =buf + nchar

loop1:
	udiv	r6, r1, r3
	mul	r7, r6, r3
	sub	r7, r1, r7
	cmp 	r7, #10
	bcs	jmp1
	add	r7, #'0'
jmp2:	
	strb 	r7, [r4, #-1]!
	mov	r1, r6
	subs	r2, #1
	bne 	loop1
	b 	jmp3

jmp1:
	add	r7, #'a'
	sub	r7, #10
	b	jmp2
jmp3:	
        mov     r7, #4          @ �����ƥॳ�����ֹ�
        mov     r0, #1          @ ɸ�����
	ldr	r1, =buf
        mov     r2, #nchar + 1	@ ���Ԥ�ޤ᤿ʸ����Ĺ��
        swi	#0            @ write�����ƥॳ����
	
        mov     r7, #1          @ �����ƥॳ�����ֹ�
        mov     r0, #0          @ ��λ������
        swi     #0            @ exit�����ƥॳ����

        .section .data
buf:
	.space nchar, 0			@ ncharʸ��ʬ���ΰ�
        .byte  0x0a            @ ����
