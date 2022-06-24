
	.p2align	2,,3	
	.syntax		unified
	.cpu cortex-m3
	.data

intmul_low_sb_jump:
	.word	intmul_low_sb_1
	.word	intmul_low_sb_2
	.word	intmul_low_sb_3
	.word	intmul_low_sb_4
	.word	intmul_low_sb_5
	.word	intmul_low_sb_6
	.word	intmul_low_sb_7
	.word	intmul_low_sb_8
	.word	intmul_low_sb_9
	.word	intmul_low_sb_10
	.word	intmul_low_sb_11
	.word	intmul_low_sb_12

	.p2align	2,,3	
	.syntax		unified
	.text

	.global intmul_low_sb
	.type	intmul_low_sb, %function
	.global intmul_low_sb_1
	.type	intmul_low_sb_1, %function
	.global intmul_low_sb_2
	.type	intmul_low_sb_2, %function
	.global intmul_low_sb_3
	.type	intmul_low_sb_3, %function
	.global intmul_low_sb_4
	.type	intmul_low_sb_4, %function
	.global intmul_low_sb_5
	.type	intmul_low_sb_5, %function
	.global intmul_low_sb_6
	.type	intmul_low_sb_6, %function
	.global intmul_low_sb_7
	.type	intmul_low_sb_7, %function
	.global intmul_low_sb_8
	.type	intmul_low_sb_8, %function
	.global intmul_low_sb_9
	.type	intmul_low_sb_9, %function
	.global intmul_low_sb_10
	.type	intmul_low_sb_10, %function
	.global intmul_low_sb_11
	.type	intmul_low_sb_11, %function
	.global intmul_low_sb_12
	.type	intmul_low_sb_12, %function
	.global intmul_low_sb_0mod4
        .type	intmul_low_sb_0mod4, %function
	.global intmul_low_sb_1mod4
        .type	intmul_low_sb_1mod4, %function
	.global intmul_low_sb_2mod4
        .type	intmul_low_sb_2mod4, %function
	.global intmul_low_sb_3mod4
        .type	intmul_low_sb_3mod4, %function

    	// R0 = destination, 2N words long
    	// R1 = first multiplicand, N words long
    	// R2 = second multiplicand, N words long
    	// R3 = N, Number of words
    	// uses UMAAL

