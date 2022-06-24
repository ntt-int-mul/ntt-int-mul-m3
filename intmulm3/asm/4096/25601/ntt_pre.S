    .syntax unified
    .cpu cortex-m3
    .section .text

    .align 2
    .global ntt_pre_25601
    .type ntt_pre_25601, %function
    ntt_pre_25601:
    push {r4-r11, lr}
    
mov r2, #1
b __ntt_25601
    pop {r4-r11, pc}
    .ltorg
    
/* minimum available registers: 10 */
