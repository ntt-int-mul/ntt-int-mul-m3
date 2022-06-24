	.p2align	2,,3	
	.syntax		unified
	.text

	.global hensel32
	.type	hensel32, %function 

	// r0: input, the value to take inverse mod 2^32, r0&1==1
	
hensel32:
	rsb	r1, r0, #2
	mov	r3, #4
	
hensel32_0:
	mul	r2, r1, r1
	mul	r2, r2, r0
	rsb	r1, r2, r1, LSL #1
	subs	r3, #1
	bne	hensel32_0
	mov	r0, r1
	bx	lr
	
