	.p2align	2,,3	
	.syntax		unified
	.text

	.global int_addl
	.type	int_addl, %function 
	.global int_addul
	.type	int_addul, %function 
	.global int_add
	.type	int_add, %function 
	.global int_addto
	.type	int_addto, %function 
	.global int_addlto
	.type	int_addlto, %function 
	.global int_sub
	.type	int_sub, %function 
	.global int_subto
	.type	int_subto, %function 
	.global int_subtor
	.type	int_subtor, %function 
	.global int_dblto
	.type	int_dblto, %function 
	.global int_negto
	.type	int_negto, %function 
	
	l4	.req	r0
	aa	.req	r1
	bb	.req	r2
	l	.req	r3	
	c	.req	r4	
	aa0	.req	r5	
	aa1	.req	r6	
	aa2	.req	r7	
	aa3	.req	r8	
	bb0	.req	r9	
	bb1	.req	r10	
	bb2	.req	r11	
	bb3	.req	r12
	dd0	.req	r9	
	dd1	.req	r10	
	dd2	.req	r11	
	dd3	.req	r12
	dd	.req	r14

	// void int_addl(uint32_t *d, uint32_t *a, uint32_t *b, int l);
	// add, extend by 1
	// void int_addul(uint32_t *d, uint32_t *a, uint32_t *b, int l);
	// add uneven, extend by 1
	// void int_add(uint32_t *d, uint32_t *a, uint32_t *b, int l);
	// just add 
	// void int_addto(uint32_t *d, uint32_t *a, int dl, int l);
	// add into, first addend longer by dl
	// void int_addlto(uint32_t *d, uint32_t *a, int dl, int l);
	// add into, extend by 1, first addend longer by dl
	// void int_sub(uint32_t *d, uint32_t *a, uint32_t b, int l);
	// just sub
	// void int_subto(uint32_t *d, uint32_t *a, int dl, int l);
	// sub from, subtrahend longer by dl
	// void int_subtor(uint32_t *d, uint32_t *a, int dl, int l);
	// sub from, minuend longer by dl
	// void int_dblto(uint32_t *d, int l); // double in place, extend by 1
	// void int_negto(uint32_t *d, int l); // negate in place
	
int_addl:
	push	{r4-r11,lr}
	mov	dd, l4
	and	l4, l, #3
	bics	l, #3
	adds	aa, #0	// clear carry
int_addl0:
	cbz	l, int_addl1
	ldm	aa!, {aa0-aa3}
	ldm	bb!, {bb0-bb3}
	adcs	aa0, bb0
	adcs	aa1, bb1
	adcs	aa2, bb2
	adcs	aa3, bb3
	stm	dd!, {aa0-aa3}
	sub	l, #4
	b	int_addl0
int_addl1:	
	cbz	l4, int_addl2
	ldr	aa0, [aa], #4
	ldr	bb0, [bb], #4
	adcs	aa0, bb0
	str	aa0, [dd], #4
	sub	l4, #1
	b	int_addl1
int_addl2:
	mov	aa0, #0
	adc	aa0, #0
	str	aa0, [dd]
	pop	{r4-r11, pc}

int_addul:			
	push	{r4-r11,lr}
	mov	dd, l4
	and	l4, l, #3
	bics	l, #3
	adds	aa, #0	// clear carry
int_addul0:
	cbz	l, int_addul1
	ldm	aa!, {aa0-aa3}
	ldm	bb!, {bb0-bb3}
	adcs	aa0, bb0
	adcs	aa1, bb1
	adcs	aa2, bb2
	adcs	aa3, bb3
	stm	dd!, {aa0-aa3}
	sub	l, #4
	b	int_addul0
int_addul1:	
	cbz	l4, int_addul2
	ldr	aa0, [aa], #4
	ldr	bb0, [bb], #4
	adcs	aa0, bb0
	str	aa0, [dd], #4
	sub	l4, #1
	b	int_addul1
