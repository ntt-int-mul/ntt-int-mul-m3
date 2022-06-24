	.p2align        2,,3    
	.syntax         unified
	.data
intmul_sb_jump:
	.word   intmul_sb_1
	.word   intmul_sb_2
	.word   intmul_sb_3
	.word   intmul_sb_4
	.word   intmul_sb_5
	.word   intmul_sb_6
	.word   intmul_sb_7
	.word   intmul_sb_8
	.p2align        2,,3    
	.syntax         unified
	.text
	.global intmul_sb
	.type   intmul_sb, %function
	.global intmul_sb_1
	.type   intmul_sb_1, %function
	.global intmul_sb_2
	.type   intmul_sb_2, %function
	.global intmul_sb_3
	.type   intmul_sb_3, %function
	.global intmul_sb_4
	.type   intmul_sb_4, %function
	.global intmul_sb_5
	.type   intmul_sb_5, %function
	.global intmul_sb_6
	.type   intmul_sb_6, %function
	.global intmul_sb_7
	.type   intmul_sb_7, %function
	.global intmul_sb_8
	.type   intmul_sb_8, %function
	.global intmul_sb_0mod4
	.type    intmul_sb_0mod4, %function
	.global intmul_sb_1mod4
	.type    intmul_sb_1mod4, %function
	.global intmul_sb_2mod4
	.type    intmul_sb_2mod4, %function
	.global intmul_sb_3mod4
	.type    intmul_sb_3mod4, %function
intmul_sb:
	// R0 = destination, 2N words long
	// R1 = first multiplicand, N words long
	// R2 = second multiplicand, N words long
	// R3 = N, Number of words
	// uses MLA
	add     r3, r3