intmul_low_sb:
    	cmp	r3, #12
    	bcs	intmul_low_sb_long
    	movw	r12, #:lower16:(intmul_low_sb_jump-4)
        movt    r12, #:upper16:(intmul_low_sb_jump-4)
    	ldr	pc, [r12, r3, LSL #2]
intmul_low_sb_1:
	push	{r4-r11,lr}
	ldr	r4, [r1]
	ldr	r5, [r2]
	mul	r6, r4, r5
	str	r6, [r0]
	pop	{r4-r11,pc}

intmul_low_sb_2:
	push	{r4-r11,lr}
	mov	lr, r0
	ldm	r1, {r11-r12}
	ldm	r2, {r9-r10}
	// multiply r9-10 and r11-r12
	umull	r0, r1, r11, r9
	mov	r2, #0
	umlal	r1, r2, r12, r9
	str	r0, [lr], #4
	mla	r0, r11, r10, r1
	str	r0, [lr], #4
	stm	lr, {r1-r2}
	pop	{r4-r11,pc}

intmul_low_sb_3:
	push	{r4-r11,lr}
	mov	lr, r0
	ldm	r1, {r10-r12}
	ldm	r2, {r7-r9}
	// multiply r7-9 and r10-r12
	umull	r0, r1, r10, r7
	mov	r2, #0
	umlal	r1, r2, r11, r7
	mov	r3, #0
	umlal	r2, r3, r12, r7
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r10, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r11, r8
	mla	r0, r10, r9, r1
	str	r0, [lr], #4
	stm	lr, {r1-r3}
	pop	{r4-r11,pc}

intmul_low_sb_4:
	push	{r4-r11,lr}
	mov	lr, r0
	ldm	r1, {r9-r12}
	ldm	r2, {r5-r8}
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	stm	lr, {r1-r4}
	pop	{r4-r11,pc}

intmul_low_sb_5:
	push	{r4-r11,lr}
	sub	sp, #12
	mov	lr, r0
	ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
	str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldr	r8, [r0], #4
	sub	r0, #(5*4)
        str	r0, [sp, #(4*2)]
	// multiply r8-8 and r9-r12, accumulate r1-r4
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	sub	lr, #(1*4)
	ldr	r1, [lr]
	ldr	r0, [sp, #(4*1)]
	ldr	r12, [r0]
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r8-r11}
	str	r0, [sp, #(4*2)]
	// multiply r8-11 and r12-r12, accumulate r1-r1
	mla	r0, r12, r8, r1
	str	r0, [lr], #4
	ldr	r0, [sp, #(4*2)]
	ldr	r11, [r0]
	// multiply r11-11 and r12-r12, accumulate r1-r1 and 1 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r12, r11
	str	r0, [lr], #4
	add	sp, #12
	pop	{r4-r11,pc}

intmul_low_sb_6:
	push	{r4-r11,lr}
	sub	sp, #12
	mov	lr, r0
	ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
	str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r7-r8}
	sub	r0, #(6*4)
        str	r0, [sp, #(4*2)]
	// multiply r7-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	sub	lr, #(2*4)
	ldm	lr, {r1-r2}
	ldr	r0, [sp, #(4*1)]
	ldm	r0, {r11-r12}
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r7-r10}
	str	r0, [sp, #(4*2)]
	// multiply r7-10 and r11-r12, accumulate r1-r2
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r11, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r12, r7
	mla	r0, r11, r8, r1
	str	r0, [lr], #4
	ldr	r0, [sp, #(4*2)]
	ldm	r0, {r9-r10}
	// multiply r9-10 and r11-r12, accumulate r1-r2 and 2 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r11, r9
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r12, r9
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r11, r10
	str	r0, [lr], #4
	add	sp, #12
	pop	{r4-r11,pc}

intmul_low_sb_7:
	push	{r4-r11,lr}
	sub	sp, #12
	mov	lr, r0
	ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
	str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r6-r8}
	sub	r0, #(7*4)
        str	r0, [sp, #(4*2)]
	// multiply r6-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	sub	lr, #(3*4)
	ldm	lr, {r1-r3}
	ldr	r0, [sp, #(4*1)]
	ldm	r0, {r10-r12}
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r6-r9}
	str	r0, [sp, #(4*2)]
	// multiply r6-9 and r10-r12, accumulate r1-r3
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r10, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r11, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r10, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r11, r7
	mla	r0, r10, r8, r1
	str	r0, [lr], #4
	ldr	r0, [sp, #(4*2)]
	ldm	r0, {r7-r9}
	// multiply r7-9 and r10-r12, accumulate r1-r3 and 3 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r10, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r11, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r12, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r10, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r11, r8
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r10, r9
	str	r0, [lr], #4
	add	sp, #12
	pop	{r4-r11,pc}

intmul_low_sb_8:
	push	{r4-r11,lr}
	sub	sp, #12
	mov	lr, r0
	ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
	str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	sub	r0, #(8*4)
        str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	sub	lr, #(4*4)
	ldm	lr, {r1-r4}
	ldr	r0, [sp, #(4*1)]
	ldm	r0, {r9-r12}
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	ldr	r0, [sp, #(4*2)]
	ldm	r0, {r5-r8}
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	add	sp, #12
	pop	{r4-r11,pc}

intmul_low_sb_9:
	push	{r4-r11,lr}
	sub	sp, #12
	mov	lr, r0
	ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
	str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	ldr	r0, [sp, #(4*2)]
	ldr	r8, [r0], #4
	sub	r0, #(9*4)
        str	r0, [sp, #(4*2)]
	// multiply r8-8 and r9-r12, accumulate r1-r4
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	sub	lr, #(5*4)
	ldr	r0, [sp, #(4*1)]
	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	ldm	lr, {r1-r4}
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	ldr	r0, [sp, #(4*2)]
	ldr	r8, [r0], #4
	sub	r0, #(5*4)
	str	r0, [sp, #(4*2)]
	// multiply r8-8 and r9-r12, accumulate r1-r4 and 1 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	sub	lr, #(1*4)
	ldr	r1, [lr]
	ldr	r0, [sp, #(4*1)]
	ldr	r12, [r0]
	ldr	r0, [sp, #(4*2)]
	ldr	r11, [r0]
	// multiply r11-11 and r12-r12, accumulate r1-r1
	mla	r0, r12, r11, r1
	str	r0, [lr], #4
	add	sp, #12
	pop	{r4-r11,pc}

intmul_low_sb_10:
	push	{r4-r11,lr}
	sub	sp, #12
	mov	lr, r0
	ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
	str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r7-r8}
	sub	r0, #(10*4)
        str	r0, [sp, #(4*2)]
	// multiply r7-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	sub	lr, #(6*4)
	ldr	r0, [sp, #(4*1)]
	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	ldm	lr, {r1-r4}
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r7-r8}
	sub	r0, #(6*4)
	str	r0, [sp, #(4*2)]
	// multiply r7-8 and r9-r12, accumulate r1-r4 and 2 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	sub	lr, #(2*4)
	ldm	lr, {r1-r2}
	ldr	r0, [sp, #(4*1)]
	ldm	r0, {r11-r12}
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r9-r10}
	// multiply r9-10 and r11-r12, accumulate r1-r2
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r11, r9
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r12, r9
	mla	r0, r11, r10, r1
	str	r0, [lr], #4
	add	sp, #12
	pop	{r4-r11,pc}

intmul_low_sb_11:
	push	{r4-r11,lr}
	sub	sp, #12
	mov	lr, r0
	ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
	str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r6-r8}
	sub	r0, #(11*4)
        str	r0, [sp, #(4*2)]
	// multiply r6-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	sub	lr, #(7*4)
	ldr	r0, [sp, #(4*1)]
	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	ldm	lr, {r1-r4}
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r6-r8}
	sub	r0, #(7*4)
	str	r0, [sp, #(4*2)]
	// multiply r6-8 and r9-r12, accumulate r1-r4 and 3 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	sub	lr, #(3*4)
	ldm	lr, {r1-r3}
	ldr	r0, [sp, #(4*1)]
	ldm	r0, {r10-r12}
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r7-r9}
	// multiply r7-9 and r10-r12, accumulate r1-r3
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r10, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r11, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r10, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r11, r8
	mla	r0, r10, r9, r1
	str	r0, [lr], #4
	add	sp, #12
	pop	{r4-r11,pc}

intmul_low_sb_12:
	push	{r4-r11,lr}
	sub	sp, #12
	mov	lr, r0
	ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
	str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	sub	r0, #(12*4)
        str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	sub	lr, #(8*4)
	ldr	r0, [sp, #(4*1)]
	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	ldm	lr, {r1-r4}
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	sub	r0, #(8*4)
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	sub	lr, #(4*4)
	ldm	lr, {r1-r4}
	ldr	r0, [sp, #(4*1)]
	ldm	r0, {r9-r12}
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r5-r8}
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	add	sp, #12
	pop	{r4-r11,pc}

intmul_low_sb_long: 
	ands	r12, r3, #3
    	beq	intmul_low_sb_0mod4 
	teq	r12, #1
	beq	intmul_low_sb_1mod4
	teq	r12, #2
    	beq	intmul_low_sb_2mod4

intmul_low_sb_3mod4:	// 4n+3
	push	{r4-r11,lr}
	sub	sp, #(4*7)
	str	r3, [sp, #(4*5)]
    	
	bic	r3, r3, #3
	sub     r3, #4
	str     r3, [sp, #(4*3)]
	str     r3, [sp, #(4*0)]
	
    	// s0, s3 = floor4(N)-4 (float),  s5 = N (integer)
	mov	lr, r0
        ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
        str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
intmul_low_sb_3mod4_0: // first loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr     r0, [sp, #(4*3)] 
	subs    r0, #4
	cmp	r0, #4
	str     r0, [sp, #(4*3)]
	
        bgt	intmul_low_sb_3mod4_0	// end first loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r6-r8}
	str	r0, [sp, #(4*2)]
	// multiply r6-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	
intmul_low_sb_3mod4_1: 			// consequent loops
	ldr     r0, [sp, #(4*0)]
        subs    r0, #4
        cmp	r0, #4
	str     r0, [sp, #(4*0)]
    	ble	intmul_low_sb_3mod4_1e
        ldr     r0, [sp, #(4*0)]
	str     r0, [sp, #(4*3)]
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
        ldm	r1!, {r5-r8}
        str	r1, [sp, #(4*2)]
        ldr	r0, [sp, #(4*1)]
	ldm	r0!, {r9-r12}
        str	r0, [sp, #(4*1)]
        ldm	lr, {r1-r4}	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
intmul_low_sb_3mod4_2: // middle loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	ldr     r0, [sp, #(4*3)]
        subs    r0, #4
        str     r0, [sp, #(4*3)]
        ble	intmul_low_sb_3mod4_2e	// end middle loop
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8

        b	intmul_low_sb_3mod4_2	// end middle loop
intmul_low_sb_3mod4_2e:
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r6-r8}
	str	r0, [sp, #(4*2)]
	// multiply r6-8 and r9-r12, accumulate r1-r4 and 3 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	b	intmul_low_sb_3mod4_1
intmul_low_sb_3mod4_1e: // ending segment
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
	ldm	r1!, {r5-r8}
	str	r1, [sp, #(4*2)]
        ldr	r0, [sp, #(4*1)]
    	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
    	ldm	lr, {r1-r4}	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r6-r8}
	str	r0, [sp, #(4*2)]
	// multiply r6-8 and r9-r12, accumulate r1-r4 and 3 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
    
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
	ldm	r1!, {r5-r8}
	str	r1, [sp, #(4*2)]
    	ldm	lr, {r1-r4}	// don't move LR yet
        ldr	r0, [sp, #(4*1)]
    	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r6-r8}
	str	r0, [sp, #(4*2)]
	// multiply r6-8 and r9-r12, accumulate r1-r4 and 3 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
    
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	ldr	r0, [sp, #(4*1)]
	ldm	r0, {r10-r12}
	ldm	r1, {r7-r9}
	ldm	lr, {r1-r3}	// don't move LR yet
	// multiply r7-9 and r10-r12, accumulate r1-r3
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r10, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r11, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r10, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r11, r8
	mla	r0, r10, r9, r1
	str	r0, [lr], #4
	add	sp, #(4*7)
	pop	{r4-r11,pc}

intmul_low_sb_2mod4:	// 4n+2
	push	{r4-r11,lr}
	sub	sp, #(4*7)
	str	r3, [sp, #(4*5)]
    	
	bic	r3, r3, #3
	sub     r3, #4
	str     r3, [sp, #(4*3)]
	str     r3, [sp, #(4*0)]
	
    	// s0, s3 = floor4(N)-4 (float),  s5 = N (integer)
	mov	lr, r0
        ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
        str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
intmul_low_sb_2mod4_0: // first loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr     r0, [sp, #(4*3)] 
	subs    r0, #4
	cmp	r0, #4
	str     r0, [sp, #(4*3)]
	
        bgt	intmul_low_sb_2mod4_0	// end first loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r7-r8}
	str	r0, [sp, #(4*2)]
	// multiply r7-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	
intmul_low_sb_2mod4_1: 			// consequent loops
	ldr     r0, [sp, #(4*0)]
        subs    r0, #4
        cmp	r0, #4
	str     r0, [sp, #(4*0)]
    	ble	intmul_low_sb_2mod4_1e
        ldr     r0, [sp, #(4*0)]
	str     r0, [sp, #(4*3)]
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
        ldm	r1!, {r5-r8}
        str	r1, [sp, #(4*2)]
        ldr	r0, [sp, #(4*1)]
	ldm	r0!, {r9-r12}
        str	r0, [sp, #(4*1)]
        ldm	lr, {r1-r4}	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
intmul_low_sb_2mod4_2: // middle loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	ldr     r0, [sp, #(4*3)]
        subs    r0, #4
        str     r0, [sp, #(4*3)]
        ble	intmul_low_sb_2mod4_2e	// end middle loop
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8

        b	intmul_low_sb_2mod4_2	// end middle loop
intmul_low_sb_2mod4_2e:
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r7-r8}
	str	r0, [sp, #(4*2)]
	// multiply r7-8 and r9-r12, accumulate r1-r4 and 2 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	b	intmul_low_sb_2mod4_1
intmul_low_sb_2mod4_1e: // ending segment
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
	ldm	r1!, {r5-r8}
	str	r1, [sp, #(4*2)]
        ldr	r0, [sp, #(4*1)]
    	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
    	ldm	lr, {r1-r4}	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r7-r8}
	str	r0, [sp, #(4*2)]
	// multiply r7-8 and r9-r12, accumulate r1-r4 and 2 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
    
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
	ldm	r1!, {r5-r8}
	str	r1, [sp, #(4*2)]
    	ldm	lr, {r1-r4}	// don't move LR yet
        ldr	r0, [sp, #(4*1)]
    	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	ldr	r0, [sp, #(4*2)]
	ldm	r0!, {r7-r8}
	str	r0, [sp, #(4*2)]
	// multiply r7-8 and r9-r12, accumulate r1-r4 and 2 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
    
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	ldr	r0, [sp, #(4*1)]
	ldm	r0, {r11-r12}
	ldm	r1, {r9-r10}
	ldm	lr, {r1-r2}	// don't move LR yet
	// multiply r9-10 and r11-r12, accumulate r1-r2
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r11, r9
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r12, r9
	mla	r0, r11, r10, r1
	str	r0, [lr], #4
	add	sp, #(4*7)
	pop	{r4-r11,pc}

intmul_low_sb_1mod4:	// 4n+1
	push	{r4-r11,lr}
	sub	sp, #(4*7)
	str	r3, [sp, #(4*5)]
    	
	bic	r3, r3, #3
	sub     r3, #4
	str     r3, [sp, #(4*3)]
	str     r3, [sp, #(4*0)]
	
    	// s0, s3 = floor4(N)-4 (float),  s5 = N (integer)
	mov	lr, r0
        ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
        str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
intmul_low_sb_1mod4_0: // first loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr     r0, [sp, #(4*3)] 
	subs    r0, #4
	cmp	r0, #4
	str     r0, [sp, #(4*3)]
	
        bgt	intmul_low_sb_1mod4_0	// end first loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	ldr	r0, [sp, #(4*2)]
	ldr	r8, [r0], #4
	str	r0, [sp, #(4*2)]
	// multiply r8-8 and r9-r12, accumulate r1-r4
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	
intmul_low_sb_1mod4_1: 			// consequent loops
	ldr     r0, [sp, #(4*0)]
        subs    r0, #4
        cmp	r0, #4
	str     r0, [sp, #(4*0)]
    	ble	intmul_low_sb_1mod4_1e
        ldr     r0, [sp, #(4*0)]
	str     r0, [sp, #(4*3)]
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
        ldm	r1!, {r5-r8}
        str	r1, [sp, #(4*2)]
        ldr	r0, [sp, #(4*1)]
	ldm	r0!, {r9-r12}
        str	r0, [sp, #(4*1)]
        ldm	lr, {r1-r4}	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
intmul_low_sb_1mod4_2: // middle loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	ldr     r0, [sp, #(4*3)]
        subs    r0, #4
        str     r0, [sp, #(4*3)]
        ble	intmul_low_sb_1mod4_2e	// end middle loop
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8

        b	intmul_low_sb_1mod4_2	// end middle loop
intmul_low_sb_1mod4_2e:
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	ldr	r0, [sp, #(4*2)]
	ldr	r8, [r0], #4
	str	r0, [sp, #(4*2)]
	// multiply r8-8 and r9-r12, accumulate r1-r4 and 1 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	b	intmul_low_sb_1mod4_1
intmul_low_sb_1mod4_1e: // ending segment
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
	ldm	r1!, {r5-r8}
	str	r1, [sp, #(4*2)]
        ldr	r0, [sp, #(4*1)]
    	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
    	ldm	lr, {r1-r4}	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	ldr	r0, [sp, #(4*2)]
	ldr	r8, [r0], #4
	str	r0, [sp, #(4*2)]
	// multiply r8-8 and r9-r12, accumulate r1-r4 and 1 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
    
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
	ldm	r1!, {r5-r8}
	str	r1, [sp, #(4*2)]
    	ldm	lr, {r1-r4}	// don't move LR yet
        ldr	r0, [sp, #(4*1)]
    	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	ldr	r0, [sp, #(4*2)]
	ldr	r8, [r0], #4
	str	r0, [sp, #(4*2)]
	// multiply r8-8 and r9-r12, accumulate r1-r4 and 1 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
    
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	ldr	r0, [sp, #(4*1)]
	ldr	r12, [r0]
	ldr	r11, [r1]
	ldr	r1, [lr]
	// multiply r11-11 and r12-r12, accumulate r1-r1
	mla	r0, r12, r11, r1
	str	r0, [lr], #4
	add	sp, #(4*7)
	pop	{r4-r11,pc}

intmul_low_sb_0mod4:	// 4n+0
	push	{r4-r11,lr}
	sub	sp, #(4*7)
	str	r3, [sp, #(4*5)]
    	
	sub     r3, #4
	str     r3, [sp, #(4*3)]
	str     r3, [sp, #(4*0)]
	
    	// s0, s3 = floor4(N)-4 (float),  s5 = N (integer)
	mov	lr, r0
        ldm	r1!, {r9-r12}
	ldm	r2!, {r5-r8}
        str	r1, [sp, #(4*1)]
	str	r2, [sp, #(4*2)]
	// multiply r5-8 and r9-r12
	umull	r0, r1, r9, r5
	mov	r2, #0
	umlal	r1, r2, r10, r5
	mov	r3, #0
	umlal	r2, r3, r11, r5
	mov	r4, #0
	umlal	r3, r4, r12, r5
	str	r0, [lr], #4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
intmul_low_sb_0mod4_0: // first loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr     r0, [sp, #(4*3)] 
	subs    r0, #4
	cmp	r0, #4
	str     r0, [sp, #(4*3)]
	
        bgt	intmul_low_sb_0mod4_0	// end first loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	
intmul_low_sb_0mod4_1: 			// consequent loops
	ldr     r0, [sp, #(4*0)]
        subs    r0, #4
        cmp	r0, #4
	str     r0, [sp, #(4*0)]
    	ble	intmul_low_sb_0mod4_1e
        ldr     r0, [sp, #(4*0)]
	str     r0, [sp, #(4*3)]
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
        ldm	r1!, {r5-r8}
        str	r1, [sp, #(4*2)]
        ldr	r0, [sp, #(4*1)]
	ldm	r0!, {r9-r12}
        str	r0, [sp, #(4*1)]
        ldm	lr, {r1-r4}	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
intmul_low_sb_0mod4_2: // middle loop
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	ldr     r0, [sp, #(4*3)]
        subs    r0, #4
        str     r0, [sp, #(4*3)]
        ble	intmul_low_sb_0mod4_2e	// end middle loop
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8

        b	intmul_low_sb_0mod4_2	// end middle loop
intmul_low_sb_0mod4_2e:
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	b	intmul_low_sb_0mod4_1
intmul_low_sb_0mod4_1e: // ending segment
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
	ldm	r1!, {r5-r8}
	str	r1, [sp, #(4*2)]
        ldr	r0, [sp, #(4*1)]
    	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
    	ldm	lr, {r1-r4}	// don't move LR yet
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r7
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r7
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r8
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r8
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r8
	ldr	r0, [sp, #(4*2)]
        ldm	r0!, {r5-r8}
	str	r0, [sp, #(4*2)]
	// multiply r5-8 and r9-r12, accumulate r1-r4 and 4 words from lr
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	ldr	r0, [lr]
	adds	r0, r1
	mov	r1, #0
	adc	r1, #0
	umlal	r0, r1, r9, r8
	str	r0, [lr], #4
    
	ldr	r0, [sp, #(4*5)]
        ldr	r1, [sp, #(4*2)]
        sub	r1, r1, r0, LSL #2  // move multiplicand pointer s2
	sub	r0, #4
	sub	lr, lr, r0, LSL #2  // move destination pointer LR
	str	r0, [sp, #(4*5)]
	ldm	r1!, {r5-r8}
	str	r1, [sp, #(4*2)]
    	ldm	lr, {r1-r4}	// don't move LR yet
        ldr	r0, [sp, #(4*1)]
    	ldm	r0!, {r9-r12}
	str	r0, [sp, #(4*1)]
	// multiply r5-8 and r9-r12, accumulate r1-r4
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r5
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r5
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r5
	adds	r3, r4
	mov	r4, #0
	adc	r4, #0
	umlal	r3, r4, r12, r5
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r6
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r6
	adds	r2, r3
	mov	r3, #0
	adc	r3, #0
	umlal	r2, r3, r11, r6
	mov	r0, r1
	mov	r1, #0
	umlal	r0, r1, r9, r7
	str	r0, [lr], #4
	adds	r1, r2
	mov	r2, #0
	adc	r2, #0
	umlal	r1, r2, r10, r7
	mla	r0, r9, r8, r1
	str	r0, [lr], #4
	add	sp, #(4*7)
	pop	{r4-r11,pc}
