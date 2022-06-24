.syntax unified
.cpu cortex-m3
.section .text

#include "params.h"

.align 2
.global sub_high
.type sub_high, %function
sub_high:
    push.w {r4-r11, lr}

    add.w r1, #(4*Npad)
    add.w r2, #(4*Npad)

    .set i, 0
    .rept N
        ldr.w r4, [r1, #4*i]
        ldr.w r5, [r2, #4*i]
        .if i == 0
            subs.w r4, r5
        .else
            sbcs.w r4, r5
        .endif
        str.w r4, [r0, #4*i]
        .set i, i+1

    .endr

    # create mask with carry 0xFFFFFFFF if carry is set
    sbc.w r6, r0, r0
    .set i, 0
    .rept N
        ldr.w r4, [r0, #4*i]
        ldr.w r5, [r3, #4*i]
        and.w r5, r5, r6
        .if i==0
            adds.w r4, r4, r5
        .else
            adcs.w r4, r4, r5
        .endif
        str.w r4, [r0, #4*i]
        .set i, i+1
    .endr

    pop.w {r4-r11, pc}


.align 2
.global add_high
.type add_high, %function
add_high:
    push.w {r4-r11, lr}

    add.w r1, #(4*Npad)

    mov.w r4, #0
    #FIXME could merge into dechunk
    .rept Npad
        ldr.w r5, [r2], #4
        orr.w r4, r5
    .endr

    // set carry, unless lower part is 0
    cmp.n r4, #1

    .set i, 0
    .rept N
        ldr.w r4, [r1, #4*i]
        ldr.w r5, [r2, #4*i]
        adcs.w r4, r5
        str.w r4, [r0, #4*i]
        .set i,i+1
    .endr

    pop.w {r4-r11, pc}


.align 2
.global fix_modp
.type fix_modp, %function
fix_modp:
    push.w {r4-r11, lr}

    .set i, 0
    .rept N
        ldr.w r4, [r1, #4*i]
        ldr.w r5, [r2, #4*i]
        .if i == 0
            subs.w r4, r5
        .else
            sbcs.w r4, r5
        .endif
        str.w r4, [r0, #4*i]
        .set i, i+1
    .endr

    sbc.w r6, r0, r0

    .set i, 0
    .rept N
        ldr.w r4, [r0, #4*i]
        ldr.w r5, [r2, #4*i]
        and.w r5, r6
        .if i == 0
            adds.w r4, r5
        .else
            adcs.w r4, r5
        .endif
        str.w r4, [r0, #4*i]
        .set i, i+1
    .endr

    pop.w {r4-r11, pc}

