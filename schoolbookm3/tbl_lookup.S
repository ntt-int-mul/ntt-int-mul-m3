
.syntax unified
.cpu cortex-m3
.thumb
.section .text

#include "params.h"

.set SZ,  (N)   /* size of a single table entry (in 4-byte words) */
.set NUM, (1u<<EXP_WINDOWSIZE)      /* number of table entries */

.macro fetch4 ptr, a,b,c,d
    ldr.w \b, [\ptr, # 4]
    ldr.w \c, [\ptr, # 8]
    ldr.w \d, [\ptr, #12]
    ldr.w \a, [\ptr],#16
.endm

.macro store4 ptr, a,b,c,d
    str.w \b, [\ptr, # 4]
    str.w \c, [\ptr, # 8]
    str.w \d, [\ptr, #12]
    str.w \a, [\ptr],#16
.endm

.macro cmov4 cond, a,b,c,d, A,B,C,D
    itttt.n \cond
    moveq.w \a, \A
    moveq.w \b, \B
    moveq.w \c, \C
    moveq.w \d, \D
.endm

.macro cmov4_ifeq u,v, a,b,c,d, A,B,C,D
    cmp.w \u, \v
    cmov4eq \a,\b,\c,\d, \A,\B,\C,\D
.endm

.align 2
.global tbl_lookup
.type tbl_lookup, %function
tbl_lookup:             /* arguments: dst, src, idx */
push {r4-r11, lr}

mov.w r12, #(4*(NUM*SZ-4))
mov.w r14, #SZ
mov.w r11, #(4*(SZ-4))
0:
    .set j,0
    .rept NUM
        fetch4 r1, r7,r8,r9,r10
        cmp.n r2, #j
        cmov4 eq, r3,r4,r5,r6, r7,r8,r9,r10
        add r1, r11
        .set j,j+1
    .endr

    store4 r0, r3,r4,r5,r6

    sub.w  r1, r12
    subs.w r14, #4
    it ne
    bne 0b

pop {r4-r11, pc}

