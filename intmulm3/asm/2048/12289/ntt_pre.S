    .syntax unified
    .cpu cortex-m3
    .section .text

    .align 2
    .global ntt_pre_12289
    .type ntt_pre_12289, %function
    ntt_pre_12289:
    push {r4-r11, lr}
    
mov r2, #1
b __ntt_12289
    pop {r4-r11, pc}
    .ltorg
    
/* minimum available registers: 10 */