intmul_sb_raw:
	cmp     r3, #9
	bcs     intmul_sb_long
	movw    r12, #:lower16:(intmul_sb_jump-4)
	movt    r12, #:upper16:(intmul_sb_jump-4)
	ldr     pc, [r12, r3, LSL #2]
intmul_sb_1:
	push    {r4-r11,lr}

	ldrh    r1, [r1]
	ldrh    r2, [r2]
	mul     r3, r1, r2
	strh    r3, [r0]
	pop     {r4-r11,pc}
intmul_sb_2:
	push    {r4-r11,lr}

	mov     lr, r0
	ldrh    r11, [r1, #0]
	ldrh    r12, [r1, #2]
	ldrh    r9, [r2, #0]
	ldrh    r10, [r2, #2]
	// multiply r9-10 and r11-r12
	mul     r0, r11, r9
	lsr     r1, r0, #16
	mla     r1, r12, r9, r1
	lsr	r2, r1, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	mla     r0, r11, r10, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r10, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	strh    r1, [lr, #0]
	strh    r2, [lr, #2]
	pop     {r4-r11,pc}
intmul_sb_3:
	push    {r4-r11,lr}

	mov     lr, r0
	ldrh    r10, [r1, #0]
	ldrh    r11, [r1, #2]
	ldrh    r12, [r1, #4]
	ldrh    r7, [r2, #0]
	ldrh    r8, [r2, #2]
	ldrh    r9, [r2, #4]
	// multiply r7-9 and r10-r12
	mul     r0, r10, r7
	lsr     r1, r0, #16
	mla     r1, r11, r7, r1
	lsr     r2, r1, #16
	mla     r2, r12, r7, r2
	lsr	r3, r2, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	uxth    r2, r2
	mla     r0, r10, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r8, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	mla     r0, r10, r9, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r9, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r9, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	strh    r1, [lr, #0]
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	pop     {r4-r11,pc}
intmul_sb_4:
	push    {r4-r11,lr}

	mov     lr, r0
	ldrh    r9, [r1, #0]
	ldrh    r10, [r1, #2]
	ldrh    r11, [r1, #4]
	ldrh    r12, [r1, #6]
	ldrh    r5, [r2, #0]
	ldrh    r6, [r2, #2]
	ldrh    r7, [r2, #4]
	ldrh    r8, [r2, #6]
	// multiply r5-8 and r9-r12
	mul     r0, r9, r5
	lsr     r1, r0, #16
	mla     r1, r10, r5, r1
	lsr     r2, r1, #16
	mla     r2, r11, r5, r2
	lsr     r3, r2, #16
	mla     r3, r12, r5, r3
	lsr	r4, r3, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	strh    r1, [lr, #0]
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	pop     {r4-r11,pc}
intmul_sb_5:
	push    {r4-r11,lr}

	sub	sp, #12
	mov     lr, r0
	ldrh    r10, [r1, #2]
	ldrh    r11, [r1, #4]
	ldrh    r12, [r1, #6]
	ldrh    r9, [r1], #8
	ldrh    r6, [r2, #2]
	ldrh    r7, [r2, #4]
	ldrh    r8, [r2, #6]
	ldrh    r5, [r2], #8
	str     r1, [sp, #(4*1)]
	str     r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	mul     r0, r9, r5
	lsr     r1, r0, #16
	mla     r1, r10, r5, r1
	lsr     r2, r1, #16
	mla     r2, r11, r5, r2
	lsr     r3, r2, #16
	mla     r3, r12, r5, r3
	lsr	r4, r3, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldr     r0, [sp, #(4*2)]
	ldrh    r8, [r0], #2
	sub     r0, #(5*2)
	str     r0, [sp, #(4*2)]
	// multiply r8-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	sub     lr, #(5*2)
	ldrh    r1, [lr, #0]
	ldr     r0, [sp, #(4*1)]
	ldrh    r12, [r0, #0]
	ldr     r0, [sp, #(4*2)]
	ldrh    r9, [r0, #2]
	ldrh    r10, [r0, #4]
	ldrh    r11, [r0, #6]
	ldrh    r8, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r8-11 and r12-r12, accumulate r1-r1
	mla     r0, r12, r8, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r9, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r10, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r11, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	ldr     r0, [sp, #(4*2)]
	ldrh    r11, [r0, #0]
	// multiply r11-11 and r12-r12, accumulate r1-r1 and 1 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r11, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	strh    r1, [lr, #0]
	add	sp, #12
	pop     {r4-r11,pc}
intmul_sb_6:
	push    {r4-r11,lr}

	sub	sp, #12
	mov     lr, r0
	ldrh    r10, [r1, #2]
	ldrh    r11, [r1, #4]
	ldrh    r12, [r1, #6]
	ldrh    r9, [r1], #8
	ldrh    r6, [r2, #2]
	ldrh    r7, [r2, #4]
	ldrh    r8, [r2, #6]
	ldrh    r5, [r2], #8
	str     r1, [sp, #(4*1)]
	str     r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	mul     r0, r9, r5
	lsr     r1, r0, #16
	mla     r1, r10, r5, r1
	lsr     r2, r1, #16
	mla     r2, r11, r5, r2
	lsr     r3, r2, #16
	mla     r3, r12, r5, r3
	lsr	r4, r3, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldr     r0, [sp, #(4*2)]
	ldrh    r8, [r0, #2]
	ldrh    r7, [r0], #4
	sub     r0, #(6*2)
	str     r0, [sp, #(4*2)]
	// multiply r7-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	sub     lr, #(6*2)
	ldrh    r1, [lr, #0]
	ldrh    r2, [lr, #2]
	ldr     r0, [sp, #(4*1)]
	ldrh    r11, [r0, #0]
	ldrh    r12, [r0, #2]
	ldr     r0, [sp, #(4*2)]
	ldrh    r8, [r0, #2]
	ldrh    r9, [r0, #4]
	ldrh    r10, [r0, #6]
	ldrh    r7, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r7-10 and r11-r12, accumulate r1-r2
	mla     r0, r11, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r7, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	mla     r0, r11, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r8, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r9, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r9, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r10, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r10, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	ldr     r0, [sp, #(4*2)]
	ldrh    r9, [r0, #0]
	ldrh    r10, [r0, #2]
	// multiply r9-10 and r11-r12, accumulate r1-r2 and 2 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r9, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r9, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r10, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r10, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	strh    r1, [lr, #0]
	strh    r2, [lr, #2]
	add	sp, #12
	pop     {r4-r11,pc}
intmul_sb_7:
	push    {r4-r11,lr}

	sub	sp, #12
	mov     lr, r0
	ldrh    r10, [r1, #2]
	ldrh    r11, [r1, #4]
	ldrh    r12, [r1, #6]
	ldrh    r9, [r1], #8
	ldrh    r6, [r2, #2]
	ldrh    r7, [r2, #4]
	ldrh    r8, [r2, #6]
	ldrh    r5, [r2], #8
	str     r1, [sp, #(4*1)]
	str     r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	mul     r0, r9, r5
	lsr     r1, r0, #16
	mla     r1, r10, r5, r1
	lsr     r2, r1, #16
	mla     r2, r11, r5, r2
	lsr     r3, r2, #16
	mla     r3, r12, r5, r3
	lsr	r4, r3, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldr     r0, [sp, #(4*2)]
	ldrh    r7, [r0, #2]
	ldrh    r8, [r0, #4]
	ldrh    r6, [r0], #6
	sub     r0, #(7*2)
	str     r0, [sp, #(4*2)]
	// multiply r6-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	sub     lr, #(7*2)
	ldrh    r1, [lr, #0]
	ldrh    r2, [lr, #2]
	ldrh    r3, [lr, #4]
	ldr     r0, [sp, #(4*1)]
	ldrh    r10, [r0, #0]
	ldrh    r11, [r0, #2]
	ldrh    r12, [r0, #4]
	ldr     r0, [sp, #(4*2)]
	ldrh    r7, [r0, #2]
	ldrh    r8, [r0, #4]
	ldrh    r9, [r0, #6]
	ldrh    r6, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r6-9 and r10-r12, accumulate r1-r3
	mla     r0, r10, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r6, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	mla     r0, r10, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r7, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	mla     r0, r10, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r8, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r9, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r9, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r9, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	ldr     r0, [sp, #(4*2)]
	ldrh    r7, [r0, #0]
	ldrh    r8, [r0, #2]
	ldrh    r9, [r0, #4]
	// multiply r7-9 and r10-r12, accumulate r1-r3 and 3 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r7, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r8, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r9, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r9, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r9, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	strh    r1, [lr, #0]
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	add	sp, #12
	pop     {r4-r11,pc}
intmul_sb_8:
	push    {r4-r11,lr}

	sub	sp, #12
	mov     lr, r0
	ldrh    r10, [r1, #2]
	ldrh    r11, [r1, #4]
	ldrh    r12, [r1, #6]
	ldrh    r9, [r1], #8
	ldrh    r6, [r2, #2]
	ldrh    r7, [r2, #4]
	ldrh    r8, [r2, #6]
	ldrh    r5, [r2], #8
	str     r1, [sp, #(4*1)]
	str     r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	mul     r0, r9, r5
	lsr     r1, r0, #16
	mla     r1, r10, r5, r1
	lsr     r2, r1, #16
	mla     r2, r11, r5, r2
	lsr     r3, r2, #16
	mla     r3, r12, r5, r3
	lsr	r4, r3, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldr     r0, [sp, #(4*2)]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	ldrh    r5, [r0], #8
	sub     r0, #(8*2)
	str     r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	sub     lr, #(8*2)
	ldrh    r1, [lr, #0]
	ldrh    r2, [lr, #2]
	ldrh    r3, [lr, #4]
	ldrh    r4, [lr, #6]
	ldr     r0, [sp, #(4*1)]
	ldrh    r9, [r0, #0]
	ldrh    r10, [r0, #2]
	ldrh    r11, [r0, #4]
	ldrh    r12, [r0, #6]
	ldr     r0, [sp, #(4*2)]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	ldrh    r5, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldr     r0, [sp, #(4*2)]
	ldrh    r5, [r0, #0]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	strh    r1, [lr, #0]
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	add	sp, #12
	pop     {r4-r11,pc}
intmul_sb_long: 
	ands    r12, r3, #3
	beq     intmul_sb_0mod4 
	teq     r12, #1
	beq     intmul_sb_1mod4
	teq     r12, #2
	beq     intmul_sb_2mod4
intmul_sb_3mod4:
	push    {r4-r11,lr}
	sub	sp, #(4*7)
	str     r3, [sp, #(4*5)]
	bic     r3, r3, #3

	sub     r3, #4
	str     r3, [sp, #(4*3)]
	str     r3, [sp, #(4*0)]
	str     r3, [sp, #(4*6)]
	// s0, s3, s6 = floor4(N)-4 (float),  s5 = N (integer)
	mov     lr, r0
	ldrh    r10, [r1, #2]
	ldrh    r11, [r1, #4]
	ldrh    r12, [r1, #6]
	ldrh    r9, [r1], #8
	ldrh    r6, [r2, #2]
	ldrh    r7, [r2, #4]
	ldrh    r8, [r2, #6]
	ldrh    r5, [r2], #8

	str     r1, [sp, #(4*1)]
	str     r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	mul     r0, r9, r5
	lsr     r1, r0, #16
	mla     r1, r10, r5, r1
	lsr     r2, r1, #16
	mla     r2, r11, r5, r2
	lsr     r3, r2, #16
	mla     r3, r12, r5, r3
	lsr	r4, r3, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_sb_3mod4_0: // first loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	ldrh    r5, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3

	ldr     r0, [sp, #(4*3)] 
	subs    r0, #4
	str     r0, [sp, #(4*3)]
	bgt     intmul_sb_3mod4_0      // end first loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r7, [r0, #2]
	ldrh    r8, [r0, #4]
	ldrh    r6, [r0], #6
	str     r0, [sp, #(4*2)]
	// multiply r6-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_sb_3mod4_1: 			// consequent loops
	ldr     r0, [sp, #(4*6)] 
	str     r0, [sp, #(4*3)]
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	ldr     r0, [sp, #(4*5)]
	sub     lr, lr, r0, LSL #1  // move destination pointer LR
	ldr     r1, [sp, #(4*2)]
	sub     r1, r1, r0, LSL #1  // move multiplicand pointer s2
	ldrh    r6, [r1, #2]
	ldrh    r7, [r1, #4]
	ldrh    r8, [r1, #6]
	ldrh    r5, [r1], #8
	str      r1, [sp, #(4*2)]
	ldr      r0, [sp, #(4*1)]
	ldrh    r10, [r0, #2]
	ldrh    r11, [r0, #4]
	ldrh    r12, [r0, #6]
	ldrh    r9, [r0], #8
	str      r0, [sp, #(4*1)]
	ldrh    r1, [lr, #0]
	ldrh    r2, [lr, #2]
	ldrh    r3, [lr, #4]
	ldrh    r4, [lr, #6]
	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_sb_3mod4_2: // middle loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	ldrh    r5, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3

	ldr     r0, [sp, #(4*3)]
	subs    r0, #4
	str     r0, [sp, #(4*3)]
	bgt     intmul_sb_3mod4_2      // end middle loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r7, [r0, #2]
	ldrh    r8, [r0, #4]
	ldrh    r6, [r0], #6
	str     r0, [sp, #(4*2)]
	// multiply r6-8 and r9-r12, accumulate r1-r4 and 3 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldr     r0, [sp, #(4*0)]
	subs    r0, #4
	str     r0, [sp, #(4*0)]
	bgt     intmul_sb_3mod4_1
intmul_sb_3mod4_end: // ending segment
	ldr     r0, [sp, #(4*6)]
	str     r0, [sp, #(4*3)]
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	ldr     r0, [sp, #(4*5)]
	sub     lr, lr, r0, LSL #1  // move destination pointer LR
	ldr     r1, [sp, #(4*2)]
	sub     r1, r1, r0, LSL #1  // move multiplicand pointer s2
	ldrh    r7, [r1, #2]
	ldrh    r8, [r1, #4]
	ldrh    r9, [r1, #6]
	ldrh    r6, [r1], #8
	str     r1, [sp, #(4*2)]
	ldrh    r1, [lr, #0]
	ldrh    r2, [lr, #2]
	ldrh    r3, [lr, #4]
	ldrh    r4, [lr, #6]
	// don't move LR yet
	ldr     r0, [sp, #(4*1)]
	ldrh    r11, [r0, #2]
	ldrh    r12, [r0, #4]
	ldrh    r10, [r0], #6
	str     r0, [sp, #(4*1)]
	// multiply r6-9 and r10-r12, accumulate r1-r3
	mla     r0, r10, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r6, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	mla     r0, r10, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r7, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	mla     r0, r10, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r8, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r9, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r9, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r9, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
intmul_sb_3mod4_3: // final loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r7, [r0, #2]
	ldrh    r8, [r0, #4]
	ldrh    r9, [r0, #6]
	ldrh    r6, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r6-9 and r10-r12, accumulate r1-r3 and 4 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r6, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r7, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r8, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r9, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r9, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r9, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2

	ldr     r0, [sp, #(4*3)]
	subs    r0, #4
	str     r0, [sp, #(4*3)]
	bgt     intmul_sb_3mod4_3      // end final loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r8, [r0, #2]
	ldrh    r9, [r0, #4]
	ldrh    r7, [r0], #6
	// multiply r7-9 and r10-r12, accumulate r1-r3 and 3 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r7, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r8, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r10, r9, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r11, r9, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r12, r9, r2
	lsr     r3, r2, #16
	uxth    r1, r1
	uxth    r2, r2
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r1, [lr], #6
	add	sp, #(4*7)
	pop     {r4-r11,pc}

intmul_sb_1mod4:
	push    {r4-r11,lr}
	sub	sp, #(4*7)
	str     r3, [sp, #(4*5)]
	bic     r3, r3, #3

	sub     r3, #4
	str     r3, [sp, #(4*3)]
	str     r3, [sp, #(4*0)]
	str     r3, [sp, #(4*6)]
	// s0, s3, s6 = floor4(N)-4 (float),  s5 = N (integer)
	mov     lr, r0
	ldrh    r10, [r1, #2]
	ldrh    r11, [r1, #4]
	ldrh    r12, [r1, #6]
	ldrh    r9, [r1], #8
	ldrh    r6, [r2, #2]
	ldrh    r7, [r2, #4]
	ldrh    r8, [r2, #6]
	ldrh    r5, [r2], #8

	str     r1, [sp, #(4*1)]
	str     r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	mul     r0, r9, r5
	lsr     r1, r0, #16
	mla     r1, r10, r5, r1
	lsr     r2, r1, #16
	mla     r2, r11, r5, r2
	lsr     r3, r2, #16
	mla     r3, r12, r5, r3
	lsr	r4, r3, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_sb_1mod4_0: // first loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	ldrh    r5, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3

	ldr     r0, [sp, #(4*3)] 
	subs    r0, #4
	str     r0, [sp, #(4*3)]
	bgt     intmul_sb_1mod4_0      // end first loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r8, [r0], #2
	str     r0, [sp, #(4*2)]
	// multiply r8-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_sb_1mod4_1: 			// consequent loops
	ldr     r0, [sp, #(4*6)] 
	str     r0, [sp, #(4*3)]
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	ldr     r0, [sp, #(4*5)]
	sub     lr, lr, r0, LSL #1  // move destination pointer LR
	ldr     r1, [sp, #(4*2)]
	sub     r1, r1, r0, LSL #1  // move multiplicand pointer s2
	ldrh    r6, [r1, #2]
	ldrh    r7, [r1, #4]
	ldrh    r8, [r1, #6]
	ldrh    r5, [r1], #8
	str      r1, [sp, #(4*2)]
	ldr      r0, [sp, #(4*1)]
	ldrh    r10, [r0, #2]
	ldrh    r11, [r0, #4]
	ldrh    r12, [r0, #6]
	ldrh    r9, [r0], #8
	str      r0, [sp, #(4*1)]
	ldrh    r1, [lr, #0]
	ldrh    r2, [lr, #2]
	ldrh    r3, [lr, #4]
	ldrh    r4, [lr, #6]
	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_sb_1mod4_2: // middle loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	ldrh    r5, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3

	ldr     r0, [sp, #(4*3)]
	subs    r0, #4
	str     r0, [sp, #(4*3)]
	bgt     intmul_sb_1mod4_2      // end middle loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r8, [r0], #2
	str     r0, [sp, #(4*2)]
	// multiply r8-8 and r9-r12, accumulate r1-r4 and 1 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldr     r0, [sp, #(4*0)]
	subs    r0, #4
	str     r0, [sp, #(4*0)]
	bgt     intmul_sb_1mod4_1
intmul_sb_1mod4_end: // ending segment
	ldr     r0, [sp, #(4*6)]
	str     r0, [sp, #(4*3)]
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	ldr     r0, [sp, #(4*5)]
	sub     lr, lr, r0, LSL #1  // move destination pointer LR
	ldr     r1, [sp, #(4*2)]
	sub     r1, r1, r0, LSL #1  // move multiplicand pointer s2
	ldrh    r9, [r1, #2]
	ldrh    r10, [r1, #4]
	ldrh    r11, [r1, #6]
	ldrh    r8, [r1], #8
	str     r1, [sp, #(4*2)]
	ldrh    r1, [lr, #0]
	ldrh    r2, [lr, #2]
	ldrh    r3, [lr, #4]
	ldrh    r4, [lr, #6]
	// don't move LR yet
	ldr     r0, [sp, #(4*1)]
	ldrh    r12, [r0], #2
	str     r0, [sp, #(4*1)]
	// multiply r8-11 and r12-r12, accumulate r1-r1
	mla     r0, r12, r8, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r9, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r10, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r11, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
intmul_sb_1mod4_3: // final loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r9, [r0, #2]
	ldrh    r10, [r0, #4]
	ldrh    r11, [r0, #6]
	ldrh    r8, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r8-11 and r12-r12, accumulate r1-r1 and 4 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r8, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r9, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r10, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r11, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16

	ldr     r0, [sp, #(4*3)]
	subs    r0, #4
	str     r0, [sp, #(4*3)]
	bgt     intmul_sb_1mod4_3      // end final loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r11, [r0], #2
	// multiply r11-11 and r12-r12, accumulate r1-r1 and 1 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r12, r11, r1
	strh    r0, [lr], #2
	lsr     r1, r0, #16
	strh    r1, [lr], #2
	add	sp, #(4*7)
	pop     {r4-r11,pc}

intmul_sb_2mod4:
	push    {r4-r11,lr}
	sub	sp, #(4*7)
	str     r3, [sp, #(4*5)]
	bic     r3, r3, #3

	sub     r3, #4
	str     r3, [sp, #(4*3)]
	str     r3, [sp, #(4*0)]
	str     r3, [sp, #(4*6)]
	// s0, s3, s6 = floor4(N)-4 (float),  s5 = N (integer)
	mov     lr, r0
	ldrh    r10, [r1, #2]
	ldrh    r11, [r1, #4]
	ldrh    r12, [r1, #6]
	ldrh    r9, [r1], #8
	ldrh    r6, [r2, #2]
	ldrh    r7, [r2, #4]
	ldrh    r8, [r2, #6]
	ldrh    r5, [r2], #8

	str     r1, [sp, #(4*1)]
	str     r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	mul     r0, r9, r5
	lsr     r1, r0, #16
	mla     r1, r10, r5, r1
	lsr     r2, r1, #16
	mla     r2, r11, r5, r2
	lsr     r3, r2, #16
	mla     r3, r12, r5, r3
	lsr	r4, r3, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_sb_2mod4_0: // first loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	ldrh    r5, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3

	ldr     r0, [sp, #(4*3)] 
	subs    r0, #4
	str     r0, [sp, #(4*3)]
	bgt     intmul_sb_2mod4_0      // end first loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r8, [r0, #2]
	ldrh    r7, [r0], #4
	str     r0, [sp, #(4*2)]
	// multiply r7-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_sb_2mod4_1: 			// consequent loops
	ldr     r0, [sp, #(4*6)] 
	str     r0, [sp, #(4*3)]
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	ldr     r0, [sp, #(4*5)]
	sub     lr, lr, r0, LSL #1  // move destination pointer LR
	ldr     r1, [sp, #(4*2)]
	sub     r1, r1, r0, LSL #1  // move multiplicand pointer s2
	ldrh    r6, [r1, #2]
	ldrh    r7, [r1, #4]
	ldrh    r8, [r1, #6]
	ldrh    r5, [r1], #8
	str      r1, [sp, #(4*2)]
	ldr      r0, [sp, #(4*1)]
	ldrh    r10, [r0, #2]
	ldrh    r11, [r0, #4]
	ldrh    r12, [r0, #6]
	ldrh    r9, [r0], #8
	str      r0, [sp, #(4*1)]
	ldrh    r1, [lr, #0]
	ldrh    r2, [lr, #2]
	ldrh    r3, [lr, #4]
	ldrh    r4, [lr, #6]
	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_sb_2mod4_2: // middle loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	ldrh    r5, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3

	ldr     r0, [sp, #(4*3)]
	subs    r0, #4
	str     r0, [sp, #(4*3)]
	bgt     intmul_sb_2mod4_2      // end middle loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r8, [r0, #2]
	ldrh    r7, [r0], #4
	str     r0, [sp, #(4*2)]
	// multiply r7-8 and r9-r12, accumulate r1-r4 and 2 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldr     r0, [sp, #(4*0)]
	subs    r0, #4
	str     r0, [sp, #(4*0)]
	bgt     intmul_sb_2mod4_1
intmul_sb_2mod4_end: // ending segment
	ldr     r0, [sp, #(4*6)]
	str     r0, [sp, #(4*3)]
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	ldr     r0, [sp, #(4*5)]
	sub     lr, lr, r0, LSL #1  // move destination pointer LR
	ldr     r1, [sp, #(4*2)]
	sub     r1, r1, r0, LSL #1  // move multiplicand pointer s2
	ldrh    r8, [r1, #2]
	ldrh    r9, [r1, #4]
	ldrh    r10, [r1, #6]
	ldrh    r7, [r1], #8
	str     r1, [sp, #(4*2)]
	ldrh    r1, [lr, #0]
	ldrh    r2, [lr, #2]
	ldrh    r3, [lr, #4]
	ldrh    r4, [lr, #6]
	// don't move LR yet
	ldr     r0, [sp, #(4*1)]
	ldrh    r12, [r0, #2]
	ldrh    r11, [r0], #4
	str     r0, [sp, #(4*1)]
	// multiply r7-10 and r11-r12, accumulate r1-r2
	mla     r0, r11, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r7, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	mla     r0, r11, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r8, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r9, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r9, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r10, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r10, r1
	lsr     r2, r1, #16
	uxth    r1, r1
intmul_sb_2mod4_3: // final loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r8, [r0, #2]
	ldrh    r9, [r0, #4]
	ldrh    r10, [r0, #6]
	ldrh    r7, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r7-10 and r11-r12, accumulate r1-r2 and 4 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r7, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r8, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r9, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r9, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r10, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r10, r1
	lsr     r2, r1, #16
	uxth    r1, r1

	ldr     r0, [sp, #(4*3)]
	subs    r0, #4
	str     r0, [sp, #(4*3)]
	bgt     intmul_sb_2mod4_3      // end final loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r10, [r0, #2]
	ldrh    r9, [r0], #4
	// multiply r9-10 and r11-r12, accumulate r1-r2 and 2 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r9, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r9, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r11, r10, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r12, r10, r1
	lsr     r2, r1, #16
	uxth    r1, r1
	strh    r2, [lr, #2]
	strh    r1, [lr], #4
	add	sp, #(4*7)
	pop     {r4-r11,pc}

intmul_sb_0mod4:
	push    {r4-r11,lr}
	sub	sp, #(4*7)
	str     r3, [sp, #(4*5)]

	sub     r3, #4
	str     r3, [sp, #(4*3)]
	str     r3, [sp, #(4*0)]
	str     r3, [sp, #(4*6)]
	// s0, s3, s6 = floor4(N)-4 (float),  s5 = N (integer)
	mov     lr, r0
	ldrh    r10, [r1, #2]
	ldrh    r11, [r1, #4]
	ldrh    r12, [r1, #6]
	ldrh    r9, [r1], #8
	ldrh    r6, [r2, #2]
	ldrh    r7, [r2, #4]
	ldrh    r8, [r2, #6]
	ldrh    r5, [r2], #8

	str     r1, [sp, #(4*1)]
	str     r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	mul     r0, r9, r5
	lsr     r1, r0, #16
	mla     r1, r10, r5, r1
	lsr     r2, r1, #16
	mla     r2, r11, r5, r2
	lsr     r3, r2, #16
	mla     r3, r12, r5, r3
	lsr	r4, r3, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_sb_0mod4_0: // first loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	ldrh    r5, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3

	ldr     r0, [sp, #(4*3)] 
	subs    r0, #4
	str     r0, [sp, #(4*3)]
	bgt     intmul_sb_0mod4_0      // end first loop
intmul_sb_0mod4_1: 			// consequent loops
	ldr     r0, [sp, #(4*6)] 
	str     r0, [sp, #(4*3)]
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	ldr     r0, [sp, #(4*5)]
	sub     lr, lr, r0, LSL #1  // move destination pointer LR
	ldr     r1, [sp, #(4*2)]
	sub     r1, r1, r0, LSL #1  // move multiplicand pointer s2
	ldrh    r6, [r1, #2]
	ldrh    r7, [r1, #4]
	ldrh    r8, [r1, #6]
	ldrh    r5, [r1], #8
	str      r1, [sp, #(4*2)]
	ldr      r0, [sp, #(4*1)]
	ldrh    r10, [r0, #2]
	ldrh    r11, [r0, #4]
	ldrh    r12, [r0, #6]
	ldrh    r9, [r0], #8
	str      r0, [sp, #(4*1)]
	ldrh    r1, [lr, #0]
	ldrh    r2, [lr, #2]
	ldrh    r3, [lr, #4]
	ldrh    r4, [lr, #6]
	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_sb_0mod4_2: // middle loop
	ldr     r0, [sp, #(4*2)]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	ldrh    r5, [r0], #8
	str     r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3

	ldr     r0, [sp, #(4*3)]
	subs    r0, #4
	str     r0, [sp, #(4*3)]
	bgt     intmul_sb_0mod4_2      // end middle loop
	ldr     r0, [sp, #(4*0)]
	subs    r0, #4
	str     r0, [sp, #(4*0)]
	bgt     intmul_sb_0mod4_1
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	add	sp, #(4*7)
	pop     {r4-r11,pc}


	.p2align	2,,3	
	.syntax		unified
	.text

	.global intmul_4nx4
	.type	intmul_4nx4, %function
intmul_4nx4:
	// intmul_4nx4 (uint32_t *d, *a, *b, int c) a=c-long b=8-long
	push	{r4-r11,lr} // s0 is counter s1/s2= pointer, s3=length
	sub	sp, #(4*4)
	add	r3, r3
	str	r3, [sp, #(4*3)]
	sub	r3, #4
	str	r3, [sp, #(4*0)]
	mov	lr, r0
	ldrh    r6, [r2, #2]
	ldrh    r7, [r2, #4]
	ldrh    r8, [r2, #6]
	ldrh    r5, [r2], #8
	ldrh    r10, [r1, #2]
	ldrh    r11, [r1, #4]
	ldrh    r12, [r1, #6]
	ldrh    r9, [r1], #8
	str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	mul     r0, r9, r5
	lsr     r1, r0, #16
	mla     r1, r10, r5, r1
	lsr     r2, r1, #16
	mla     r2, r11, r5, r2
	lsr     r3, r2, #16
	mla     r3, r12, r5, r3
	lsr	r4, r3, #16
	strh    r0, [lr], #2
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_4nx4_0:
	ldr	r0, [sp, #(4*1)]
	ldrh    r10, [r0, #2]
	ldrh    r11, [r0, #4]
	ldrh    r12, [r0, #6]
	ldrh    r9, [r0], #8
	str	r0, [sp, #(4*1)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldr	r0, [sp, #(4*0)]
	subs	r0, #4
	str	r0, [sp, #(4*0)]
	bgt	intmul_4nx4_0
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	ldr	r0, [sp, #(4*1)]
	ldr	r1, [sp, #(4*3)]
	sub	r0, r0, r1, LSL #1
	sub	lr, lr, r1, LSL #1
	sub	r1, #4
	str	r1, [sp, #(4*0)]
	ldrh    r10, [r0, #2]
	ldrh    r11, [r0, #4]
	ldrh    r12, [r0, #6]
	ldrh    r9, [r0], #8
	str	r0, [sp, #(4*1)]
	ldr	r0, [sp, #(4*2)]
	ldrh    r5, [r0, #0]
	ldrh    r6, [r0, #2]
	ldrh    r7, [r0, #4]
	ldrh    r8, [r0, #6]
	ldrh    r1, [lr, #0]
	ldrh    r2, [lr, #2]
	ldrh    r3, [lr, #4]
	ldrh    r4, [lr, #6]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
intmul_4nx4_1:
	ldr	r0, [sp, #(4*1)]
	ldrh    r10, [r0, #2]
	ldrh    r11, [r0, #4]
	ldrh    r12, [r0, #6]
	ldrh    r9, [r0], #8
	str	r0, [sp, #(4*1)]
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r5, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r5, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r5, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r5, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r6, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r6, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r6, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r6, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r7, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r7, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r7, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r7, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldrh    r0, [lr]
	add     r1, r0
	mla     r0, r9, r8, r1
	strh    r0, [lr], #2
	add     r1, r2, r0, lsr #16
	mla     r1, r10, r8, r1
	add     r2, r3, r1, lsr #16
	mla     r2, r11, r8, r2
	add     r3, r4, r2, lsr #16
	mla     r3, r12, r8, r3
	lsr     r4, r3, #16
	uxth    r1, r1
	uxth    r2, r2
	uxth    r3, r3
	ldr	r0, [sp, #(4*0)]
	subs	r0, #4
	str	r0, [sp, #(4*0)]
	bgt	intmul_4nx4_1
	strh    r2, [lr, #2]
	strh    r3, [lr, #4]
	strh    r4, [lr, #6]
	strh    r1, [lr], #8
	add	sp, #(4*4)
	pop	{r4-r11,pc}
