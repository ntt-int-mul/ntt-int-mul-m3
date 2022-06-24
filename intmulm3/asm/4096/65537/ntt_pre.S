    .syntax unified
    .cpu cortex-m3
    .section .text

    .align 2
    .global ntt_pre_65537
    .type ntt_pre_65537, %function
    ntt_pre_65537:
    push {r4-r11, lr}
    
mov r2, #1
b __ntt_65537
    pop {r4-r11, pc}
    .ltorg
    
/* minimum available registers: 12 */