int_addul2:
	ldr	aa0, [aa]
	adcs	aa0, #0
	str	aa0, [dd], #4
	mov	aa0, #0
	adc	aa0, #0
	str	aa0, [dd]
	pop	{r4-r11, pc}

	
int_add:
	push	{r4-r11,lr}
	mov	dd, l4
	and	l4, l, #3
	bics	l, #3
	adds	aa, #0	// clear carry
int_add0:
	cbz	l, int_add1
	ldm	aa!, {aa0-aa3}
	ldm	bb!, {bb0-bb3}
	adcs	aa0, bb0
	adcs	aa1, bb1
	adcs	aa2, bb2
	adcs	aa3, bb3
	stm	dd!, {aa0-aa3}
	sub	l, #4
	b	int_add0
int_add1:	
	cbz	l4, int_add2
	ldr	aa0, [aa], #4 
	ldr	bb0, [bb], #4
	adcs	aa0, bb0
	str	aa0, [dd], #4
	sub	l4, #1
	b	int_add1
int_add2:
	pop	{r4-r11, pc}

int_addto:
	push	{r4-r11,lr}
	mov	dd, l4
	and	l4, l, #3
	bics	l, #3
	adds	aa, #0	// clear carry
int_addto0:
	cbz	l, int_addto1
	ldm	dd, {dd0-dd3}
	ldm	aa!, {aa0-aa3}
	adcs	dd0, aa0
	adcs	dd1, aa1
	adcs	dd2, aa2
	adcs	dd3, aa3
	stm	dd!, {dd0-dd3}
	sub	l, #4
	b	int_addto0
int_addto1:	
	cbz	l4, int_addto2
	ldr	dd0, [dd]
	ldr	aa0, [aa], #4
	adcs	dd0, aa0
	str	dd0, [dd], #4
	sub	l4, #1
	b	int_addto1
int_addto2:
	cbz	bb, int_addto3
	ldr	dd0, [dd]
	adcs	dd0, #0
	str	dd0, [dd], #4
	sub	bb, #1
	b	int_addto2
int_addto3:	
	pop	{r4-r11, pc}

int_addlto:
	push	{r4-r11,lr}
	mov	dd, l4
	and	l4, l, #3
	bics	l, #3
	adds	aa, #0	// clear carry
int_addlto0:
	cbz	l, int_addlto1
	ldm	dd, {dd0-dd3}
	ldm	aa!, {aa0-aa3}
	adcs	dd0, aa0
	adcs	dd1, aa1
	adcs	dd2, aa2
	adcs	dd3, aa3
	stm	dd!, {dd0-dd3}
	sub	l, #4
	b	int_addlto0
int_addlto1:	
	cbz	l4, int_addlto2
	ldr	dd0, [dd]
	ldr	aa0, [aa], #4
	adcs	dd0, aa0
	str	dd0, [dd], #4
	sub	l4, #1
	b	int_addlto1
int_addlto2:
	cbz	bb, int_addlto3
	ldr	dd0, [dd]
	adcs	dd0, #0
	str	dd0, [dd], #4
	sub	bb, #1
	b	int_addlto2
int_addlto3:
	mov	dd0, #0
	adc	dd0, #0
	str	dd0, [dd]
	pop	{r4-r11, pc}

	
int_sub:
	push	{r4-r11,lr}
	mov	dd, l4
	and	l4, l, #3
	bics	l, #3
	subs	aa, #0	// set carry
int_sub1:
	cbz	l, int_sub0
	ldm	aa!, {aa0-aa3}
	ldm	bb!, {bb0-bb3}
	sbcs	aa0, bb0
	sbcs	aa1, bb1
	sbcs	aa2, bb2
	sbcs	aa3, bb3
	stm	dd!, {aa0-aa3}
	sub	l, #4
	b	int_sub1
int_sub0:	
	cbz	l4, int_sub2
	ldr	aa0, [aa], #4
	ldr	bb0, [bb], #4
	sbcs	aa0, bb0
	str	aa0, [dd], #4
	sub	l4, #1
	b	int_sub0
