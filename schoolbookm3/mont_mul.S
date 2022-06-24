.syntax unified
.cpu cortex-m3

#include "params.h"

// 8 or 9 (if k == 0)
.macro mont_mul_inner aaa, ccc0, uuu, ppp, mont_red_t, zero, bbb, tmp, k, minv, uuu2
    // t2 = (uint32_t)a[i]*b[j];
    mul.w \bbb, \aaa, \bbb

    .if k%2 == 0
        carry .req \uuu
    .else
        carry .req \uuu2
    .endif

    // cbuf[(i+j)/2] = t2 + cbuf[(i+j)/2] + u;
    .if k < 2
    adds.w \ccc0, \ccc0, \bbb
    adc.w carry,\zero, \zero
    .else
    add.w \bbb, \bbb, carry
    adds.w \ccc0, \ccc0, \bbb
    adc.w carry, \zero, \zero
    .endif

    .if k==0
    ubfx.w \tmp, \ccc0, #0, #16
    mul.w \mont_red_t, \tmp, \minv
    ubfx.w \mont_red_t, \mont_red_t, #0, #16
    .endif

    // t2 = (uint32_t)p[j] * t;
    mul.w \ppp, \ppp, \mont_red_t
    adds.w \ccc0, \ccc0, \ppp
    adc.w carry, #0

    .unreq carry

.endm

.macro mont_mul c_ptr, aaa_ptr, bbb_ptr, p_ptr, aaa, ccc0, uuu, ppp, mont_red_t, zero, bbb, tmp, minv, uuu2
    ldrh.w \aaa, [\aaa_ptr], #2

    .set k, 0
    .rept N*2
    ldrh.w \bbb, [\bbb_ptr, #2*k]
    ldrh.w \ppp, [\p_ptr, #2*k]
    ldr.w \ccc0, [\c_ptr, #2*k]
    mont_mul_inner \aaa, \ccc0, \uuu, \ppp, \mont_red_t, \zero, \bbb, \tmp, k, \minv, \uuu2
    str.w \ccc0, [\c_ptr, #2*k]
    .set k,k+1
    .endr
    ldr \tmp, [\c_ptr, #N*2*2]
    add \tmp, \uuu
    add \tmp, \tmp, \uuu2, lsl#16
    str \tmp, [\c_ptr, #N*2*2]
.endm


.align 2
.global multi_limb_mont_16_asm
.type multi_limb_mont_16_asm, %function
multi_limb_mont_16_asm:
    push.w {r4-r12, lr}

    c_ptr      .req r0
    aaa_ptr    .req r1
    bbb_ptr    .req r2
    p_ptr      .req r3
    ccc0       .req r4
    tmp       .req r5
    uuu        .req r6
    ppp        .req r7
    mont_red_t .req r8
    zero       .req r9
    minv       .req r10
    bbb        .req r14
    aaa        .req r11
    iii        .req r12

    ldrh.w minv, [sp, #40]

    push.w {r0}
    sub.w sp, sp, #2*N*4+4
    mov.w c_ptr, sp

    mov.w r4, r1
    mov.w r5, r2
    mov.w r6, r3
    mov.w r1, #0
    mov.w r2, #2*N*4
    bl.w memset

    mov.w r1, r4
    mov.w r2, r5
    mov.w r3, r6

    mov.w zero, #0
    mov.w c_ptr ,sp

    mov.w iii, #N*2
    1:
    push {iii}
    mont_mul c_ptr, aaa_ptr, bbb_ptr, p_ptr, aaa, ccc0, uuu, ppp, mont_red_t, zero, bbb, tmp, minv, iii
    pop {iii}
    add.w c_ptr, #2
    subs.w iii, #1
    bne.w 1b

    ldr.w r0, [sp, #2*N*4+4]
    add.w r1, sp, #4*N
    mov.w r2, #4*N
    bl memcpy
    add.w sp, sp, #2*N*4+8


    pop.w {r4-r12, pc}