int_sub2:
	pop	{r4-r11, pc}
	
int_subto:
	push	{r4-r11,lr}
	mov	dd, l4
	and	l4, l, #3
	bics	l, #3
	subs	aa, #0	// set carry
int_subto1:
	cbz	l, int_subto0
	ldm	dd, {dd0-dd3}
	ldm	aa!, {aa0-aa3}
	sbcs	dd0, aa0
	sbcs	dd1, aa1
	sbcs	dd2, aa2
	sbcs	dd3, aa3
	stm	dd!, {dd0-dd3}
	sub	l, #4
	b	int_subto1
int_subto0:	
	cbz	l4, int_subto2
	ldr	dd0, [dd]
	ldr	aa0, [aa], #4
	sbcs	dd0, aa0
	str	dd0, [dd], #4
	sub	l4, #1
	b	int_subto0
int_subto2:
	cbz	bb, int_subto3
	ldr	dd0, [dd]
	sbcs	dd0, #0
	str	dd0, [dd], #4
	sub	bb, #1
	b	int_subto2
int_subto3:
	pop	{r4-r11, pc}
	
int_subtor:
	push	{r4-r11,lr}
	mov	dd, l4
	and	l4, l, #3
	bics	l, #3
	subs	aa, #0	// set carry
int_subtor1:
	cbz	l, int_subtor0
	ldm	dd, {dd0-dd3}
	ldm	aa!, {aa0-aa3}
	sbcs	dd0, aa0
	sbcs	dd1, aa1
	sbcs	dd2, aa2
	sbcs	dd3, aa3
	stm	dd!, {dd0-dd3}
	sub	l, #4
	b	int_subtor1
int_subtor0:	
	cbz	l4, int_subtor2
	ldr	dd0, [dd]
	ldr	aa0, [aa], #4
	sbcs	dd0, aa0
	str	dd0, [dd], #4
	sub	l4, #1
	b	int_subtor0
int_subtor2:
	cbz	bb, int_subtor3
	ldr	aa0, [aa], #4
	mov	dd0, #0
	sbcs	dd0, aa0
	str	dd0, [dd], #4
	sub	bb, #1
	b	int_subtor2
int_subtor3:
	pop	{r4-r11, pc}



int_dblto:
	push	{r4-r11,lr}
	mov	dd, l4
	and	l4, aa, #3
	bics	aa, #3
	adds	dd, #0	// clear carry
int_dblto0:
	cbz	aa, int_dblto1
	ldm	dd, {dd0-dd3}
	adcs	dd0, dd0
	adcs	dd1, dd1
	adcs	dd2, dd2
	adcs	dd3, dd3
	stm	dd!, {dd0-dd3}
	sub	aa, #4
	b	int_dblto0
int_dblto1:	
	cbz	l4, int_dblto2
	ldr	dd0, [dd]
	adcs	dd0, dd0
	str	dd0, [dd], #4
	sub	l4, #1
	b	int_dblto1
int_dblto2:
	mov	dd0, #0
	adcs	dd0, #0
	str	dd0, [dd], #4
	pop	{r4-r11, pc}
	
int_negto:
	push	{r4-r11,lr}
	mov	dd, l4
	and	l4, aa, #3
	bics	aa, #3
	subs	dd, #0	// set carry
	mov	bb, #0
int_negto0:
	cbz	aa, int_negto1
	ldm	dd, {dd0-dd3}
	sbcs	dd0, bb, dd0
	sbcs	dd1, bb, dd1
	sbcs	dd2, bb, dd2
	sbcs	dd3, bb, dd3
	stm	dd!, {dd0-dd3}
	sub	aa, #4
	b	int_negto0
int_negto1:	
	cbz	l4, int_negto2
	ldr	dd0, [dd]
	sbcs 	dd0, bb, dd0
	str	dd0, [dd], #4
	sub	l4, #1
	b	int_negto1
int_negto2:
	pop	{r4-r11, pc}
