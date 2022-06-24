    .syntax unified
    .cpu cortex-m3
    .section .text

    .align 2
    .global ntt_65537
    .type ntt_65537, %function
    ntt_65537:
    push {r4-r11, lr}
    
mov r2, #0
.global __ntt_65537
__ntt_65537:
push.w {r2}
push.w {r0}
sub sp, #1536
ldr.w r12, [r1, #0]
ldr.w r11, [r1, #96]
ldr.w r10, [r1, #192]
ldr.w r9, [r1, #288]
ldr.w r8, [r1, #384]
ldr.w r7, [r1, #480]
ldr.w r6, [r1, #576]
ldr.w r4, [r1, #672]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
        .macro RED1 z, tmp
            ubfx.w \tmp, \z, #0, #16
            sub.w \z, \tmp, \z, asr #16
        .endm
        
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #0]
str.w r11, [sp, #96]
str.w r10, [sp, #192]
str.w r9, [sp, #288]
str.w r8, [sp, #384]
str.w r7, [sp, #480]
str.w r6, [sp, #576]
str.w r4, [sp, #672]
ldr.w r12, [r1, #4]
ldr.w r11, [r1, #100]
ldr.w r10, [r1, #196]
ldr.w r9, [r1, #292]
ldr.w r8, [r1, #388]
ldr.w r7, [r1, #484]
ldr.w r6, [r1, #580]
ldr.w r4, [r1, #676]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #4]
str.w r11, [sp, #100]
str.w r10, [sp, #196]
str.w r9, [sp, #292]
str.w r8, [sp, #388]
str.w r7, [sp, #484]
str.w r6, [sp, #580]
str.w r4, [sp, #676]
ldr.w r12, [r1, #8]
ldr.w r11, [r1, #104]
ldr.w r10, [r1, #200]
ldr.w r9, [r1, #296]
ldr.w r8, [r1, #392]
ldr.w r7, [r1, #488]
ldr.w r6, [r1, #584]
ldr.w r4, [r1, #680]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #8]
str.w r11, [sp, #104]
str.w r10, [sp, #200]
str.w r9, [sp, #296]
str.w r8, [sp, #392]
str.w r7, [sp, #488]
str.w r6, [sp, #584]
str.w r4, [sp, #680]
ldr.w r12, [r1, #12]
ldr.w r11, [r1, #108]
ldr.w r10, [r1, #204]
ldr.w r9, [r1, #300]
ldr.w r8, [r1, #396]
ldr.w r7, [r1, #492]
ldr.w r6, [r1, #588]
ldr.w r4, [r1, #684]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #12]
str.w r11, [sp, #108]
str.w r10, [sp, #204]
str.w r9, [sp, #300]
str.w r8, [sp, #396]
str.w r7, [sp, #492]
str.w r6, [sp, #588]
str.w r4, [sp, #684]
ldr.w r12, [r1, #16]
ldr.w r11, [r1, #112]
ldr.w r10, [r1, #208]
ldr.w r9, [r1, #304]
ldr.w r8, [r1, #400]
ldr.w r7, [r1, #496]
ldr.w r6, [r1, #592]
ldr.w r4, [r1, #688]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #16]
str.w r11, [sp, #112]
str.w r10, [sp, #208]
str.w r9, [sp, #304]
str.w r8, [sp, #400]
str.w r7, [sp, #496]
str.w r6, [sp, #592]
str.w r4, [sp, #688]
ldr.w r12, [r1, #20]
ldr.w r11, [r1, #116]
ldr.w r10, [r1, #212]
ldr.w r9, [r1, #308]
ldr.w r8, [r1, #404]
ldr.w r7, [r1, #500]
ldr.w r6, [r1, #596]
ldr.w r4, [r1, #692]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #20]
str.w r11, [sp, #116]
str.w r10, [sp, #212]
str.w r9, [sp, #308]
str.w r8, [sp, #404]
str.w r7, [sp, #500]
str.w r6, [sp, #596]
str.w r4, [sp, #692]
ldr.w r12, [r1, #24]
ldr.w r11, [r1, #120]
ldr.w r10, [r1, #216]
ldr.w r9, [r1, #312]
ldr.w r8, [r1, #408]
ldr.w r7, [r1, #504]
ldr.w r6, [r1, #600]
ldr.w r4, [r1, #696]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #24]
str.w r11, [sp, #120]
str.w r10, [sp, #216]
str.w r9, [sp, #312]
str.w r8, [sp, #408]
str.w r7, [sp, #504]
str.w r6, [sp, #600]
str.w r4, [sp, #696]
ldr.w r12, [r1, #28]
ldr.w r11, [r1, #124]
ldr.w r10, [r1, #220]
ldr.w r9, [r1, #316]
ldr.w r8, [r1, #412]
ldr.w r7, [r1, #508]
ldr.w r6, [r1, #604]
ldr.w r4, [r1, #700]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #28]
str.w r11, [sp, #124]
str.w r10, [sp, #220]
str.w r9, [sp, #316]
str.w r8, [sp, #412]
str.w r7, [sp, #508]
str.w r6, [sp, #604]
str.w r4, [sp, #700]
ldr.w r12, [r1, #32]
ldr.w r11, [r1, #128]
ldr.w r10, [r1, #224]
ldr.w r9, [r1, #320]
ldr.w r8, [r1, #416]
ldr.w r7, [r1, #512]
ldr.w r6, [r1, #608]
ldr.w r4, [r1, #704]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #32]
str.w r11, [sp, #128]
str.w r10, [sp, #224]
str.w r9, [sp, #320]
str.w r8, [sp, #416]
str.w r7, [sp, #512]
str.w r6, [sp, #608]
str.w r4, [sp, #704]
ldr.w r12, [r1, #36]
ldr.w r11, [r1, #132]
ldr.w r10, [r1, #228]
ldr.w r9, [r1, #324]
ldr.w r8, [r1, #420]
ldr.w r7, [r1, #516]
ldr.w r6, [r1, #612]
ldr.w r4, [r1, #708]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #36]
str.w r11, [sp, #132]
str.w r10, [sp, #228]
str.w r9, [sp, #324]
str.w r8, [sp, #420]
str.w r7, [sp, #516]
str.w r6, [sp, #612]
str.w r4, [sp, #708]
ldr.w r12, [r1, #40]
ldr.w r11, [r1, #136]
ldr.w r10, [r1, #232]
ldr.w r9, [r1, #328]
ldr.w r8, [r1, #424]
ldr.w r7, [r1, #520]
ldr.w r6, [r1, #616]
ldr.w r4, [r1, #712]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #40]
str.w r11, [sp, #136]
str.w r10, [sp, #232]
str.w r9, [sp, #328]
str.w r8, [sp, #424]
str.w r7, [sp, #520]
str.w r6, [sp, #616]
str.w r4, [sp, #712]
ldr.w r12, [r1, #44]
ldr.w r11, [r1, #140]
ldr.w r10, [r1, #236]
ldr.w r9, [r1, #332]
ldr.w r8, [r1, #428]
ldr.w r7, [r1, #524]
ldr.w r6, [r1, #620]
ldr.w r4, [r1, #716]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #44]
str.w r11, [sp, #140]
str.w r10, [sp, #236]
str.w r9, [sp, #332]
str.w r8, [sp, #428]
str.w r7, [sp, #524]
str.w r6, [sp, #620]
str.w r4, [sp, #716]
ldr.w r12, [r1, #48]
ldr.w r11, [r1, #144]
ldr.w r10, [r1, #240]
ldr.w r9, [r1, #336]
ldr.w r8, [r1, #432]
ldr.w r7, [r1, #528]
ldr.w r6, [r1, #624]
ldr.w r4, [r1, #720]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #48]
str.w r11, [sp, #144]
str.w r10, [sp, #240]
str.w r9, [sp, #336]
str.w r8, [sp, #432]
str.w r7, [sp, #528]
str.w r6, [sp, #624]
str.w r4, [sp, #720]
ldr.w r12, [r1, #52]
ldr.w r11, [r1, #148]
ldr.w r10, [r1, #244]
ldr.w r9, [r1, #340]
ldr.w r8, [r1, #436]
ldr.w r7, [r1, #532]
ldr.w r6, [r1, #628]
ldr.w r4, [r1, #724]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #52]
str.w r11, [sp, #148]
str.w r10, [sp, #244]
str.w r9, [sp, #340]
str.w r8, [sp, #436]
str.w r7, [sp, #532]
str.w r6, [sp, #628]
str.w r4, [sp, #724]
ldr.w r12, [r1, #56]
ldr.w r11, [r1, #152]
ldr.w r10, [r1, #248]
ldr.w r9, [r1, #344]
ldr.w r8, [r1, #440]
ldr.w r7, [r1, #536]
ldr.w r6, [r1, #632]
ldr.w r4, [r1, #728]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #56]
str.w r11, [sp, #152]
str.w r10, [sp, #248]
str.w r9, [sp, #344]
str.w r8, [sp, #440]
str.w r7, [sp, #536]
str.w r6, [sp, #632]
str.w r4, [sp, #728]
ldr.w r12, [r1, #60]
ldr.w r11, [r1, #156]
ldr.w r10, [r1, #252]
ldr.w r9, [r1, #348]
ldr.w r8, [r1, #444]
ldr.w r7, [r1, #540]
ldr.w r6, [r1, #636]
ldr.w r4, [r1, #732]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #60]
str.w r11, [sp, #156]
str.w r10, [sp, #252]
str.w r9, [sp, #348]
str.w r8, [sp, #444]
str.w r7, [sp, #540]
str.w r6, [sp, #636]
str.w r4, [sp, #732]
ldr.w r12, [r1, #64]
ldr.w r11, [r1, #160]
ldr.w r10, [r1, #256]
ldr.w r9, [r1, #352]
ldr.w r8, [r1, #448]
ldr.w r7, [r1, #544]
ldr.w r6, [r1, #640]
ldr.w r4, [r1, #736]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #64]
str.w r11, [sp, #160]
str.w r10, [sp, #256]
str.w r9, [sp, #352]
str.w r8, [sp, #448]
str.w r7, [sp, #544]
str.w r6, [sp, #640]
str.w r4, [sp, #736]
ldr.w r12, [r1, #68]
ldr.w r11, [r1, #164]
ldr.w r10, [r1, #260]
ldr.w r9, [r1, #356]
ldr.w r8, [r1, #452]
ldr.w r7, [r1, #548]
ldr.w r6, [r1, #644]
ldr.w r4, [r1, #740]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #68]
str.w r11, [sp, #164]
str.w r10, [sp, #260]
str.w r9, [sp, #356]
str.w r8, [sp, #452]
str.w r7, [sp, #548]
str.w r6, [sp, #644]
str.w r4, [sp, #740]
ldr.w r12, [r1, #72]
ldr.w r11, [r1, #168]
ldr.w r10, [r1, #264]
ldr.w r9, [r1, #360]
ldr.w r8, [r1, #456]
ldr.w r7, [r1, #552]
ldr.w r6, [r1, #648]
ldr.w r4, [r1, #744]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #72]
str.w r11, [sp, #168]
str.w r10, [sp, #264]
str.w r9, [sp, #360]
str.w r8, [sp, #456]
str.w r7, [sp, #552]
str.w r6, [sp, #648]
str.w r4, [sp, #744]
ldr.w r12, [r1, #76]
ldr.w r11, [r1, #172]
ldr.w r10, [r1, #268]
ldr.w r9, [r1, #364]
ldr.w r8, [r1, #460]
ldr.w r7, [r1, #556]
ldr.w r6, [r1, #652]
ldr.w r4, [r1, #748]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #76]
str.w r11, [sp, #172]
str.w r10, [sp, #268]
str.w r9, [sp, #364]
str.w r8, [sp, #460]
str.w r7, [sp, #556]
str.w r6, [sp, #652]
str.w r4, [sp, #748]
ldr.w r12, [r1, #80]
ldr.w r11, [r1, #176]
ldr.w r10, [r1, #272]
ldr.w r9, [r1, #368]
ldr.w r8, [r1, #464]
ldr.w r7, [r1, #560]
ldr.w r6, [r1, #656]
ldr.w r4, [r1, #752]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #80]
str.w r11, [sp, #176]
str.w r10, [sp, #272]
str.w r9, [sp, #368]
str.w r8, [sp, #464]
str.w r7, [sp, #560]
str.w r6, [sp, #656]
str.w r4, [sp, #752]
ldr.w r12, [r1, #84]
ldr.w r11, [r1, #180]
ldr.w r10, [r1, #276]
ldr.w r9, [r1, #372]
ldr.w r8, [r1, #468]
ldr.w r7, [r1, #564]
ldr.w r6, [r1, #660]
ldr.w r4, [r1, #756]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #84]
str.w r11, [sp, #180]
str.w r10, [sp, #276]
str.w r9, [sp, #372]
str.w r8, [sp, #468]
str.w r7, [sp, #564]
str.w r6, [sp, #660]
str.w r4, [sp, #756]
ldr.w r12, [r1, #88]
ldr.w r11, [r1, #184]
ldr.w r10, [r1, #280]
ldr.w r9, [r1, #376]
ldr.w r8, [r1, #472]
ldr.w r7, [r1, #568]
ldr.w r6, [r1, #664]
ldr.w r4, [r1, #760]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #88]
str.w r11, [sp, #184]
str.w r10, [sp, #280]
str.w r9, [sp, #376]
str.w r8, [sp, #472]
str.w r7, [sp, #568]
str.w r6, [sp, #664]
str.w r4, [sp, #760]
ldr.w r12, [r1, #92]
ldr.w r11, [r1, #188]
ldr.w r10, [r1, #284]
ldr.w r9, [r1, #380]
ldr.w r8, [r1, #476]
ldr.w r7, [r1, #572]
ldr.w r6, [r1, #668]
ldr.w r4, [r1, #764]
/*** LAYER 1 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00000ffe (+2^11.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00000ffe (+2^11.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00000ffe (+2^11.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00000ffe (+2^11.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x00007ff (-2^10.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x00001ffc (+2^12.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r10 <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x00001ffc (+2^12.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0000ffe (-2^11.9993) <= r9  <= 0x00000ffe (+2^11.9993)
/*** LAYER 2 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r8  <= 0x000806ff (+2^19.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r6  <= 0x000806ff (+2^19.0049)
/*** LAYER 2 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x00806ff (-2^19.0049) <= r7  <= 0x000806ff (+2^19.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x00806ff (-2^19.0049) <= r4  <= 0x000806ff (+2^19.0049)
/*** LAYER 3 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x00003ff8 (+2^13.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x0001ffc (-2^12.9993) <= r11 <= 0x00001ffc (+2^12.9993)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0100dfe (-2^20.0049) <= r10 <= 0x00100dfe (+2^20.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0100dfe (-2^20.0049) <= r9  <= 0x00100dfe (+2^20.0049)
/*** LAYER 3 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x08876ef (-2^23.0924) <= r8  <= 0x008876ef (+2^23.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x08876ef (-2^23.0924) <= r7  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
RED1 r4, r3
    //// bounds:  -0x0000008 (-2^ 3.0000) <= r4  <= 0x00010008 (+2^16.0002)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x100886ff (-2^28.0030) <= r6  <= 0x000886ff (+2^19.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x00886ff (-2^19.0921) <= r4  <= 0x100886ff (+2^28.0030)
str.w r12, [sp, #92]
str.w r11, [sp, #188]
str.w r10, [sp, #284]
str.w r9, [sp, #380]
str.w r8, [sp, #476]
str.w r7, [sp, #572]
str.w r6, [sp, #668]
str.w r4, [sp, #764]
ldr.w r12, [r1, #0]
ldr.w r11, [r1, #96]
ldr.w r10, [r1, #192]
ldr.w r9, [r1, #288]
ldr.w r8, [r1, #384]
ldr.w r7, [r1, #480]
ldr.w r6, [r1, #576]
ldr.w r4, [r1, #672]
b.w 1f
.ltorg /* constant pool */
1:
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #768]
str.w r11, [sp, #864]
str.w r10, [sp, #960]
str.w r9, [sp, #1056]
str.w r8, [sp, #1152]
str.w r7, [sp, #1248]
str.w r6, [sp, #1344]
str.w r4, [sp, #1440]
ldr.w r12, [r1, #4]
ldr.w r11, [r1, #100]
ldr.w r10, [r1, #196]
ldr.w r9, [r1, #292]
ldr.w r8, [r1, #388]
ldr.w r7, [r1, #484]
ldr.w r6, [r1, #580]
ldr.w r4, [r1, #676]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #772]
str.w r11, [sp, #868]
str.w r10, [sp, #964]
str.w r9, [sp, #1060]
str.w r8, [sp, #1156]
str.w r7, [sp, #1252]
str.w r6, [sp, #1348]
str.w r4, [sp, #1444]
ldr.w r12, [r1, #8]
ldr.w r11, [r1, #104]
ldr.w r10, [r1, #200]
ldr.w r9, [r1, #296]
ldr.w r8, [r1, #392]
ldr.w r7, [r1, #488]
ldr.w r6, [r1, #584]
ldr.w r4, [r1, #680]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #776]
str.w r11, [sp, #872]
str.w r10, [sp, #968]
str.w r9, [sp, #1064]
str.w r8, [sp, #1160]
str.w r7, [sp, #1256]
str.w r6, [sp, #1352]
str.w r4, [sp, #1448]
ldr.w r12, [r1, #12]
ldr.w r11, [r1, #108]
ldr.w r10, [r1, #204]
ldr.w r9, [r1, #300]
ldr.w r8, [r1, #396]
ldr.w r7, [r1, #492]
ldr.w r6, [r1, #588]
ldr.w r4, [r1, #684]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #780]
str.w r11, [sp, #876]
str.w r10, [sp, #972]
str.w r9, [sp, #1068]
str.w r8, [sp, #1164]
str.w r7, [sp, #1260]
str.w r6, [sp, #1356]
str.w r4, [sp, #1452]
ldr.w r12, [r1, #16]
ldr.w r11, [r1, #112]
ldr.w r10, [r1, #208]
ldr.w r9, [r1, #304]
ldr.w r8, [r1, #400]
ldr.w r7, [r1, #496]
ldr.w r6, [r1, #592]
ldr.w r4, [r1, #688]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #784]
str.w r11, [sp, #880]
str.w r10, [sp, #976]
str.w r9, [sp, #1072]
str.w r8, [sp, #1168]
str.w r7, [sp, #1264]
str.w r6, [sp, #1360]
str.w r4, [sp, #1456]
ldr.w r12, [r1, #20]
ldr.w r11, [r1, #116]
ldr.w r10, [r1, #212]
ldr.w r9, [r1, #308]
ldr.w r8, [r1, #404]
ldr.w r7, [r1, #500]
ldr.w r6, [r1, #596]
ldr.w r4, [r1, #692]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #788]
str.w r11, [sp, #884]
str.w r10, [sp, #980]
str.w r9, [sp, #1076]
str.w r8, [sp, #1172]
str.w r7, [sp, #1268]
str.w r6, [sp, #1364]
str.w r4, [sp, #1460]
ldr.w r12, [r1, #24]
ldr.w r11, [r1, #120]
ldr.w r10, [r1, #216]
ldr.w r9, [r1, #312]
ldr.w r8, [r1, #408]
ldr.w r7, [r1, #504]
ldr.w r6, [r1, #600]
ldr.w r4, [r1, #696]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #792]
str.w r11, [sp, #888]
str.w r10, [sp, #984]
str.w r9, [sp, #1080]
str.w r8, [sp, #1176]
str.w r7, [sp, #1272]
str.w r6, [sp, #1368]
str.w r4, [sp, #1464]
ldr.w r12, [r1, #28]
ldr.w r11, [r1, #124]
ldr.w r10, [r1, #220]
ldr.w r9, [r1, #316]
ldr.w r8, [r1, #412]
ldr.w r7, [r1, #508]
ldr.w r6, [r1, #604]
ldr.w r4, [r1, #700]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #796]
str.w r11, [sp, #892]
str.w r10, [sp, #988]
str.w r9, [sp, #1084]
str.w r8, [sp, #1180]
str.w r7, [sp, #1276]
str.w r6, [sp, #1372]
str.w r4, [sp, #1468]
ldr.w r12, [r1, #32]
ldr.w r11, [r1, #128]
ldr.w r10, [r1, #224]
ldr.w r9, [r1, #320]
ldr.w r8, [r1, #416]
ldr.w r7, [r1, #512]
ldr.w r6, [r1, #608]
ldr.w r4, [r1, #704]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #800]
str.w r11, [sp, #896]
str.w r10, [sp, #992]
str.w r9, [sp, #1088]
str.w r8, [sp, #1184]
str.w r7, [sp, #1280]
str.w r6, [sp, #1376]
str.w r4, [sp, #1472]
ldr.w r12, [r1, #36]
ldr.w r11, [r1, #132]
ldr.w r10, [r1, #228]
ldr.w r9, [r1, #324]
ldr.w r8, [r1, #420]
ldr.w r7, [r1, #516]
ldr.w r6, [r1, #612]
ldr.w r4, [r1, #708]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #804]
str.w r11, [sp, #900]
str.w r10, [sp, #996]
str.w r9, [sp, #1092]
str.w r8, [sp, #1188]
str.w r7, [sp, #1284]
str.w r6, [sp, #1380]
str.w r4, [sp, #1476]
ldr.w r12, [r1, #40]
ldr.w r11, [r1, #136]
ldr.w r10, [r1, #232]
ldr.w r9, [r1, #328]
ldr.w r8, [r1, #424]
ldr.w r7, [r1, #520]
ldr.w r6, [r1, #616]
ldr.w r4, [r1, #712]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #808]
str.w r11, [sp, #904]
str.w r10, [sp, #1000]
str.w r9, [sp, #1096]
str.w r8, [sp, #1192]
str.w r7, [sp, #1288]
str.w r6, [sp, #1384]
str.w r4, [sp, #1480]
ldr.w r12, [r1, #44]
ldr.w r11, [r1, #140]
ldr.w r10, [r1, #236]
ldr.w r9, [r1, #332]
ldr.w r8, [r1, #428]
ldr.w r7, [r1, #524]
ldr.w r6, [r1, #620]
ldr.w r4, [r1, #716]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #812]
str.w r11, [sp, #908]
str.w r10, [sp, #1004]
str.w r9, [sp, #1100]
str.w r8, [sp, #1196]
str.w r7, [sp, #1292]
str.w r6, [sp, #1388]
str.w r4, [sp, #1484]
ldr.w r12, [r1, #48]
ldr.w r11, [r1, #144]
ldr.w r10, [r1, #240]
ldr.w r9, [r1, #336]
ldr.w r8, [r1, #432]
ldr.w r7, [r1, #528]
ldr.w r6, [r1, #624]
ldr.w r4, [r1, #720]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #816]
str.w r11, [sp, #912]
str.w r10, [sp, #1008]
str.w r9, [sp, #1104]
str.w r8, [sp, #1200]
str.w r7, [sp, #1296]
str.w r6, [sp, #1392]
str.w r4, [sp, #1488]
ldr.w r12, [r1, #52]
ldr.w r11, [r1, #148]
ldr.w r10, [r1, #244]
ldr.w r9, [r1, #340]
ldr.w r8, [r1, #436]
ldr.w r7, [r1, #532]
ldr.w r6, [r1, #628]
ldr.w r4, [r1, #724]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #820]
str.w r11, [sp, #916]
str.w r10, [sp, #1012]
str.w r9, [sp, #1108]
str.w r8, [sp, #1204]
str.w r7, [sp, #1300]
str.w r6, [sp, #1396]
str.w r4, [sp, #1492]
ldr.w r12, [r1, #56]
ldr.w r11, [r1, #152]
ldr.w r10, [r1, #248]
ldr.w r9, [r1, #344]
ldr.w r8, [r1, #440]
ldr.w r7, [r1, #536]
ldr.w r6, [r1, #632]
ldr.w r4, [r1, #728]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #824]
str.w r11, [sp, #920]
str.w r10, [sp, #1016]
str.w r9, [sp, #1112]
str.w r8, [sp, #1208]
str.w r7, [sp, #1304]
str.w r6, [sp, #1400]
str.w r4, [sp, #1496]
ldr.w r12, [r1, #60]
ldr.w r11, [r1, #156]
ldr.w r10, [r1, #252]
ldr.w r9, [r1, #348]
ldr.w r8, [r1, #444]
ldr.w r7, [r1, #540]
ldr.w r6, [r1, #636]
ldr.w r4, [r1, #732]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #828]
str.w r11, [sp, #924]
str.w r10, [sp, #1020]
str.w r9, [sp, #1116]
str.w r8, [sp, #1212]
str.w r7, [sp, #1308]
str.w r6, [sp, #1404]
str.w r4, [sp, #1500]
ldr.w r12, [r1, #64]
ldr.w r11, [r1, #160]
ldr.w r10, [r1, #256]
ldr.w r9, [r1, #352]
ldr.w r8, [r1, #448]
ldr.w r7, [r1, #544]
ldr.w r6, [r1, #640]
ldr.w r4, [r1, #736]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #832]
str.w r11, [sp, #928]
str.w r10, [sp, #1024]
str.w r9, [sp, #1120]
str.w r8, [sp, #1216]
str.w r7, [sp, #1312]
str.w r6, [sp, #1408]
str.w r4, [sp, #1504]
ldr.w r12, [r1, #68]
ldr.w r11, [r1, #164]
ldr.w r10, [r1, #260]
ldr.w r9, [r1, #356]
ldr.w r8, [r1, #452]
ldr.w r7, [r1, #548]
ldr.w r6, [r1, #644]
ldr.w r4, [r1, #740]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #836]
str.w r11, [sp, #932]
str.w r10, [sp, #1028]
str.w r9, [sp, #1124]
str.w r8, [sp, #1220]
str.w r7, [sp, #1316]
str.w r6, [sp, #1412]
str.w r4, [sp, #1508]
ldr.w r12, [r1, #72]
ldr.w r11, [r1, #168]
ldr.w r10, [r1, #264]
ldr.w r9, [r1, #360]
ldr.w r8, [r1, #456]
ldr.w r7, [r1, #552]
ldr.w r6, [r1, #648]
ldr.w r4, [r1, #744]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #840]
str.w r11, [sp, #936]
str.w r10, [sp, #1032]
str.w r9, [sp, #1128]
str.w r8, [sp, #1224]
str.w r7, [sp, #1320]
str.w r6, [sp, #1416]
str.w r4, [sp, #1512]
ldr.w r12, [r1, #76]
ldr.w r11, [r1, #172]
b.w 1f
.ltorg /* constant pool */
1:
ldr.w r10, [r1, #268]
ldr.w r9, [r1, #364]
ldr.w r8, [r1, #460]
ldr.w r7, [r1, #556]
ldr.w r6, [r1, #652]
ldr.w r4, [r1, #748]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #844]
str.w r11, [sp, #940]
str.w r10, [sp, #1036]
str.w r9, [sp, #1132]
str.w r8, [sp, #1228]
str.w r7, [sp, #1324]
str.w r6, [sp, #1420]
str.w r4, [sp, #1516]
ldr.w r12, [r1, #80]
ldr.w r11, [r1, #176]
ldr.w r10, [r1, #272]
ldr.w r9, [r1, #368]
ldr.w r8, [r1, #464]
ldr.w r7, [r1, #560]
ldr.w r6, [r1, #656]
ldr.w r4, [r1, #752]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #848]
str.w r11, [sp, #944]
str.w r10, [sp, #1040]
str.w r9, [sp, #1136]
str.w r8, [sp, #1232]
str.w r7, [sp, #1328]
str.w r6, [sp, #1424]
str.w r4, [sp, #1520]
ldr.w r12, [r1, #84]
ldr.w r11, [r1, #180]
ldr.w r10, [r1, #276]
ldr.w r9, [r1, #372]
ldr.w r8, [r1, #468]
ldr.w r7, [r1, #564]
ldr.w r6, [r1, #660]
ldr.w r4, [r1, #756]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #852]
str.w r11, [sp, #948]
str.w r10, [sp, #1044]
str.w r9, [sp, #1140]
str.w r8, [sp, #1236]
str.w r7, [sp, #1332]
str.w r6, [sp, #1428]
str.w r4, [sp, #1524]
ldr.w r12, [r1, #88]
ldr.w r11, [r1, #184]
ldr.w r10, [r1, #280]
ldr.w r9, [r1, #376]
ldr.w r8, [r1, #472]
ldr.w r7, [r1, #568]
ldr.w r6, [r1, #664]
ldr.w r4, [r1, #760]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #856]
str.w r11, [sp, #952]
str.w r10, [sp, #1048]
str.w r9, [sp, #1144]
str.w r8, [sp, #1240]
str.w r7, [sp, #1336]
str.w r6, [sp, #1432]
str.w r4, [sp, #1528]
ldr.w r12, [r1, #92]
ldr.w r11, [r1, #188]
ldr.w r10, [r1, #284]
ldr.w r9, [r1, #380]
ldr.w r8, [r1, #476]
ldr.w r7, [r1, #572]
ldr.w r6, [r1, #668]
ldr.w r4, [r1, #764]
/*** LAYER 1 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  0x00000000 <= r12 <= 0x000806ff (+2^19.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r8  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  0x00000000 <= r11 <= 0x000806ff (+2^19.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r7  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  0x00000000 <= r10 <= 0x000806ff (+2^19.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r6  <= 0x000007ff (+2^10.9993)
/*** LAYER 1 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  0x00000000 <= r9  <= 0x000806ff (+2^19.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x007ff00 (-2^18.9993) <= r4  <= 0x000007ff (+2^10.9993)
/*** LAYER 2 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r12 <= 0x000806ff (+2^19.0049)
add.w r10, r12, r10, lsl #5
    //// bounds:  0x00000000 <= r10 <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r11 <= 0x000806ff (+2^19.0049)
add.w r9, r11, r9, lsl #5
    //// bounds:  0x00000000 <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 2 ***/
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r8  <= 0x7ff007ff (+2^30.9993)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r6  <= 0x007ff7ff (+2^22.9996)
RED1 r8, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r8  <= 0x00017ff0 (+2^16.5847)
RED1 r6, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r6  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 2 ***/
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x087ef00 (-2^23.0868) <= r7  <= 0x7ff007ff (+2^30.9993)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x7ff7ff00 (-2^30.9996) <= r4  <= 0x007ff7ff (+2^22.9996)
RED1 r7, r3
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r7  <= 0x00017ff0 (+2^16.5847)
RED1 r4, r3
    //// bounds:  -0x0007ff7 (-2^14.9996) <= r4  <= 0x00017ff7 (+2^16.5848)
/*** LAYER 3 ***/
RED1 r11, r3
    //// bounds:  -0x0000080 (-2^ 7.0000) <= r11 <= 0x00010080 (+2^16.0028)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x4826ff0 (-2^26.1730) <= r12 <= 0x000a06ff (+2^19.3259)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x0826ff0 (-2^23.0272) <= r11 <= 0x040a06ff (+2^26.0141)
/*** LAYER 3 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  0x00000000 <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x008876ef (+2^23.0924)
/*** LAYER 3 ***/
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x1ffc7ff0 (-2^28.9994) <= r8  <= 0x5ffd7ff0 (+2^30.5848)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x5ffc7ff0 (-2^30.5848) <= r7  <= 0x1ffd7ff0 (+2^28.9996)
RED1 r8, r3
    //// bounds:  -0x0005ffd (-2^14.5848) <= r8  <= 0x00015ffd (+2^16.4594)
RED1 r7, r3
    //// bounds:  -0x0005ffc (-2^14.5847) <= r7  <= 0x00015ffc (+2^16.4594)
/*** LAYER 3 ***/
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x0607db7 (-2^22.5923) <= r6  <= 0x00217db7 (+2^21.0657)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x0207db7 (-2^21.0220) <= r4  <= 0x00617db7 (+2^22.6072)
str.w r12, [sp, #860]
str.w r11, [sp, #956]
str.w r10, [sp, #1052]
str.w r9, [sp, #1148]
str.w r8, [sp, #1244]
str.w r7, [sp, #1340]
str.w r6, [sp, #1436]
str.w r4, [sp, #1532]
ldr.w r12, [sp, #0]
ldr.w r11, [sp, #12]
ldr.w r10, [sp, #24]
ldr.w r9, [sp, #36]
ldr.w r8, [sp, #48]
ldr.w r7, [sp, #60]
ldr.w r6, [sp, #72]
ldr.w r4, [sp, #84]
/*** LAYER 4 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00007ff0 (+2^14.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r8  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00007ff0 (+2^14.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r7  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00007ff0 (+2^14.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r6  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00007ff0 (+2^14.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r4  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 5 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x0000ffe0 (+2^15.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r10 <= 0x00007ff0 (+2^14.9993)
/*** LAYER 5 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x0000ffe0 (+2^15.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r9  <= 0x00007ff0 (+2^14.9993)
/*** LAYER 5 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x04037f8 (-2^22.0049) <= r8  <= 0x004037f8 (+2^22.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x04037f8 (-2^22.0049) <= r6  <= 0x004037f8 (+2^22.0049)
/*** LAYER 5 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x04037f8 (-2^22.0049) <= r7  <= 0x004037f8 (+2^22.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x04037f8 (-2^22.0049) <= r4  <= 0x004037f8 (+2^22.0049)
ldr.w r0, [sp,#1540]
tst.n r0, r0
it.n ne
bne.w _ntt_pre
/*** LAYER 6 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x0001ffc0 (+2^16.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x000ffe0 (-2^15.9993) <= r11 <= 0x0000ffe0 (+2^15.9993)
        .macro RED4 z, tmp
            /* RED1 \z, \tmp */
            /* ------------- */
            ubfx.w \tmp, \z, #0, #16
            sub.w \z, \tmp, \z, asr #16
            /* ------------- */
            cmp \z, r5
            it.n gt
            subgt.w \z, #((1<<16)+1)
        .endm
        
ldr.w r5, =32768
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r10 <= 0x00806ff0 (+2^23.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r9  <= 0x00806ff0 (+2^23.0049)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x443b778 (-2^26.0924) <= r8  <= 0x0443b778 (+2^26.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x443b778 (-2^26.0924) <= r7  <= 0x0443b778 (+2^26.0924)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000040 (-2^ 6.0000) <= r4  <= 0x00010040 (+2^16.0014)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x104437f8 (-2^28.0238) <= r6  <= 0x004437f8 (+2^22.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x04437f8 (-2^22.0921) <= r4  <= 0x104437f8 (+2^28.0238)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
ldr.w r1, [sp,#1536]
str.w r12, [r1, #0]
str.w r11, [r1, #12]
str.w r10, [r1, #24]
str.w r9, [r1, #36]
str.w r8, [r1, #48]
str.w r7, [r1, #60]
str.w r6, [r1, #72]
str.w r4, [r1, #84]
ldr.w r12, [sp, #4]
ldr.w r11, [sp, #16]
ldr.w r10, [sp, #28]
ldr.w r9, [sp, #40]
ldr.w r8, [sp, #52]
ldr.w r7, [sp, #64]
ldr.w r6, [sp, #76]
ldr.w r4, [sp, #88]
/*** LAYER 4 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00007ff0 (+2^14.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r8  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00007ff0 (+2^14.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r7  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00007ff0 (+2^14.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r6  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00007ff0 (+2^14.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r4  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 5 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x0000ffe0 (+2^15.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r10 <= 0x00007ff0 (+2^14.9993)
/*** LAYER 5 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x0000ffe0 (+2^15.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r9  <= 0x00007ff0 (+2^14.9993)
/*** LAYER 5 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x04037f8 (-2^22.0049) <= r8  <= 0x004037f8 (+2^22.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x04037f8 (-2^22.0049) <= r6  <= 0x004037f8 (+2^22.0049)
/*** LAYER 5 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x04037f8 (-2^22.0049) <= r7  <= 0x004037f8 (+2^22.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x04037f8 (-2^22.0049) <= r4  <= 0x004037f8 (+2^22.0049)
/*** LAYER 6 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x0001ffc0 (+2^16.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x000ffe0 (-2^15.9993) <= r11 <= 0x0000ffe0 (+2^15.9993)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r10 <= 0x00806ff0 (+2^23.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r9  <= 0x00806ff0 (+2^23.0049)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x443b778 (-2^26.0924) <= r8  <= 0x0443b778 (+2^26.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x443b778 (-2^26.0924) <= r7  <= 0x0443b778 (+2^26.0924)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000040 (-2^ 6.0000) <= r4  <= 0x00010040 (+2^16.0014)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x104437f8 (-2^28.0238) <= r6  <= 0x004437f8 (+2^22.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x04437f8 (-2^22.0921) <= r4  <= 0x104437f8 (+2^28.0238)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #4]
str.w r11, [r1, #16]
str.w r10, [r1, #28]
str.w r9, [r1, #40]
str.w r8, [r1, #52]
str.w r7, [r1, #64]
str.w r6, [r1, #76]
str.w r4, [r1, #88]
ldr.w r12, [sp, #8]
ldr.w r11, [sp, #20]
ldr.w r10, [sp, #32]
ldr.w r9, [sp, #44]
ldr.w r8, [sp, #56]
ldr.w r7, [sp, #68]
ldr.w r6, [sp, #80]
ldr.w r4, [sp, #92]
/*** LAYER 4 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00007ff0 (+2^14.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r8  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00007ff0 (+2^14.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r7  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00007ff0 (+2^14.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r6  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00007ff0 (+2^14.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r4  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 5 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x0000ffe0 (+2^15.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r10 <= 0x00007ff0 (+2^14.9993)
/*** LAYER 5 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x0000ffe0 (+2^15.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r9  <= 0x00007ff0 (+2^14.9993)
/*** LAYER 5 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x04037f8 (-2^22.0049) <= r8  <= 0x004037f8 (+2^22.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x04037f8 (-2^22.0049) <= r6  <= 0x004037f8 (+2^22.0049)
/*** LAYER 5 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x04037f8 (-2^22.0049) <= r7  <= 0x004037f8 (+2^22.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x04037f8 (-2^22.0049) <= r4  <= 0x004037f8 (+2^22.0049)
/*** LAYER 6 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x0001ffc0 (+2^16.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x000ffe0 (-2^15.9993) <= r11 <= 0x0000ffe0 (+2^15.9993)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r10 <= 0x00806ff0 (+2^23.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r9  <= 0x00806ff0 (+2^23.0049)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x443b778 (-2^26.0924) <= r8  <= 0x0443b778 (+2^26.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x443b778 (-2^26.0924) <= r7  <= 0x0443b778 (+2^26.0924)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000040 (-2^ 6.0000) <= r4  <= 0x00010040 (+2^16.0014)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x104437f8 (-2^28.0238) <= r6  <= 0x004437f8 (+2^22.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x04437f8 (-2^22.0921) <= r4  <= 0x104437f8 (+2^28.0238)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #8]
str.w r11, [r1, #20]
str.w r10, [r1, #32]
str.w r9, [r1, #44]
str.w r8, [r1, #56]
str.w r7, [r1, #68]
str.w r6, [r1, #80]
str.w r4, [r1, #92]
ldr.w r12, [sp, #96]
ldr.w r11, [sp, #108]
ldr.w r10, [sp, #120]
ldr.w r9, [sp, #132]
ldr.w r8, [sp, #144]
ldr.w r7, [sp, #156]
ldr.w r6, [sp, #168]
ldr.w r4, [sp, #180]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r12 <= 0x00201bfc (+2^21.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r8  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r11 <= 0x00201bfc (+2^21.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r7  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r10 <= 0x00201bfc (+2^21.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r6  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r9  <= 0x00201bfc (+2^21.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r4  <= 0x00201bfc (+2^21.0049)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r12 <= 0x0221dbbc (+2^25.0924)
add.w r10, r12, r10, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r10 <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r11 <= 0x0221dbbc (+2^25.0924)
add.w r9, r11, r9, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r6  <= 0x00010020 (+2^16.0007)
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r8  <= 0x00221bfc (+2^21.0921)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r6  <= 0x10221bfc (+2^28.0120)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r4  <= 0x00010020 (+2^16.0007)
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r7  <= 0x00221bfc (+2^21.0921)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r4  <= 0x10221bfc (+2^28.0120)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r11 <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x62a5fbc (-2^26.6242) <= r12 <= 0x022a5fbc (+2^25.1147)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x22a5fbc (-2^25.1147) <= r11 <= 0x062a5fbc (+2^26.6242)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  -0xaa94aac (-2^27.4143) <= r10 <= 0x0aa94aac (+2^27.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0xaa94aac (-2^27.4143) <= r9  <= 0x0aa94aac (+2^27.4143)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r7  <= 0x00011022 (+2^16.0882)
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x142a9bfc (-2^28.3339) <= r8  <= 0x442a9bfc (+2^30.0910)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x542a9bfc (-2^30.3952) <= r7  <= 0x042a9bfc (+2^26.0588)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r4  <= 0x00011022 (+2^16.0882)
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x066247c (-2^22.6744) <= r6  <= 0x1026247c (+2^28.0134)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x026247c (-2^21.2533) <= r4  <= 0x1066247c (+2^28.0355)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #96]
str.w r11, [r1, #108]
str.w r10, [r1, #120]
str.w r9, [r1, #132]
str.w r8, [r1, #144]
str.w r7, [r1, #156]
str.w r6, [r1, #168]
str.w r4, [r1, #180]
ldr.w r12, [sp, #100]
ldr.w r11, [sp, #112]
ldr.w r10, [sp, #124]
ldr.w r9, [sp, #136]
ldr.w r8, [sp, #148]
ldr.w r7, [sp, #160]
ldr.w r6, [sp, #172]
ldr.w r4, [sp, #184]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r12 <= 0x00201bfc (+2^21.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r8  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r11 <= 0x00201bfc (+2^21.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r7  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r10 <= 0x00201bfc (+2^21.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r6  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r9  <= 0x00201bfc (+2^21.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r4  <= 0x00201bfc (+2^21.0049)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r12 <= 0x0221dbbc (+2^25.0924)
add.w r10, r12, r10, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r10 <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r11 <= 0x0221dbbc (+2^25.0924)
add.w r9, r11, r9, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r6  <= 0x00010020 (+2^16.0007)
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r8  <= 0x00221bfc (+2^21.0921)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r6  <= 0x10221bfc (+2^28.0120)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r4  <= 0x00010020 (+2^16.0007)
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r7  <= 0x00221bfc (+2^21.0921)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r4  <= 0x10221bfc (+2^28.0120)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r11 <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x62a5fbc (-2^26.6242) <= r12 <= 0x022a5fbc (+2^25.1147)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x22a5fbc (-2^25.1147) <= r11 <= 0x062a5fbc (+2^26.6242)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  -0xaa94aac (-2^27.4143) <= r10 <= 0x0aa94aac (+2^27.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0xaa94aac (-2^27.4143) <= r9  <= 0x0aa94aac (+2^27.4143)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r7  <= 0x00011022 (+2^16.0882)
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x142a9bfc (-2^28.3339) <= r8  <= 0x442a9bfc (+2^30.0910)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x542a9bfc (-2^30.3952) <= r7  <= 0x042a9bfc (+2^26.0588)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r4  <= 0x00011022 (+2^16.0882)
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x066247c (-2^22.6744) <= r6  <= 0x1026247c (+2^28.0134)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x026247c (-2^21.2533) <= r4  <= 0x1066247c (+2^28.0355)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #100]
str.w r11, [r1, #112]
str.w r10, [r1, #124]
str.w r9, [r1, #136]
str.w r8, [r1, #148]
str.w r7, [r1, #160]
str.w r6, [r1, #172]
str.w r4, [r1, #184]
ldr.w r12, [sp, #104]
ldr.w r11, [sp, #116]
ldr.w r10, [sp, #128]
ldr.w r9, [sp, #140]
ldr.w r8, [sp, #152]
ldr.w r7, [sp, #164]
ldr.w r6, [sp, #176]
ldr.w r4, [sp, #188]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r12 <= 0x00201bfc (+2^21.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r8  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r11 <= 0x00201bfc (+2^21.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r7  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r10 <= 0x00201bfc (+2^21.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r6  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r9  <= 0x00201bfc (+2^21.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r4  <= 0x00201bfc (+2^21.0049)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r12 <= 0x0221dbbc (+2^25.0924)
add.w r10, r12, r10, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r10 <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r11 <= 0x0221dbbc (+2^25.0924)
add.w r9, r11, r9, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r6  <= 0x00010020 (+2^16.0007)
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r8  <= 0x00221bfc (+2^21.0921)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r6  <= 0x10221bfc (+2^28.0120)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r4  <= 0x00010020 (+2^16.0007)
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r7  <= 0x00221bfc (+2^21.0921)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r4  <= 0x10221bfc (+2^28.0120)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r11 <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x62a5fbc (-2^26.6242) <= r12 <= 0x022a5fbc (+2^25.1147)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x22a5fbc (-2^25.1147) <= r11 <= 0x062a5fbc (+2^26.6242)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  -0xaa94aac (-2^27.4143) <= r10 <= 0x0aa94aac (+2^27.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0xaa94aac (-2^27.4143) <= r9  <= 0x0aa94aac (+2^27.4143)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r7  <= 0x00011022 (+2^16.0882)
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x142a9bfc (-2^28.3339) <= r8  <= 0x442a9bfc (+2^30.0910)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x542a9bfc (-2^30.3952) <= r7  <= 0x042a9bfc (+2^26.0588)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r4  <= 0x00011022 (+2^16.0882)
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x066247c (-2^22.6744) <= r6  <= 0x1026247c (+2^28.0134)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x026247c (-2^21.2533) <= r4  <= 0x1066247c (+2^28.0355)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #104]
str.w r11, [r1, #116]
str.w r10, [r1, #128]
str.w r9, [r1, #140]
str.w r8, [r1, #152]
str.w r7, [r1, #164]
str.w r6, [r1, #176]
str.w r4, [r1, #188]
ldr.w r12, [sp, #192]
ldr.w r11, [sp, #204]
ldr.w r10, [sp, #216]
ldr.w r9, [sp, #228]
ldr.w r8, [sp, #240]
ldr.w r7, [sp, #252]
ldr.w r6, [sp, #264]
ldr.w r4, [sp, #276]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r12 <= 0x0110edde (+2^24.0924)
add.w r8, r12, r8, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r8  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r11 <= 0x0110edde (+2^24.0924)
add.w r7, r11, r7, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r7  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r10 <= 0x0110edde (+2^24.0924)
add.w r6, r10, r6, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r6  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r9  <= 0x0110edde (+2^24.0924)
add.w r4, r9, r4, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r4  <= 0x0110edde (+2^24.0924)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r10 <= 0x00010110 (+2^16.0060)
sub.w r12, r12, r10, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r12 <= 0x01152dde (+2^24.1147)
add.w r10, r12, r10, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r10 <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r9  <= 0x00010110 (+2^16.0060)
sub.w r11, r11, r9, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r11 <= 0x01152dde (+2^24.1147)
add.w r9, r11, r9, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r9  <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
add.w r8, r8, r6, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r8  <= 0x0554a556 (+2^26.4143)
sub.w r6, r8, r6, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r6  <= 0x0554a556 (+2^26.4143)
/*** LAYER 5 ***/
add.w r7, r7, r4, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r7  <= 0x0554a556 (+2^26.4143)
sub.w r4, r7, r4, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r4  <= 0x0554a556 (+2^26.4143)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r11 <= 0x00010515 (+2^16.0284)
sub.w r12, r12, r11, lsl #13
    //// bounds:  -0x25b7cdde (-2^29.2372) <= r12 <= 0x01b7cdde (+2^24.7807)
add.w r11, r12, r11, lsl #14
    //// bounds:  -0x5b7cdde (-2^26.5155) <= r11 <= 0x21b7cdde (+2^29.0754)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r9, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r9  <= 0x00010515 (+2^16.0284)
add.w r10, r10, r9, lsl #5
    //// bounds:  -0x115d07e (-2^24.1180) <= r10 <= 0x0535d07e (+2^26.3813)
sub.w r9, r10, r9, lsl #6
    //// bounds:  -0x135d07e (-2^24.2753) <= r9  <= 0x0515d07e (+2^26.3463)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #1
    //// bounds:  -0xffdf002 (-2^27.9993) <= r8  <= 0x0ffdf002 (+2^27.9993)
add.w r7, r8, r7, lsl #2
    //// bounds:  -0xffdf002 (-2^27.9993) <= r7  <= 0x0ffdf002 (+2^27.9993)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r4  <= 0x00010554 (+2^16.0297)
sub.w r6, r6, r4, lsl #9
    //// bounds:  -0x75f4d56 (-2^26.8821) <= r6  <= 0x055f4d56 (+2^26.4255)
add.w r4, r6, r4, lsl #10
    //// bounds:  -0x55f4d56 (-2^26.4255) <= r4  <= 0x075f4d56 (+2^26.8821)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #192]
str.w r11, [r1, #204]
str.w r10, [r1, #216]
str.w r9, [r1, #228]
str.w r8, [r1, #240]
str.w r7, [r1, #252]
str.w r6, [r1, #264]
str.w r4, [r1, #276]
ldr.w r12, [sp, #196]
ldr.w r11, [sp, #208]
ldr.w r10, [sp, #220]
ldr.w r9, [sp, #232]
ldr.w r8, [sp, #244]
ldr.w r7, [sp, #256]
ldr.w r6, [sp, #268]
ldr.w r4, [sp, #280]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r12 <= 0x0110edde (+2^24.0924)
add.w r8, r12, r8, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r8  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r11 <= 0x0110edde (+2^24.0924)
add.w r7, r11, r7, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r7  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r10 <= 0x0110edde (+2^24.0924)
add.w r6, r10, r6, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r6  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r9  <= 0x0110edde (+2^24.0924)
add.w r4, r9, r4, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r4  <= 0x0110edde (+2^24.0924)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r10 <= 0x00010110 (+2^16.0060)
sub.w r12, r12, r10, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r12 <= 0x01152dde (+2^24.1147)
add.w r10, r12, r10, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r10 <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r9  <= 0x00010110 (+2^16.0060)
sub.w r11, r11, r9, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r11 <= 0x01152dde (+2^24.1147)
add.w r9, r11, r9, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r9  <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
add.w r8, r8, r6, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r8  <= 0x0554a556 (+2^26.4143)
sub.w r6, r8, r6, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r6  <= 0x0554a556 (+2^26.4143)
/*** LAYER 5 ***/
add.w r7, r7, r4, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r7  <= 0x0554a556 (+2^26.4143)
sub.w r4, r7, r4, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r4  <= 0x0554a556 (+2^26.4143)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r11 <= 0x00010515 (+2^16.0284)
sub.w r12, r12, r11, lsl #13
    //// bounds:  -0x25b7cdde (-2^29.2372) <= r12 <= 0x01b7cdde (+2^24.7807)
add.w r11, r12, r11, lsl #14
    //// bounds:  -0x5b7cdde (-2^26.5155) <= r11 <= 0x21b7cdde (+2^29.0754)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r9, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r9  <= 0x00010515 (+2^16.0284)
add.w r10, r10, r9, lsl #5
    //// bounds:  -0x115d07e (-2^24.1180) <= r10 <= 0x0535d07e (+2^26.3813)
sub.w r9, r10, r9, lsl #6
    //// bounds:  -0x135d07e (-2^24.2753) <= r9  <= 0x0515d07e (+2^26.3463)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #1
    //// bounds:  -0xffdf002 (-2^27.9993) <= r8  <= 0x0ffdf002 (+2^27.9993)
add.w r7, r8, r7, lsl #2
    //// bounds:  -0xffdf002 (-2^27.9993) <= r7  <= 0x0ffdf002 (+2^27.9993)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r4  <= 0x00010554 (+2^16.0297)
sub.w r6, r6, r4, lsl #9
    //// bounds:  -0x75f4d56 (-2^26.8821) <= r6  <= 0x055f4d56 (+2^26.4255)
add.w r4, r6, r4, lsl #10
    //// bounds:  -0x55f4d56 (-2^26.4255) <= r4  <= 0x075f4d56 (+2^26.8821)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #196]
str.w r11, [r1, #208]
str.w r10, [r1, #220]
str.w r9, [r1, #232]
str.w r8, [r1, #244]
str.w r7, [r1, #256]
str.w r6, [r1, #268]
str.w r4, [r1, #280]
ldr.w r12, [sp, #200]
ldr.w r11, [sp, #212]
ldr.w r10, [sp, #224]
ldr.w r9, [sp, #236]
ldr.w r8, [sp, #248]
ldr.w r7, [sp, #260]
ldr.w r6, [sp, #272]
ldr.w r4, [sp, #284]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r12 <= 0x0110edde (+2^24.0924)
add.w r8, r12, r8, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r8  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r11 <= 0x0110edde (+2^24.0924)
add.w r7, r11, r7, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r7  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r10 <= 0x0110edde (+2^24.0924)
add.w r6, r10, r6, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r6  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r9  <= 0x0110edde (+2^24.0924)
add.w r4, r9, r4, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r4  <= 0x0110edde (+2^24.0924)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r10 <= 0x00010110 (+2^16.0060)
sub.w r12, r12, r10, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r12 <= 0x01152dde (+2^24.1147)
add.w r10, r12, r10, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r10 <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r9  <= 0x00010110 (+2^16.0060)
sub.w r11, r11, r9, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r11 <= 0x01152dde (+2^24.1147)
add.w r9, r11, r9, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r9  <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
add.w r8, r8, r6, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r8  <= 0x0554a556 (+2^26.4143)
sub.w r6, r8, r6, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r6  <= 0x0554a556 (+2^26.4143)
/*** LAYER 5 ***/
add.w r7, r7, r4, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r7  <= 0x0554a556 (+2^26.4143)
sub.w r4, r7, r4, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r4  <= 0x0554a556 (+2^26.4143)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r11 <= 0x00010515 (+2^16.0284)
sub.w r12, r12, r11, lsl #13
    //// bounds:  -0x25b7cdde (-2^29.2372) <= r12 <= 0x01b7cdde (+2^24.7807)
add.w r11, r12, r11, lsl #14
    //// bounds:  -0x5b7cdde (-2^26.5155) <= r11 <= 0x21b7cdde (+2^29.0754)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r9, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r9  <= 0x00010515 (+2^16.0284)
add.w r10, r10, r9, lsl #5
    //// bounds:  -0x115d07e (-2^24.1180) <= r10 <= 0x0535d07e (+2^26.3813)
sub.w r9, r10, r9, lsl #6
    //// bounds:  -0x135d07e (-2^24.2753) <= r9  <= 0x0515d07e (+2^26.3463)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #1
    //// bounds:  -0xffdf002 (-2^27.9993) <= r8  <= 0x0ffdf002 (+2^27.9993)
add.w r7, r8, r7, lsl #2
    //// bounds:  -0xffdf002 (-2^27.9993) <= r7  <= 0x0ffdf002 (+2^27.9993)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r4  <= 0x00010554 (+2^16.0297)
sub.w r6, r6, r4, lsl #9
    //// bounds:  -0x75f4d56 (-2^26.8821) <= r6  <= 0x055f4d56 (+2^26.4255)
add.w r4, r6, r4, lsl #10
    //// bounds:  -0x55f4d56 (-2^26.4255) <= r4  <= 0x075f4d56 (+2^26.8821)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #200]
str.w r11, [r1, #212]
str.w r10, [r1, #224]
str.w r9, [r1, #236]
str.w r8, [r1, #248]
str.w r7, [r1, #260]
str.w r6, [r1, #272]
str.w r4, [r1, #284]
ldr.w r12, [sp, #288]
ldr.w r11, [sp, #300]
ldr.w r10, [sp, #312]
ldr.w r9, [sp, #324]
ldr.w r8, [sp, #336]
ldr.w r7, [sp, #348]
ldr.w r6, [sp, #360]
ldr.w r4, [sp, #372]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r8  <= 0x00010010 (+2^16.0004)
sub.w r12, r12, r8, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r12 <= 0x00110dfe (+2^20.0921)
add.w r8, r12, r8, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r8  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r7  <= 0x00010010 (+2^16.0004)
sub.w r11, r11, r7, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r11 <= 0x00110dfe (+2^20.0921)
add.w r7, r11, r7, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r7  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r6  <= 0x00010010 (+2^16.0004)
sub.w r10, r10, r6, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r10 <= 0x00110dfe (+2^20.0921)
add.w r6, r10, r6, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r6  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r4  <= 0x00010010 (+2^16.0004)
sub.w r9, r9, r4, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r9  <= 0x00110dfe (+2^20.0921)
add.w r4, r9, r4, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r4  <= 0x10110dfe (+2^28.0060)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r10 <= 0x00011011 (+2^16.0878)
add.w r12, r12, r10, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r12 <= 0x44154dfe (+2^30.0892)
sub.w r10, r12, r10, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r10 <= 0x04154dfe (+2^26.0297)
RED1 r12, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r12 <= 0x00014415 (+2^16.3402)
RED1 r10, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0005415 (-2^14.3937) <= r10 <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r9  <= 0x00011011 (+2^16.0878)
add.w r11, r11, r9, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r11 <= 0x44154dfe (+2^30.0892)
sub.w r9, r11, r9, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r9  <= 0x04154dfe (+2^26.0297)
RED1 r11, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r11 <= 0x00014415 (+2^16.3402)
RED1 r9, r3
    //// bounds:  -0x0005415 (-2^14.3937) <= r9  <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r6  <= 0x00011011 (+2^16.0878)
sub.w r8, r8, r6, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r8  <= 0x1015123e (+2^28.0074)
add.w r6, r8, r6, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r6  <= 0x1055123e (+2^28.0297)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r4  <= 0x00011011 (+2^16.0878)
sub.w r7, r7, r4, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r7  <= 0x1015123e (+2^28.0074)
add.w r4, r7, r4, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r4  <= 0x1055123e (+2^28.0297)
/*** LAYER 6 ***/
sub.w r12, r12, r11, lsl #7
    //// bounds:  -0x0a24e95 (-2^23.3426) <= r12 <= 0x00234e95 (+2^21.1419)
add.w r11, r12, r11, lsl #8
    //// bounds:  -0x0224e95 (-2^21.1004) <= r11 <= 0x00a34e95 (+2^23.3514)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r9, lsl #15
    //// bounds:  -0x40005415 (-2^30.0000) <= r10 <= 0x40015415 (+2^30.0001)
sub.w r9, r10, r9
    //// bounds:  -0x4000d415 (-2^30.0001) <= r9  <= 0x4001d415 (+2^30.0002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001015 (-2^12.0074) <= r7  <= 0x00011015 (+2^16.0879)
add.w r8, r8, r7, lsl #11
    //// bounds:  -0x0d5ba3e (-2^23.7396) <= r8  <= 0x1895ba3e (+2^28.6197)
sub.w r7, r8, r7, lsl #12
    //// bounds:  -0x8d5ba3e (-2^27.1432) <= r7  <= 0x1095ba3e (+2^28.0518)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
sub.w r6, r6, r4, lsl #3
    //// bounds:  -0x01d94e6 (-2^20.8866) <= r6  <= 0x105594e6 (+2^28.0298)
add.w r4, r6, r4, lsl #4
    //// bounds:  -0x01594e6 (-2^20.4317) <= r4  <= 0x105d94e6 (+2^28.0326)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #288]
str.w r11, [r1, #300]
str.w r10, [r1, #312]
str.w r9, [r1, #324]
str.w r8, [r1, #336]
str.w r7, [r1, #348]
str.w r6, [r1, #360]
str.w r4, [r1, #372]
ldr.w r12, [sp, #292]
ldr.w r11, [sp, #304]
ldr.w r10, [sp, #316]
ldr.w r9, [sp, #328]
ldr.w r8, [sp, #340]
ldr.w r7, [sp, #352]
ldr.w r6, [sp, #364]
ldr.w r4, [sp, #376]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r8  <= 0x00010010 (+2^16.0004)
sub.w r12, r12, r8, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r12 <= 0x00110dfe (+2^20.0921)
add.w r8, r12, r8, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r8  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r7  <= 0x00010010 (+2^16.0004)
sub.w r11, r11, r7, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r11 <= 0x00110dfe (+2^20.0921)
add.w r7, r11, r7, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r7  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r6  <= 0x00010010 (+2^16.0004)
sub.w r10, r10, r6, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r10 <= 0x00110dfe (+2^20.0921)
add.w r6, r10, r6, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r6  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r4  <= 0x00010010 (+2^16.0004)
sub.w r9, r9, r4, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r9  <= 0x00110dfe (+2^20.0921)
add.w r4, r9, r4, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r4  <= 0x10110dfe (+2^28.0060)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r10 <= 0x00011011 (+2^16.0878)
add.w r12, r12, r10, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r12 <= 0x44154dfe (+2^30.0892)
sub.w r10, r12, r10, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r10 <= 0x04154dfe (+2^26.0297)
RED1 r12, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r12 <= 0x00014415 (+2^16.3402)
RED1 r10, r3
    //// bounds:  -0x0005415 (-2^14.3937) <= r10 <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r9  <= 0x00011011 (+2^16.0878)
add.w r11, r11, r9, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r11 <= 0x44154dfe (+2^30.0892)
sub.w r9, r11, r9, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r9  <= 0x04154dfe (+2^26.0297)
RED1 r11, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r11 <= 0x00014415 (+2^16.3402)
RED1 r9, r3
    //// bounds:  -0x0005415 (-2^14.3937) <= r9  <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r6  <= 0x00011011 (+2^16.0878)
sub.w r8, r8, r6, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r8  <= 0x1015123e (+2^28.0074)
add.w r6, r8, r6, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r6  <= 0x1055123e (+2^28.0297)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r4  <= 0x00011011 (+2^16.0878)
sub.w r7, r7, r4, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r7  <= 0x1015123e (+2^28.0074)
add.w r4, r7, r4, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r4  <= 0x1055123e (+2^28.0297)
/*** LAYER 6 ***/
sub.w r12, r12, r11, lsl #7
    //// bounds:  -0x0a24e95 (-2^23.3426) <= r12 <= 0x00234e95 (+2^21.1419)
add.w r11, r12, r11, lsl #8
    //// bounds:  -0x0224e95 (-2^21.1004) <= r11 <= 0x00a34e95 (+2^23.3514)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r9, lsl #15
    //// bounds:  -0x40005415 (-2^30.0000) <= r10 <= 0x40015415 (+2^30.0001)
sub.w r9, r10, r9
    //// bounds:  -0x4000d415 (-2^30.0001) <= r9  <= 0x4001d415 (+2^30.0002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001015 (-2^12.0074) <= r7  <= 0x00011015 (+2^16.0879)
add.w r8, r8, r7, lsl #11
    //// bounds:  -0x0d5ba3e (-2^23.7396) <= r8  <= 0x1895ba3e (+2^28.6197)
sub.w r7, r8, r7, lsl #12
    //// bounds:  -0x8d5ba3e (-2^27.1432) <= r7  <= 0x1095ba3e (+2^28.0518)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
sub.w r6, r6, r4, lsl #3
    //// bounds:  -0x01d94e6 (-2^20.8866) <= r6  <= 0x105594e6 (+2^28.0298)
add.w r4, r6, r4, lsl #4
    //// bounds:  -0x01594e6 (-2^20.4317) <= r4  <= 0x105d94e6 (+2^28.0326)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #292]
str.w r11, [r1, #304]
str.w r10, [r1, #316]
str.w r9, [r1, #328]
str.w r8, [r1, #340]
str.w r7, [r1, #352]
str.w r6, [r1, #364]
str.w r4, [r1, #376]
ldr.w r12, [sp, #296]
ldr.w r11, [sp, #308]
ldr.w r10, [sp, #320]
ldr.w r9, [sp, #332]
ldr.w r8, [sp, #344]
ldr.w r7, [sp, #356]
ldr.w r6, [sp, #368]
ldr.w r4, [sp, #380]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r8  <= 0x00010010 (+2^16.0004)
sub.w r12, r12, r8, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r12 <= 0x00110dfe (+2^20.0921)
add.w r8, r12, r8, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r8  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r7  <= 0x00010010 (+2^16.0004)
sub.w r11, r11, r7, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r11 <= 0x00110dfe (+2^20.0921)
add.w r7, r11, r7, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r7  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r6  <= 0x00010010 (+2^16.0004)
sub.w r10, r10, r6, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r10 <= 0x00110dfe (+2^20.0921)
add.w r6, r10, r6, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r6  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r4  <= 0x00010010 (+2^16.0004)
sub.w r9, r9, r4, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r9  <= 0x00110dfe (+2^20.0921)
add.w r4, r9, r4, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r4  <= 0x10110dfe (+2^28.0060)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r10 <= 0x00011011 (+2^16.0878)
add.w r12, r12, r10, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r12 <= 0x44154dfe (+2^30.0892)
sub.w r10, r12, r10, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r10 <= 0x04154dfe (+2^26.0297)
RED1 r12, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r12 <= 0x00014415 (+2^16.3402)
RED1 r10, r3
    //// bounds:  -0x0005415 (-2^14.3937) <= r10 <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r9  <= 0x00011011 (+2^16.0878)
add.w r11, r11, r9, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r11 <= 0x44154dfe (+2^30.0892)
sub.w r9, r11, r9, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r9  <= 0x04154dfe (+2^26.0297)
RED1 r11, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r11 <= 0x00014415 (+2^16.3402)
RED1 r9, r3
    //// bounds:  -0x0005415 (-2^14.3937) <= r9  <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r6  <= 0x00011011 (+2^16.0878)
sub.w r8, r8, r6, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r8  <= 0x1015123e (+2^28.0074)
add.w r6, r8, r6, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r6  <= 0x1055123e (+2^28.0297)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r4  <= 0x00011011 (+2^16.0878)
sub.w r7, r7, r4, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r7  <= 0x1015123e (+2^28.0074)
add.w r4, r7, r4, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r4  <= 0x1055123e (+2^28.0297)
/*** LAYER 6 ***/
sub.w r12, r12, r11, lsl #7
    //// bounds:  -0x0a24e95 (-2^23.3426) <= r12 <= 0x00234e95 (+2^21.1419)
add.w r11, r12, r11, lsl #8
    //// bounds:  -0x0224e95 (-2^21.1004) <= r11 <= 0x00a34e95 (+2^23.3514)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r9, lsl #15
    //// bounds:  -0x40005415 (-2^30.0000) <= r10 <= 0x40015415 (+2^30.0001)
sub.w r9, r10, r9
    //// bounds:  -0x4000d415 (-2^30.0001) <= r9  <= 0x4001d415 (+2^30.0002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001015 (-2^12.0074) <= r7  <= 0x00011015 (+2^16.0879)
add.w r8, r8, r7, lsl #11
    //// bounds:  -0x0d5ba3e (-2^23.7396) <= r8  <= 0x1895ba3e (+2^28.6197)
sub.w r7, r8, r7, lsl #12
    //// bounds:  -0x8d5ba3e (-2^27.1432) <= r7  <= 0x1095ba3e (+2^28.0518)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
sub.w r6, r6, r4, lsl #3
    //// bounds:  -0x01d94e6 (-2^20.8866) <= r6  <= 0x105594e6 (+2^28.0298)
add.w r4, r6, r4, lsl #4
    //// bounds:  -0x01594e6 (-2^20.4317) <= r4  <= 0x105d94e6 (+2^28.0326)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #296]
str.w r11, [r1, #308]
str.w r10, [r1, #320]
str.w r9, [r1, #332]
str.w r8, [r1, #344]
str.w r7, [r1, #356]
str.w r6, [r1, #368]
str.w r4, [r1, #380]
ldr.w r12, [sp, #384]
ldr.w r11, [sp, #396]
ldr.w r10, [sp, #408]
ldr.w r9, [sp, #420]
ldr.w r8, [sp, #432]
ldr.w r7, [sp, #444]
ldr.w r6, [sp, #456]
ldr.w r4, [sp, #468]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r8  <= 0x00010088 (+2^16.0030)
sub.w r12, r12, r8, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r12 <= 0x008a96ef (+2^23.1147)
add.w r8, r12, r8, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r8  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r7  <= 0x00010088 (+2^16.0030)
sub.w r11, r11, r7, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r11 <= 0x008a96ef (+2^23.1147)
add.w r7, r11, r7, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r7  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r6  <= 0x00010088 (+2^16.0030)
sub.w r10, r10, r6, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r10 <= 0x008a96ef (+2^23.1147)
add.w r6, r10, r6, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r6  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r4  <= 0x00010088 (+2^16.0030)
sub.w r9, r9, r4, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r9  <= 0x008a96ef (+2^23.1147)
add.w r4, r9, r4, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r4  <= 0x048a96ef (+2^26.1831)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r10 <= 0x0001048a (+2^16.0254)
sub.w r12, r12, r10, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r12 <= 0x011bd6ef (+2^24.1489)
add.w r10, r12, r10, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r10 <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r9  <= 0x0001048a (+2^16.0254)
sub.w r11, r11, r9, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r11 <= 0x011bd6ef (+2^24.1489)
add.w r9, r11, r9, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r9  <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r6  <= 0x0001048a (+2^16.0254)
add.w r8, r8, r6, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r8  <= 0x04ab282f (+2^26.2230)
sub.w r6, r8, r6, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r6  <= 0x048b282f (+2^26.1838)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r4  <= 0x0001048a (+2^16.0254)
add.w r7, r7, r4, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r7  <= 0x04ab282f (+2^26.2230)
sub.w r4, r7, r4, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r4  <= 0x048b282f (+2^26.1838)
/*** LAYER 6 ***/
ldr.w r14, =1020
RED1 r11, r3
    //// bounds:  -0x000251b (-2^13.2136) <= r11 <= 0x0001251b (+2^16.1953)
mul.w r11, r11, r14
    //// bounds:  -0x093d794 (-2^23.2079) <= r11 <= 0x048fd794 (+2^26.1896)
add.w r12, r12, r11
    //// bounds:  -0x25afae83 (-2^29.2360) <= r12 <= 0x05abae83 (+2^26.5035)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x29abae83 (-2^29.3810) <= r11 <= 0x01afae83 (+2^24.7538)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =1028
RED1 r9, r3
    //// bounds:  -0x000211b (-2^13.0490) <= r9  <= 0x0001211b (+2^16.1755)
mul.w r9, r9, r14
    //// bounds:  -0x084f06c (-2^23.0546) <= r9  <= 0x0488f06c (+2^26.1811)
sub.w r10, r10, r9
    //// bounds:  -0x9a4c75b (-2^27.2696) <= r10 <= 0x21a0c75b (+2^29.0716)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x5a0c75b (-2^26.4926) <= r9  <= 0x25a4c75b (+2^29.2343)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-16320
RED1 r7, r3
    //// bounds:  -0x00004ab (-2^10.2228) <= r7  <= 0x000104ab (+2^16.0261)
mul.w r7, r7, r14
    //// bounds:  -0x40e99540 (-2^30.0204) <= r7  <= 0x01299540 (+2^24.2171)
add.w r8, r8, r7
    //// bounds:  -0x4174bd6f (-2^30.0325) <= r8  <= 0x05d4bd6f (+2^26.5437)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x1b4bd6f (-2^24.7706) <= r7  <= 0x4594bd6f (+2^30.1206)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =16448
RED1 r4, r3
    //// bounds:  -0x000048b (-2^10.1836) <= r4  <= 0x0001048b (+2^16.0254)
mul.w r4, r4, r14
    //// bounds:  -0x123e2c0 (-2^24.1893) <= r4  <= 0x4163e2c0 (+2^30.0310)
add.w r6, r6, r4
    //// bounds:  -0x1cf0aef (-2^24.8550) <= r6  <= 0x45ef0aef (+2^30.1279)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x420f0aef (-2^30.0457) <= r4  <= 0x05af0aef (+2^26.5068)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #384]
str.w r11, [r1, #396]
str.w r10, [r1, #408]
str.w r9, [r1, #420]
str.w r8, [r1, #432]
str.w r7, [r1, #444]
str.w r6, [r1, #456]
str.w r4, [r1, #468]
ldr.w r12, [sp, #388]
ldr.w r11, [sp, #400]
ldr.w r10, [sp, #412]
ldr.w r9, [sp, #424]
ldr.w r8, [sp, #436]
ldr.w r7, [sp, #448]
ldr.w r6, [sp, #460]
ldr.w r4, [sp, #472]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r8  <= 0x00010088 (+2^16.0030)
sub.w r12, r12, r8, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r12 <= 0x008a96ef (+2^23.1147)
add.w r8, r12, r8, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r8  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r7  <= 0x00010088 (+2^16.0030)
sub.w r11, r11, r7, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r11 <= 0x008a96ef (+2^23.1147)
add.w r7, r11, r7, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r7  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r6  <= 0x00010088 (+2^16.0030)
sub.w r10, r10, r6, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r10 <= 0x008a96ef (+2^23.1147)
add.w r6, r10, r6, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r6  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r4  <= 0x00010088 (+2^16.0030)
sub.w r9, r9, r4, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r9  <= 0x008a96ef (+2^23.1147)
add.w r4, r9, r4, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r4  <= 0x048a96ef (+2^26.1831)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r10 <= 0x0001048a (+2^16.0254)
sub.w r12, r12, r10, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r12 <= 0x011bd6ef (+2^24.1489)
add.w r10, r12, r10, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r10 <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r9  <= 0x0001048a (+2^16.0254)
sub.w r11, r11, r9, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r11 <= 0x011bd6ef (+2^24.1489)
add.w r9, r11, r9, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r9  <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r6  <= 0x0001048a (+2^16.0254)
add.w r8, r8, r6, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r8  <= 0x04ab282f (+2^26.2230)
sub.w r6, r8, r6, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r6  <= 0x048b282f (+2^26.1838)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r4  <= 0x0001048a (+2^16.0254)
add.w r7, r7, r4, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r7  <= 0x04ab282f (+2^26.2230)
sub.w r4, r7, r4, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r4  <= 0x048b282f (+2^26.1838)
/*** LAYER 6 ***/
ldr.w r14, =1020
RED1 r11, r3
    //// bounds:  -0x000251b (-2^13.2136) <= r11 <= 0x0001251b (+2^16.1953)
mul.w r11, r11, r14
    //// bounds:  -0x093d794 (-2^23.2079) <= r11 <= 0x048fd794 (+2^26.1896)
add.w r12, r12, r11
    //// bounds:  -0x25afae83 (-2^29.2360) <= r12 <= 0x05abae83 (+2^26.5035)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x29abae83 (-2^29.3810) <= r11 <= 0x01afae83 (+2^24.7538)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =1028
RED1 r9, r3
    //// bounds:  -0x000211b (-2^13.0490) <= r9  <= 0x0001211b (+2^16.1755)
mul.w r9, r9, r14
    //// bounds:  -0x084f06c (-2^23.0546) <= r9  <= 0x0488f06c (+2^26.1811)
sub.w r10, r10, r9
    //// bounds:  -0x9a4c75b (-2^27.2696) <= r10 <= 0x21a0c75b (+2^29.0716)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x5a0c75b (-2^26.4926) <= r9  <= 0x25a4c75b (+2^29.2343)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-16320
RED1 r7, r3
    //// bounds:  -0x00004ab (-2^10.2228) <= r7  <= 0x000104ab (+2^16.0261)
mul.w r7, r7, r14
    //// bounds:  -0x40e99540 (-2^30.0204) <= r7  <= 0x01299540 (+2^24.2171)
add.w r8, r8, r7
    //// bounds:  -0x4174bd6f (-2^30.0325) <= r8  <= 0x05d4bd6f (+2^26.5437)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x1b4bd6f (-2^24.7706) <= r7  <= 0x4594bd6f (+2^30.1206)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =16448
RED1 r4, r3
    //// bounds:  -0x000048b (-2^10.1836) <= r4  <= 0x0001048b (+2^16.0254)
mul.w r4, r4, r14
    //// bounds:  -0x123e2c0 (-2^24.1893) <= r4  <= 0x4163e2c0 (+2^30.0310)
add.w r6, r6, r4
    //// bounds:  -0x1cf0aef (-2^24.8550) <= r6  <= 0x45ef0aef (+2^30.1279)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x420f0aef (-2^30.0457) <= r4  <= 0x05af0aef (+2^26.5068)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #388]
str.w r11, [r1, #400]
str.w r10, [r1, #412]
str.w r9, [r1, #424]
str.w r8, [r1, #436]
str.w r7, [r1, #448]
str.w r6, [r1, #460]
str.w r4, [r1, #472]
ldr.w r12, [sp, #392]
ldr.w r11, [sp, #404]
ldr.w r10, [sp, #416]
ldr.w r9, [sp, #428]
ldr.w r8, [sp, #440]
ldr.w r7, [sp, #452]
ldr.w r6, [sp, #464]
ldr.w r4, [sp, #476]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r8  <= 0x00010088 (+2^16.0030)
sub.w r12, r12, r8, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r12 <= 0x008a96ef (+2^23.1147)
add.w r8, r12, r8, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r8  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r7  <= 0x00010088 (+2^16.0030)
sub.w r11, r11, r7, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r11 <= 0x008a96ef (+2^23.1147)
add.w r7, r11, r7, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r7  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r6  <= 0x00010088 (+2^16.0030)
sub.w r10, r10, r6, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r10 <= 0x008a96ef (+2^23.1147)
add.w r6, r10, r6, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r6  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r4  <= 0x00010088 (+2^16.0030)
sub.w r9, r9, r4, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r9  <= 0x008a96ef (+2^23.1147)
add.w r4, r9, r4, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r4  <= 0x048a96ef (+2^26.1831)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r10 <= 0x0001048a (+2^16.0254)
sub.w r12, r12, r10, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r12 <= 0x011bd6ef (+2^24.1489)
add.w r10, r12, r10, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r10 <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r9  <= 0x0001048a (+2^16.0254)
sub.w r11, r11, r9, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r11 <= 0x011bd6ef (+2^24.1489)
add.w r9, r11, r9, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r9  <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r6  <= 0x0001048a (+2^16.0254)
add.w r8, r8, r6, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r8  <= 0x04ab282f (+2^26.2230)
sub.w r6, r8, r6, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r6  <= 0x048b282f (+2^26.1838)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r4  <= 0x0001048a (+2^16.0254)
add.w r7, r7, r4, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r7  <= 0x04ab282f (+2^26.2230)
sub.w r4, r7, r4, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r4  <= 0x048b282f (+2^26.1838)
/*** LAYER 6 ***/
ldr.w r14, =1020
RED1 r11, r3
    //// bounds:  -0x000251b (-2^13.2136) <= r11 <= 0x0001251b (+2^16.1953)
mul.w r11, r11, r14
    //// bounds:  -0x093d794 (-2^23.2079) <= r11 <= 0x048fd794 (+2^26.1896)
add.w r12, r12, r11
    //// bounds:  -0x25afae83 (-2^29.2360) <= r12 <= 0x05abae83 (+2^26.5035)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x29abae83 (-2^29.3810) <= r11 <= 0x01afae83 (+2^24.7538)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =1028
RED1 r9, r3
    //// bounds:  -0x000211b (-2^13.0490) <= r9  <= 0x0001211b (+2^16.1755)
mul.w r9, r9, r14
    //// bounds:  -0x084f06c (-2^23.0546) <= r9  <= 0x0488f06c (+2^26.1811)
sub.w r10, r10, r9
    //// bounds:  -0x9a4c75b (-2^27.2696) <= r10 <= 0x21a0c75b (+2^29.0716)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x5a0c75b (-2^26.4926) <= r9  <= 0x25a4c75b (+2^29.2343)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-16320
RED1 r7, r3
    //// bounds:  -0x00004ab (-2^10.2228) <= r7  <= 0x000104ab (+2^16.0261)
mul.w r7, r7, r14
    //// bounds:  -0x40e99540 (-2^30.0204) <= r7  <= 0x01299540 (+2^24.2171)
add.w r8, r8, r7
    //// bounds:  -0x4174bd6f (-2^30.0325) <= r8  <= 0x05d4bd6f (+2^26.5437)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x1b4bd6f (-2^24.7706) <= r7  <= 0x4594bd6f (+2^30.1206)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =16448
RED1 r4, r3
    //// bounds:  -0x000048b (-2^10.1836) <= r4  <= 0x0001048b (+2^16.0254)
mul.w r4, r4, r14
    //// bounds:  -0x123e2c0 (-2^24.1893) <= r4  <= 0x4163e2c0 (+2^30.0310)
add.w r6, r6, r4
    //// bounds:  -0x1cf0aef (-2^24.8550) <= r6  <= 0x45ef0aef (+2^30.1279)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x420f0aef (-2^30.0457) <= r4  <= 0x05af0aef (+2^26.5068)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #392]
str.w r11, [r1, #404]
str.w r10, [r1, #416]
str.w r9, [r1, #428]
str.w r8, [r1, #440]
str.w r7, [r1, #452]
str.w r6, [r1, #464]
str.w r4, [r1, #476]
ldr.w r12, [sp, #480]
ldr.w r11, [sp, #492]
ldr.w r10, [sp, #504]
ldr.w r9, [sp, #516]
ldr.w r8, [sp, #528]
ldr.w r7, [sp, #540]
ldr.w r6, [sp, #552]
ldr.w r4, [sp, #564]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
sub.w r8, r12, r8, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r8  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
sub.w r7, r11, r7, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r7  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r6, r10, r6, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r6  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
sub.w r4, r9, r4, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r4  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r12 <= 0x07fef801 (+2^26.9993)
add.w r10, r12, r10, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r10 <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r11 <= 0x07fef801 (+2^26.9993)
add.w r9, r11, r9, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r9  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r6  <= 0x000102aa (+2^16.0149)
sub.w r8, r8, r6, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r8  <= 0x02afa6ab (+2^25.4255)
add.w r6, r8, r6, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r6  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r4  <= 0x000102aa (+2^16.0149)
sub.w r7, r7, r4, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r7  <= 0x02afa6ab (+2^25.4255)
add.w r4, r7, r4, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r4  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 6 ***/
ldr.w r14, =4112
RED1 r11, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r11 <= 0x000107fe (+2^16.0444)
mul.w r11, r11, r14
    //// bounds:  -0x0805fe0 (-2^23.0042) <= r11 <= 0x10905fe0 (+2^28.0500)
add.w r12, r12, r11
    //// bounds:  -0x87f57e1 (-2^27.0870) <= r12 <= 0x188f57e1 (+2^28.6182)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x188f57e1 (-2^28.6182) <= r11 <= 0x087f57e1 (+2^27.0870)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4080
RED1 r9, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r9  <= 0x000107fe (+2^16.0444)
mul.w r9, r9, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r9  <= 0x106f6020 (+2^28.0387)
add.w r10, r10, r9
    //// bounds:  -0x87e5821 (-2^27.0864) <= r10 <= 0x186e5821 (+2^28.6106)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x186e5821 (-2^28.6106) <= r9  <= 0x087e5821 (+2^27.0864)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-255
RED1 r7, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r7  <= 0x000104af (+2^16.0262)
mul.w r7, r7, r14
    //// bounds:  -0x103aa51 (-2^24.0205) <= r7  <= 0x0004aa51 (+2^18.2220)
add.w r8, r8, r7
    //// bounds:  -0x5b350fc (-2^26.5111) <= r8  <= 0x02b450fc (+2^25.4353)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4b450fc (-2^26.2340) <= r7  <= 0x03b350fc (+2^25.8877)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =257
RED1 r4, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r4  <= 0x000104af (+2^16.0262)
mul.w r4, r4, r14
    //// bounds:  -0x004b3af (-2^18.2332) <= r4  <= 0x0105b3af (+2^24.0318)
add.w r6, r6, r4
    //// bounds:  -0x2b45a5a (-2^25.4354) <= r6  <= 0x05b55a5a (+2^26.5131)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x3b55a5a (-2^25.8908) <= r4  <= 0x04b45a5a (+2^26.2340)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #480]
str.w r11, [r1, #492]
str.w r10, [r1, #504]
str.w r9, [r1, #516]
str.w r8, [r1, #528]
str.w r7, [r1, #540]
str.w r6, [r1, #552]
str.w r4, [r1, #564]
ldr.w r12, [sp, #484]
ldr.w r11, [sp, #496]
ldr.w r10, [sp, #508]
ldr.w r9, [sp, #520]
ldr.w r8, [sp, #532]
ldr.w r7, [sp, #544]
ldr.w r6, [sp, #556]
ldr.w r4, [sp, #568]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
sub.w r8, r12, r8, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r8  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
sub.w r7, r11, r7, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r7  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r6, r10, r6, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r6  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
sub.w r4, r9, r4, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r4  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r12 <= 0x07fef801 (+2^26.9993)
add.w r10, r12, r10, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r10 <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r11 <= 0x07fef801 (+2^26.9993)
add.w r9, r11, r9, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r9  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r6  <= 0x000102aa (+2^16.0149)
sub.w r8, r8, r6, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r8  <= 0x02afa6ab (+2^25.4255)
add.w r6, r8, r6, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r6  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r4  <= 0x000102aa (+2^16.0149)
sub.w r7, r7, r4, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r7  <= 0x02afa6ab (+2^25.4255)
add.w r4, r7, r4, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r4  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 6 ***/
ldr.w r14, =4112
RED1 r11, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r11 <= 0x000107fe (+2^16.0444)
mul.w r11, r11, r14
    //// bounds:  -0x0805fe0 (-2^23.0042) <= r11 <= 0x10905fe0 (+2^28.0500)
add.w r12, r12, r11
    //// bounds:  -0x87f57e1 (-2^27.0870) <= r12 <= 0x188f57e1 (+2^28.6182)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x188f57e1 (-2^28.6182) <= r11 <= 0x087f57e1 (+2^27.0870)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4080
RED1 r9, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r9  <= 0x000107fe (+2^16.0444)
mul.w r9, r9, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r9  <= 0x106f6020 (+2^28.0387)
add.w r10, r10, r9
    //// bounds:  -0x87e5821 (-2^27.0864) <= r10 <= 0x186e5821 (+2^28.6106)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x186e5821 (-2^28.6106) <= r9  <= 0x087e5821 (+2^27.0864)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-255
RED1 r7, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r7  <= 0x000104af (+2^16.0262)
mul.w r7, r7, r14
    //// bounds:  -0x103aa51 (-2^24.0205) <= r7  <= 0x0004aa51 (+2^18.2220)
add.w r8, r8, r7
    //// bounds:  -0x5b350fc (-2^26.5111) <= r8  <= 0x02b450fc (+2^25.4353)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4b450fc (-2^26.2340) <= r7  <= 0x03b350fc (+2^25.8877)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =257
RED1 r4, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r4  <= 0x000104af (+2^16.0262)
mul.w r4, r4, r14
    //// bounds:  -0x004b3af (-2^18.2332) <= r4  <= 0x0105b3af (+2^24.0318)
add.w r6, r6, r4
    //// bounds:  -0x2b45a5a (-2^25.4354) <= r6  <= 0x05b55a5a (+2^26.5131)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x3b55a5a (-2^25.8908) <= r4  <= 0x04b45a5a (+2^26.2340)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #484]
str.w r11, [r1, #496]
str.w r10, [r1, #508]
str.w r9, [r1, #520]
str.w r8, [r1, #532]
str.w r7, [r1, #544]
str.w r6, [r1, #556]
str.w r4, [r1, #568]
ldr.w r12, [sp, #488]
ldr.w r11, [sp, #500]
ldr.w r10, [sp, #512]
ldr.w r9, [sp, #524]
ldr.w r8, [sp, #536]
ldr.w r7, [sp, #548]
ldr.w r6, [sp, #560]
ldr.w r4, [sp, #572]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
sub.w r8, r12, r8, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r8  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
sub.w r7, r11, r7, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r7  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r6, r10, r6, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r6  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
sub.w r4, r9, r4, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r4  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r12 <= 0x07fef801 (+2^26.9993)
add.w r10, r12, r10, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r10 <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r11 <= 0x07fef801 (+2^26.9993)
add.w r9, r11, r9, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r9  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r6  <= 0x000102aa (+2^16.0149)
sub.w r8, r8, r6, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r8  <= 0x02afa6ab (+2^25.4255)
add.w r6, r8, r6, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r6  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r4  <= 0x000102aa (+2^16.0149)
sub.w r7, r7, r4, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r7  <= 0x02afa6ab (+2^25.4255)
add.w r4, r7, r4, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r4  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 6 ***/
ldr.w r14, =4112
RED1 r11, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r11 <= 0x000107fe (+2^16.0444)
mul.w r11, r11, r14
    //// bounds:  -0x0805fe0 (-2^23.0042) <= r11 <= 0x10905fe0 (+2^28.0500)
add.w r12, r12, r11
    //// bounds:  -0x87f57e1 (-2^27.0870) <= r12 <= 0x188f57e1 (+2^28.6182)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x188f57e1 (-2^28.6182) <= r11 <= 0x087f57e1 (+2^27.0870)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4080
RED1 r9, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r9  <= 0x000107fe (+2^16.0444)
mul.w r9, r9, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r9  <= 0x106f6020 (+2^28.0387)
add.w r10, r10, r9
    //// bounds:  -0x87e5821 (-2^27.0864) <= r10 <= 0x186e5821 (+2^28.6106)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x186e5821 (-2^28.6106) <= r9  <= 0x087e5821 (+2^27.0864)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-255
RED1 r7, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r7  <= 0x000104af (+2^16.0262)
mul.w r7, r7, r14
    //// bounds:  -0x103aa51 (-2^24.0205) <= r7  <= 0x0004aa51 (+2^18.2220)
add.w r8, r8, r7
    //// bounds:  -0x5b350fc (-2^26.5111) <= r8  <= 0x02b450fc (+2^25.4353)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4b450fc (-2^26.2340) <= r7  <= 0x03b350fc (+2^25.8877)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =257
RED1 r4, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r4  <= 0x000104af (+2^16.0262)
mul.w r4, r4, r14
    //// bounds:  -0x004b3af (-2^18.2332) <= r4  <= 0x0105b3af (+2^24.0318)
add.w r6, r6, r4
    //// bounds:  -0x2b45a5a (-2^25.4354) <= r6  <= 0x05b55a5a (+2^26.5131)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x3b55a5a (-2^25.8908) <= r4  <= 0x04b45a5a (+2^26.2340)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #488]
str.w r11, [r1, #500]
str.w r10, [r1, #512]
str.w r9, [r1, #524]
str.w r8, [r1, #536]
str.w r7, [r1, #548]
str.w r6, [r1, #560]
str.w r4, [r1, #572]
ldr.w r12, [sp, #576]
ldr.w r11, [sp, #588]
ldr.w r10, [sp, #600]
ldr.w r9, [sp, #612]
ldr.w r8, [sp, #624]
ldr.w r7, [sp, #636]
ldr.w r6, [sp, #648]
ldr.w r4, [sp, #660]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
add.w r12, r12, r8, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r12 <= 0x440a86ff (+2^30.0883)
sub.w r8, r12, r8, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r8  <= 0x040a86ff (+2^26.0148)
RED1 r12, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r12 <= 0x0001440a (+2^16.3400)
RED1 r8, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r8  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
add.w r11, r11, r7, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r11 <= 0x440a86ff (+2^30.0883)
sub.w r7, r11, r7, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r7  <= 0x040a86ff (+2^26.0148)
RED1 r11, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r11 <= 0x0001440a (+2^16.3400)
RED1 r7, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r7  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
add.w r10, r10, r6, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r10 <= 0x440a86ff (+2^30.0883)
sub.w r6, r10, r6, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r6  <= 0x040a86ff (+2^26.0148)
RED1 r10, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r10 <= 0x0001440a (+2^16.3400)
RED1 r6, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r6  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
add.w r9, r9, r4, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r9  <= 0x440a86ff (+2^30.0883)
sub.w r4, r9, r4, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r4  <= 0x040a86ff (+2^26.0148)
RED1 r9, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r9  <= 0x0001440a (+2^16.3400)
RED1 r4, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r4  <= 0x0001540a (+2^16.4096)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r12 <= 0x0023490a (+2^21.1410)
add.w r10, r12, r10, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r10 <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r11 <= 0x0023490a (+2^21.1410)
add.w r9, r11, r9, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r9  <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r8, r8, r6, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r8  <= 0x4001540a (+2^30.0001)
sub.w r6, r8, r6
    //// bounds:  -0x4000d40a (-2^30.0001) <= r6  <= 0x4001d40a (+2^30.0002)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r7, r7, r4, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r7  <= 0x4001540a (+2^30.0001)
sub.w r4, r7, r4
    //// bounds:  -0x4000d40a (-2^30.0001) <= r4  <= 0x4001d40a (+2^30.0002)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 6 ***/
ldr.w r14, =32641
RED1 r11, r3
    //// bounds:  -0x00000a2 (-2^ 7.3399) <= r11 <= 0x000100a2 (+2^16.0036)
mul.w r11, r11, r14
    //// bounds:  -0x050afa2 (-2^22.3342) <= r11 <= 0x7fd1afa2 (+2^30.9980)
RED1 r11, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r11 <= 0x00017fd1 (+2^16.5843)
sub.w r12, r12, r11
    //// bounds:  -0x0a3c8db (-2^23.3557) <= r12 <= 0x0023c8db (+2^21.1613)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0x0a2c8db (-2^23.3468) <= r11 <= 0x0024c8db (+2^21.2010)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =32640
RED1 r9, r3
    //// bounds:  -0x00000a3 (-2^ 7.3487) <= r9  <= 0x000100a3 (+2^16.0036)
mul.w r9, r9, r14
    //// bounds:  -0x0512e80 (-2^22.3431) <= r9  <= 0x7fd12e80 (+2^30.9979)
RED1 r9, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r9  <= 0x00017fd1 (+2^16.5843)
add.w r10, r10, r9
    //// bounds:  -0x022c8db (-2^21.1204) <= r10 <= 0x00a4c8db (+2^23.3644)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x023c8db (-2^21.1613) <= r9  <= 0x00a3c8db (+2^23.3557)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2040
mul.w r7, r7, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r7  <= 0x09f607f8 (+2^27.3163)
sub.w r8, r8, r7
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r8  <= 0x01ff47f9 (+2^24.9980)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r7  <= 0x09f747f9 (+2^27.3170)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2056
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r6, r6, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r6  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #576]
str.w r11, [r1, #588]
str.w r10, [r1, #600]
str.w r9, [r1, #612]
str.w r8, [r1, #624]
str.w r7, [r1, #636]
str.w r6, [r1, #648]
str.w r4, [r1, #660]
ldr.w r12, [sp, #580]
ldr.w r11, [sp, #592]
ldr.w r10, [sp, #604]
ldr.w r9, [sp, #616]
ldr.w r8, [sp, #628]
ldr.w r7, [sp, #640]
ldr.w r6, [sp, #652]
ldr.w r4, [sp, #664]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
add.w r12, r12, r8, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r12 <= 0x440a86ff (+2^30.0883)
sub.w r8, r12, r8, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r8  <= 0x040a86ff (+2^26.0148)
RED1 r12, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r12 <= 0x0001440a (+2^16.3400)
RED1 r8, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r8  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
add.w r11, r11, r7, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r11 <= 0x440a86ff (+2^30.0883)
sub.w r7, r11, r7, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r7  <= 0x040a86ff (+2^26.0148)
RED1 r11, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r11 <= 0x0001440a (+2^16.3400)
RED1 r7, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x000540a (-2^14.3930) <= r7  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
add.w r10, r10, r6, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r10 <= 0x440a86ff (+2^30.0883)
sub.w r6, r10, r6, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r6  <= 0x040a86ff (+2^26.0148)
RED1 r10, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r10 <= 0x0001440a (+2^16.3400)
RED1 r6, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r6  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
add.w r9, r9, r4, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r9  <= 0x440a86ff (+2^30.0883)
sub.w r4, r9, r4, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r4  <= 0x040a86ff (+2^26.0148)
RED1 r9, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r9  <= 0x0001440a (+2^16.3400)
RED1 r4, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r4  <= 0x0001540a (+2^16.4096)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r12 <= 0x0023490a (+2^21.1410)
add.w r10, r12, r10, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r10 <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r11 <= 0x0023490a (+2^21.1410)
add.w r9, r11, r9, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r9  <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r8, r8, r6, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r8  <= 0x4001540a (+2^30.0001)
sub.w r6, r8, r6
    //// bounds:  -0x4000d40a (-2^30.0001) <= r6  <= 0x4001d40a (+2^30.0002)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r7, r7, r4, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r7  <= 0x4001540a (+2^30.0001)
sub.w r4, r7, r4
    //// bounds:  -0x4000d40a (-2^30.0001) <= r4  <= 0x4001d40a (+2^30.0002)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 6 ***/
ldr.w r14, =32641
RED1 r11, r3
    //// bounds:  -0x00000a2 (-2^ 7.3399) <= r11 <= 0x000100a2 (+2^16.0036)
mul.w r11, r11, r14
    //// bounds:  -0x050afa2 (-2^22.3342) <= r11 <= 0x7fd1afa2 (+2^30.9980)
RED1 r11, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r11 <= 0x00017fd1 (+2^16.5843)
sub.w r12, r12, r11
    //// bounds:  -0x0a3c8db (-2^23.3557) <= r12 <= 0x0023c8db (+2^21.1613)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0x0a2c8db (-2^23.3468) <= r11 <= 0x0024c8db (+2^21.2010)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =32640
RED1 r9, r3
    //// bounds:  -0x00000a3 (-2^ 7.3487) <= r9  <= 0x000100a3 (+2^16.0036)
mul.w r9, r9, r14
    //// bounds:  -0x0512e80 (-2^22.3431) <= r9  <= 0x7fd12e80 (+2^30.9979)
RED1 r9, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r9  <= 0x00017fd1 (+2^16.5843)
add.w r10, r10, r9
    //// bounds:  -0x022c8db (-2^21.1204) <= r10 <= 0x00a4c8db (+2^23.3644)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x023c8db (-2^21.1613) <= r9  <= 0x00a3c8db (+2^23.3557)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2040
mul.w r7, r7, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r7  <= 0x09f607f8 (+2^27.3163)
sub.w r8, r8, r7
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r8  <= 0x01ff47f9 (+2^24.9980)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r7  <= 0x09f747f9 (+2^27.3170)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2056
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r6, r6, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r6  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #580]
str.w r11, [r1, #592]
str.w r10, [r1, #604]
str.w r9, [r1, #616]
str.w r8, [r1, #628]
str.w r7, [r1, #640]
str.w r6, [r1, #652]
str.w r4, [r1, #664]
ldr.w r12, [sp, #584]
ldr.w r11, [sp, #596]
ldr.w r10, [sp, #608]
ldr.w r9, [sp, #620]
ldr.w r8, [sp, #632]
ldr.w r7, [sp, #644]
ldr.w r6, [sp, #656]
ldr.w r4, [sp, #668]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
add.w r12, r12, r8, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r12 <= 0x440a86ff (+2^30.0883)
sub.w r8, r12, r8, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r8  <= 0x040a86ff (+2^26.0148)
RED1 r12, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r12 <= 0x0001440a (+2^16.3400)
RED1 r8, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r8  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
add.w r11, r11, r7, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r11 <= 0x440a86ff (+2^30.0883)
sub.w r7, r11, r7, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r7  <= 0x040a86ff (+2^26.0148)
RED1 r11, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r11 <= 0x0001440a (+2^16.3400)
RED1 r7, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r7  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
add.w r10, r10, r6, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r10 <= 0x440a86ff (+2^30.0883)
sub.w r6, r10, r6, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r6  <= 0x040a86ff (+2^26.0148)
RED1 r10, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r10 <= 0x0001440a (+2^16.3400)
RED1 r6, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r6  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
add.w r9, r9, r4, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r9  <= 0x440a86ff (+2^30.0883)
sub.w r4, r9, r4, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r4  <= 0x040a86ff (+2^26.0148)
RED1 r9, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r9  <= 0x0001440a (+2^16.3400)
RED1 r4, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r4  <= 0x0001540a (+2^16.4096)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r12 <= 0x0023490a (+2^21.1410)
add.w r10, r12, r10, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r10 <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r11 <= 0x0023490a (+2^21.1410)
add.w r9, r11, r9, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r9  <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r8, r8, r6, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r8  <= 0x4001540a (+2^30.0001)
sub.w r6, r8, r6
    //// bounds:  -0x4000d40a (-2^30.0001) <= r6  <= 0x4001d40a (+2^30.0002)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r7, r7, r4, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r7  <= 0x4001540a (+2^30.0001)
sub.w r4, r7, r4
    //// bounds:  -0x4000d40a (-2^30.0001) <= r4  <= 0x4001d40a (+2^30.0002)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 6 ***/
ldr.w r14, =32641
RED1 r11, r3
    //// bounds:  -0x00000a2 (-2^ 7.3399) <= r11 <= 0x000100a2 (+2^16.0036)
mul.w r11, r11, r14
    //// bounds:  -0x050afa2 (-2^22.3342) <= r11 <= 0x7fd1afa2 (+2^30.9980)
RED1 r11, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r11 <= 0x00017fd1 (+2^16.5843)
sub.w r12, r12, r11
    //// bounds:  -0x0a3c8db (-2^23.3557) <= r12 <= 0x0023c8db (+2^21.1613)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0x0a2c8db (-2^23.3468) <= r11 <= 0x0024c8db (+2^21.2010)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =32640
RED1 r9, r3
    //// bounds:  -0x00000a3 (-2^ 7.3487) <= r9  <= 0x000100a3 (+2^16.0036)
mul.w r9, r9, r14
    //// bounds:  -0x0512e80 (-2^22.3431) <= r9  <= 0x7fd12e80 (+2^30.9979)
RED1 r9, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r9  <= 0x00017fd1 (+2^16.5843)
add.w r10, r10, r9
    //// bounds:  -0x022c8db (-2^21.1204) <= r10 <= 0x00a4c8db (+2^23.3644)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x023c8db (-2^21.1613) <= r9  <= 0x00a3c8db (+2^23.3557)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2040
mul.w r7, r7, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r7  <= 0x09f607f8 (+2^27.3163)
sub.w r8, r8, r7
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r8  <= 0x01ff47f9 (+2^24.9980)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r7  <= 0x09f747f9 (+2^27.3170)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2056
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r6, r6, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r6  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #584]
str.w r11, [r1, #596]
str.w r10, [r1, #608]
str.w r9, [r1, #620]
str.w r8, [r1, #632]
str.w r7, [r1, #644]
str.w r6, [r1, #656]
str.w r4, [r1, #668]
ldr.w r12, [sp, #672]
ldr.w r11, [sp, #684]
ldr.w r10, [sp, #696]
ldr.w r9, [sp, #708]
ldr.w r8, [sp, #720]
ldr.w r7, [sp, #732]
ldr.w r6, [sp, #744]
ldr.w r4, [sp, #756]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
sub.w r12, r12, r8, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r12 <= 0x100c88ff (+2^28.0044)
add.w r8, r12, r8, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r8  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
sub.w r11, r11, r7, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r11 <= 0x100c88ff (+2^28.0044)
add.w r7, r11, r7, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r7  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
sub.w r10, r10, r6, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r10 <= 0x100c88ff (+2^28.0044)
add.w r6, r10, r6, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r6  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
sub.w r9, r9, r4, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r9  <= 0x100c88ff (+2^28.0044)
add.w r4, r9, r4, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r4  <= 0x104c88ff (+2^28.0267)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r10 <= 0x0001100c (+2^16.0877)
add.w r12, r12, r10, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r12 <= 0x188ce8ff (+2^28.6177)
sub.w r10, r12, r10, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r10 <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r9  <= 0x0001100c (+2^16.0877)
add.w r11, r11, r9, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r11 <= 0x188ce8ff (+2^28.6177)
sub.w r9, r11, r9, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r9  <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r6  <= 0x0001104c (+2^16.0890)
sub.w r8, r8, r6, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r8  <= 0x104d0b5f (+2^28.0269)
add.w r6, r8, r6, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r6  <= 0x10550b5f (+2^28.0296)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r4  <= 0x0001104c (+2^16.0890)
sub.w r7, r7, r4, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r7  <= 0x104d0b5f (+2^28.0269)
add.w r4, r7, r4, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r4  <= 0x10550b5f (+2^28.0296)
/*** LAYER 6 ***/
ldr.w r14, =514
RED1 r11, r3
    //// bounds:  -0x000188c (-2^12.6175) <= r11 <= 0x0001188c (+2^16.1321)
mul.w r11, r11, r14
    //// bounds:  -0x0314918 (-2^21.6231) <= r11 <= 0x02334918 (+2^25.1377)
add.w r12, r12, r11
    //// bounds:  -0x0fe3217 (-2^23.9898) <= r12 <= 0x1ac03217 (+2^28.7415)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x3003217 (-2^25.5853) <= r11 <= 0x18be3217 (+2^28.6289)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =510
RED1 r9, r3
    //// bounds:  -0x000108c (-2^12.0485) <= r9  <= 0x0001108c (+2^16.0904)
mul.w r9, r9, r14
    //// bounds:  -0x020f6e8 (-2^21.0428) <= r9  <= 0x021ef6e8 (+2^25.0847)
add.w r10, r10, r9
    //// bounds:  -0x8eddfe7 (-2^27.1585) <= r10 <= 0x12abdfe7 (+2^28.2228)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0xaebdfe7 (-2^27.4491) <= r9  <= 0x10addfe7 (+2^28.0600)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8224
RED1 r7, r3
    //// bounds:  -0x000104d (-2^12.0269) <= r7  <= 0x0001104d (+2^16.0891)
mul.w r7, r7, r14
    //// bounds:  -0x20ba9a0 (-2^25.0325) <= r7  <= 0x222ba9a0 (+2^29.0947)
sub.w r8, r8, r7
    //// bounds:  -0x2240b4ff (-2^29.0981) <= r8  <= 0x1258b4ff (+2^28.1974)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x220b4ff (-2^25.0893) <= r7  <= 0x3278b4ff (+2^29.6574)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8160
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
mul.w r4, r4, r14
    //// bounds:  -0x2089560 (-2^25.0240) <= r4  <= 0x21e89560 (+2^29.0836)
sub.w r6, r6, r4
    //// bounds:  -0x21f5a0bf (-2^29.0857) <= r6  <= 0x125da0bf (+2^28.1989)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x215a0bf (-2^25.0597) <= r4  <= 0x323da0bf (+2^29.6508)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #672]
str.w r11, [r1, #684]
str.w r10, [r1, #696]
str.w r9, [r1, #708]
str.w r8, [r1, #720]
str.w r7, [r1, #732]
str.w r6, [r1, #744]
str.w r4, [r1, #756]
ldr.w r12, [sp, #676]
ldr.w r11, [sp, #688]
ldr.w r10, [sp, #700]
ldr.w r9, [sp, #712]
ldr.w r8, [sp, #724]
ldr.w r7, [sp, #736]
ldr.w r6, [sp, #748]
ldr.w r4, [sp, #760]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
sub.w r12, r12, r8, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r12 <= 0x100c88ff (+2^28.0044)
add.w r8, r12, r8, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r8  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
sub.w r11, r11, r7, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r11 <= 0x100c88ff (+2^28.0044)
add.w r7, r11, r7, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r7  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
sub.w r10, r10, r6, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r10 <= 0x100c88ff (+2^28.0044)
add.w r6, r10, r6, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r6  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
sub.w r9, r9, r4, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r9  <= 0x100c88ff (+2^28.0044)
add.w r4, r9, r4, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r4  <= 0x104c88ff (+2^28.0267)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r10 <= 0x0001100c (+2^16.0877)
add.w r12, r12, r10, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r12 <= 0x188ce8ff (+2^28.6177)
sub.w r10, r12, r10, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r10 <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r9  <= 0x0001100c (+2^16.0877)
add.w r11, r11, r9, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r11 <= 0x188ce8ff (+2^28.6177)
sub.w r9, r11, r9, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r9  <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r6  <= 0x0001104c (+2^16.0890)
sub.w r8, r8, r6, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r8  <= 0x104d0b5f (+2^28.0269)
add.w r6, r8, r6, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r6  <= 0x10550b5f (+2^28.0296)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r4  <= 0x0001104c (+2^16.0890)
sub.w r7, r7, r4, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r7  <= 0x104d0b5f (+2^28.0269)
add.w r4, r7, r4, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r4  <= 0x10550b5f (+2^28.0296)
/*** LAYER 6 ***/
ldr.w r14, =514
RED1 r11, r3
    //// bounds:  -0x000188c (-2^12.6175) <= r11 <= 0x0001188c (+2^16.1321)
mul.w r11, r11, r14
    //// bounds:  -0x0314918 (-2^21.6231) <= r11 <= 0x02334918 (+2^25.1377)
add.w r12, r12, r11
    //// bounds:  -0x0fe3217 (-2^23.9898) <= r12 <= 0x1ac03217 (+2^28.7415)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x3003217 (-2^25.5853) <= r11 <= 0x18be3217 (+2^28.6289)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =510
RED1 r9, r3
    //// bounds:  -0x000108c (-2^12.0485) <= r9  <= 0x0001108c (+2^16.0904)
mul.w r9, r9, r14
    //// bounds:  -0x020f6e8 (-2^21.0428) <= r9  <= 0x021ef6e8 (+2^25.0847)
add.w r10, r10, r9
    //// bounds:  -0x8eddfe7 (-2^27.1585) <= r10 <= 0x12abdfe7 (+2^28.2228)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0xaebdfe7 (-2^27.4491) <= r9  <= 0x10addfe7 (+2^28.0600)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8224
RED1 r7, r3
    //// bounds:  -0x000104d (-2^12.0269) <= r7  <= 0x0001104d (+2^16.0891)
mul.w r7, r7, r14
    //// bounds:  -0x20ba9a0 (-2^25.0325) <= r7  <= 0x222ba9a0 (+2^29.0947)
sub.w r8, r8, r7
    //// bounds:  -0x2240b4ff (-2^29.0981) <= r8  <= 0x1258b4ff (+2^28.1974)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x220b4ff (-2^25.0893) <= r7  <= 0x3278b4ff (+2^29.6574)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8160
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
mul.w r4, r4, r14
    //// bounds:  -0x2089560 (-2^25.0240) <= r4  <= 0x21e89560 (+2^29.0836)
sub.w r6, r6, r4
    //// bounds:  -0x21f5a0bf (-2^29.0857) <= r6  <= 0x125da0bf (+2^28.1989)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x215a0bf (-2^25.0597) <= r4  <= 0x323da0bf (+2^29.6508)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #676]
str.w r11, [r1, #688]
str.w r10, [r1, #700]
str.w r9, [r1, #712]
str.w r8, [r1, #724]
str.w r7, [r1, #736]
str.w r6, [r1, #748]
str.w r4, [r1, #760]
ldr.w r12, [sp, #680]
ldr.w r11, [sp, #692]
ldr.w r10, [sp, #704]
ldr.w r9, [sp, #716]
ldr.w r8, [sp, #728]
ldr.w r7, [sp, #740]
ldr.w r6, [sp, #752]
ldr.w r4, [sp, #764]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
sub.w r12, r12, r8, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r12 <= 0x100c88ff (+2^28.0044)
add.w r8, r12, r8, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r8  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
sub.w r11, r11, r7, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r11 <= 0x100c88ff (+2^28.0044)
add.w r7, r11, r7, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r7  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
sub.w r10, r10, r6, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r10 <= 0x100c88ff (+2^28.0044)
add.w r6, r10, r6, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r6  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
sub.w r9, r9, r4, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r9  <= 0x100c88ff (+2^28.0044)
add.w r4, r9, r4, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r4  <= 0x104c88ff (+2^28.0267)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r10 <= 0x0001100c (+2^16.0877)
add.w r12, r12, r10, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r12 <= 0x188ce8ff (+2^28.6177)
sub.w r10, r12, r10, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r10 <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r9  <= 0x0001100c (+2^16.0877)
add.w r11, r11, r9, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r11 <= 0x188ce8ff (+2^28.6177)
sub.w r9, r11, r9, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r9  <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r6  <= 0x0001104c (+2^16.0890)
sub.w r8, r8, r6, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r8  <= 0x104d0b5f (+2^28.0269)
add.w r6, r8, r6, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r6  <= 0x10550b5f (+2^28.0296)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r4  <= 0x0001104c (+2^16.0890)
sub.w r7, r7, r4, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r7  <= 0x104d0b5f (+2^28.0269)
add.w r4, r7, r4, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r4  <= 0x10550b5f (+2^28.0296)
/*** LAYER 6 ***/
ldr.w r14, =514
RED1 r11, r3
    //// bounds:  -0x000188c (-2^12.6175) <= r11 <= 0x0001188c (+2^16.1321)
mul.w r11, r11, r14
    //// bounds:  -0x0314918 (-2^21.6231) <= r11 <= 0x02334918 (+2^25.1377)
add.w r12, r12, r11
    //// bounds:  -0x0fe3217 (-2^23.9898) <= r12 <= 0x1ac03217 (+2^28.7415)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x3003217 (-2^25.5853) <= r11 <= 0x18be3217 (+2^28.6289)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =510
RED1 r9, r3
    //// bounds:  -0x000108c (-2^12.0485) <= r9  <= 0x0001108c (+2^16.0904)
mul.w r9, r9, r14
    //// bounds:  -0x020f6e8 (-2^21.0428) <= r9  <= 0x021ef6e8 (+2^25.0847)
add.w r10, r10, r9
    //// bounds:  -0x8eddfe7 (-2^27.1585) <= r10 <= 0x12abdfe7 (+2^28.2228)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0xaebdfe7 (-2^27.4491) <= r9  <= 0x10addfe7 (+2^28.0600)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8224
RED1 r7, r3
    //// bounds:  -0x000104d (-2^12.0269) <= r7  <= 0x0001104d (+2^16.0891)
mul.w r7, r7, r14
    //// bounds:  -0x20ba9a0 (-2^25.0325) <= r7  <= 0x222ba9a0 (+2^29.0947)
sub.w r8, r8, r7
    //// bounds:  -0x2240b4ff (-2^29.0981) <= r8  <= 0x1258b4ff (+2^28.1974)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x220b4ff (-2^25.0893) <= r7  <= 0x3278b4ff (+2^29.6574)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8160
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
mul.w r4, r4, r14
    //// bounds:  -0x2089560 (-2^25.0240) <= r4  <= 0x21e89560 (+2^29.0836)
sub.w r6, r6, r4
    //// bounds:  -0x21f5a0bf (-2^29.0857) <= r6  <= 0x125da0bf (+2^28.1989)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x215a0bf (-2^25.0597) <= r4  <= 0x323da0bf (+2^29.6508)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #680]
str.w r11, [r1, #692]
str.w r10, [r1, #704]
str.w r9, [r1, #716]
str.w r8, [r1, #728]
str.w r7, [r1, #740]
str.w r6, [r1, #752]
str.w r4, [r1, #764]
ldr.w r12, [sp, #768]
ldr.w r11, [sp, #780]
ldr.w r10, [sp, #792]
ldr.w r9, [sp, #804]
ldr.w r8, [sp, #816]
ldr.w r7, [sp, #828]
ldr.w r6, [sp, #840]
ldr.w r4, [sp, #852]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r8  <= 0x00010482 (+2^16.0252)
sub.w r12, r12, r8, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r12 <= 0x009a46ff (+2^23.2694)
add.w r8, r12, r8, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r8  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r7  <= 0x00010482 (+2^16.0252)
sub.w r11, r11, r7, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r11 <= 0x009a46ff (+2^23.2694)
add.w r7, r11, r7, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r7  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r6  <= 0x00010482 (+2^16.0252)
sub.w r10, r10, r6, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r10 <= 0x009a46ff (+2^23.2694)
add.w r6, r10, r6, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r6  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r4  <= 0x00010482 (+2^16.0252)
sub.w r9, r9, r4, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r9  <= 0x009a46ff (+2^23.2694)
add.w r4, r9, r4, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r4  <= 0x209a46ff (+2^29.0269)
/*** LAYER 5 ***/
ldr.w r14, =1020
RED1 r10, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r10 <= 0x00012512 (+2^16.1951)
mul.w r10, r10, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r10 <= 0x048fb3b8 (+2^26.1895)
add.w r12, r12, r10
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r12 <= 0x0529fab7 (+2^26.3685)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r10 <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r9  <= 0x00012512 (+2^16.1951)
mul.w r9, r9, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r9  <= 0x048fb3b8 (+2^26.1895)
add.w r11, r11, r9
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r11 <= 0x0529fab7 (+2^26.3685)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r9  <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
ldr.w r14, =1028
RED1 r6, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r6  <= 0x0001209a (+2^16.1729)
mul.w r6, r6, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r6  <= 0x0486ea68 (+2^26.1786)
sub.w r8, r8, r6
    //// bounds:  -0x9999a58 (-2^27.2630) <= r8  <= 0x211d3167 (+2^29.0494)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r6  <= 0x25213167 (+2^29.2145)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r4  <= 0x0001209a (+2^16.1729)
mul.w r4, r4, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r4  <= 0x0486ea68 (+2^26.1786)
sub.w r7, r7, r4
    //// bounds:  -0x9999a58 (-2^27.2630) <= r7  <= 0x211d3167 (+2^29.0494)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r4  <= 0x25213167 (+2^29.2145)
/*** LAYER 6 ***/
ldr.w r14, =2469
RED1 r11, r3
    //// bounds:  -0x00025a6 (-2^13.2345) <= r11 <= 0x000125a6 (+2^16.1979)
mul.w r11, r11, r14
    //// bounds:  -0x16b19fe (-2^24.5042) <= r11 <= 0x0b1019fe (+2^27.4677)
add.w r12, r12, r11
    //// bounds:  -0x27117da6 (-2^29.2879) <= r12 <= 0x103a14b5 (+2^28.0203)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x30b67da6 (-2^29.6062) <= r11 <= 0x069514b5 (+2^26.7186)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =23306
RED1 r9, r3
    //// bounds:  -0x00029a2 (-2^13.3796) <= r9  <= 0x000129a2 (+2^16.2174)
mul.w r9, r9, r14
    //// bounds:  -0xece3654 (-2^27.8881) <= r9  <= 0x69d83654 (+2^30.7258)
RED1 r9, r3
    //// bounds:  -0x00069d8 (-2^14.7258) <= r9  <= 0x000169d8 (+2^16.4992)
sub.w r10, r10, r9
    //// bounds:  -0x29a3cd80 (-2^29.3799) <= r10 <= 0x012e648f (+2^24.2403)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x29a2cd80 (-2^29.3798) <= r9  <= 0x012f648f (+2^24.2450)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26033
RED1 r7, r3
    //// bounds:  -0x000211d (-2^13.0493) <= r7  <= 0x0001211d (+2^16.1755)
mul.w r7, r7, r14
    //// bounds:  -0xd27560d (-2^27.7174) <= r7  <= 0x72d8560d (+2^30.8435)
RED1 r7, r3
    //// bounds:  -0x00072d8 (-2^14.8435) <= r7  <= 0x000172d8 (+2^16.5347)
add.w r8, r8, r7
    //// bounds:  -0x99a0d30 (-2^27.2633) <= r8  <= 0x211ea43f (+2^29.0496)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x99b0d30 (-2^27.2639) <= r7  <= 0x211da43f (+2^29.0494)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20326
RED1 r4, r3
    //// bounds:  -0x0002521 (-2^13.2145) <= r4  <= 0x00012521 (+2^16.1954)
mul.w r4, r4, r14
    //// bounds:  -0xb83fa26 (-2^27.5255) <= r4  <= 0x5ae9fa26 (+2^30.5064)
RED1 r4, r3
    //// bounds:  -0x0005ae9 (-2^14.5064) <= r4  <= 0x00015ae9 (+2^16.4384)
sub.w r6, r6, r4
    //// bounds:  -0x596f541 (-2^26.4828) <= r6  <= 0x25218c50 (+2^29.2146)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x595f541 (-2^26.4818) <= r4  <= 0x25228c50 (+2^29.2147)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #768]
str.w r11, [r1, #780]
str.w r10, [r1, #792]
str.w r9, [r1, #804]
str.w r8, [r1, #816]
str.w r7, [r1, #828]
str.w r6, [r1, #840]
str.w r4, [r1, #852]
ldr.w r12, [sp, #772]
ldr.w r11, [sp, #784]
ldr.w r10, [sp, #796]
ldr.w r9, [sp, #808]
ldr.w r8, [sp, #820]
ldr.w r7, [sp, #832]
ldr.w r6, [sp, #844]
ldr.w r4, [sp, #856]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r8  <= 0x00010482 (+2^16.0252)
sub.w r12, r12, r8, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r12 <= 0x009a46ff (+2^23.2694)
add.w r8, r12, r8, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r8  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r7  <= 0x00010482 (+2^16.0252)
sub.w r11, r11, r7, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r11 <= 0x009a46ff (+2^23.2694)
add.w r7, r11, r7, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r7  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r6  <= 0x00010482 (+2^16.0252)
sub.w r10, r10, r6, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r10 <= 0x009a46ff (+2^23.2694)
add.w r6, r10, r6, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r6  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r4  <= 0x00010482 (+2^16.0252)
sub.w r9, r9, r4, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r9  <= 0x009a46ff (+2^23.2694)
add.w r4, r9, r4, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r4  <= 0x209a46ff (+2^29.0269)
/*** LAYER 5 ***/
ldr.w r14, =1020
RED1 r10, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r10 <= 0x00012512 (+2^16.1951)
mul.w r10, r10, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r10 <= 0x048fb3b8 (+2^26.1895)
add.w r12, r12, r10
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r12 <= 0x0529fab7 (+2^26.3685)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r10 <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r9  <= 0x00012512 (+2^16.1951)
mul.w r9, r9, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r9  <= 0x048fb3b8 (+2^26.1895)
add.w r11, r11, r9
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r11 <= 0x0529fab7 (+2^26.3685)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r9  <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
ldr.w r14, =1028
RED1 r6, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r6  <= 0x0001209a (+2^16.1729)
mul.w r6, r6, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r6  <= 0x0486ea68 (+2^26.1786)
sub.w r8, r8, r6
    //// bounds:  -0x9999a58 (-2^27.2630) <= r8  <= 0x211d3167 (+2^29.0494)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r6  <= 0x25213167 (+2^29.2145)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r4  <= 0x0001209a (+2^16.1729)
mul.w r4, r4, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r4  <= 0x0486ea68 (+2^26.1786)
sub.w r7, r7, r4
    //// bounds:  -0x9999a58 (-2^27.2630) <= r7  <= 0x211d3167 (+2^29.0494)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r4  <= 0x25213167 (+2^29.2145)
/*** LAYER 6 ***/
ldr.w r14, =2469
RED1 r11, r3
    //// bounds:  -0x00025a6 (-2^13.2345) <= r11 <= 0x000125a6 (+2^16.1979)
mul.w r11, r11, r14
    //// bounds:  -0x16b19fe (-2^24.5042) <= r11 <= 0x0b1019fe (+2^27.4677)
add.w r12, r12, r11
    //// bounds:  -0x27117da6 (-2^29.2879) <= r12 <= 0x103a14b5 (+2^28.0203)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x30b67da6 (-2^29.6062) <= r11 <= 0x069514b5 (+2^26.7186)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =23306
RED1 r9, r3
    //// bounds:  -0x00029a2 (-2^13.3796) <= r9  <= 0x000129a2 (+2^16.2174)
mul.w r9, r9, r14
    //// bounds:  -0xece3654 (-2^27.8881) <= r9  <= 0x69d83654 (+2^30.7258)
RED1 r9, r3
    //// bounds:  -0x00069d8 (-2^14.7258) <= r9  <= 0x000169d8 (+2^16.4992)
sub.w r10, r10, r9
    //// bounds:  -0x29a3cd80 (-2^29.3799) <= r10 <= 0x012e648f (+2^24.2403)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x29a2cd80 (-2^29.3798) <= r9  <= 0x012f648f (+2^24.2450)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26033
RED1 r7, r3
    //// bounds:  -0x000211d (-2^13.0493) <= r7  <= 0x0001211d (+2^16.1755)
mul.w r7, r7, r14
    //// bounds:  -0xd27560d (-2^27.7174) <= r7  <= 0x72d8560d (+2^30.8435)
RED1 r7, r3
    //// bounds:  -0x00072d8 (-2^14.8435) <= r7  <= 0x000172d8 (+2^16.5347)
add.w r8, r8, r7
    //// bounds:  -0x99a0d30 (-2^27.2633) <= r8  <= 0x211ea43f (+2^29.0496)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x99b0d30 (-2^27.2639) <= r7  <= 0x211da43f (+2^29.0494)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20326
RED1 r4, r3
    //// bounds:  -0x0002521 (-2^13.2145) <= r4  <= 0x00012521 (+2^16.1954)
mul.w r4, r4, r14
    //// bounds:  -0xb83fa26 (-2^27.5255) <= r4  <= 0x5ae9fa26 (+2^30.5064)
RED1 r4, r3
    //// bounds:  -0x0005ae9 (-2^14.5064) <= r4  <= 0x00015ae9 (+2^16.4384)
sub.w r6, r6, r4
    //// bounds:  -0x596f541 (-2^26.4828) <= r6  <= 0x25218c50 (+2^29.2146)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x595f541 (-2^26.4818) <= r4  <= 0x25228c50 (+2^29.2147)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #772]
str.w r11, [r1, #784]
str.w r10, [r1, #796]
str.w r9, [r1, #808]
str.w r8, [r1, #820]
str.w r7, [r1, #832]
str.w r6, [r1, #844]
str.w r4, [r1, #856]
ldr.w r12, [sp, #776]
ldr.w r11, [sp, #788]
ldr.w r10, [sp, #800]
ldr.w r9, [sp, #812]
ldr.w r8, [sp, #824]
ldr.w r7, [sp, #836]
ldr.w r6, [sp, #848]
ldr.w r4, [sp, #860]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r8  <= 0x00010482 (+2^16.0252)
sub.w r12, r12, r8, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r12 <= 0x009a46ff (+2^23.2694)
add.w r8, r12, r8, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r8  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r7  <= 0x00010482 (+2^16.0252)
sub.w r11, r11, r7, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r11 <= 0x009a46ff (+2^23.2694)
add.w r7, r11, r7, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r7  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r6  <= 0x00010482 (+2^16.0252)
sub.w r10, r10, r6, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r10 <= 0x009a46ff (+2^23.2694)
add.w r6, r10, r6, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r6  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r4  <= 0x00010482 (+2^16.0252)
sub.w r9, r9, r4, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r9  <= 0x009a46ff (+2^23.2694)
add.w r4, r9, r4, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r4  <= 0x209a46ff (+2^29.0269)
/*** LAYER 5 ***/
ldr.w r14, =1020
RED1 r10, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r10 <= 0x00012512 (+2^16.1951)
mul.w r10, r10, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r10 <= 0x048fb3b8 (+2^26.1895)
add.w r12, r12, r10
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r12 <= 0x0529fab7 (+2^26.3685)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r10 <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r9  <= 0x00012512 (+2^16.1951)
mul.w r9, r9, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r9  <= 0x048fb3b8 (+2^26.1895)
add.w r11, r11, r9
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r11 <= 0x0529fab7 (+2^26.3685)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r9  <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
ldr.w r14, =1028
RED1 r6, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r6  <= 0x0001209a (+2^16.1729)
mul.w r6, r6, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r6  <= 0x0486ea68 (+2^26.1786)
sub.w r8, r8, r6
    //// bounds:  -0x9999a58 (-2^27.2630) <= r8  <= 0x211d3167 (+2^29.0494)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r6  <= 0x25213167 (+2^29.2145)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r4  <= 0x0001209a (+2^16.1729)
mul.w r4, r4, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r4  <= 0x0486ea68 (+2^26.1786)
sub.w r7, r7, r4
    //// bounds:  -0x9999a58 (-2^27.2630) <= r7  <= 0x211d3167 (+2^29.0494)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r4  <= 0x25213167 (+2^29.2145)
/*** LAYER 6 ***/
ldr.w r14, =2469
RED1 r11, r3
    //// bounds:  -0x00025a6 (-2^13.2345) <= r11 <= 0x000125a6 (+2^16.1979)
mul.w r11, r11, r14
    //// bounds:  -0x16b19fe (-2^24.5042) <= r11 <= 0x0b1019fe (+2^27.4677)
add.w r12, r12, r11
    //// bounds:  -0x27117da6 (-2^29.2879) <= r12 <= 0x103a14b5 (+2^28.0203)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x30b67da6 (-2^29.6062) <= r11 <= 0x069514b5 (+2^26.7186)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =23306
RED1 r9, r3
    //// bounds:  -0x00029a2 (-2^13.3796) <= r9  <= 0x000129a2 (+2^16.2174)
mul.w r9, r9, r14
    //// bounds:  -0xece3654 (-2^27.8881) <= r9  <= 0x69d83654 (+2^30.7258)
RED1 r9, r3
    //// bounds:  -0x00069d8 (-2^14.7258) <= r9  <= 0x000169d8 (+2^16.4992)
sub.w r10, r10, r9
    //// bounds:  -0x29a3cd80 (-2^29.3799) <= r10 <= 0x012e648f (+2^24.2403)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x29a2cd80 (-2^29.3798) <= r9  <= 0x012f648f (+2^24.2450)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26033
RED1 r7, r3
    //// bounds:  -0x000211d (-2^13.0493) <= r7  <= 0x0001211d (+2^16.1755)
mul.w r7, r7, r14
    //// bounds:  -0xd27560d (-2^27.7174) <= r7  <= 0x72d8560d (+2^30.8435)
RED1 r7, r3
    //// bounds:  -0x00072d8 (-2^14.8435) <= r7  <= 0x000172d8 (+2^16.5347)
add.w r8, r8, r7
    //// bounds:  -0x99a0d30 (-2^27.2633) <= r8  <= 0x211ea43f (+2^29.0496)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x99b0d30 (-2^27.2639) <= r7  <= 0x211da43f (+2^29.0494)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20326
RED1 r4, r3
    //// bounds:  -0x0002521 (-2^13.2145) <= r4  <= 0x00012521 (+2^16.1954)
mul.w r4, r4, r14
    //// bounds:  -0xb83fa26 (-2^27.5255) <= r4  <= 0x5ae9fa26 (+2^30.5064)
RED1 r4, r3
    //// bounds:  -0x0005ae9 (-2^14.5064) <= r4  <= 0x00015ae9 (+2^16.4384)
sub.w r6, r6, r4
    //// bounds:  -0x596f541 (-2^26.4828) <= r6  <= 0x25218c50 (+2^29.2146)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x595f541 (-2^26.4818) <= r4  <= 0x25228c50 (+2^29.2147)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #776]
str.w r11, [r1, #788]
str.w r10, [r1, #800]
str.w r9, [r1, #812]
str.w r8, [r1, #824]
str.w r7, [r1, #836]
str.w r6, [r1, #848]
str.w r4, [r1, #860]
ldr.w r12, [sp, #864]
ldr.w r11, [sp, #876]
ldr.w r10, [sp, #888]
ldr.w r9, [sp, #900]
ldr.w r8, [sp, #912]
ldr.w r7, [sp, #924]
ldr.w r6, [sp, #936]
ldr.w r4, [sp, #948]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r8  <= 0x0001040a (+2^16.0226)
add.w r12, r12, r8, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r12 <= 0x042a883f (+2^26.0587)
sub.w r8, r12, r8, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r8  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r7  <= 0x0001040a (+2^16.0226)
add.w r11, r11, r7, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r11 <= 0x042a883f (+2^26.0587)
sub.w r7, r11, r7, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r7  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
add.w r10, r10, r6, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r10 <= 0x042a883f (+2^26.0587)
sub.w r6, r10, r6, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r6  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
add.w r9, r9, r4, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r9  <= 0x042a883f (+2^26.0587)
sub.w r4, r9, r4, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r4  <= 0x040a883f (+2^26.0148)
/*** LAYER 5 ***/
ldr.w r14, =-16320
RED1 r10, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r10 <= 0x0001042a (+2^16.0233)
mul.w r10, r10, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r10 <= 0x01097580 (+2^24.0523)
add.w r12, r12, r10
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r12 <= 0x0533fdbf (+2^26.3794)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r10 <= 0x44f3fdbf (+2^30.1075)
RED1 r12, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r12 <= 0x0001414c (+2^16.3278)
RED1 r10, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r10 <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r9  <= 0x01097580 (+2^24.0523)
add.w r11, r11, r9
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r11 <= 0x0533fdbf (+2^26.3794)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r9  <= 0x44f3fdbf (+2^30.1075)
RED1 r11, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r11 <= 0x0001414c (+2^16.3278)
RED1 r9, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r9  <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
ldr.w r14, =16448
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
mul.w r6, r6, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r6  <= 0x41438280 (+2^30.0282)
add.w r8, r8, r6
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r8  <= 0x454e0abf (+2^30.1149)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r6  <= 0x050e0abf (+2^26.3377)
RED1 r8, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r8  <= 0x0001454e (+2^16.3456)
RED1 r6, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r6  <= 0x000141e6 (+2^16.3305)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
mul.w r4, r4, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r4  <= 0x41438280 (+2^30.0282)
add.w r7, r7, r4
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r7  <= 0x454e0abf (+2^30.1149)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r4  <= 0x050e0abf (+2^26.3377)
RED1 r7, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r7  <= 0x0001454e (+2^16.3456)
RED1 r4, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r4  <= 0x000141e6 (+2^16.3305)
/*** LAYER 6 ***/
ldr.w r14, =27687
RED1 r11, r3
    //// bounds:  -0x0000001 <= r11 <= 0x00010001 (+2^16.0000)
mul.w r11, r11, r14
    //// bounds:  -0x0006c27 (-2^14.7569) <= r11 <= 0x6c276c27 (+2^30.7569)
add.w r12, r12, r11
    //// bounds:  -0x000ad73 (-2^15.4384) <= r12 <= 0x6c28ad73 (+2^30.7570)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6c27ad73 (-2^30.7570) <= r11 <= 0x0001ad73 (+2^16.7463)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9876
mul.w r9, r9, r14
    //// bounds:  -0xa63ee7c (-2^27.3772) <= r9  <= 0x30f7ee7c (+2^29.6138)
add.w r10, r10, r9
    //// bounds:  -0xa64336f (-2^27.3773) <= r10 <= 0x30f9336f (+2^29.6139)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x30f8336f (-2^29.6138) <= r9  <= 0x0a65336f (+2^27.3779)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =15767
mul.w r7, r7, r14
    //// bounds:  -0x10ac7702 (-2^28.0595) <= r7  <= 0x4e437702 (+2^30.2903)
add.w r8, r8, r7
    //// bounds:  -0x10acbc50 (-2^28.0596) <= r8  <= 0x4e44bc50 (+2^30.2904)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4e43bc50 (-2^30.2903) <= r7  <= 0x10adbc50 (+2^28.0599)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26942
RED1 r4, r3
    //// bounds:  -0x0000001 <= r4  <= 0x00010001 (+2^16.0000)
mul.w r4, r4, r14
    //// bounds:  -0x000693e (-2^14.7176) <= r4  <= 0x693e693e (+2^30.7176)
sub.w r6, r6, r4
    //// bounds:  -0x693eab24 (-2^30.7176) <= r6  <= 0x0001ab24 (+2^16.7386)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x000ab24 (-2^15.4190) <= r4  <= 0x693fab24 (+2^30.7177)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #864]
str.w r11, [r1, #876]
str.w r10, [r1, #888]
str.w r9, [r1, #900]
str.w r8, [r1, #912]
str.w r7, [r1, #924]
str.w r6, [r1, #936]
str.w r4, [r1, #948]
ldr.w r12, [sp, #868]
ldr.w r11, [sp, #880]
ldr.w r10, [sp, #892]
ldr.w r9, [sp, #904]
ldr.w r8, [sp, #916]
ldr.w r7, [sp, #928]
b.w 1f
.ltorg /* constant pool */
1:
ldr.w r6, [sp, #940]
ldr.w r4, [sp, #952]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r8  <= 0x0001040a (+2^16.0226)
add.w r12, r12, r8, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r12 <= 0x042a883f (+2^26.0587)
sub.w r8, r12, r8, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r8  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r7  <= 0x0001040a (+2^16.0226)
add.w r11, r11, r7, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r11 <= 0x042a883f (+2^26.0587)
sub.w r7, r11, r7, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r7  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
add.w r10, r10, r6, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r10 <= 0x042a883f (+2^26.0587)
sub.w r6, r10, r6, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r6  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
add.w r9, r9, r4, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r9  <= 0x042a883f (+2^26.0587)
sub.w r4, r9, r4, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r4  <= 0x040a883f (+2^26.0148)
/*** LAYER 5 ***/
ldr.w r14, =-16320
RED1 r10, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r10 <= 0x0001042a (+2^16.0233)
mul.w r10, r10, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r10 <= 0x01097580 (+2^24.0523)
add.w r12, r12, r10
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r12 <= 0x0533fdbf (+2^26.3794)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r10 <= 0x44f3fdbf (+2^30.1075)
RED1 r12, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r12 <= 0x0001414c (+2^16.3278)
RED1 r10, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r10 <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r9  <= 0x01097580 (+2^24.0523)
add.w r11, r11, r9
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r11 <= 0x0533fdbf (+2^26.3794)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r9  <= 0x44f3fdbf (+2^30.1075)
RED1 r11, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r11 <= 0x0001414c (+2^16.3278)
RED1 r9, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r9  <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
ldr.w r14, =16448
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
mul.w r6, r6, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r6  <= 0x41438280 (+2^30.0282)
add.w r8, r8, r6
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r8  <= 0x454e0abf (+2^30.1149)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r6  <= 0x050e0abf (+2^26.3377)
RED1 r8, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r8  <= 0x0001454e (+2^16.3456)
RED1 r6, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r6  <= 0x000141e6 (+2^16.3305)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
mul.w r4, r4, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r4  <= 0x41438280 (+2^30.0282)
add.w r7, r7, r4
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r7  <= 0x454e0abf (+2^30.1149)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r4  <= 0x050e0abf (+2^26.3377)
RED1 r7, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r7  <= 0x0001454e (+2^16.3456)
RED1 r4, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r4  <= 0x000141e6 (+2^16.3305)
/*** LAYER 6 ***/
ldr.w r14, =27687
RED1 r11, r3
    //// bounds:  -0x0000001 <= r11 <= 0x00010001 (+2^16.0000)
mul.w r11, r11, r14
    //// bounds:  -0x0006c27 (-2^14.7569) <= r11 <= 0x6c276c27 (+2^30.7569)
add.w r12, r12, r11
    //// bounds:  -0x000ad73 (-2^15.4384) <= r12 <= 0x6c28ad73 (+2^30.7570)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6c27ad73 (-2^30.7570) <= r11 <= 0x0001ad73 (+2^16.7463)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9876
mul.w r9, r9, r14
    //// bounds:  -0xa63ee7c (-2^27.3772) <= r9  <= 0x30f7ee7c (+2^29.6138)
add.w r10, r10, r9
    //// bounds:  -0xa64336f (-2^27.3773) <= r10 <= 0x30f9336f (+2^29.6139)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x30f8336f (-2^29.6138) <= r9  <= 0x0a65336f (+2^27.3779)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =15767
mul.w r7, r7, r14
    //// bounds:  -0x10ac7702 (-2^28.0595) <= r7  <= 0x4e437702 (+2^30.2903)
add.w r8, r8, r7
    //// bounds:  -0x10acbc50 (-2^28.0596) <= r8  <= 0x4e44bc50 (+2^30.2904)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4e43bc50 (-2^30.2903) <= r7  <= 0x10adbc50 (+2^28.0599)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26942
RED1 r4, r3
    //// bounds:  -0x0000001 <= r4  <= 0x00010001 (+2^16.0000)
mul.w r4, r4, r14
    //// bounds:  -0x000693e (-2^14.7176) <= r4  <= 0x693e693e (+2^30.7176)
sub.w r6, r6, r4
    //// bounds:  -0x693eab24 (-2^30.7176) <= r6  <= 0x0001ab24 (+2^16.7386)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x000ab24 (-2^15.4190) <= r4  <= 0x693fab24 (+2^30.7177)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #868]
str.w r11, [r1, #880]
str.w r10, [r1, #892]
str.w r9, [r1, #904]
str.w r8, [r1, #916]
str.w r7, [r1, #928]
str.w r6, [r1, #940]
str.w r4, [r1, #952]
ldr.w r12, [sp, #872]
ldr.w r11, [sp, #884]
ldr.w r10, [sp, #896]
ldr.w r9, [sp, #908]
ldr.w r8, [sp, #920]
ldr.w r7, [sp, #932]
ldr.w r6, [sp, #944]
ldr.w r4, [sp, #956]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r8  <= 0x0001040a (+2^16.0226)
add.w r12, r12, r8, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r12 <= 0x042a883f (+2^26.0587)
sub.w r8, r12, r8, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r8  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r7  <= 0x0001040a (+2^16.0226)
add.w r11, r11, r7, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r11 <= 0x042a883f (+2^26.0587)
sub.w r7, r11, r7, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r7  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
add.w r10, r10, r6, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r10 <= 0x042a883f (+2^26.0587)
sub.w r6, r10, r6, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r6  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
add.w r9, r9, r4, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r9  <= 0x042a883f (+2^26.0587)
sub.w r4, r9, r4, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r4  <= 0x040a883f (+2^26.0148)
/*** LAYER 5 ***/
ldr.w r14, =-16320
RED1 r10, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r10 <= 0x0001042a (+2^16.0233)
mul.w r10, r10, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r10 <= 0x01097580 (+2^24.0523)
add.w r12, r12, r10
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r12 <= 0x0533fdbf (+2^26.3794)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r10 <= 0x44f3fdbf (+2^30.1075)
RED1 r12, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r12 <= 0x0001414c (+2^16.3278)
RED1 r10, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r10 <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r9  <= 0x01097580 (+2^24.0523)
add.w r11, r11, r9
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r11 <= 0x0533fdbf (+2^26.3794)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r9  <= 0x44f3fdbf (+2^30.1075)
RED1 r11, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r11 <= 0x0001414c (+2^16.3278)
RED1 r9, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r9  <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
ldr.w r14, =16448
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
mul.w r6, r6, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r6  <= 0x41438280 (+2^30.0282)
add.w r8, r8, r6
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r8  <= 0x454e0abf (+2^30.1149)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r6  <= 0x050e0abf (+2^26.3377)
RED1 r8, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r8  <= 0x0001454e (+2^16.3456)
RED1 r6, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r6  <= 0x000141e6 (+2^16.3305)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
mul.w r4, r4, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r4  <= 0x41438280 (+2^30.0282)
add.w r7, r7, r4
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r7  <= 0x454e0abf (+2^30.1149)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r4  <= 0x050e0abf (+2^26.3377)
RED1 r7, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r7  <= 0x0001454e (+2^16.3456)
RED1 r4, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r4  <= 0x000141e6 (+2^16.3305)
/*** LAYER 6 ***/
ldr.w r14, =27687
RED1 r11, r3
    //// bounds:  -0x0000001 <= r11 <= 0x00010001 (+2^16.0000)
mul.w r11, r11, r14
    //// bounds:  -0x0006c27 (-2^14.7569) <= r11 <= 0x6c276c27 (+2^30.7569)
add.w r12, r12, r11
    //// bounds:  -0x000ad73 (-2^15.4384) <= r12 <= 0x6c28ad73 (+2^30.7570)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6c27ad73 (-2^30.7570) <= r11 <= 0x0001ad73 (+2^16.7463)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9876
mul.w r9, r9, r14
    //// bounds:  -0xa63ee7c (-2^27.3772) <= r9  <= 0x30f7ee7c (+2^29.6138)
add.w r10, r10, r9
    //// bounds:  -0xa64336f (-2^27.3773) <= r10 <= 0x30f9336f (+2^29.6139)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x30f8336f (-2^29.6138) <= r9  <= 0x0a65336f (+2^27.3779)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =15767
mul.w r7, r7, r14
    //// bounds:  -0x10ac7702 (-2^28.0595) <= r7  <= 0x4e437702 (+2^30.2903)
add.w r8, r8, r7
    //// bounds:  -0x10acbc50 (-2^28.0596) <= r8  <= 0x4e44bc50 (+2^30.2904)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4e43bc50 (-2^30.2903) <= r7  <= 0x10adbc50 (+2^28.0599)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26942
RED1 r4, r3
    //// bounds:  -0x0000001 <= r4  <= 0x00010001 (+2^16.0000)
mul.w r4, r4, r14
    //// bounds:  -0x000693e (-2^14.7176) <= r4  <= 0x693e693e (+2^30.7176)
sub.w r6, r6, r4
    //// bounds:  -0x693eab24 (-2^30.7176) <= r6  <= 0x0001ab24 (+2^16.7386)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x000ab24 (-2^15.4190) <= r4  <= 0x693fab24 (+2^30.7177)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #872]
str.w r11, [r1, #884]
str.w r10, [r1, #896]
str.w r9, [r1, #908]
str.w r8, [r1, #920]
str.w r7, [r1, #932]
str.w r6, [r1, #944]
str.w r4, [r1, #956]
ldr.w r12, [sp, #960]
ldr.w r11, [sp, #972]
ldr.w r10, [sp, #984]
ldr.w r9, [sp, #996]
ldr.w r8, [sp, #1008]
ldr.w r7, [sp, #1020]
ldr.w r6, [sp, #1032]
ldr.w r4, [sp, #1044]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
add.w r8, r12, r8, lsl #2
    //// bounds:  0x00000000 <= r8  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
add.w r7, r11, r7, lsl #2
    //// bounds:  0x00000000 <= r7  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
add.w r6, r10, r6, lsl #2
    //// bounds:  0x00000000 <= r6  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
add.w r4, r9, r4, lsl #2
    //// bounds:  0x00000000 <= r4  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
ldr.w r14, =4112
RED1 r10, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r10 <= 0x00010554 (+2^16.0297)
mul.w r10, r10, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r10 <= 0x10659540 (+2^28.0353)
add.w r12, r12, r10
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r12 <= 0x130fe7eb (+2^28.2526)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r10 <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r9  <= 0x00010554 (+2^16.0297)
mul.w r9, r9, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r9  <= 0x10659540 (+2^28.0353)
add.w r11, r11, r9
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r11 <= 0x130fe7eb (+2^28.2526)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r9  <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
ldr.w r14, =4080
RED1 r6, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r6  <= 0x000107fe (+2^16.0444)
mul.w r6, r6, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r6  <= 0x106f6020 (+2^28.0387)
add.w r8, r8, r6
    //// bounds:  -0x07f6020 (-2^22.9929) <= r8  <= 0x186e5821 (+2^28.6106)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r6  <= 0x087e5821 (+2^27.0864)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r4  <= 0x000107fe (+2^16.0444)
mul.w r4, r4, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r4  <= 0x106f6020 (+2^28.0387)
add.w r7, r7, r4
    //// bounds:  -0x07f6020 (-2^22.9929) <= r7  <= 0x186e5821 (+2^28.6106)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r4  <= 0x087e5821 (+2^27.0864)
/*** LAYER 6 ***/
ldr.w r14, =24885
RED1 r11, r3
    //// bounds:  -0x000130f (-2^12.2524) <= r11 <= 0x0001130f (+2^16.1036)
mul.w r11, r11, r14
    //// bounds:  -0x73ca11b (-2^26.8554) <= r11 <= 0x6871a11b (+2^30.7066)
add.w r12, r12, r11
    //// bounds:  -0xce6dbb1 (-2^27.6895) <= r12 <= 0x7b818906 (+2^30.9484)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e1bdbb1 (-2^30.7828) <= r11 <= 0x1a4c8906 (+2^28.7169)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13471
RED1 r9, r3
    //// bounds:  -0x00015ba (-2^12.4414) <= r9  <= 0x000115ba (+2^16.1175)
mul.w r9, r9, r14
    //// bounds:  -0x4774686 (-2^26.1590) <= r9  <= 0x39164686 (+2^29.8351)
add.w r10, r10, r9
    //// bounds:  -0x1a31811c (-2^28.7111) <= r10 <= 0x3c162e71 (+2^29.9090)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4ed0811c (-2^30.3004) <= r9  <= 0x07772e71 (+2^26.9002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4938
RED1 r7, r3
    //// bounds:  -0x000186e (-2^12.6106) <= r7  <= 0x0001186e (+2^16.1315)
mul.w r7, r7, r14
    //// bounds:  -0x1d739cc (-2^24.8803) <= r7  <= 0x152139cc (+2^28.4012)
sub.w r8, r8, r7
    //// bounds:  -0x15a099ec (-2^28.4348) <= r8  <= 0x1a4591ed (+2^28.7154)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x25699ec (-2^25.2255) <= r7  <= 0x2d8f91ed (+2^29.5097)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =18925
RED1 r4, r3
    //// bounds:  -0x000106f (-2^12.0386) <= r4  <= 0x0001106f (+2^16.0898)
mul.w r4, r4, r14
    //// bounds:  -0x4beddc3 (-2^26.2466) <= r4  <= 0x4eabddc3 (+2^30.2978)
sub.w r6, r6, r4
    //// bounds:  -0x5f1b3de3 (-2^30.5715) <= r6  <= 0x0d3d35e4 (+2^27.7267)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x152e3de3 (-2^28.4047) <= r4  <= 0x572a35e4 (+2^30.4457)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #960]
str.w r11, [r1, #972]
str.w r10, [r1, #984]
str.w r9, [r1, #996]
str.w r8, [r1, #1008]
str.w r7, [r1, #1020]
str.w r6, [r1, #1032]
str.w r4, [r1, #1044]
ldr.w r12, [sp, #964]
ldr.w r11, [sp, #976]
ldr.w r10, [sp, #988]
ldr.w r9, [sp, #1000]
ldr.w r8, [sp, #1012]
ldr.w r7, [sp, #1024]
ldr.w r6, [sp, #1036]
ldr.w r4, [sp, #1048]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
add.w r8, r12, r8, lsl #2
    //// bounds:  0x00000000 <= r8  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
add.w r7, r11, r7, lsl #2
    //// bounds:  0x00000000 <= r7  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
add.w r6, r10, r6, lsl #2
    //// bounds:  0x00000000 <= r6  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
add.w r4, r9, r4, lsl #2
    //// bounds:  0x00000000 <= r4  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
ldr.w r14, =4112
RED1 r10, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r10 <= 0x00010554 (+2^16.0297)
mul.w r10, r10, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r10 <= 0x10659540 (+2^28.0353)
add.w r12, r12, r10
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r12 <= 0x130fe7eb (+2^28.2526)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r10 <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r9  <= 0x00010554 (+2^16.0297)
mul.w r9, r9, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r9  <= 0x10659540 (+2^28.0353)
add.w r11, r11, r9
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r11 <= 0x130fe7eb (+2^28.2526)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r9  <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
ldr.w r14, =4080
RED1 r6, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r6  <= 0x000107fe (+2^16.0444)
mul.w r6, r6, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r6  <= 0x106f6020 (+2^28.0387)
add.w r8, r8, r6
    //// bounds:  -0x07f6020 (-2^22.9929) <= r8  <= 0x186e5821 (+2^28.6106)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r6  <= 0x087e5821 (+2^27.0864)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r4  <= 0x000107fe (+2^16.0444)
mul.w r4, r4, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r4  <= 0x106f6020 (+2^28.0387)
add.w r7, r7, r4
    //// bounds:  -0x07f6020 (-2^22.9929) <= r7  <= 0x186e5821 (+2^28.6106)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r4  <= 0x087e5821 (+2^27.0864)
/*** LAYER 6 ***/
ldr.w r14, =24885
RED1 r11, r3
    //// bounds:  -0x000130f (-2^12.2524) <= r11 <= 0x0001130f (+2^16.1036)
mul.w r11, r11, r14
    //// bounds:  -0x73ca11b (-2^26.8554) <= r11 <= 0x6871a11b (+2^30.7066)
add.w r12, r12, r11
    //// bounds:  -0xce6dbb1 (-2^27.6895) <= r12 <= 0x7b818906 (+2^30.9484)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e1bdbb1 (-2^30.7828) <= r11 <= 0x1a4c8906 (+2^28.7169)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13471
RED1 r9, r3
    //// bounds:  -0x00015ba (-2^12.4414) <= r9  <= 0x000115ba (+2^16.1175)
mul.w r9, r9, r14
    //// bounds:  -0x4774686 (-2^26.1590) <= r9  <= 0x39164686 (+2^29.8351)
add.w r10, r10, r9
    //// bounds:  -0x1a31811c (-2^28.7111) <= r10 <= 0x3c162e71 (+2^29.9090)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4ed0811c (-2^30.3004) <= r9  <= 0x07772e71 (+2^26.9002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4938
RED1 r7, r3
    //// bounds:  -0x000186e (-2^12.6106) <= r7  <= 0x0001186e (+2^16.1315)
mul.w r7, r7, r14
    //// bounds:  -0x1d739cc (-2^24.8803) <= r7  <= 0x152139cc (+2^28.4012)
sub.w r8, r8, r7
    //// bounds:  -0x15a099ec (-2^28.4348) <= r8  <= 0x1a4591ed (+2^28.7154)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x25699ec (-2^25.2255) <= r7  <= 0x2d8f91ed (+2^29.5097)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =18925
RED1 r4, r3
    //// bounds:  -0x000106f (-2^12.0386) <= r4  <= 0x0001106f (+2^16.0898)
mul.w r4, r4, r14
    //// bounds:  -0x4beddc3 (-2^26.2466) <= r4  <= 0x4eabddc3 (+2^30.2978)
sub.w r6, r6, r4
    //// bounds:  -0x5f1b3de3 (-2^30.5715) <= r6  <= 0x0d3d35e4 (+2^27.7267)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x152e3de3 (-2^28.4047) <= r4  <= 0x572a35e4 (+2^30.4457)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #964]
str.w r11, [r1, #976]
str.w r10, [r1, #988]
str.w r9, [r1, #1000]
str.w r8, [r1, #1012]
str.w r7, [r1, #1024]
str.w r6, [r1, #1036]
str.w r4, [r1, #1048]
ldr.w r12, [sp, #968]
ldr.w r11, [sp, #980]
ldr.w r10, [sp, #992]
ldr.w r9, [sp, #1004]
ldr.w r8, [sp, #1016]
ldr.w r7, [sp, #1028]
ldr.w r6, [sp, #1040]
ldr.w r4, [sp, #1052]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
add.w r8, r12, r8, lsl #2
    //// bounds:  0x00000000 <= r8  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
add.w r7, r11, r7, lsl #2
    //// bounds:  0x00000000 <= r7  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
add.w r6, r10, r6, lsl #2
    //// bounds:  0x00000000 <= r6  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
add.w r4, r9, r4, lsl #2
    //// bounds:  0x00000000 <= r4  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
ldr.w r14, =4112
RED1 r10, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r10 <= 0x00010554 (+2^16.0297)
mul.w r10, r10, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r10 <= 0x10659540 (+2^28.0353)
add.w r12, r12, r10
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r12 <= 0x130fe7eb (+2^28.2526)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r10 <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r9  <= 0x00010554 (+2^16.0297)
mul.w r9, r9, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r9  <= 0x10659540 (+2^28.0353)
add.w r11, r11, r9
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r11 <= 0x130fe7eb (+2^28.2526)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r9  <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
ldr.w r14, =4080
RED1 r6, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r6  <= 0x000107fe (+2^16.0444)
mul.w r6, r6, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r6  <= 0x106f6020 (+2^28.0387)
add.w r8, r8, r6
    //// bounds:  -0x07f6020 (-2^22.9929) <= r8  <= 0x186e5821 (+2^28.6106)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r6  <= 0x087e5821 (+2^27.0864)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r4  <= 0x000107fe (+2^16.0444)
mul.w r4, r4, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r4  <= 0x106f6020 (+2^28.0387)
add.w r7, r7, r4
    //// bounds:  -0x07f6020 (-2^22.9929) <= r7  <= 0x186e5821 (+2^28.6106)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r4  <= 0x087e5821 (+2^27.0864)
/*** LAYER 6 ***/
ldr.w r14, =24885
RED1 r11, r3
    //// bounds:  -0x000130f (-2^12.2524) <= r11 <= 0x0001130f (+2^16.1036)
mul.w r11, r11, r14
    //// bounds:  -0x73ca11b (-2^26.8554) <= r11 <= 0x6871a11b (+2^30.7066)
add.w r12, r12, r11
    //// bounds:  -0xce6dbb1 (-2^27.6895) <= r12 <= 0x7b818906 (+2^30.9484)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e1bdbb1 (-2^30.7828) <= r11 <= 0x1a4c8906 (+2^28.7169)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13471
RED1 r9, r3
    //// bounds:  -0x00015ba (-2^12.4414) <= r9  <= 0x000115ba (+2^16.1175)
mul.w r9, r9, r14
    //// bounds:  -0x4774686 (-2^26.1590) <= r9  <= 0x39164686 (+2^29.8351)
add.w r10, r10, r9
    //// bounds:  -0x1a31811c (-2^28.7111) <= r10 <= 0x3c162e71 (+2^29.9090)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4ed0811c (-2^30.3004) <= r9  <= 0x07772e71 (+2^26.9002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4938
RED1 r7, r3
    //// bounds:  -0x000186e (-2^12.6106) <= r7  <= 0x0001186e (+2^16.1315)
mul.w r7, r7, r14
    //// bounds:  -0x1d739cc (-2^24.8803) <= r7  <= 0x152139cc (+2^28.4012)
sub.w r8, r8, r7
    //// bounds:  -0x15a099ec (-2^28.4348) <= r8  <= 0x1a4591ed (+2^28.7154)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x25699ec (-2^25.2255) <= r7  <= 0x2d8f91ed (+2^29.5097)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =18925
RED1 r4, r3
    //// bounds:  -0x000106f (-2^12.0386) <= r4  <= 0x0001106f (+2^16.0898)
mul.w r4, r4, r14
    //// bounds:  -0x4beddc3 (-2^26.2466) <= r4  <= 0x4eabddc3 (+2^30.2978)
sub.w r6, r6, r4
    //// bounds:  -0x5f1b3de3 (-2^30.5715) <= r6  <= 0x0d3d35e4 (+2^27.7267)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x152e3de3 (-2^28.4047) <= r4  <= 0x572a35e4 (+2^30.4457)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #968]
str.w r11, [r1, #980]
str.w r10, [r1, #992]
str.w r9, [r1, #1004]
str.w r8, [r1, #1016]
str.w r7, [r1, #1028]
str.w r6, [r1, #1040]
str.w r4, [r1, #1052]
ldr.w r12, [sp, #1056]
ldr.w r11, [sp, #1068]
ldr.w r10, [sp, #1080]
ldr.w r9, [sp, #1092]
ldr.w r8, [sp, #1104]
ldr.w r7, [sp, #1116]
ldr.w r6, [sp, #1128]
ldr.w r4, [sp, #1140]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r8  <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r8, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r12 <= 0x008cb8ef (+2^23.1367)
add.w r8, r12, r8, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r8  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r7  <= 0x00010221 (+2^16.0119)
sub.w r11, r11, r7, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r11 <= 0x008cb8ef (+2^23.1367)
add.w r7, r11, r7, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r7  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r6  <= 0x00010221 (+2^16.0119)
sub.w r10, r10, r6, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r10 <= 0x008cb8ef (+2^23.1367)
add.w r6, r10, r6, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r6  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r4  <= 0x00010221 (+2^16.0119)
sub.w r9, r9, r4, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r9  <= 0x008cb8ef (+2^23.1367)
add.w r4, r9, r4, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r4  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 5 ***/
ldr.w r14, =-255
RED1 r10, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r10 <= 0x00010426 (+2^16.0232)
mul.w r10, r10, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r10 <= 0x000421da (+2^18.0469)
add.w r12, r12, r10
    //// bounds:  -0x5293f96 (-2^26.3677) <= r12 <= 0x0090dac9 (+2^23.1785)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r10 <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r9  <= 0x00010426 (+2^16.0232)
mul.w r9, r9, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r9  <= 0x000421da (+2^18.0469)
add.w r11, r11, r9
    //// bounds:  -0x5293f96 (-2^26.3677) <= r11 <= 0x0090dac9 (+2^23.1785)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r9  <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
ldr.w r14, =257
RED1 r6, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r6  <= 0x0001028c (+2^16.0143)
mul.w r6, r6, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r6  <= 0x01038e8c (+2^24.0199)
add.w r8, r8, r6
    //// bounds:  -0x228ac48 (-2^25.1103) <= r8  <= 0x0390477b (+2^25.8333)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r6  <= 0x028f477b (+2^25.3560)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r4  <= 0x0001028c (+2^16.0143)
mul.w r4, r4, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r4  <= 0x01038e8c (+2^24.0199)
add.w r7, r7, r4
    //// bounds:  -0x228ac48 (-2^25.1103) <= r7  <= 0x0390477b (+2^25.8333)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r4  <= 0x028f477b (+2^25.3560)
/*** LAYER 6 ***/
ldr.w r14, =11653
RED1 r11, r3
    //// bounds:  -0x0000529 (-2^10.3674) <= r11 <= 0x00010529 (+2^16.0288)
mul.w r11, r11, r14
    //// bounds:  -0x0eae34d (-2^23.8758) <= r11 <= 0x2e6fe34d (+2^29.5372)
add.w r12, r12, r11
    //// bounds:  -0x61422e3 (-2^26.6038) <= r12 <= 0x2f00be16 (+2^29.5547)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x339922e3 (-2^29.6892) <= r11 <= 0x017bbe16 (+2^24.5689)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =31534
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x200ed8c (-2^25.0026) <= r9  <= 0x7d2eed8c (+2^30.9679)
RED1 r9, r3
    //// bounds:  -0x0007d2e (-2^14.9679) <= r9  <= 0x00017d2e (+2^16.5743)
sub.w r10, r10, r9
    //// bounds:  -0x42bbcc4 (-2^26.0603) <= r10 <= 0x019057f7 (+2^24.6451)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x42abcc4 (-2^26.0590) <= r9  <= 0x019157f7 (+2^24.6487)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =10163
RED1 r7, r3
    //// bounds:  -0x0000390 (-2^ 9.8329) <= r7  <= 0x00010390 (+2^16.0199)
mul.w r7, r7, r14
    //// bounds:  -0x08d6db0 (-2^23.1439) <= r7  <= 0x28406db0 (+2^29.3310)
add.w r8, r8, r7
    //// bounds:  -0x2b619f8 (-2^25.4390) <= r8  <= 0x2bd0b52b (+2^29.4534)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2a6919f8 (-2^29.4064) <= r7  <= 0x041db52b (+2^26.0413)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19752
RED1 r4, r3
    //// bounds:  -0x0000329 (-2^ 9.6600) <= r4  <= 0x00010329 (+2^16.0177)
mul.w r4, r4, r14
    //// bounds:  -0x0f3d368 (-2^23.9297) <= r4  <= 0x4e1bd368 (+2^30.2874)
sub.w r6, r6, r4
    //// bounds:  -0x51457fb0 (-2^30.3447) <= r6  <= 0x03831ae3 (+2^25.8123)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x41d7fb0 (-2^26.0410) <= r4  <= 0x50ab1ae3 (+2^30.3339)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1056]
str.w r11, [r1, #1068]
str.w r10, [r1, #1080]
str.w r9, [r1, #1092]
str.w r8, [r1, #1104]
str.w r7, [r1, #1116]
str.w r6, [r1, #1128]
str.w r4, [r1, #1140]
ldr.w r12, [sp, #1060]
ldr.w r11, [sp, #1072]
ldr.w r10, [sp, #1084]
ldr.w r9, [sp, #1096]
ldr.w r8, [sp, #1108]
ldr.w r7, [sp, #1120]
ldr.w r6, [sp, #1132]
ldr.w r4, [sp, #1144]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r8  <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r8, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r12 <= 0x008cb8ef (+2^23.1367)
add.w r8, r12, r8, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r8  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r7  <= 0x00010221 (+2^16.0119)
sub.w r11, r11, r7, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r11 <= 0x008cb8ef (+2^23.1367)
add.w r7, r11, r7, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r7  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r6  <= 0x00010221 (+2^16.0119)
sub.w r10, r10, r6, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r10 <= 0x008cb8ef (+2^23.1367)
add.w r6, r10, r6, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r6  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r4  <= 0x00010221 (+2^16.0119)
sub.w r9, r9, r4, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r9  <= 0x008cb8ef (+2^23.1367)
add.w r4, r9, r4, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r4  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 5 ***/
ldr.w r14, =-255
RED1 r10, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r10 <= 0x00010426 (+2^16.0232)
mul.w r10, r10, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r10 <= 0x000421da (+2^18.0469)
add.w r12, r12, r10
    //// bounds:  -0x5293f96 (-2^26.3677) <= r12 <= 0x0090dac9 (+2^23.1785)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r10 <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r9  <= 0x00010426 (+2^16.0232)
mul.w r9, r9, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r9  <= 0x000421da (+2^18.0469)
add.w r11, r11, r9
    //// bounds:  -0x5293f96 (-2^26.3677) <= r11 <= 0x0090dac9 (+2^23.1785)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r9  <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
ldr.w r14, =257
RED1 r6, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r6  <= 0x0001028c (+2^16.0143)
mul.w r6, r6, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r6  <= 0x01038e8c (+2^24.0199)
add.w r8, r8, r6
    //// bounds:  -0x228ac48 (-2^25.1103) <= r8  <= 0x0390477b (+2^25.8333)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r6  <= 0x028f477b (+2^25.3560)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r4  <= 0x0001028c (+2^16.0143)
mul.w r4, r4, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r4  <= 0x01038e8c (+2^24.0199)
add.w r7, r7, r4
    //// bounds:  -0x228ac48 (-2^25.1103) <= r7  <= 0x0390477b (+2^25.8333)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r4  <= 0x028f477b (+2^25.3560)
/*** LAYER 6 ***/
ldr.w r14, =11653
RED1 r11, r3
    //// bounds:  -0x0000529 (-2^10.3674) <= r11 <= 0x00010529 (+2^16.0288)
mul.w r11, r11, r14
    //// bounds:  -0x0eae34d (-2^23.8758) <= r11 <= 0x2e6fe34d (+2^29.5372)
add.w r12, r12, r11
    //// bounds:  -0x61422e3 (-2^26.6038) <= r12 <= 0x2f00be16 (+2^29.5547)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x339922e3 (-2^29.6892) <= r11 <= 0x017bbe16 (+2^24.5689)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =31534
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x200ed8c (-2^25.0026) <= r9  <= 0x7d2eed8c (+2^30.9679)
RED1 r9, r3
    //// bounds:  -0x0007d2e (-2^14.9679) <= r9  <= 0x00017d2e (+2^16.5743)
sub.w r10, r10, r9
    //// bounds:  -0x42bbcc4 (-2^26.0603) <= r10 <= 0x019057f7 (+2^24.6451)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x42abcc4 (-2^26.0590) <= r9  <= 0x019157f7 (+2^24.6487)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =10163
RED1 r7, r3
    //// bounds:  -0x0000390 (-2^ 9.8329) <= r7  <= 0x00010390 (+2^16.0199)
mul.w r7, r7, r14
    //// bounds:  -0x08d6db0 (-2^23.1439) <= r7  <= 0x28406db0 (+2^29.3310)
add.w r8, r8, r7
    //// bounds:  -0x2b619f8 (-2^25.4390) <= r8  <= 0x2bd0b52b (+2^29.4534)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2a6919f8 (-2^29.4064) <= r7  <= 0x041db52b (+2^26.0413)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19752
RED1 r4, r3
    //// bounds:  -0x0000329 (-2^ 9.6600) <= r4  <= 0x00010329 (+2^16.0177)
mul.w r4, r4, r14
    //// bounds:  -0x0f3d368 (-2^23.9297) <= r4  <= 0x4e1bd368 (+2^30.2874)
sub.w r6, r6, r4
    //// bounds:  -0x51457fb0 (-2^30.3447) <= r6  <= 0x03831ae3 (+2^25.8123)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x41d7fb0 (-2^26.0410) <= r4  <= 0x50ab1ae3 (+2^30.3339)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1060]
str.w r11, [r1, #1072]
str.w r10, [r1, #1084]
str.w r9, [r1, #1096]
str.w r8, [r1, #1108]
str.w r7, [r1, #1120]
str.w r6, [r1, #1132]
str.w r4, [r1, #1144]
ldr.w r12, [sp, #1064]
ldr.w r11, [sp, #1076]
ldr.w r10, [sp, #1088]
ldr.w r9, [sp, #1100]
ldr.w r8, [sp, #1112]
ldr.w r7, [sp, #1124]
ldr.w r6, [sp, #1136]
ldr.w r4, [sp, #1148]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r8  <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r8, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r12 <= 0x008cb8ef (+2^23.1367)
add.w r8, r12, r8, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r8  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r7  <= 0x00010221 (+2^16.0119)
sub.w r11, r11, r7, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r11 <= 0x008cb8ef (+2^23.1367)
add.w r7, r11, r7, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r7  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r6  <= 0x00010221 (+2^16.0119)
sub.w r10, r10, r6, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r10 <= 0x008cb8ef (+2^23.1367)
add.w r6, r10, r6, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r6  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r4  <= 0x00010221 (+2^16.0119)
sub.w r9, r9, r4, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r9  <= 0x008cb8ef (+2^23.1367)
add.w r4, r9, r4, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r4  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 5 ***/
ldr.w r14, =-255
RED1 r10, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r10 <= 0x00010426 (+2^16.0232)
mul.w r10, r10, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r10 <= 0x000421da (+2^18.0469)
add.w r12, r12, r10
    //// bounds:  -0x5293f96 (-2^26.3677) <= r12 <= 0x0090dac9 (+2^23.1785)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r10 <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r9  <= 0x00010426 (+2^16.0232)
mul.w r9, r9, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r9  <= 0x000421da (+2^18.0469)
add.w r11, r11, r9
    //// bounds:  -0x5293f96 (-2^26.3677) <= r11 <= 0x0090dac9 (+2^23.1785)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r9  <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
ldr.w r14, =257
RED1 r6, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r6  <= 0x0001028c (+2^16.0143)
mul.w r6, r6, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r6  <= 0x01038e8c (+2^24.0199)
add.w r8, r8, r6
    //// bounds:  -0x228ac48 (-2^25.1103) <= r8  <= 0x0390477b (+2^25.8333)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r6  <= 0x028f477b (+2^25.3560)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r4  <= 0x0001028c (+2^16.0143)
mul.w r4, r4, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r4  <= 0x01038e8c (+2^24.0199)
add.w r7, r7, r4
    //// bounds:  -0x228ac48 (-2^25.1103) <= r7  <= 0x0390477b (+2^25.8333)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r4  <= 0x028f477b (+2^25.3560)
/*** LAYER 6 ***/
ldr.w r14, =11653
RED1 r11, r3
    //// bounds:  -0x0000529 (-2^10.3674) <= r11 <= 0x00010529 (+2^16.0288)
mul.w r11, r11, r14
    //// bounds:  -0x0eae34d (-2^23.8758) <= r11 <= 0x2e6fe34d (+2^29.5372)
add.w r12, r12, r11
    //// bounds:  -0x61422e3 (-2^26.6038) <= r12 <= 0x2f00be16 (+2^29.5547)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x339922e3 (-2^29.6892) <= r11 <= 0x017bbe16 (+2^24.5689)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =31534
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x200ed8c (-2^25.0026) <= r9  <= 0x7d2eed8c (+2^30.9679)
RED1 r9, r3
    //// bounds:  -0x0007d2e (-2^14.9679) <= r9  <= 0x00017d2e (+2^16.5743)
sub.w r10, r10, r9
    //// bounds:  -0x42bbcc4 (-2^26.0603) <= r10 <= 0x019057f7 (+2^24.6451)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x42abcc4 (-2^26.0590) <= r9  <= 0x019157f7 (+2^24.6487)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =10163
RED1 r7, r3
    //// bounds:  -0x0000390 (-2^ 9.8329) <= r7  <= 0x00010390 (+2^16.0199)
mul.w r7, r7, r14
    //// bounds:  -0x08d6db0 (-2^23.1439) <= r7  <= 0x28406db0 (+2^29.3310)
add.w r8, r8, r7
    //// bounds:  -0x2b619f8 (-2^25.4390) <= r8  <= 0x2bd0b52b (+2^29.4534)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2a6919f8 (-2^29.4064) <= r7  <= 0x041db52b (+2^26.0413)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19752
RED1 r4, r3
    //// bounds:  -0x0000329 (-2^ 9.6600) <= r4  <= 0x00010329 (+2^16.0177)
mul.w r4, r4, r14
    //// bounds:  -0x0f3d368 (-2^23.9297) <= r4  <= 0x4e1bd368 (+2^30.2874)
sub.w r6, r6, r4
    //// bounds:  -0x51457fb0 (-2^30.3447) <= r6  <= 0x03831ae3 (+2^25.8123)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x41d7fb0 (-2^26.0410) <= r4  <= 0x50ab1ae3 (+2^30.3339)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1064]
str.w r11, [r1, #1076]
str.w r10, [r1, #1088]
str.w r9, [r1, #1100]
str.w r8, [r1, #1112]
str.w r7, [r1, #1124]
str.w r6, [r1, #1136]
str.w r4, [r1, #1148]
ldr.w r12, [sp, #1152]
ldr.w r11, [sp, #1164]
ldr.w r10, [sp, #1176]
ldr.w r9, [sp, #1188]
ldr.w r8, [sp, #1200]
ldr.w r7, [sp, #1212]
ldr.w r6, [sp, #1224]
ldr.w r4, [sp, #1236]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r12 <= 0x00315e7d (+2^21.6255)
add.w r8, r12, r8, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r8  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r11 <= 0x00315e7d (+2^21.6255)
add.w r7, r11, r7, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r7  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r10 <= 0x00315e7d (+2^21.6255)
add.w r6, r10, r6, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r6  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r9  <= 0x00315e7d (+2^21.6255)
add.w r4, r9, r4, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r4  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 5 ***/
ldr.w r14, =32641
RED1 r10, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r10 <= 0x000100b0 (+2^16.0039)
mul.w r10, r10, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r10 <= 0x7fd8a8b0 (+2^30.9983)
RED1 r10, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r10 <= 0x00017fd8 (+2^16.5844)
sub.w r12, r12, r10
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r12 <= 0x0031de55 (+2^21.6401)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r10 <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r9  <= 0x7fd8a8b0 (+2^30.9983)
RED1 r9, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r9  <= 0x00017fd8 (+2^16.5844)
sub.w r11, r11, r9
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r11 <= 0x0031de55 (+2^21.6401)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r9  <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
ldr.w r14, =32640
RED1 r6, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r6  <= 0x000100b1 (+2^16.0039)
mul.w r6, r6, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r6  <= 0x7fd82780 (+2^30.9982)
RED1 r6, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r6  <= 0x00017fd8 (+2^16.5844)
add.w r8, r8, r6
    //// bounds:  -0x030de55 (-2^21.6108) <= r8  <= 0x00b2de55 (+2^23.4828)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r6  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r4  <= 0x7fd82780 (+2^30.9982)
RED1 r4, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r4  <= 0x00017fd8 (+2^16.5844)
add.w r7, r7, r4
    //// bounds:  -0x030de55 (-2^21.6108) <= r7  <= 0x00b2de55 (+2^23.4828)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r4  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 6 ***/
ldr.w r14, =27974
RED1 r11, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r11 <= 0x000100b1 (+2^16.0039)
mul.w r11, r11, r14
    //// bounds:  -0x04b8d66 (-2^22.2394) <= r11 <= 0x6d918d66 (+2^30.7757)
add.w r12, r12, r11
    //// bounds:  -0x0fd6bbb (-2^23.9854) <= r12 <= 0x6dc36bbb (+2^30.7783)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e436bbb (-2^30.7848) <= r11 <= 0x007d6bbb (+2^22.9706)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =17811
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x02fd510 (-2^21.5799) <= r9  <= 0x45c2d510 (+2^30.1244)
add.w r10, r10, r9
    //// bounds:  -0x0e0b365 (-2^23.8119) <= r10 <= 0x45f5b365 (+2^30.1285)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4673b365 (-2^30.1386) <= r9  <= 0x0062b365 (+2^22.6250)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11175
RED1 r7, r3
    //// bounds:  -0x00000b2 (-2^ 7.4757) <= r7  <= 0x000100b2 (+2^16.0039)
mul.w r7, r7, r14
    //// bounds:  -0x01e5a1e (-2^20.9237) <= r7  <= 0x2bc55a1e (+2^29.4519)
add.w r8, r8, r7
    //// bounds:  -0x04f3873 (-2^22.3078) <= r8  <= 0x2c783873 (+2^29.4747)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2bf63873 (-2^29.4582) <= r7  <= 0x00d13873 (+2^23.7089)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22828
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x03da76c (-2^21.9461) <= r4  <= 0x5969a76c (+2^30.4824)
sub.w r6, r6, r4
    //// bounds:  -0x599b85c1 (-2^30.4855) <= r6  <= 0x00ef85c1 (+2^23.9040)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x06f85c1 (-2^22.8012) <= r4  <= 0x5a1b85c1 (+2^30.4936)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1152]
str.w r11, [r1, #1164]
str.w r10, [r1, #1176]
str.w r9, [r1, #1188]
str.w r8, [r1, #1200]
str.w r7, [r1, #1212]
str.w r6, [r1, #1224]
str.w r4, [r1, #1236]
ldr.w r12, [sp, #1156]
ldr.w r11, [sp, #1168]
ldr.w r10, [sp, #1180]
ldr.w r9, [sp, #1192]
ldr.w r8, [sp, #1204]
ldr.w r7, [sp, #1216]
ldr.w r6, [sp, #1228]
ldr.w r4, [sp, #1240]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r12 <= 0x00315e7d (+2^21.6255)
add.w r8, r12, r8, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r8  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r11 <= 0x00315e7d (+2^21.6255)
add.w r7, r11, r7, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r7  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r10 <= 0x00315e7d (+2^21.6255)
add.w r6, r10, r6, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r6  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r9  <= 0x00315e7d (+2^21.6255)
add.w r4, r9, r4, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r4  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 5 ***/
ldr.w r14, =32641
RED1 r10, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r10 <= 0x000100b0 (+2^16.0039)
mul.w r10, r10, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r10 <= 0x7fd8a8b0 (+2^30.9983)
RED1 r10, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r10 <= 0x00017fd8 (+2^16.5844)
sub.w r12, r12, r10
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r12 <= 0x0031de55 (+2^21.6401)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r10 <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r9  <= 0x7fd8a8b0 (+2^30.9983)
RED1 r9, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r9  <= 0x00017fd8 (+2^16.5844)
sub.w r11, r11, r9
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r11 <= 0x0031de55 (+2^21.6401)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r9  <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
ldr.w r14, =32640
RED1 r6, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r6  <= 0x000100b1 (+2^16.0039)
mul.w r6, r6, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r6  <= 0x7fd82780 (+2^30.9982)
RED1 r6, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r6  <= 0x00017fd8 (+2^16.5844)
add.w r8, r8, r6
    //// bounds:  -0x030de55 (-2^21.6108) <= r8  <= 0x00b2de55 (+2^23.4828)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r6  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r4  <= 0x7fd82780 (+2^30.9982)
RED1 r4, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r4  <= 0x00017fd8 (+2^16.5844)
add.w r7, r7, r4
    //// bounds:  -0x030de55 (-2^21.6108) <= r7  <= 0x00b2de55 (+2^23.4828)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r4  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 6 ***/
ldr.w r14, =27974
RED1 r11, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r11 <= 0x000100b1 (+2^16.0039)
mul.w r11, r11, r14
    //// bounds:  -0x04b8d66 (-2^22.2394) <= r11 <= 0x6d918d66 (+2^30.7757)
add.w r12, r12, r11
    //// bounds:  -0x0fd6bbb (-2^23.9854) <= r12 <= 0x6dc36bbb (+2^30.7783)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e436bbb (-2^30.7848) <= r11 <= 0x007d6bbb (+2^22.9706)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =17811
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x02fd510 (-2^21.5799) <= r9  <= 0x45c2d510 (+2^30.1244)
add.w r10, r10, r9
    //// bounds:  -0x0e0b365 (-2^23.8119) <= r10 <= 0x45f5b365 (+2^30.1285)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4673b365 (-2^30.1386) <= r9  <= 0x0062b365 (+2^22.6250)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11175
RED1 r7, r3
    //// bounds:  -0x00000b2 (-2^ 7.4757) <= r7  <= 0x000100b2 (+2^16.0039)
mul.w r7, r7, r14
    //// bounds:  -0x01e5a1e (-2^20.9237) <= r7  <= 0x2bc55a1e (+2^29.4519)
add.w r8, r8, r7
    //// bounds:  -0x04f3873 (-2^22.3078) <= r8  <= 0x2c783873 (+2^29.4747)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2bf63873 (-2^29.4582) <= r7  <= 0x00d13873 (+2^23.7089)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22828
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x03da76c (-2^21.9461) <= r4  <= 0x5969a76c (+2^30.4824)
sub.w r6, r6, r4
    //// bounds:  -0x599b85c1 (-2^30.4855) <= r6  <= 0x00ef85c1 (+2^23.9040)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x06f85c1 (-2^22.8012) <= r4  <= 0x5a1b85c1 (+2^30.4936)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1156]
str.w r11, [r1, #1168]
str.w r10, [r1, #1180]
str.w r9, [r1, #1192]
str.w r8, [r1, #1204]
str.w r7, [r1, #1216]
str.w r6, [r1, #1228]
str.w r4, [r1, #1240]
ldr.w r12, [sp, #1160]
ldr.w r11, [sp, #1172]
ldr.w r10, [sp, #1184]
ldr.w r9, [sp, #1196]
ldr.w r8, [sp, #1208]
ldr.w r7, [sp, #1220]
ldr.w r6, [sp, #1232]
ldr.w r4, [sp, #1244]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r12 <= 0x00315e7d (+2^21.6255)
add.w r8, r12, r8, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r8  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r11 <= 0x00315e7d (+2^21.6255)
add.w r7, r11, r7, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r7  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r10 <= 0x00315e7d (+2^21.6255)
add.w r6, r10, r6, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r6  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r9  <= 0x00315e7d (+2^21.6255)
add.w r4, r9, r4, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r4  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 5 ***/
ldr.w r14, =32641
RED1 r10, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r10 <= 0x000100b0 (+2^16.0039)
mul.w r10, r10, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r10 <= 0x7fd8a8b0 (+2^30.9983)
RED1 r10, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r10 <= 0x00017fd8 (+2^16.5844)
sub.w r12, r12, r10
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r12 <= 0x0031de55 (+2^21.6401)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r10 <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r9  <= 0x7fd8a8b0 (+2^30.9983)
RED1 r9, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r9  <= 0x00017fd8 (+2^16.5844)
sub.w r11, r11, r9
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r11 <= 0x0031de55 (+2^21.6401)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r9  <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
ldr.w r14, =32640
RED1 r6, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r6  <= 0x000100b1 (+2^16.0039)
mul.w r6, r6, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r6  <= 0x7fd82780 (+2^30.9982)
RED1 r6, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r6  <= 0x00017fd8 (+2^16.5844)
add.w r8, r8, r6
    //// bounds:  -0x030de55 (-2^21.6108) <= r8  <= 0x00b2de55 (+2^23.4828)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r6  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r4  <= 0x7fd82780 (+2^30.9982)
RED1 r4, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r4  <= 0x00017fd8 (+2^16.5844)
add.w r7, r7, r4
    //// bounds:  -0x030de55 (-2^21.6108) <= r7  <= 0x00b2de55 (+2^23.4828)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r4  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 6 ***/
ldr.w r14, =27974
RED1 r11, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r11 <= 0x000100b1 (+2^16.0039)
mul.w r11, r11, r14
    //// bounds:  -0x04b8d66 (-2^22.2394) <= r11 <= 0x6d918d66 (+2^30.7757)
add.w r12, r12, r11
    //// bounds:  -0x0fd6bbb (-2^23.9854) <= r12 <= 0x6dc36bbb (+2^30.7783)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e436bbb (-2^30.7848) <= r11 <= 0x007d6bbb (+2^22.9706)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =17811
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x02fd510 (-2^21.5799) <= r9  <= 0x45c2d510 (+2^30.1244)
add.w r10, r10, r9
    //// bounds:  -0x0e0b365 (-2^23.8119) <= r10 <= 0x45f5b365 (+2^30.1285)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4673b365 (-2^30.1386) <= r9  <= 0x0062b365 (+2^22.6250)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11175
RED1 r7, r3
    //// bounds:  -0x00000b2 (-2^ 7.4757) <= r7  <= 0x000100b2 (+2^16.0039)
mul.w r7, r7, r14
    //// bounds:  -0x01e5a1e (-2^20.9237) <= r7  <= 0x2bc55a1e (+2^29.4519)
add.w r8, r8, r7
    //// bounds:  -0x04f3873 (-2^22.3078) <= r8  <= 0x2c783873 (+2^29.4747)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2bf63873 (-2^29.4582) <= r7  <= 0x00d13873 (+2^23.7089)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22828
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x03da76c (-2^21.9461) <= r4  <= 0x5969a76c (+2^30.4824)
sub.w r6, r6, r4
    //// bounds:  -0x599b85c1 (-2^30.4855) <= r6  <= 0x00ef85c1 (+2^23.9040)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x06f85c1 (-2^22.8012) <= r4  <= 0x5a1b85c1 (+2^30.4936)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1160]
str.w r11, [r1, #1172]
str.w r10, [r1, #1184]
str.w r9, [r1, #1196]
str.w r8, [r1, #1208]
str.w r7, [r1, #1220]
str.w r6, [r1, #1232]
str.w r4, [r1, #1244]
ldr.w r12, [sp, #1248]
ldr.w r11, [sp, #1260]
ldr.w r10, [sp, #1272]
ldr.w r9, [sp, #1284]
ldr.w r8, [sp, #1296]
ldr.w r7, [sp, #1308]
ldr.w r6, [sp, #1320]
ldr.w r4, [sp, #1332]
/*** LAYER 4 ***/
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
sub.w r12, r12, r8, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r12 <= 0x40015ffc (+2^30.0001)
sub.w r8, r12, r8
    //// bounds:  -0x4000dffc (-2^30.0001) <= r8  <= 0x4001dffc (+2^30.0002)
RED1 r12, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r12 <= 0x00014001 (+2^16.3219)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
sub.w r11, r11, r7, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r11 <= 0x40015ffc (+2^30.0001)
sub.w r7, r11, r7
    //// bounds:  -0x4000dffc (-2^30.0001) <= r7  <= 0x4001dffc (+2^30.0002)
RED1 r11, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r11 <= 0x00014001 (+2^16.3219)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r6, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r10 <= 0x40015ffc (+2^30.0001)
sub.w r6, r10, r6
    //// bounds:  -0x4000dffc (-2^30.0001) <= r6  <= 0x4001dffc (+2^30.0002)
RED1 r10, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r10 <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r9, r9, r4, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r9  <= 0x40015ffc (+2^30.0001)
sub.w r4, r9, r4
    //// bounds:  -0x4000dffc (-2^30.0001) <= r4  <= 0x4001dffc (+2^30.0002)
RED1 r9, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r9  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
ldr.w r14, =2040
mul.w r10, r10, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r10 <= 0x09f607f8 (+2^27.3163)
sub.w r12, r12, r10
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r12 <= 0x01ff47f9 (+2^24.9980)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r10 <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
mul.w r9, r9, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r9  <= 0x09f607f8 (+2^27.3163)
sub.w r11, r11, r9
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r11 <= 0x01ff47f9 (+2^24.9980)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r9  <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
ldr.w r14, =2056
mul.w r6, r6, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r6  <= 0x0a0a0808 (+2^27.3276)
add.w r8, r8, r6
    //// bounds:  -0x2024809 (-2^25.0064) <= r8  <= 0x0a0b4809 (+2^27.3283)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r6  <= 0x02034809 (+2^25.0092)
/*** LAYER 5 ***/
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r7, r7, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r7  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
/*** LAYER 6 ***/
ldr.w r14, =5707
RED1 r11, r3
    //// bounds:  -0x00009f6 (-2^11.3163) <= r11 <= 0x000109f6 (+2^16.0551)
mul.w r11, r11, r14
    //// bounds:  -0x0de0f12 (-2^23.7948) <= r11 <= 0x17290f12 (+2^28.5336)
sub.w r12, r12, r11
    //// bounds:  -0x211f570b (-2^29.0497) <= r12 <= 0x02dd570b (+2^25.5183)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0xad4570b (-2^27.4369) <= r11 <= 0x1928570b (+2^28.6529)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19178
RED1 r9, r3
    //// bounds:  -0x00009f7 (-2^11.3168) <= r9  <= 0x000109f7 (+2^16.0551)
mul.w r9, r9, r14
    //// bounds:  -0x2ea81c6 (-2^25.5440) <= r9  <= 0x4dd481c6 (+2^30.2823)
sub.w r10, r10, r9
    //// bounds:  -0x4fd2c9bf (-2^30.3187) <= r10 <= 0x0ce1c9bf (+2^27.6873)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x4e8c9bf (-2^26.2955) <= r9  <= 0x57cbc9bf (+2^30.4561)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =25775
RED1 r7, r3
    //// bounds:  -0x0000a0b (-2^11.3281) <= r7  <= 0x00010a0b (+2^16.0555)
mul.w r7, r7, r14
    //// bounds:  -0x3f32985 (-2^25.9818) <= r7  <= 0x68a22985 (+2^30.7092)
add.w r8, r8, r7
    //// bounds:  -0x5f5718e (-2^26.5750) <= r8  <= 0x72ad718e (+2^30.8414)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x6aa4718e (-2^30.7366) <= r7  <= 0x0dfe718e (+2^27.8067)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20837
RED1 r4, r3
    //// bounds:  -0x0000a0a (-2^11.3276) <= r4  <= 0x00010a0a (+2^16.0555)
mul.w r4, r4, r14
    //// bounds:  -0x3311ff2 (-2^25.6744) <= r4  <= 0x54961ff2 (+2^30.4024)
sub.w r6, r6, r4
    //// bounds:  -0x5ea067fb (-2^30.5642) <= r6  <= 0x053467fb (+2^26.3798)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0xd3b67fb (-2^27.7260) <= r4  <= 0x569967fb (+2^30.4363)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1248]
str.w r11, [r1, #1260]
str.w r10, [r1, #1272]
str.w r9, [r1, #1284]
str.w r8, [r1, #1296]
str.w r7, [r1, #1308]
str.w r6, [r1, #1320]
str.w r4, [r1, #1332]
ldr.w r12, [sp, #1252]
ldr.w r11, [sp, #1264]
ldr.w r10, [sp, #1276]
ldr.w r9, [sp, #1288]
ldr.w r8, [sp, #1300]
ldr.w r7, [sp, #1312]
ldr.w r6, [sp, #1324]
ldr.w r4, [sp, #1336]
/*** LAYER 4 ***/
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
sub.w r12, r12, r8, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r12 <= 0x40015ffc (+2^30.0001)
sub.w r8, r12, r8
    //// bounds:  -0x4000dffc (-2^30.0001) <= r8  <= 0x4001dffc (+2^30.0002)
RED1 r12, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r12 <= 0x00014001 (+2^16.3219)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
sub.w r11, r11, r7, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r11 <= 0x40015ffc (+2^30.0001)
sub.w r7, r11, r7
    //// bounds:  -0x4000dffc (-2^30.0001) <= r7  <= 0x4001dffc (+2^30.0002)
RED1 r11, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r11 <= 0x00014001 (+2^16.3219)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r6, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r10 <= 0x40015ffc (+2^30.0001)
sub.w r6, r10, r6
    //// bounds:  -0x4000dffc (-2^30.0001) <= r6  <= 0x4001dffc (+2^30.0002)
RED1 r10, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r10 <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r9, r9, r4, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r9  <= 0x40015ffc (+2^30.0001)
sub.w r4, r9, r4
    //// bounds:  -0x4000dffc (-2^30.0001) <= r4  <= 0x4001dffc (+2^30.0002)
RED1 r9, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r9  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
ldr.w r14, =2040
mul.w r10, r10, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r10 <= 0x09f607f8 (+2^27.3163)
sub.w r12, r12, r10
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r12 <= 0x01ff47f9 (+2^24.9980)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r10 <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
mul.w r9, r9, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r9  <= 0x09f607f8 (+2^27.3163)
sub.w r11, r11, r9
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r11 <= 0x01ff47f9 (+2^24.9980)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r9  <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
ldr.w r14, =2056
mul.w r6, r6, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r6  <= 0x0a0a0808 (+2^27.3276)
add.w r8, r8, r6
    //// bounds:  -0x2024809 (-2^25.0064) <= r8  <= 0x0a0b4809 (+2^27.3283)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r6  <= 0x02034809 (+2^25.0092)
/*** LAYER 5 ***/
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r7, r7, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r7  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
/*** LAYER 6 ***/
ldr.w r14, =5707
RED1 r11, r3
    //// bounds:  -0x00009f6 (-2^11.3163) <= r11 <= 0x000109f6 (+2^16.0551)
mul.w r11, r11, r14
    //// bounds:  -0x0de0f12 (-2^23.7948) <= r11 <= 0x17290f12 (+2^28.5336)
sub.w r12, r12, r11
    //// bounds:  -0x211f570b (-2^29.0497) <= r12 <= 0x02dd570b (+2^25.5183)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0xad4570b (-2^27.4369) <= r11 <= 0x1928570b (+2^28.6529)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19178
RED1 r9, r3
    //// bounds:  -0x00009f7 (-2^11.3168) <= r9  <= 0x000109f7 (+2^16.0551)
mul.w r9, r9, r14
    //// bounds:  -0x2ea81c6 (-2^25.5440) <= r9  <= 0x4dd481c6 (+2^30.2823)
sub.w r10, r10, r9
    //// bounds:  -0x4fd2c9bf (-2^30.3187) <= r10 <= 0x0ce1c9bf (+2^27.6873)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x4e8c9bf (-2^26.2955) <= r9  <= 0x57cbc9bf (+2^30.4561)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =25775
RED1 r7, r3
    //// bounds:  -0x0000a0b (-2^11.3281) <= r7  <= 0x00010a0b (+2^16.0555)
mul.w r7, r7, r14
    //// bounds:  -0x3f32985 (-2^25.9818) <= r7  <= 0x68a22985 (+2^30.7092)
add.w r8, r8, r7
    //// bounds:  -0x5f5718e (-2^26.5750) <= r8  <= 0x72ad718e (+2^30.8414)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x6aa4718e (-2^30.7366) <= r7  <= 0x0dfe718e (+2^27.8067)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20837
RED1 r4, r3
    //// bounds:  -0x0000a0a (-2^11.3276) <= r4  <= 0x00010a0a (+2^16.0555)
mul.w r4, r4, r14
    //// bounds:  -0x3311ff2 (-2^25.6744) <= r4  <= 0x54961ff2 (+2^30.4024)
sub.w r6, r6, r4
    //// bounds:  -0x5ea067fb (-2^30.5642) <= r6  <= 0x053467fb (+2^26.3798)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0xd3b67fb (-2^27.7260) <= r4  <= 0x569967fb (+2^30.4363)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1252]
str.w r11, [r1, #1264]
str.w r10, [r1, #1276]
str.w r9, [r1, #1288]
str.w r8, [r1, #1300]
str.w r7, [r1, #1312]
str.w r6, [r1, #1324]
str.w r4, [r1, #1336]
ldr.w r12, [sp, #1256]
ldr.w r11, [sp, #1268]
ldr.w r10, [sp, #1280]
ldr.w r9, [sp, #1292]
ldr.w r8, [sp, #1304]
ldr.w r7, [sp, #1316]
ldr.w r6, [sp, #1328]
ldr.w r4, [sp, #1340]
/*** LAYER 4 ***/
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
sub.w r12, r12, r8, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r12 <= 0x40015ffc (+2^30.0001)
sub.w r8, r12, r8
    //// bounds:  -0x4000dffc (-2^30.0001) <= r8  <= 0x4001dffc (+2^30.0002)
RED1 r12, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r12 <= 0x00014001 (+2^16.3219)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
sub.w r11, r11, r7, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r11 <= 0x40015ffc (+2^30.0001)
sub.w r7, r11, r7
    //// bounds:  -0x4000dffc (-2^30.0001) <= r7  <= 0x4001dffc (+2^30.0002)
RED1 r11, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r11 <= 0x00014001 (+2^16.3219)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r6, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r10 <= 0x40015ffc (+2^30.0001)
sub.w r6, r10, r6
    //// bounds:  -0x4000dffc (-2^30.0001) <= r6  <= 0x4001dffc (+2^30.0002)
RED1 r10, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r10 <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r9, r9, r4, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r9  <= 0x40015ffc (+2^30.0001)
sub.w r4, r9, r4
    //// bounds:  -0x4000dffc (-2^30.0001) <= r4  <= 0x4001dffc (+2^30.0002)
RED1 r9, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r9  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
ldr.w r14, =2040
mul.w r10, r10, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r10 <= 0x09f607f8 (+2^27.3163)
sub.w r12, r12, r10
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r12 <= 0x01ff47f9 (+2^24.9980)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r10 <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
mul.w r9, r9, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r9  <= 0x09f607f8 (+2^27.3163)
sub.w r11, r11, r9
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r11 <= 0x01ff47f9 (+2^24.9980)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r9  <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
ldr.w r14, =2056
mul.w r6, r6, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r6  <= 0x0a0a0808 (+2^27.3276)
add.w r8, r8, r6
    //// bounds:  -0x2024809 (-2^25.0064) <= r8  <= 0x0a0b4809 (+2^27.3283)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r6  <= 0x02034809 (+2^25.0092)
/*** LAYER 5 ***/
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r7, r7, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r7  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
/*** LAYER 6 ***/
ldr.w r14, =5707
RED1 r11, r3
    //// bounds:  -0x00009f6 (-2^11.3163) <= r11 <= 0x000109f6 (+2^16.0551)
mul.w r11, r11, r14
    //// bounds:  -0x0de0f12 (-2^23.7948) <= r11 <= 0x17290f12 (+2^28.5336)
sub.w r12, r12, r11
    //// bounds:  -0x211f570b (-2^29.0497) <= r12 <= 0x02dd570b (+2^25.5183)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0xad4570b (-2^27.4369) <= r11 <= 0x1928570b (+2^28.6529)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19178
RED1 r9, r3
    //// bounds:  -0x00009f7 (-2^11.3168) <= r9  <= 0x000109f7 (+2^16.0551)
mul.w r9, r9, r14
    //// bounds:  -0x2ea81c6 (-2^25.5440) <= r9  <= 0x4dd481c6 (+2^30.2823)
sub.w r10, r10, r9
    //// bounds:  -0x4fd2c9bf (-2^30.3187) <= r10 <= 0x0ce1c9bf (+2^27.6873)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x4e8c9bf (-2^26.2955) <= r9  <= 0x57cbc9bf (+2^30.4561)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =25775
RED1 r7, r3
    //// bounds:  -0x0000a0b (-2^11.3281) <= r7  <= 0x00010a0b (+2^16.0555)
mul.w r7, r7, r14
    //// bounds:  -0x3f32985 (-2^25.9818) <= r7  <= 0x68a22985 (+2^30.7092)
add.w r8, r8, r7
    //// bounds:  -0x5f5718e (-2^26.5750) <= r8  <= 0x72ad718e (+2^30.8414)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x6aa4718e (-2^30.7366) <= r7  <= 0x0dfe718e (+2^27.8067)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20837
RED1 r4, r3
    //// bounds:  -0x0000a0a (-2^11.3276) <= r4  <= 0x00010a0a (+2^16.0555)
mul.w r4, r4, r14
    //// bounds:  -0x3311ff2 (-2^25.6744) <= r4  <= 0x54961ff2 (+2^30.4024)
sub.w r6, r6, r4
    //// bounds:  -0x5ea067fb (-2^30.5642) <= r6  <= 0x053467fb (+2^26.3798)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0xd3b67fb (-2^27.7260) <= r4  <= 0x569967fb (+2^30.4363)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1256]
str.w r11, [r1, #1268]
str.w r10, [r1, #1280]
str.w r9, [r1, #1292]
str.w r8, [r1, #1304]
str.w r7, [r1, #1316]
str.w r6, [r1, #1328]
str.w r4, [r1, #1340]
ldr.w r12, [sp, #1344]
ldr.w r11, [sp, #1356]
ldr.w r10, [sp, #1368]
ldr.w r9, [sp, #1380]
ldr.w r8, [sp, #1392]
ldr.w r7, [sp, #1404]
ldr.w r6, [sp, #1416]
ldr.w r4, [sp, #1428]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r8  <= 0x00010060 (+2^16.0021)
add.w r12, r12, r8, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r12 <= 0x08247db7 (+2^27.0255)
sub.w r8, r12, r8, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r8  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r7  <= 0x00010060 (+2^16.0021)
add.w r11, r11, r7, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r11 <= 0x08247db7 (+2^27.0255)
sub.w r7, r11, r7, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r7  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r6  <= 0x00010060 (+2^16.0021)
add.w r10, r10, r6, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r10 <= 0x08247db7 (+2^27.0255)
sub.w r6, r10, r6, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r6  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r4  <= 0x00010060 (+2^16.0021)
add.w r9, r9, r4, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r9  <= 0x08247db7 (+2^27.0255)
sub.w r4, r9, r4, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r4  <= 0x00247db7 (+2^21.1895)
/*** LAYER 5 ***/
ldr.w r14, =514
RED1 r10, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r10 <= 0x00010824 (+2^16.0452)
mul.w r10, r10, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r10 <= 0x02125848 (+2^25.0508)
add.w r12, r12, r10
    //// bounds:  -0x073d5ff (-2^22.8559) <= r12 <= 0x0a36d5ff (+2^27.3525)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r10 <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r9  <= 0x00010824 (+2^16.0452)
mul.w r9, r9, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r9  <= 0x02125848 (+2^25.0508)
add.w r11, r11, r9
    //// bounds:  -0x073d5ff (-2^22.8559) <= r11 <= 0x0a36d5ff (+2^27.3525)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r9  <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
ldr.w r14, =510
RED1 r6, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r6  <= 0x00010863 (+2^16.0465)
mul.w r6, r6, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r6  <= 0x020eb53a (+2^25.0409)
add.w r8, r8, r6
    //// bounds:  -0x87432f1 (-2^27.0796) <= r8  <= 0x023332f1 (+2^25.1375)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r6  <= 0x003532f1 (+2^21.7333)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r4  <= 0x00010863 (+2^16.0465)
mul.w r4, r4, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r4  <= 0x020eb53a (+2^25.0409)
add.w r7, r7, r4
    //// bounds:  -0x87432f1 (-2^27.0796) <= r7  <= 0x023332f1 (+2^25.1375)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r4  <= 0x003532f1 (+2^21.7333)
/*** LAYER 6 ***/
ldr.w r14, =19881
RED1 r11, r3
    //// bounds:  -0x0000a36 (-2^11.3520) <= r11 <= 0x00010a36 (+2^16.0564)
mul.w r11, r11, r14
    //// bounds:  -0x318fba6 (-2^25.6311) <= r11 <= 0x50c1fba6 (+2^30.3355)
add.w r12, r12, r11
    //// bounds:  -0x38cd1a5 (-2^25.8278) <= r12 <= 0x5af8d1a5 (+2^30.5073)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x5135d1a5 (-2^30.3436) <= r11 <= 0x0d4fd1a5 (+2^27.7346)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22350
RED1 r9, r3
    //// bounds:  -0x0000834 (-2^11.0362) <= r9  <= 0x00010834 (+2^16.0455)
mul.w r9, r9, r14
    //// bounds:  -0x2cc2bd8 (-2^25.4842) <= r9  <= 0x5a1a2bd8 (+2^30.4935)
sub.w r10, r10, r9
    //// bounds:  -0x5c9001d7 (-2^30.5324) <= r10 <= 0x0b0101d7 (+2^27.4599)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x54201d7 (-2^26.3945) <= r9  <= 0x624f01d7 (+2^30.6192)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9589
RED1 r7, r3
    //// bounds:  -0x0000874 (-2^11.0795) <= r7  <= 0x00010874 (+2^16.0469)
mul.w r7, r7, r14
    //// bounds:  -0x13ca104 (-2^24.3066) <= r7  <= 0x26b1a104 (+2^29.2740)
add.w r8, r8, r7
    //// bounds:  -0x9b0d3f5 (-2^27.2766) <= r8  <= 0x28e4d3f5 (+2^29.3538)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2f25d3f5 (-2^29.5591) <= r7  <= 0x036fd3f5 (+2^25.7811)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =29915
RED1 r4, r3
    //// bounds:  -0x0000a72 (-2^11.3848) <= r4  <= 0x00010a72 (+2^16.0577)
mul.w r4, r4, r14
    //// bounds:  -0x4c49786 (-2^26.2534) <= r4  <= 0x799f9786 (+2^30.9263)
RED1 r4, r3
    //// bounds:  -0x000799f (-2^14.9262) <= r4  <= 0x0001799f (+2^16.5608)
add.w r6, r6, r4
    //// bounds:  -0xa72ac90 (-2^27.3851) <= r6  <= 0x0036ac90 (+2^21.7728)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa73ac90 (-2^27.3857) <= r4  <= 0x0035ac90 (+2^21.7462)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1344]
str.w r11, [r1, #1356]
str.w r10, [r1, #1368]
str.w r9, [r1, #1380]
str.w r8, [r1, #1392]
str.w r7, [r1, #1404]
str.w r6, [r1, #1416]
str.w r4, [r1, #1428]
ldr.w r12, [sp, #1348]
ldr.w r11, [sp, #1360]
ldr.w r10, [sp, #1372]
ldr.w r9, [sp, #1384]
ldr.w r8, [sp, #1396]
ldr.w r7, [sp, #1408]
ldr.w r6, [sp, #1420]
ldr.w r4, [sp, #1432]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r8  <= 0x00010060 (+2^16.0021)
add.w r12, r12, r8, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r12 <= 0x08247db7 (+2^27.0255)
sub.w r8, r12, r8, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r8  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r7  <= 0x00010060 (+2^16.0021)
add.w r11, r11, r7, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r11 <= 0x08247db7 (+2^27.0255)
sub.w r7, r11, r7, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r7  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r6  <= 0x00010060 (+2^16.0021)
add.w r10, r10, r6, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r10 <= 0x08247db7 (+2^27.0255)
sub.w r6, r10, r6, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r6  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r4  <= 0x00010060 (+2^16.0021)
add.w r9, r9, r4, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r9  <= 0x08247db7 (+2^27.0255)
sub.w r4, r9, r4, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r4  <= 0x00247db7 (+2^21.1895)
/*** LAYER 5 ***/
ldr.w r14, =514
RED1 r10, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r10 <= 0x00010824 (+2^16.0452)
mul.w r10, r10, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r10 <= 0x02125848 (+2^25.0508)
add.w r12, r12, r10
    //// bounds:  -0x073d5ff (-2^22.8559) <= r12 <= 0x0a36d5ff (+2^27.3525)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r10 <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r9  <= 0x00010824 (+2^16.0452)
mul.w r9, r9, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r9  <= 0x02125848 (+2^25.0508)
add.w r11, r11, r9
    //// bounds:  -0x073d5ff (-2^22.8559) <= r11 <= 0x0a36d5ff (+2^27.3525)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r9  <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
ldr.w r14, =510
RED1 r6, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r6  <= 0x00010863 (+2^16.0465)
mul.w r6, r6, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r6  <= 0x020eb53a (+2^25.0409)
add.w r8, r8, r6
    //// bounds:  -0x87432f1 (-2^27.0796) <= r8  <= 0x023332f1 (+2^25.1375)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r6  <= 0x003532f1 (+2^21.7333)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r4  <= 0x00010863 (+2^16.0465)
mul.w r4, r4, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r4  <= 0x020eb53a (+2^25.0409)
add.w r7, r7, r4
    //// bounds:  -0x87432f1 (-2^27.0796) <= r7  <= 0x023332f1 (+2^25.1375)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r4  <= 0x003532f1 (+2^21.7333)
/*** LAYER 6 ***/
ldr.w r14, =19881
RED1 r11, r3
    //// bounds:  -0x0000a36 (-2^11.3520) <= r11 <= 0x00010a36 (+2^16.0564)
mul.w r11, r11, r14
    //// bounds:  -0x318fba6 (-2^25.6311) <= r11 <= 0x50c1fba6 (+2^30.3355)
add.w r12, r12, r11
    //// bounds:  -0x38cd1a5 (-2^25.8278) <= r12 <= 0x5af8d1a5 (+2^30.5073)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x5135d1a5 (-2^30.3436) <= r11 <= 0x0d4fd1a5 (+2^27.7346)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22350
RED1 r9, r3
    //// bounds:  -0x0000834 (-2^11.0362) <= r9  <= 0x00010834 (+2^16.0455)
mul.w r9, r9, r14
    //// bounds:  -0x2cc2bd8 (-2^25.4842) <= r9  <= 0x5a1a2bd8 (+2^30.4935)
sub.w r10, r10, r9
    //// bounds:  -0x5c9001d7 (-2^30.5324) <= r10 <= 0x0b0101d7 (+2^27.4599)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x54201d7 (-2^26.3945) <= r9  <= 0x624f01d7 (+2^30.6192)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9589
RED1 r7, r3
    //// bounds:  -0x0000874 (-2^11.0795) <= r7  <= 0x00010874 (+2^16.0469)
mul.w r7, r7, r14
    //// bounds:  -0x13ca104 (-2^24.3066) <= r7  <= 0x26b1a104 (+2^29.2740)
add.w r8, r8, r7
    //// bounds:  -0x9b0d3f5 (-2^27.2766) <= r8  <= 0x28e4d3f5 (+2^29.3538)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2f25d3f5 (-2^29.5591) <= r7  <= 0x036fd3f5 (+2^25.7811)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =29915
RED1 r4, r3
    //// bounds:  -0x0000a72 (-2^11.3848) <= r4  <= 0x00010a72 (+2^16.0577)
mul.w r4, r4, r14
    //// bounds:  -0x4c49786 (-2^26.2534) <= r4  <= 0x799f9786 (+2^30.9263)
RED1 r4, r3
    //// bounds:  -0x000799f (-2^14.9262) <= r4  <= 0x0001799f (+2^16.5608)
add.w r6, r6, r4
    //// bounds:  -0xa72ac90 (-2^27.3851) <= r6  <= 0x0036ac90 (+2^21.7728)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa73ac90 (-2^27.3857) <= r4  <= 0x0035ac90 (+2^21.7462)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1348]
str.w r11, [r1, #1360]
str.w r10, [r1, #1372]
str.w r9, [r1, #1384]
str.w r8, [r1, #1396]
str.w r7, [r1, #1408]
str.w r6, [r1, #1420]
str.w r4, [r1, #1432]
ldr.w r12, [sp, #1352]
ldr.w r11, [sp, #1364]
ldr.w r10, [sp, #1376]
ldr.w r9, [sp, #1388]
ldr.w r8, [sp, #1400]
ldr.w r7, [sp, #1412]
ldr.w r6, [sp, #1424]
ldr.w r4, [sp, #1436]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r8  <= 0x00010060 (+2^16.0021)
add.w r12, r12, r8, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r12 <= 0x08247db7 (+2^27.0255)
sub.w r8, r12, r8, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r8  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r7  <= 0x00010060 (+2^16.0021)
add.w r11, r11, r7, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r11 <= 0x08247db7 (+2^27.0255)
sub.w r7, r11, r7, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r7  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r6  <= 0x00010060 (+2^16.0021)
add.w r10, r10, r6, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r10 <= 0x08247db7 (+2^27.0255)
sub.w r6, r10, r6, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r6  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r4  <= 0x00010060 (+2^16.0021)
add.w r9, r9, r4, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r9  <= 0x08247db7 (+2^27.0255)
sub.w r4, r9, r4, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r4  <= 0x00247db7 (+2^21.1895)
/*** LAYER 5 ***/
ldr.w r14, =514
RED1 r10, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r10 <= 0x00010824 (+2^16.0452)
mul.w r10, r10, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r10 <= 0x02125848 (+2^25.0508)
add.w r12, r12, r10
    //// bounds:  -0x073d5ff (-2^22.8559) <= r12 <= 0x0a36d5ff (+2^27.3525)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r10 <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r9  <= 0x00010824 (+2^16.0452)
mul.w r9, r9, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r9  <= 0x02125848 (+2^25.0508)
add.w r11, r11, r9
    //// bounds:  -0x073d5ff (-2^22.8559) <= r11 <= 0x0a36d5ff (+2^27.3525)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r9  <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
ldr.w r14, =510
RED1 r6, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r6  <= 0x00010863 (+2^16.0465)
mul.w r6, r6, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r6  <= 0x020eb53a (+2^25.0409)
add.w r8, r8, r6
    //// bounds:  -0x87432f1 (-2^27.0796) <= r8  <= 0x023332f1 (+2^25.1375)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r6  <= 0x003532f1 (+2^21.7333)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r4  <= 0x00010863 (+2^16.0465)
mul.w r4, r4, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r4  <= 0x020eb53a (+2^25.0409)
add.w r7, r7, r4
    //// bounds:  -0x87432f1 (-2^27.0796) <= r7  <= 0x023332f1 (+2^25.1375)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r4  <= 0x003532f1 (+2^21.7333)
/*** LAYER 6 ***/
ldr.w r14, =19881
RED1 r11, r3
    //// bounds:  -0x0000a36 (-2^11.3520) <= r11 <= 0x00010a36 (+2^16.0564)
mul.w r11, r11, r14
    //// bounds:  -0x318fba6 (-2^25.6311) <= r11 <= 0x50c1fba6 (+2^30.3355)
add.w r12, r12, r11
    //// bounds:  -0x38cd1a5 (-2^25.8278) <= r12 <= 0x5af8d1a5 (+2^30.5073)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x5135d1a5 (-2^30.3436) <= r11 <= 0x0d4fd1a5 (+2^27.7346)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22350
RED1 r9, r3
    //// bounds:  -0x0000834 (-2^11.0362) <= r9  <= 0x00010834 (+2^16.0455)
mul.w r9, r9, r14
    //// bounds:  -0x2cc2bd8 (-2^25.4842) <= r9  <= 0x5a1a2bd8 (+2^30.4935)
sub.w r10, r10, r9
    //// bounds:  -0x5c9001d7 (-2^30.5324) <= r10 <= 0x0b0101d7 (+2^27.4599)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x54201d7 (-2^26.3945) <= r9  <= 0x624f01d7 (+2^30.6192)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9589
RED1 r7, r3
    //// bounds:  -0x0000874 (-2^11.0795) <= r7  <= 0x00010874 (+2^16.0469)
mul.w r7, r7, r14
    //// bounds:  -0x13ca104 (-2^24.3066) <= r7  <= 0x26b1a104 (+2^29.2740)
add.w r8, r8, r7
    //// bounds:  -0x9b0d3f5 (-2^27.2766) <= r8  <= 0x28e4d3f5 (+2^29.3538)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2f25d3f5 (-2^29.5591) <= r7  <= 0x036fd3f5 (+2^25.7811)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =29915
RED1 r4, r3
    //// bounds:  -0x0000a72 (-2^11.3848) <= r4  <= 0x00010a72 (+2^16.0577)
mul.w r4, r4, r14
    //// bounds:  -0x4c49786 (-2^26.2534) <= r4  <= 0x799f9786 (+2^30.9263)
RED1 r4, r3
    //// bounds:  -0x000799f (-2^14.9262) <= r4  <= 0x0001799f (+2^16.5608)
add.w r6, r6, r4
    //// bounds:  -0xa72ac90 (-2^27.3851) <= r6  <= 0x0036ac90 (+2^21.7728)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa73ac90 (-2^27.3857) <= r4  <= 0x0035ac90 (+2^21.7462)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1352]
str.w r11, [r1, #1364]
str.w r10, [r1, #1376]
str.w r9, [r1, #1388]
str.w r8, [r1, #1400]
str.w r7, [r1, #1412]
str.w r6, [r1, #1424]
str.w r4, [r1, #1436]
ldr.w r12, [sp, #1440]
ldr.w r11, [sp, #1452]
ldr.w r10, [sp, #1464]
ldr.w r9, [sp, #1476]
ldr.w r8, [sp, #1488]
ldr.w r7, [sp, #1500]
ldr.w r6, [sp, #1512]
ldr.w r4, [sp, #1524]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r12 <= 0x01656b6f (+2^24.4815)
add.w r8, r12, r8, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r8  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r11 <= 0x01656b6f (+2^24.4815)
add.w r7, r11, r7, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r7  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r10 <= 0x01656b6f (+2^24.4815)
add.w r6, r10, r6, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r6  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r9  <= 0x01656b6f (+2^24.4815)
add.w r4, r9, r4, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r4  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 5 ***/
ldr.w r14, =8224
RED1 r10, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r10 <= 0x0001032c (+2^16.0178)
mul.w r10, r10, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r10 <= 0x2085e580 (+2^29.0234)
sub.w r12, r12, r10
    //// bounds:  -0x23b250ef (-2^29.1577) <= r12 <= 0x01cb50ef (+2^24.8433)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r10 <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r9  <= 0x0001032c (+2^16.0178)
mul.w r9, r9, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r9  <= 0x2085e580 (+2^29.0234)
sub.w r11, r11, r9
    //// bounds:  -0x23b250ef (-2^29.1577) <= r11 <= 0x01cb50ef (+2^24.8433)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r9  <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
ldr.w r14, =8160
RED1 r6, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r6  <= 0x0001036d (+2^16.0192)
mul.w r6, r6, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r6  <= 0x204d3260 (+2^29.0135)
sub.w r8, r8, r6
    //// bounds:  -0x21719dcf (-2^29.0637) <= r8  <= 0x03da9dcf (+2^25.9463)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r6  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r4  <= 0x0001036d (+2^16.0192)
mul.w r4, r4, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r4  <= 0x204d3260 (+2^29.0135)
sub.w r7, r7, r4
    //// bounds:  -0x21719dcf (-2^29.0637) <= r7  <= 0x03da9dcf (+2^25.9463)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r4  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 6 ***/
ldr.w r14, =23863
RED1 r11, r3
    //// bounds:  -0x00023b2 (-2^13.1577) <= r11 <= 0x000123b2 (+2^16.1883)
mul.w r11, r11, r14
    //// bounds:  -0xcff553e (-2^27.7002) <= r11 <= 0x6a36553e (+2^30.7308)
RED1 r11, r3
    //// bounds:  -0x0006a36 (-2^14.7308) <= r11 <= 0x00016a36 (+2^16.5007)
add.w r12, r12, r11
    //// bounds:  -0x23b2bb25 (-2^29.1578) <= r12 <= 0x01ccbb25 (+2^24.8478)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x23b3bb25 (-2^29.1579) <= r11 <= 0x01cbbb25 (+2^24.8446)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13987
RED1 r9, r3
    //// bounds:  -0x00021eb (-2^13.0840) <= r9  <= 0x000121eb (+2^16.1795)
mul.w r9, r9, r14
    //// bounds:  -0x73d2aa1 (-2^26.8558) <= r9  <= 0x3de02aa1 (+2^29.9513)
add.w r10, r10, r9
    //// bounds:  -0xacf7b90 (-2^27.4344) <= r10 <= 0x5fcb7b90 (+2^30.5819)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x41727b90 (-2^30.0323) <= r9  <= 0x29287b90 (+2^29.3631)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11414
RED1 r7, r3
    //// bounds:  -0x0002171 (-2^13.0636) <= r7  <= 0x00012171 (+2^16.1771)
mul.w r7, r7, r14
    //// bounds:  -0x5d30436 (-2^26.5421) <= r7  <= 0x32690436 (+2^29.6556)
add.w r8, r8, r7
    //// bounds:  -0x2744a205 (-2^29.2953) <= r8  <= 0x3643a205 (+2^29.7619)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x53daa205 (-2^30.3898) <= r7  <= 0x09ada205 (+2^27.2747)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =27181
RED1 r4, r3
    //// bounds:  -0x00023ba (-2^13.1589) <= r4  <= 0x000123ba (+2^16.1885)
mul.w r4, r4, r14
    //// bounds:  -0xed14bb2 (-2^27.8892) <= r4  <= 0x78fe4bb2 (+2^30.9188)
RED1 r4, r3
    //// bounds:  -0x00078fe (-2^14.9188) <= r4  <= 0x000178fe (+2^16.5584)
sub.w r6, r6, r4
    //// bounds:  -0x19316cd (-2^24.6550) <= r6  <= 0x23bb16cd (+2^29.1591)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x19216cd (-2^24.6514) <= r4  <= 0x23bc16cd (+2^29.1593)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1440]
str.w r11, [r1, #1452]
str.w r10, [r1, #1464]
str.w r9, [r1, #1476]
str.w r8, [r1, #1488]
str.w r7, [r1, #1500]
str.w r6, [r1, #1512]
str.w r4, [r1, #1524]
ldr.w r12, [sp, #1444]
ldr.w r11, [sp, #1456]
ldr.w r10, [sp, #1468]
ldr.w r9, [sp, #1480]
ldr.w r8, [sp, #1492]
ldr.w r7, [sp, #1504]
ldr.w r6, [sp, #1516]
ldr.w r4, [sp, #1528]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r12 <= 0x01656b6f (+2^24.4815)
add.w r8, r12, r8, lsl #4
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x1246b6f (-2^24.1919) <= r8  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r11 <= 0x01656b6f (+2^24.4815)
add.w r7, r11, r7, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r7  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r10 <= 0x01656b6f (+2^24.4815)
add.w r6, r10, r6, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r6  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r9  <= 0x01656b6f (+2^24.4815)
add.w r4, r9, r4, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r4  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 5 ***/
ldr.w r14, =8224
RED1 r10, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r10 <= 0x0001032c (+2^16.0178)
mul.w r10, r10, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r10 <= 0x2085e580 (+2^29.0234)
sub.w r12, r12, r10
    //// bounds:  -0x23b250ef (-2^29.1577) <= r12 <= 0x01cb50ef (+2^24.8433)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r10 <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r9  <= 0x0001032c (+2^16.0178)
mul.w r9, r9, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r9  <= 0x2085e580 (+2^29.0234)
sub.w r11, r11, r9
    //// bounds:  -0x23b250ef (-2^29.1577) <= r11 <= 0x01cb50ef (+2^24.8433)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r9  <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
ldr.w r14, =8160
RED1 r6, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r6  <= 0x0001036d (+2^16.0192)
mul.w r6, r6, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r6  <= 0x204d3260 (+2^29.0135)
sub.w r8, r8, r6
    //// bounds:  -0x21719dcf (-2^29.0637) <= r8  <= 0x03da9dcf (+2^25.9463)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r6  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r4  <= 0x0001036d (+2^16.0192)
mul.w r4, r4, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r4  <= 0x204d3260 (+2^29.0135)
sub.w r7, r7, r4
    //// bounds:  -0x21719dcf (-2^29.0637) <= r7  <= 0x03da9dcf (+2^25.9463)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r4  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 6 ***/
ldr.w r14, =23863
RED1 r11, r3
    //// bounds:  -0x00023b2 (-2^13.1577) <= r11 <= 0x000123b2 (+2^16.1883)
mul.w r11, r11, r14
    //// bounds:  -0xcff553e (-2^27.7002) <= r11 <= 0x6a36553e (+2^30.7308)
RED1 r11, r3
    //// bounds:  -0x0006a36 (-2^14.7308) <= r11 <= 0x00016a36 (+2^16.5007)
add.w r12, r12, r11
    //// bounds:  -0x23b2bb25 (-2^29.1578) <= r12 <= 0x01ccbb25 (+2^24.8478)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x23b3bb25 (-2^29.1579) <= r11 <= 0x01cbbb25 (+2^24.8446)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13987
RED1 r9, r3
    //// bounds:  -0x00021eb (-2^13.0840) <= r9  <= 0x000121eb (+2^16.1795)
mul.w r9, r9, r14
    //// bounds:  -0x73d2aa1 (-2^26.8558) <= r9  <= 0x3de02aa1 (+2^29.9513)
add.w r10, r10, r9
    //// bounds:  -0xacf7b90 (-2^27.4344) <= r10 <= 0x5fcb7b90 (+2^30.5819)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x41727b90 (-2^30.0323) <= r9  <= 0x29287b90 (+2^29.3631)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11414
RED1 r7, r3
    //// bounds:  -0x0002171 (-2^13.0636) <= r7  <= 0x00012171 (+2^16.1771)
mul.w r7, r7, r14
    //// bounds:  -0x5d30436 (-2^26.5421) <= r7  <= 0x32690436 (+2^29.6556)
add.w r8, r8, r7
    //// bounds:  -0x2744a205 (-2^29.2953) <= r8  <= 0x3643a205 (+2^29.7619)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x53daa205 (-2^30.3898) <= r7  <= 0x09ada205 (+2^27.2747)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =27181
RED1 r4, r3
    //// bounds:  -0x00023ba (-2^13.1589) <= r4  <= 0x000123ba (+2^16.1885)
mul.w r4, r4, r14
    //// bounds:  -0xed14bb2 (-2^27.8892) <= r4  <= 0x78fe4bb2 (+2^30.9188)
RED1 r4, r3
    //// bounds:  -0x00078fe (-2^14.9188) <= r4  <= 0x000178fe (+2^16.5584)
sub.w r6, r6, r4
    //// bounds:  -0x19316cd (-2^24.6550) <= r6  <= 0x23bb16cd (+2^29.1591)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x19216cd (-2^24.6514) <= r4  <= 0x23bc16cd (+2^29.1593)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1444]
str.w r11, [r1, #1456]
str.w r10, [r1, #1468]
str.w r9, [r1, #1480]
str.w r8, [r1, #1492]
str.w r7, [r1, #1504]
str.w r6, [r1, #1516]
str.w r4, [r1, #1528]
ldr.w r12, [sp, #1448]
ldr.w r11, [sp, #1460]
ldr.w r10, [sp, #1472]
ldr.w r9, [sp, #1484]
ldr.w r8, [sp, #1496]
ldr.w r7, [sp, #1508]
ldr.w r6, [sp, #1520]
ldr.w r4, [sp, #1532]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r12 <= 0x01656b6f (+2^24.4815)
add.w r8, r12, r8, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r8  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r11 <= 0x01656b6f (+2^24.4815)
add.w r7, r11, r7, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r7  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r10 <= 0x01656b6f (+2^24.4815)
add.w r6, r10, r6, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r6  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r9  <= 0x01656b6f (+2^24.4815)
add.w r4, r9, r4, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r4  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 5 ***/
ldr.w r14, =8224
RED1 r10, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r10 <= 0x0001032c (+2^16.0178)
mul.w r10, r10, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r10 <= 0x2085e580 (+2^29.0234)
sub.w r12, r12, r10
    //// bounds:  -0x23b250ef (-2^29.1577) <= r12 <= 0x01cb50ef (+2^24.8433)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r10 <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r9  <= 0x0001032c (+2^16.0178)
mul.w r9, r9, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r9  <= 0x2085e580 (+2^29.0234)
sub.w r11, r11, r9
    //// bounds:  -0x23b250ef (-2^29.1577) <= r11 <= 0x01cb50ef (+2^24.8433)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r9  <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
ldr.w r14, =8160
RED1 r6, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r6  <= 0x0001036d (+2^16.0192)
mul.w r6, r6, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r6  <= 0x204d3260 (+2^29.0135)
sub.w r8, r8, r6
    //// bounds:  -0x21719dcf (-2^29.0637) <= r8  <= 0x03da9dcf (+2^25.9463)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r6  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r4  <= 0x0001036d (+2^16.0192)
mul.w r4, r4, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r4  <= 0x204d3260 (+2^29.0135)
sub.w r7, r7, r4
    //// bounds:  -0x21719dcf (-2^29.0637) <= r7  <= 0x03da9dcf (+2^25.9463)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r4  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 6 ***/
ldr.w r14, =23863
RED1 r11, r3
    //// bounds:  -0x00023b2 (-2^13.1577) <= r11 <= 0x000123b2 (+2^16.1883)
mul.w r11, r11, r14
    //// bounds:  -0xcff553e (-2^27.7002) <= r11 <= 0x6a36553e (+2^30.7308)
RED1 r11, r3
    //// bounds:  -0x0006a36 (-2^14.7308) <= r11 <= 0x00016a36 (+2^16.5007)
add.w r12, r12, r11
    //// bounds:  -0x23b2bb25 (-2^29.1578) <= r12 <= 0x01ccbb25 (+2^24.8478)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x23b3bb25 (-2^29.1579) <= r11 <= 0x01cbbb25 (+2^24.8446)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13987
RED1 r9, r3
    //// bounds:  -0x00021eb (-2^13.0840) <= r9  <= 0x000121eb (+2^16.1795)
mul.w r9, r9, r14
    //// bounds:  -0x73d2aa1 (-2^26.8558) <= r9  <= 0x3de02aa1 (+2^29.9513)
add.w r10, r10, r9
    //// bounds:  -0xacf7b90 (-2^27.4344) <= r10 <= 0x5fcb7b90 (+2^30.5819)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x41727b90 (-2^30.0323) <= r9  <= 0x29287b90 (+2^29.3631)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11414
RED1 r7, r3
    //// bounds:  -0x0002171 (-2^13.0636) <= r7  <= 0x00012171 (+2^16.1771)
mul.w r7, r7, r14
    //// bounds:  -0x5d30436 (-2^26.5421) <= r7  <= 0x32690436 (+2^29.6556)
add.w r8, r8, r7
    //// bounds:  -0x2744a205 (-2^29.2953) <= r8  <= 0x3643a205 (+2^29.7619)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x53daa205 (-2^30.3898) <= r7  <= 0x09ada205 (+2^27.2747)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =27181
RED1 r4, r3
    //// bounds:  -0x00023ba (-2^13.1589) <= r4  <= 0x000123ba (+2^16.1885)
mul.w r4, r4, r14
    //// bounds:  -0xed14bb2 (-2^27.8892) <= r4  <= 0x78fe4bb2 (+2^30.9188)
RED1 r4, r3
    //// bounds:  -0x00078fe (-2^14.9188) <= r4  <= 0x000178fe (+2^16.5584)
sub.w r6, r6, r4
    //// bounds:  -0x19316cd (-2^24.6550) <= r6  <= 0x23bb16cd (+2^29.1591)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x19216cd (-2^24.6514) <= r4  <= 0x23bc16cd (+2^29.1593)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1448]
str.w r11, [r1, #1460]
str.w r10, [r1, #1472]
str.w r9, [r1, #1484]
str.w r8, [r1, #1496]
str.w r7, [r1, #1508]
str.w r6, [r1, #1520]
str.w r4, [r1, #1532]
add sp, #1544
            pop {r4-r11, pc}
            .ltorg
            
_ntt_pre:
/*** LAYER 6 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x0001ffc0 (+2^16.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x000ffe0 (-2^15.9993) <= r11 <= 0x0000ffe0 (+2^15.9993)
ldr.w r5, =32768
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r10 <= 0x00806ff0 (+2^23.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r9  <= 0x00806ff0 (+2^23.0049)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x443b778 (-2^26.0924) <= r8  <= 0x0443b778 (+2^26.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x443b778 (-2^26.0924) <= r7  <= 0x0443b778 (+2^26.0924)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000040 (-2^ 6.0000) <= r4  <= 0x00010040 (+2^16.0014)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x104437f8 (-2^28.0238) <= r6  <= 0x004437f8 (+2^22.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x04437f8 (-2^22.0921) <= r4  <= 0x104437f8 (+2^28.0238)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
ldr.w r1, [sp,#1536]
str.w r12, [r1, #0]
str.w r11, [r1, #20]
str.w r10, [r1, #40]
str.w r9, [r1, #60]
str.w r8, [r1, #80]
str.w r7, [r1, #100]
str.w r6, [r1, #120]
str.w r4, [r1, #140]
ldr.w r12, [sp, #4]
ldr.w r11, [sp, #16]
ldr.w r10, [sp, #28]
ldr.w r9, [sp, #40]
ldr.w r8, [sp, #52]
ldr.w r7, [sp, #64]
ldr.w r6, [sp, #76]
ldr.w r4, [sp, #88]
/*** LAYER 4 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00007ff0 (+2^14.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r8  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00007ff0 (+2^14.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r7  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00007ff0 (+2^14.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r6  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00007ff0 (+2^14.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r4  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 5 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x0000ffe0 (+2^15.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r10 <= 0x00007ff0 (+2^14.9993)
/*** LAYER 5 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x0000ffe0 (+2^15.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r9  <= 0x00007ff0 (+2^14.9993)
/*** LAYER 5 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x04037f8 (-2^22.0049) <= r8  <= 0x004037f8 (+2^22.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x04037f8 (-2^22.0049) <= r6  <= 0x004037f8 (+2^22.0049)
/*** LAYER 5 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x04037f8 (-2^22.0049) <= r7  <= 0x004037f8 (+2^22.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x04037f8 (-2^22.0049) <= r4  <= 0x004037f8 (+2^22.0049)
/*** LAYER 6 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x0001ffc0 (+2^16.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x000ffe0 (-2^15.9993) <= r11 <= 0x0000ffe0 (+2^15.9993)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r10 <= 0x00806ff0 (+2^23.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r9  <= 0x00806ff0 (+2^23.0049)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x443b778 (-2^26.0924) <= r8  <= 0x0443b778 (+2^26.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x443b778 (-2^26.0924) <= r7  <= 0x0443b778 (+2^26.0924)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000040 (-2^ 6.0000) <= r4  <= 0x00010040 (+2^16.0014)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x104437f8 (-2^28.0238) <= r6  <= 0x004437f8 (+2^22.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x04437f8 (-2^22.0921) <= r4  <= 0x104437f8 (+2^28.0238)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 0 ***/
ldr.w r14, =1
mul.w r3, r12, r14
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #12]
/*** baseaux 1 ***/
ldr.w r14, =-1
mul.w r3, r11, r14
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #32]
/*** baseaux 2 ***/
ldr.w r14, =256
mul.w r3, r10, r14
    //// bounds:  -0x0800000 (-2^23.0000) <= r3  <= 0x00800000 (+2^23.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #52]
/*** baseaux 3 ***/
ldr.w r14, =-256
mul.w r3, r9, r14
    //// bounds:  -0x0800000 (-2^23.0000) <= r3  <= 0x00800000 (+2^23.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #72]
/*** baseaux 4 ***/
ldr.w r14, =-16
mul.w r3, r8, r14
    //// bounds:  -0x0080000 (-2^19.0000) <= r3  <= 0x00080000 (+2^19.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #92]
/*** baseaux 5 ***/
ldr.w r14, =16
mul.w r3, r7, r14
    //// bounds:  -0x0080000 (-2^19.0000) <= r3  <= 0x00080000 (+2^19.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #112]
/*** baseaux 6 ***/
ldr.w r14, =-4096
mul.w r3, r6, r14
    //// bounds:  -0x8000000 (-2^27.0000) <= r3  <= 0x08000000 (+2^27.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #132]
/*** baseaux 7 ***/
ldr.w r14, =4096
mul.w r3, r4, r14
    //// bounds:  -0x8000000 (-2^27.0000) <= r3  <= 0x08000000 (+2^27.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #152]
str.w r12, [r1, #4]
str.w r11, [r1, #24]
str.w r10, [r1, #44]
str.w r9, [r1, #64]
str.w r8, [r1, #84]
str.w r7, [r1, #104]
str.w r6, [r1, #124]
str.w r4, [r1, #144]
ldr.w r12, [sp, #8]
ldr.w r11, [sp, #20]
ldr.w r10, [sp, #32]
ldr.w r9, [sp, #44]
ldr.w r8, [sp, #56]
ldr.w r7, [sp, #68]
ldr.w r6, [sp, #80]
ldr.w r4, [sp, #92]
/*** LAYER 4 ***/
add.w r12, r12, r8
    //// bounds:  0x00000000 <= r12 <= 0x00007ff0 (+2^14.9993)
sub.w r8, r12, r8, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r8  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r11, r11, r7
    //// bounds:  0x00000000 <= r11 <= 0x00007ff0 (+2^14.9993)
sub.w r7, r11, r7, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r7  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r10, r10, r6
    //// bounds:  0x00000000 <= r10 <= 0x00007ff0 (+2^14.9993)
sub.w r6, r10, r6, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r6  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 4 ***/
add.w r9, r9, r4
    //// bounds:  0x00000000 <= r9  <= 0x00007ff0 (+2^14.9993)
sub.w r4, r9, r4, lsl #1
    //// bounds:  -0x0003ff8 (-2^13.9993) <= r4  <= 0x00003ff8 (+2^13.9993)
/*** LAYER 5 ***/
add.w r12, r12, r10
    //// bounds:  0x00000000 <= r12 <= 0x0000ffe0 (+2^15.9993)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r10 <= 0x00007ff0 (+2^14.9993)
/*** LAYER 5 ***/
add.w r11, r11, r9
    //// bounds:  0x00000000 <= r11 <= 0x0000ffe0 (+2^15.9993)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x0007ff0 (-2^14.9993) <= r9  <= 0x00007ff0 (+2^14.9993)
/*** LAYER 5 ***/
add.w r8, r8, r6, lsl #8
    //// bounds:  -0x04037f8 (-2^22.0049) <= r8  <= 0x004037f8 (+2^22.0049)
sub.w r6, r8, r6, lsl #9
    //// bounds:  -0x04037f8 (-2^22.0049) <= r6  <= 0x004037f8 (+2^22.0049)
/*** LAYER 5 ***/
add.w r7, r7, r4, lsl #8
    //// bounds:  -0x04037f8 (-2^22.0049) <= r7  <= 0x004037f8 (+2^22.0049)
sub.w r4, r7, r4, lsl #9
    //// bounds:  -0x04037f8 (-2^22.0049) <= r4  <= 0x004037f8 (+2^22.0049)
/*** LAYER 6 ***/
add.w r12, r12, r11
    //// bounds:  0x00000000 <= r12 <= 0x0001ffc0 (+2^16.9993)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x000ffe0 (-2^15.9993) <= r11 <= 0x0000ffe0 (+2^15.9993)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #8
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r10 <= 0x00806ff0 (+2^23.0049)
sub.w r9, r10, r9, lsl #9
    //// bounds:  -0x0806ff0 (-2^23.0049) <= r9  <= 0x00806ff0 (+2^23.0049)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #4
    //// bounds:  -0x443b778 (-2^26.0924) <= r8  <= 0x0443b778 (+2^26.0924)
add.w r7, r8, r7, lsl #5
    //// bounds:  -0x443b778 (-2^26.0924) <= r7  <= 0x0443b778 (+2^26.0924)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000040 (-2^ 6.0000) <= r4  <= 0x00010040 (+2^16.0014)
sub.w r6, r6, r4, lsl #12
    //// bounds:  -0x104437f8 (-2^28.0238) <= r6  <= 0x004437f8 (+2^22.0921)
add.w r4, r6, r4, lsl #13
    //// bounds:  -0x04437f8 (-2^22.0921) <= r4  <= 0x104437f8 (+2^28.0238)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 0 ***/
ldr.w r14, =1
mul.w r3, r12, r14
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #16]
/*** baseaux 1 ***/
ldr.w r14, =-1
mul.w r3, r11, r14
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #36]
/*** baseaux 2 ***/
ldr.w r14, =256
mul.w r3, r10, r14
    //// bounds:  -0x0800000 (-2^23.0000) <= r3  <= 0x00800000 (+2^23.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #56]
/*** baseaux 3 ***/
ldr.w r14, =-256
mul.w r3, r9, r14
    //// bounds:  -0x0800000 (-2^23.0000) <= r3  <= 0x00800000 (+2^23.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #76]
/*** baseaux 4 ***/
ldr.w r14, =-16
mul.w r3, r8, r14
    //// bounds:  -0x0080000 (-2^19.0000) <= r3  <= 0x00080000 (+2^19.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #96]
/*** baseaux 5 ***/
ldr.w r14, =16
mul.w r3, r7, r14
    //// bounds:  -0x0080000 (-2^19.0000) <= r3  <= 0x00080000 (+2^19.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #116]
/*** baseaux 6 ***/
ldr.w r14, =-4096
mul.w r3, r6, r14
    //// bounds:  -0x8000000 (-2^27.0000) <= r3  <= 0x08000000 (+2^27.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #136]
/*** baseaux 7 ***/
ldr.w r14, =4096
mul.w r3, r4, r14
    //// bounds:  -0x8000000 (-2^27.0000) <= r3  <= 0x08000000 (+2^27.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #156]
str.w r12, [r1, #8]
str.w r11, [r1, #28]
str.w r10, [r1, #48]
str.w r9, [r1, #68]
str.w r8, [r1, #88]
str.w r7, [r1, #108]
str.w r6, [r1, #128]
str.w r4, [r1, #148]
ldr.w r12, [sp, #96]
ldr.w r11, [sp, #108]
ldr.w r10, [sp, #120]
ldr.w r9, [sp, #132]
ldr.w r8, [sp, #144]
ldr.w r7, [sp, #156]
ldr.w r6, [sp, #168]
ldr.w r4, [sp, #180]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r12 <= 0x00201bfc (+2^21.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r8  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r11 <= 0x00201bfc (+2^21.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r7  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r10 <= 0x00201bfc (+2^21.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r6  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r9  <= 0x00201bfc (+2^21.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r4  <= 0x00201bfc (+2^21.0049)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r12 <= 0x0221dbbc (+2^25.0924)
add.w r10, r12, r10, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r10 <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r11 <= 0x0221dbbc (+2^25.0924)
add.w r9, r11, r9, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r6  <= 0x00010020 (+2^16.0007)
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r8  <= 0x00221bfc (+2^21.0921)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r6  <= 0x10221bfc (+2^28.0120)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r4  <= 0x00010020 (+2^16.0007)
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r7  <= 0x00221bfc (+2^21.0921)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r4  <= 0x10221bfc (+2^28.0120)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r11 <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x62a5fbc (-2^26.6242) <= r12 <= 0x022a5fbc (+2^25.1147)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x22a5fbc (-2^25.1147) <= r11 <= 0x062a5fbc (+2^26.6242)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  -0xaa94aac (-2^27.4143) <= r10 <= 0x0aa94aac (+2^27.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0xaa94aac (-2^27.4143) <= r9  <= 0x0aa94aac (+2^27.4143)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r7  <= 0x00011022 (+2^16.0882)
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x142a9bfc (-2^28.3339) <= r8  <= 0x442a9bfc (+2^30.0910)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x542a9bfc (-2^30.3952) <= r7  <= 0x042a9bfc (+2^26.0588)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r4  <= 0x00011022 (+2^16.0882)
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x066247c (-2^22.6744) <= r6  <= 0x1026247c (+2^28.0134)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x026247c (-2^21.2533) <= r4  <= 0x1066247c (+2^28.0355)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #160]
str.w r11, [r1, #180]
str.w r10, [r1, #200]
str.w r9, [r1, #220]
str.w r8, [r1, #240]
str.w r7, [r1, #260]
str.w r6, [r1, #280]
str.w r4, [r1, #300]
ldr.w r12, [sp, #100]
ldr.w r11, [sp, #112]
ldr.w r10, [sp, #124]
ldr.w r9, [sp, #136]
ldr.w r8, [sp, #148]
ldr.w r7, [sp, #160]
ldr.w r6, [sp, #172]
ldr.w r4, [sp, #184]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r12 <= 0x00201bfc (+2^21.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r8  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r11 <= 0x00201bfc (+2^21.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r7  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r10 <= 0x00201bfc (+2^21.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r6  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r9  <= 0x00201bfc (+2^21.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r4  <= 0x00201bfc (+2^21.0049)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r12 <= 0x0221dbbc (+2^25.0924)
add.w r10, r12, r10, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r10 <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r11 <= 0x0221dbbc (+2^25.0924)
add.w r9, r11, r9, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r6  <= 0x00010020 (+2^16.0007)
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r8  <= 0x00221bfc (+2^21.0921)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r6  <= 0x10221bfc (+2^28.0120)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r4  <= 0x00010020 (+2^16.0007)
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r7  <= 0x00221bfc (+2^21.0921)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r4  <= 0x10221bfc (+2^28.0120)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r11 <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x62a5fbc (-2^26.6242) <= r12 <= 0x022a5fbc (+2^25.1147)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x22a5fbc (-2^25.1147) <= r11 <= 0x062a5fbc (+2^26.6242)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  -0xaa94aac (-2^27.4143) <= r10 <= 0x0aa94aac (+2^27.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0xaa94aac (-2^27.4143) <= r9  <= 0x0aa94aac (+2^27.4143)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r7  <= 0x00011022 (+2^16.0882)
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x142a9bfc (-2^28.3339) <= r8  <= 0x442a9bfc (+2^30.0910)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x542a9bfc (-2^30.3952) <= r7  <= 0x042a9bfc (+2^26.0588)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r4  <= 0x00011022 (+2^16.0882)
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x066247c (-2^22.6744) <= r6  <= 0x1026247c (+2^28.0134)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x026247c (-2^21.2533) <= r4  <= 0x1066247c (+2^28.0355)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 8 ***/
ldr.w r14, =-1024
mul.w r3, r12, r14
    //// bounds:  -0x2000000 (-2^25.0000) <= r3  <= 0x02000000 (+2^25.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #172]
/*** baseaux 9 ***/
ldr.w r14, =1024
mul.w r3, r11, r14
    //// bounds:  -0x2000000 (-2^25.0000) <= r3  <= 0x02000000 (+2^25.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #192]
/*** baseaux 10 ***/
ldr.w r14, =4
mul.w r3, r10, r14
    //// bounds:  -0x0020000 (-2^17.0000) <= r3  <= 0x00020000 (+2^17.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #212]
/*** baseaux 11 ***/
ldr.w r14, =-4
mul.w r3, r9, r14
    //// bounds:  -0x0020000 (-2^17.0000) <= r3  <= 0x00020000 (+2^17.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #232]
/*** baseaux 12 ***/
ldr.w r14, =16384
mul.w r3, r8, r14
    //// bounds:  -0x20000000 (-2^29.0000) <= r3  <= 0x20000000 (+2^29.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #252]
/*** baseaux 13 ***/
ldr.w r14, =-16384
mul.w r3, r7, r14
    //// bounds:  -0x20000000 (-2^29.0000) <= r3  <= 0x20000000 (+2^29.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #272]
/*** baseaux 14 ***/
ldr.w r14, =-64
mul.w r3, r6, r14
    //// bounds:  -0x0200000 (-2^21.0000) <= r3  <= 0x00200000 (+2^21.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #292]
/*** baseaux 15 ***/
ldr.w r14, =64
mul.w r3, r4, r14
    //// bounds:  -0x0200000 (-2^21.0000) <= r3  <= 0x00200000 (+2^21.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #312]
str.w r12, [r1, #164]
str.w r11, [r1, #184]
str.w r10, [r1, #204]
str.w r9, [r1, #224]
str.w r8, [r1, #244]
str.w r7, [r1, #264]
str.w r6, [r1, #284]
str.w r4, [r1, #304]
ldr.w r12, [sp, #104]
ldr.w r11, [sp, #116]
ldr.w r10, [sp, #128]
ldr.w r9, [sp, #140]
ldr.w r8, [sp, #152]
ldr.w r7, [sp, #164]
ldr.w r6, [sp, #176]
ldr.w r4, [sp, #188]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r12 <= 0x00201bfc (+2^21.0049)
sub.w r8, r12, r8, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r8  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r11 <= 0x00201bfc (+2^21.0049)
sub.w r7, r11, r7, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r7  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r10 <= 0x00201bfc (+2^21.0049)
sub.w r6, r10, r6, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r6  <= 0x00201bfc (+2^21.0049)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #8
    //// bounds:  -0x0201bfc (-2^21.0049) <= r9  <= 0x00201bfc (+2^21.0049)
sub.w r4, r9, r4, lsl #9
    //// bounds:  -0x0201bfc (-2^21.0049) <= r4  <= 0x00201bfc (+2^21.0049)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r12 <= 0x0221dbbc (+2^25.0924)
add.w r10, r12, r10, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r10 <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #4
    //// bounds:  -0x221dbbc (-2^25.0924) <= r11 <= 0x0221dbbc (+2^25.0924)
add.w r9, r11, r9, lsl #5
    //// bounds:  -0x221dbbc (-2^25.0924) <= r9  <= 0x0221dbbc (+2^25.0924)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r6  <= 0x00010020 (+2^16.0007)
sub.w r8, r8, r6, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r8  <= 0x00221bfc (+2^21.0921)
add.w r6, r8, r6, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r6  <= 0x10221bfc (+2^28.0120)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000020 (-2^ 5.0000) <= r4  <= 0x00010020 (+2^16.0007)
sub.w r7, r7, r4, lsl #12
    //// bounds:  -0x10221bfc (-2^28.0120) <= r7  <= 0x00221bfc (+2^21.0921)
add.w r4, r7, r4, lsl #13
    //// bounds:  -0x0221bfc (-2^21.0921) <= r4  <= 0x10221bfc (+2^28.0120)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r11 <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r11, lsl #10
    //// bounds:  -0x62a5fbc (-2^26.6242) <= r12 <= 0x022a5fbc (+2^25.1147)
add.w r11, r12, r11, lsl #11
    //// bounds:  -0x22a5fbc (-2^25.1147) <= r11 <= 0x062a5fbc (+2^26.6242)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
add.w r10, r10, r9, lsl #2
    //// bounds:  -0xaa94aac (-2^27.4143) <= r10 <= 0x0aa94aac (+2^27.4143)
sub.w r9, r10, r9, lsl #3
    //// bounds:  -0xaa94aac (-2^27.4143) <= r9  <= 0x0aa94aac (+2^27.4143)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r7  <= 0x00011022 (+2^16.0882)
add.w r8, r8, r7, lsl #14
    //// bounds:  -0x142a9bfc (-2^28.3339) <= r8  <= 0x442a9bfc (+2^30.0910)
sub.w r7, r8, r7, lsl #15
    //// bounds:  -0x542a9bfc (-2^30.3952) <= r7  <= 0x042a9bfc (+2^26.0588)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001022 (-2^12.0119) <= r4  <= 0x00011022 (+2^16.0882)
sub.w r6, r6, r4, lsl #6
    //// bounds:  -0x066247c (-2^22.6744) <= r6  <= 0x1026247c (+2^28.0134)
add.w r4, r6, r4, lsl #7
    //// bounds:  -0x026247c (-2^21.2533) <= r4  <= 0x1066247c (+2^28.0355)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 8 ***/
ldr.w r14, =-1024
mul.w r3, r12, r14
    //// bounds:  -0x2000000 (-2^25.0000) <= r3  <= 0x02000000 (+2^25.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #176]
/*** baseaux 9 ***/
ldr.w r14, =1024
mul.w r3, r11, r14
    //// bounds:  -0x2000000 (-2^25.0000) <= r3  <= 0x02000000 (+2^25.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #196]
/*** baseaux 10 ***/
ldr.w r14, =4
mul.w r3, r10, r14
    //// bounds:  -0x0020000 (-2^17.0000) <= r3  <= 0x00020000 (+2^17.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #216]
/*** baseaux 11 ***/
ldr.w r14, =-4
mul.w r3, r9, r14
    //// bounds:  -0x0020000 (-2^17.0000) <= r3  <= 0x00020000 (+2^17.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #236]
/*** baseaux 12 ***/
ldr.w r14, =16384
mul.w r3, r8, r14
    //// bounds:  -0x20000000 (-2^29.0000) <= r3  <= 0x20000000 (+2^29.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #256]
/*** baseaux 13 ***/
ldr.w r14, =-16384
mul.w r3, r7, r14
    //// bounds:  -0x20000000 (-2^29.0000) <= r3  <= 0x20000000 (+2^29.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #276]
/*** baseaux 14 ***/
ldr.w r14, =-64
mul.w r3, r6, r14
    //// bounds:  -0x0200000 (-2^21.0000) <= r3  <= 0x00200000 (+2^21.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #296]
/*** baseaux 15 ***/
ldr.w r14, =64
mul.w r3, r4, r14
    //// bounds:  -0x0200000 (-2^21.0000) <= r3  <= 0x00200000 (+2^21.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #316]
str.w r12, [r1, #168]
str.w r11, [r1, #188]
str.w r10, [r1, #208]
str.w r9, [r1, #228]
str.w r8, [r1, #248]
str.w r7, [r1, #268]
str.w r6, [r1, #288]
str.w r4, [r1, #308]
ldr.w r12, [sp, #192]
ldr.w r11, [sp, #204]
ldr.w r10, [sp, #216]
ldr.w r9, [sp, #228]
ldr.w r8, [sp, #240]
ldr.w r7, [sp, #252]
ldr.w r6, [sp, #264]
ldr.w r4, [sp, #276]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r12 <= 0x0110edde (+2^24.0924)
add.w r8, r12, r8, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r8  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r11 <= 0x0110edde (+2^24.0924)
add.w r7, r11, r7, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r7  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r10 <= 0x0110edde (+2^24.0924)
add.w r6, r10, r6, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r6  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r9  <= 0x0110edde (+2^24.0924)
add.w r4, r9, r4, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r4  <= 0x0110edde (+2^24.0924)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r10 <= 0x00010110 (+2^16.0060)
sub.w r12, r12, r10, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r12 <= 0x01152dde (+2^24.1147)
add.w r10, r12, r10, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r10 <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r9  <= 0x00010110 (+2^16.0060)
sub.w r11, r11, r9, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r11 <= 0x01152dde (+2^24.1147)
add.w r9, r11, r9, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r9  <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
add.w r8, r8, r6, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r8  <= 0x0554a556 (+2^26.4143)
sub.w r6, r8, r6, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r6  <= 0x0554a556 (+2^26.4143)
/*** LAYER 5 ***/
add.w r7, r7, r4, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r7  <= 0x0554a556 (+2^26.4143)
sub.w r4, r7, r4, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r4  <= 0x0554a556 (+2^26.4143)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r11 <= 0x00010515 (+2^16.0284)
sub.w r12, r12, r11, lsl #13
    //// bounds:  -0x25b7cdde (-2^29.2372) <= r12 <= 0x01b7cdde (+2^24.7807)
add.w r11, r12, r11, lsl #14
    //// bounds:  -0x5b7cdde (-2^26.5155) <= r11 <= 0x21b7cdde (+2^29.0754)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r9, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r9  <= 0x00010515 (+2^16.0284)
add.w r10, r10, r9, lsl #5
    //// bounds:  -0x115d07e (-2^24.1180) <= r10 <= 0x0535d07e (+2^26.3813)
sub.w r9, r10, r9, lsl #6
    //// bounds:  -0x135d07e (-2^24.2753) <= r9  <= 0x0515d07e (+2^26.3463)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #1
    //// bounds:  -0xffdf002 (-2^27.9993) <= r8  <= 0x0ffdf002 (+2^27.9993)
add.w r7, r8, r7, lsl #2
    //// bounds:  -0xffdf002 (-2^27.9993) <= r7  <= 0x0ffdf002 (+2^27.9993)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r4  <= 0x00010554 (+2^16.0297)
sub.w r6, r6, r4, lsl #9
    //// bounds:  -0x75f4d56 (-2^26.8821) <= r6  <= 0x055f4d56 (+2^26.4255)
add.w r4, r6, r4, lsl #10
    //// bounds:  -0x55f4d56 (-2^26.4255) <= r4  <= 0x075f4d56 (+2^26.8821)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #320]
str.w r11, [r1, #340]
str.w r10, [r1, #360]
str.w r9, [r1, #380]
str.w r8, [r1, #400]
str.w r7, [r1, #420]
str.w r6, [r1, #440]
str.w r4, [r1, #460]
ldr.w r12, [sp, #196]
ldr.w r11, [sp, #208]
ldr.w r10, [sp, #220]
ldr.w r9, [sp, #232]
ldr.w r8, [sp, #244]
ldr.w r7, [sp, #256]
ldr.w r6, [sp, #268]
ldr.w r4, [sp, #280]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r12 <= 0x0110edde (+2^24.0924)
add.w r8, r12, r8, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r8  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r11 <= 0x0110edde (+2^24.0924)
add.w r7, r11, r7, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r7  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r10 <= 0x0110edde (+2^24.0924)
add.w r6, r10, r6, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r6  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r9  <= 0x0110edde (+2^24.0924)
add.w r4, r9, r4, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r4  <= 0x0110edde (+2^24.0924)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r10 <= 0x00010110 (+2^16.0060)
sub.w r12, r12, r10, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r12 <= 0x01152dde (+2^24.1147)
add.w r10, r12, r10, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r10 <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r9  <= 0x00010110 (+2^16.0060)
sub.w r11, r11, r9, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r11 <= 0x01152dde (+2^24.1147)
add.w r9, r11, r9, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r9  <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
add.w r8, r8, r6, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r8  <= 0x0554a556 (+2^26.4143)
sub.w r6, r8, r6, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r6  <= 0x0554a556 (+2^26.4143)
/*** LAYER 5 ***/
add.w r7, r7, r4, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r7  <= 0x0554a556 (+2^26.4143)
sub.w r4, r7, r4, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r4  <= 0x0554a556 (+2^26.4143)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r11 <= 0x00010515 (+2^16.0284)
sub.w r12, r12, r11, lsl #13
    //// bounds:  -0x25b7cdde (-2^29.2372) <= r12 <= 0x01b7cdde (+2^24.7807)
add.w r11, r12, r11, lsl #14
    //// bounds:  -0x5b7cdde (-2^26.5155) <= r11 <= 0x21b7cdde (+2^29.0754)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r9, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r9  <= 0x00010515 (+2^16.0284)
add.w r10, r10, r9, lsl #5
    //// bounds:  -0x115d07e (-2^24.1180) <= r10 <= 0x0535d07e (+2^26.3813)
sub.w r9, r10, r9, lsl #6
    //// bounds:  -0x135d07e (-2^24.2753) <= r9  <= 0x0515d07e (+2^26.3463)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #1
    //// bounds:  -0xffdf002 (-2^27.9993) <= r8  <= 0x0ffdf002 (+2^27.9993)
add.w r7, r8, r7, lsl #2
    //// bounds:  -0xffdf002 (-2^27.9993) <= r7  <= 0x0ffdf002 (+2^27.9993)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r4  <= 0x00010554 (+2^16.0297)
sub.w r6, r6, r4, lsl #9
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x75f4d56 (-2^26.8821) <= r6  <= 0x055f4d56 (+2^26.4255)
add.w r4, r6, r4, lsl #10
    //// bounds:  -0x55f4d56 (-2^26.4255) <= r4  <= 0x075f4d56 (+2^26.8821)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 16 ***/
ldr.w r14, =-8192
mul.w r3, r12, r14
    //// bounds:  -0x10000000 (-2^28.0000) <= r3  <= 0x10000000 (+2^28.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #332]
/*** baseaux 17 ***/
ldr.w r14, =8192
mul.w r3, r11, r14
    //// bounds:  -0x10000000 (-2^28.0000) <= r3  <= 0x10000000 (+2^28.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #352]
/*** baseaux 18 ***/
ldr.w r14, =32
mul.w r3, r10, r14
    //// bounds:  -0x0100000 (-2^20.0000) <= r3  <= 0x00100000 (+2^20.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #372]
/*** baseaux 19 ***/
ldr.w r14, =-32
mul.w r3, r9, r14
    //// bounds:  -0x0100000 (-2^20.0000) <= r3  <= 0x00100000 (+2^20.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #392]
/*** baseaux 20 ***/
ldr.w r14, =-2
mul.w r3, r8, r14
    //// bounds:  -0x0010000 (-2^16.0000) <= r3  <= 0x00010000 (+2^16.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #412]
/*** baseaux 21 ***/
ldr.w r14, =2
mul.w r3, r7, r14
    //// bounds:  -0x0010000 (-2^16.0000) <= r3  <= 0x00010000 (+2^16.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #432]
/*** baseaux 22 ***/
ldr.w r14, =-512
mul.w r3, r6, r14
    //// bounds:  -0x1000000 (-2^24.0000) <= r3  <= 0x01000000 (+2^24.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #452]
/*** baseaux 23 ***/
ldr.w r14, =512
mul.w r3, r4, r14
    //// bounds:  -0x1000000 (-2^24.0000) <= r3  <= 0x01000000 (+2^24.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #472]
str.w r12, [r1, #324]
str.w r11, [r1, #344]
str.w r10, [r1, #364]
str.w r9, [r1, #384]
str.w r8, [r1, #404]
str.w r7, [r1, #424]
str.w r6, [r1, #444]
str.w r4, [r1, #464]
ldr.w r12, [sp, #200]
ldr.w r11, [sp, #212]
ldr.w r10, [sp, #224]
ldr.w r9, [sp, #236]
ldr.w r8, [sp, #248]
ldr.w r7, [sp, #260]
ldr.w r6, [sp, #272]
ldr.w r4, [sp, #284]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r12 <= 0x0110edde (+2^24.0924)
add.w r8, r12, r8, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r8  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r11 <= 0x0110edde (+2^24.0924)
add.w r7, r11, r7, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r7  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r10 <= 0x0110edde (+2^24.0924)
add.w r6, r10, r6, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r6  <= 0x0110edde (+2^24.0924)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #4
    //// bounds:  -0x110edde (-2^24.0924) <= r9  <= 0x0110edde (+2^24.0924)
add.w r4, r9, r4, lsl #5
    //// bounds:  -0x110edde (-2^24.0924) <= r4  <= 0x0110edde (+2^24.0924)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r10 <= 0x00010110 (+2^16.0060)
sub.w r12, r12, r10, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r12 <= 0x01152dde (+2^24.1147)
add.w r10, r12, r10, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r10 <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000110 (-2^ 8.0875) <= r9  <= 0x00010110 (+2^16.0060)
sub.w r11, r11, r9, lsl #10
    //// bounds:  -0x5152dde (-2^26.3456) <= r11 <= 0x01152dde (+2^24.1147)
add.w r9, r11, r9, lsl #11
    //// bounds:  -0x1152dde (-2^24.1147) <= r9  <= 0x05152dde (+2^26.3456)
/*** LAYER 5 ***/
add.w r8, r8, r6, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r8  <= 0x0554a556 (+2^26.4143)
sub.w r6, r8, r6, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r6  <= 0x0554a556 (+2^26.4143)
/*** LAYER 5 ***/
add.w r7, r7, r4, lsl #2
    //// bounds:  -0x554a556 (-2^26.4143) <= r7  <= 0x0554a556 (+2^26.4143)
sub.w r4, r7, r4, lsl #3
    //// bounds:  -0x554a556 (-2^26.4143) <= r4  <= 0x0554a556 (+2^26.4143)
/*** LAYER 6 ***/
RED1 r11, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r11 <= 0x00010515 (+2^16.0284)
sub.w r12, r12, r11, lsl #13
    //// bounds:  -0x25b7cdde (-2^29.2372) <= r12 <= 0x01b7cdde (+2^24.7807)
add.w r11, r12, r11, lsl #14
    //// bounds:  -0x5b7cdde (-2^26.5155) <= r11 <= 0x21b7cdde (+2^29.0754)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r9, r3
    //// bounds:  -0x0000515 (-2^10.3454) <= r9  <= 0x00010515 (+2^16.0284)
add.w r10, r10, r9, lsl #5
    //// bounds:  -0x115d07e (-2^24.1180) <= r10 <= 0x0535d07e (+2^26.3813)
sub.w r9, r10, r9, lsl #6
    //// bounds:  -0x135d07e (-2^24.2753) <= r9  <= 0x0515d07e (+2^26.3463)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
sub.w r8, r8, r7, lsl #1
    //// bounds:  -0xffdf002 (-2^27.9993) <= r8  <= 0x0ffdf002 (+2^27.9993)
add.w r7, r8, r7, lsl #2
    //// bounds:  -0xffdf002 (-2^27.9993) <= r7  <= 0x0ffdf002 (+2^27.9993)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r4  <= 0x00010554 (+2^16.0297)
sub.w r6, r6, r4, lsl #9
    //// bounds:  -0x75f4d56 (-2^26.8821) <= r6  <= 0x055f4d56 (+2^26.4255)
add.w r4, r6, r4, lsl #10
    //// bounds:  -0x55f4d56 (-2^26.4255) <= r4  <= 0x075f4d56 (+2^26.8821)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 16 ***/
ldr.w r14, =-8192
mul.w r3, r12, r14
    //// bounds:  -0x10000000 (-2^28.0000) <= r3  <= 0x10000000 (+2^28.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #336]
/*** baseaux 17 ***/
ldr.w r14, =8192
mul.w r3, r11, r14
    //// bounds:  -0x10000000 (-2^28.0000) <= r3  <= 0x10000000 (+2^28.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #356]
/*** baseaux 18 ***/
ldr.w r14, =32
mul.w r3, r10, r14
    //// bounds:  -0x0100000 (-2^20.0000) <= r3  <= 0x00100000 (+2^20.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #376]
/*** baseaux 19 ***/
ldr.w r14, =-32
mul.w r3, r9, r14
    //// bounds:  -0x0100000 (-2^20.0000) <= r3  <= 0x00100000 (+2^20.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #396]
/*** baseaux 20 ***/
ldr.w r14, =-2
mul.w r3, r8, r14
    //// bounds:  -0x0010000 (-2^16.0000) <= r3  <= 0x00010000 (+2^16.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #416]
/*** baseaux 21 ***/
ldr.w r14, =2
mul.w r3, r7, r14
    //// bounds:  -0x0010000 (-2^16.0000) <= r3  <= 0x00010000 (+2^16.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #436]
/*** baseaux 22 ***/
ldr.w r14, =-512
mul.w r3, r6, r14
    //// bounds:  -0x1000000 (-2^24.0000) <= r3  <= 0x01000000 (+2^24.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #456]
/*** baseaux 23 ***/
ldr.w r14, =512
mul.w r3, r4, r14
    //// bounds:  -0x1000000 (-2^24.0000) <= r3  <= 0x01000000 (+2^24.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #476]
str.w r12, [r1, #328]
str.w r11, [r1, #348]
str.w r10, [r1, #368]
str.w r9, [r1, #388]
str.w r8, [r1, #408]
str.w r7, [r1, #428]
str.w r6, [r1, #448]
str.w r4, [r1, #468]
ldr.w r12, [sp, #288]
ldr.w r11, [sp, #300]
ldr.w r10, [sp, #312]
ldr.w r9, [sp, #324]
ldr.w r8, [sp, #336]
ldr.w r7, [sp, #348]
ldr.w r6, [sp, #360]
ldr.w r4, [sp, #372]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r8  <= 0x00010010 (+2^16.0004)
sub.w r12, r12, r8, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r12 <= 0x00110dfe (+2^20.0921)
add.w r8, r12, r8, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r8  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r7  <= 0x00010010 (+2^16.0004)
sub.w r11, r11, r7, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r11 <= 0x00110dfe (+2^20.0921)
add.w r7, r11, r7, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r7  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r6  <= 0x00010010 (+2^16.0004)
sub.w r10, r10, r6, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r10 <= 0x00110dfe (+2^20.0921)
add.w r6, r10, r6, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r6  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r4  <= 0x00010010 (+2^16.0004)
sub.w r9, r9, r4, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r9  <= 0x00110dfe (+2^20.0921)
add.w r4, r9, r4, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r4  <= 0x10110dfe (+2^28.0060)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r10 <= 0x00011011 (+2^16.0878)
add.w r12, r12, r10, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r12 <= 0x44154dfe (+2^30.0892)
sub.w r10, r12, r10, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r10 <= 0x04154dfe (+2^26.0297)
RED1 r12, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r12 <= 0x00014415 (+2^16.3402)
RED1 r10, r3
    //// bounds:  -0x0005415 (-2^14.3937) <= r10 <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r9  <= 0x00011011 (+2^16.0878)
add.w r11, r11, r9, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r11 <= 0x44154dfe (+2^30.0892)
sub.w r9, r11, r9, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r9  <= 0x04154dfe (+2^26.0297)
RED1 r11, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r11 <= 0x00014415 (+2^16.3402)
RED1 r9, r3
    //// bounds:  -0x0005415 (-2^14.3937) <= r9  <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r6  <= 0x00011011 (+2^16.0878)
sub.w r8, r8, r6, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r8  <= 0x1015123e (+2^28.0074)
add.w r6, r8, r6, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r6  <= 0x1055123e (+2^28.0297)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r4  <= 0x00011011 (+2^16.0878)
sub.w r7, r7, r4, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r7  <= 0x1015123e (+2^28.0074)
add.w r4, r7, r4, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r4  <= 0x1055123e (+2^28.0297)
/*** LAYER 6 ***/
sub.w r12, r12, r11, lsl #7
    //// bounds:  -0x0a24e95 (-2^23.3426) <= r12 <= 0x00234e95 (+2^21.1419)
add.w r11, r12, r11, lsl #8
    //// bounds:  -0x0224e95 (-2^21.1004) <= r11 <= 0x00a34e95 (+2^23.3514)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r9, lsl #15
    //// bounds:  -0x40005415 (-2^30.0000) <= r10 <= 0x40015415 (+2^30.0001)
sub.w r9, r10, r9
    //// bounds:  -0x4000d415 (-2^30.0001) <= r9  <= 0x4001d415 (+2^30.0002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001015 (-2^12.0074) <= r7  <= 0x00011015 (+2^16.0879)
add.w r8, r8, r7, lsl #11
    //// bounds:  -0x0d5ba3e (-2^23.7396) <= r8  <= 0x1895ba3e (+2^28.6197)
sub.w r7, r8, r7, lsl #12
    //// bounds:  -0x8d5ba3e (-2^27.1432) <= r7  <= 0x1095ba3e (+2^28.0518)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
sub.w r6, r6, r4, lsl #3
    //// bounds:  -0x01d94e6 (-2^20.8866) <= r6  <= 0x105594e6 (+2^28.0298)
add.w r4, r6, r4, lsl #4
    //// bounds:  -0x01594e6 (-2^20.4317) <= r4  <= 0x105d94e6 (+2^28.0326)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #480]
str.w r11, [r1, #500]
str.w r10, [r1, #520]
str.w r9, [r1, #540]
str.w r8, [r1, #560]
str.w r7, [r1, #580]
str.w r6, [r1, #600]
str.w r4, [r1, #620]
ldr.w r12, [sp, #292]
ldr.w r11, [sp, #304]
ldr.w r10, [sp, #316]
ldr.w r9, [sp, #328]
ldr.w r8, [sp, #340]
ldr.w r7, [sp, #352]
ldr.w r6, [sp, #364]
ldr.w r4, [sp, #376]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r8  <= 0x00010010 (+2^16.0004)
sub.w r12, r12, r8, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r12 <= 0x00110dfe (+2^20.0921)
add.w r8, r12, r8, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r8  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r7  <= 0x00010010 (+2^16.0004)
sub.w r11, r11, r7, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r11 <= 0x00110dfe (+2^20.0921)
add.w r7, r11, r7, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r7  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r6  <= 0x00010010 (+2^16.0004)
sub.w r10, r10, r6, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r10 <= 0x00110dfe (+2^20.0921)
add.w r6, r10, r6, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r6  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r4  <= 0x00010010 (+2^16.0004)
sub.w r9, r9, r4, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r9  <= 0x00110dfe (+2^20.0921)
add.w r4, r9, r4, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r4  <= 0x10110dfe (+2^28.0060)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r10 <= 0x00011011 (+2^16.0878)
add.w r12, r12, r10, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r12 <= 0x44154dfe (+2^30.0892)
sub.w r10, r12, r10, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r10 <= 0x04154dfe (+2^26.0297)
RED1 r12, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r12 <= 0x00014415 (+2^16.3402)
RED1 r10, r3
    //// bounds:  -0x0005415 (-2^14.3937) <= r10 <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r9  <= 0x00011011 (+2^16.0878)
add.w r11, r11, r9, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r11 <= 0x44154dfe (+2^30.0892)
sub.w r9, r11, r9, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r9  <= 0x04154dfe (+2^26.0297)
RED1 r11, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r11 <= 0x00014415 (+2^16.3402)
RED1 r9, r3
    //// bounds:  -0x0005415 (-2^14.3937) <= r9  <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r6  <= 0x00011011 (+2^16.0878)
sub.w r8, r8, r6, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r8  <= 0x1015123e (+2^28.0074)
add.w r6, r8, r6, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r6  <= 0x1055123e (+2^28.0297)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r4  <= 0x00011011 (+2^16.0878)
sub.w r7, r7, r4, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r7  <= 0x1015123e (+2^28.0074)
add.w r4, r7, r4, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r4  <= 0x1055123e (+2^28.0297)
/*** LAYER 6 ***/
sub.w r12, r12, r11, lsl #7
    //// bounds:  -0x0a24e95 (-2^23.3426) <= r12 <= 0x00234e95 (+2^21.1419)
add.w r11, r12, r11, lsl #8
    //// bounds:  -0x0224e95 (-2^21.1004) <= r11 <= 0x00a34e95 (+2^23.3514)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r9, lsl #15
    //// bounds:  -0x40005415 (-2^30.0000) <= r10 <= 0x40015415 (+2^30.0001)
sub.w r9, r10, r9
    //// bounds:  -0x4000d415 (-2^30.0001) <= r9  <= 0x4001d415 (+2^30.0002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001015 (-2^12.0074) <= r7  <= 0x00011015 (+2^16.0879)
add.w r8, r8, r7, lsl #11
    //// bounds:  -0x0d5ba3e (-2^23.7396) <= r8  <= 0x1895ba3e (+2^28.6197)
sub.w r7, r8, r7, lsl #12
    //// bounds:  -0x8d5ba3e (-2^27.1432) <= r7  <= 0x1095ba3e (+2^28.0518)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
sub.w r6, r6, r4, lsl #3
    //// bounds:  -0x01d94e6 (-2^20.8866) <= r6  <= 0x105594e6 (+2^28.0298)
add.w r4, r6, r4, lsl #4
    //// bounds:  -0x01594e6 (-2^20.4317) <= r4  <= 0x105d94e6 (+2^28.0326)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 24 ***/
ldr.w r14, =-128
mul.w r3, r12, r14
    //// bounds:  -0x0400000 (-2^22.0000) <= r3  <= 0x00400000 (+2^22.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #492]
/*** baseaux 25 ***/
ldr.w r14, =128
mul.w r3, r11, r14
    //// bounds:  -0x0400000 (-2^22.0000) <= r3  <= 0x00400000 (+2^22.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #512]
/*** baseaux 26 ***/
ldr.w r14, =-32768
mul.w r3, r10, r14
    //// bounds:  -0x40000000 (-2^30.0000) <= r3  <= 0x40000000 (+2^30.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #532]
/*** baseaux 27 ***/
ldr.w r14, =32768
mul.w r3, r9, r14
    //// bounds:  -0x40000000 (-2^30.0000) <= r3  <= 0x40000000 (+2^30.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #552]
/*** baseaux 28 ***/
ldr.w r14, =2048
mul.w r3, r8, r14
    //// bounds:  -0x4000000 (-2^26.0000) <= r3  <= 0x04000000 (+2^26.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #572]
/*** baseaux 29 ***/
ldr.w r14, =-2048
mul.w r3, r7, r14
    //// bounds:  -0x4000000 (-2^26.0000) <= r3  <= 0x04000000 (+2^26.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #592]
/*** baseaux 30 ***/
ldr.w r14, =-8
mul.w r3, r6, r14
    //// bounds:  -0x0040000 (-2^18.0000) <= r3  <= 0x00040000 (+2^18.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #612]
/*** baseaux 31 ***/
ldr.w r14, =8
mul.w r3, r4, r14
    //// bounds:  -0x0040000 (-2^18.0000) <= r3  <= 0x00040000 (+2^18.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #632]
str.w r12, [r1, #484]
str.w r11, [r1, #504]
str.w r10, [r1, #524]
str.w r9, [r1, #544]
str.w r8, [r1, #564]
str.w r7, [r1, #584]
str.w r6, [r1, #604]
str.w r4, [r1, #624]
ldr.w r12, [sp, #296]
ldr.w r11, [sp, #308]
ldr.w r10, [sp, #320]
ldr.w r9, [sp, #332]
ldr.w r8, [sp, #344]
ldr.w r7, [sp, #356]
ldr.w r6, [sp, #368]
ldr.w r4, [sp, #380]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r8  <= 0x00010010 (+2^16.0004)
sub.w r12, r12, r8, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r12 <= 0x00110dfe (+2^20.0921)
add.w r8, r12, r8, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r8  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r7  <= 0x00010010 (+2^16.0004)
sub.w r11, r11, r7, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r11 <= 0x00110dfe (+2^20.0921)
add.w r7, r11, r7, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r7  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r6  <= 0x00010010 (+2^16.0004)
sub.w r10, r10, r6, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r10 <= 0x00110dfe (+2^20.0921)
add.w r6, r10, r6, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r6  <= 0x10110dfe (+2^28.0060)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000010 (-2^ 4.0000) <= r4  <= 0x00010010 (+2^16.0004)
sub.w r9, r9, r4, lsl #12
    //// bounds:  -0x10110dfe (-2^28.0060) <= r9  <= 0x00110dfe (+2^20.0921)
add.w r4, r9, r4, lsl #13
    //// bounds:  -0x0110dfe (-2^20.0921) <= r4  <= 0x10110dfe (+2^28.0060)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r10 <= 0x00011011 (+2^16.0878)
add.w r12, r12, r10, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r12 <= 0x44154dfe (+2^30.0892)
sub.w r10, r12, r10, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r10 <= 0x04154dfe (+2^26.0297)
RED1 r12, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r12 <= 0x00014415 (+2^16.3402)
RED1 r10, r3
    //// bounds:  -0x0005415 (-2^14.3937) <= r10 <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r9  <= 0x00011011 (+2^16.0878)
add.w r11, r11, r9, lsl #14
    //// bounds:  -0x14154dfe (-2^28.3279) <= r11 <= 0x44154dfe (+2^30.0892)
sub.w r9, r11, r9, lsl #15
    //// bounds:  -0x54154dfe (-2^30.3937) <= r9  <= 0x04154dfe (+2^26.0297)
RED1 r11, r3
    //// bounds:  -0x0004415 (-2^14.0892) <= r11 <= 0x00014415 (+2^16.3402)
RED1 r9, r3
    //// bounds:  -0x0005415 (-2^14.3937) <= r9  <= 0x00015415 (+2^16.4097)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r6  <= 0x00011011 (+2^16.0878)
sub.w r8, r8, r6, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r8  <= 0x1015123e (+2^28.0074)
add.w r6, r8, r6, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r6  <= 0x1055123e (+2^28.0297)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0001011 (-2^12.0060) <= r4  <= 0x00011011 (+2^16.0878)
sub.w r7, r7, r4, lsl #6
    //// bounds:  -0x055123e (-2^22.4106) <= r7  <= 0x1015123e (+2^28.0074)
add.w r4, r7, r4, lsl #7
    //// bounds:  -0x015123e (-2^20.3972) <= r4  <= 0x1055123e (+2^28.0297)
/*** LAYER 6 ***/
sub.w r12, r12, r11, lsl #7
    //// bounds:  -0x0a24e95 (-2^23.3426) <= r12 <= 0x00234e95 (+2^21.1419)
add.w r11, r12, r11, lsl #8
    //// bounds:  -0x0224e95 (-2^21.1004) <= r11 <= 0x00a34e95 (+2^23.3514)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r9, lsl #15
    //// bounds:  -0x40005415 (-2^30.0000) <= r10 <= 0x40015415 (+2^30.0001)
sub.w r9, r10, r9
    //// bounds:  -0x4000d415 (-2^30.0001) <= r9  <= 0x4001d415 (+2^30.0002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r7, r3
    //// bounds:  -0x0001015 (-2^12.0074) <= r7  <= 0x00011015 (+2^16.0879)
add.w r8, r8, r7, lsl #11
    //// bounds:  -0x0d5ba3e (-2^23.7396) <= r8  <= 0x1895ba3e (+2^28.6197)
sub.w r7, r8, r7, lsl #12
    //// bounds:  -0x8d5ba3e (-2^27.1432) <= r7  <= 0x1095ba3e (+2^28.0518)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
sub.w r6, r6, r4, lsl #3
    //// bounds:  -0x01d94e6 (-2^20.8866) <= r6  <= 0x105594e6 (+2^28.0298)
add.w r4, r6, r4, lsl #4
    //// bounds:  -0x01594e6 (-2^20.4317) <= r4  <= 0x105d94e6 (+2^28.0326)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 24 ***/
ldr.w r14, =-128
mul.w r3, r12, r14
    //// bounds:  -0x0400000 (-2^22.0000) <= r3  <= 0x00400000 (+2^22.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #496]
/*** baseaux 25 ***/
ldr.w r14, =128
mul.w r3, r11, r14
    //// bounds:  -0x0400000 (-2^22.0000) <= r3  <= 0x00400000 (+2^22.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #516]
/*** baseaux 26 ***/
ldr.w r14, =-32768
mul.w r3, r10, r14
    //// bounds:  -0x40000000 (-2^30.0000) <= r3  <= 0x40000000 (+2^30.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #536]
/*** baseaux 27 ***/
ldr.w r14, =32768
mul.w r3, r9, r14
    //// bounds:  -0x40000000 (-2^30.0000) <= r3  <= 0x40000000 (+2^30.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #556]
/*** baseaux 28 ***/
ldr.w r14, =2048
mul.w r3, r8, r14
    //// bounds:  -0x4000000 (-2^26.0000) <= r3  <= 0x04000000 (+2^26.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #576]
/*** baseaux 29 ***/
ldr.w r14, =-2048
mul.w r3, r7, r14
    //// bounds:  -0x4000000 (-2^26.0000) <= r3  <= 0x04000000 (+2^26.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #596]
/*** baseaux 30 ***/
ldr.w r14, =-8
mul.w r3, r6, r14
    //// bounds:  -0x0040000 (-2^18.0000) <= r3  <= 0x00040000 (+2^18.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #616]
/*** baseaux 31 ***/
ldr.w r14, =8
mul.w r3, r4, r14
    //// bounds:  -0x0040000 (-2^18.0000) <= r3  <= 0x00040000 (+2^18.0000)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #636]
str.w r12, [r1, #488]
str.w r11, [r1, #508]
str.w r10, [r1, #528]
str.w r9, [r1, #548]
str.w r8, [r1, #568]
str.w r7, [r1, #588]
str.w r6, [r1, #608]
str.w r4, [r1, #628]
ldr.w r12, [sp, #384]
ldr.w r11, [sp, #396]
ldr.w r10, [sp, #408]
ldr.w r9, [sp, #420]
ldr.w r8, [sp, #432]
ldr.w r7, [sp, #444]
ldr.w r6, [sp, #456]
ldr.w r4, [sp, #468]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r8  <= 0x00010088 (+2^16.0030)
sub.w r12, r12, r8, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r12 <= 0x008a96ef (+2^23.1147)
add.w r8, r12, r8, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r8  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r7  <= 0x00010088 (+2^16.0030)
sub.w r11, r11, r7, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r11 <= 0x008a96ef (+2^23.1147)
add.w r7, r11, r7, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r7  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r6  <= 0x00010088 (+2^16.0030)
sub.w r10, r10, r6, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r10 <= 0x008a96ef (+2^23.1147)
add.w r6, r10, r6, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r6  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r4  <= 0x00010088 (+2^16.0030)
sub.w r9, r9, r4, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r9  <= 0x008a96ef (+2^23.1147)
add.w r4, r9, r4, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r4  <= 0x048a96ef (+2^26.1831)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r10 <= 0x0001048a (+2^16.0254)
sub.w r12, r12, r10, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r12 <= 0x011bd6ef (+2^24.1489)
add.w r10, r12, r10, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r10 <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r9  <= 0x0001048a (+2^16.0254)
sub.w r11, r11, r9, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r11 <= 0x011bd6ef (+2^24.1489)
add.w r9, r11, r9, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r9  <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r6  <= 0x0001048a (+2^16.0254)
add.w r8, r8, r6, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r8  <= 0x04ab282f (+2^26.2230)
sub.w r6, r8, r6, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r6  <= 0x048b282f (+2^26.1838)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r4  <= 0x0001048a (+2^16.0254)
add.w r7, r7, r4, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r7  <= 0x04ab282f (+2^26.2230)
sub.w r4, r7, r4, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r4  <= 0x048b282f (+2^26.1838)
/*** LAYER 6 ***/
ldr.w r14, =1020
RED1 r11, r3
    //// bounds:  -0x000251b (-2^13.2136) <= r11 <= 0x0001251b (+2^16.1953)
mul.w r11, r11, r14
    //// bounds:  -0x093d794 (-2^23.2079) <= r11 <= 0x048fd794 (+2^26.1896)
add.w r12, r12, r11
    //// bounds:  -0x25afae83 (-2^29.2360) <= r12 <= 0x05abae83 (+2^26.5035)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x29abae83 (-2^29.3810) <= r11 <= 0x01afae83 (+2^24.7538)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =1028
RED1 r9, r3
    //// bounds:  -0x000211b (-2^13.0490) <= r9  <= 0x0001211b (+2^16.1755)
mul.w r9, r9, r14
    //// bounds:  -0x084f06c (-2^23.0546) <= r9  <= 0x0488f06c (+2^26.1811)
sub.w r10, r10, r9
    //// bounds:  -0x9a4c75b (-2^27.2696) <= r10 <= 0x21a0c75b (+2^29.0716)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x5a0c75b (-2^26.4926) <= r9  <= 0x25a4c75b (+2^29.2343)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-16320
RED1 r7, r3
    //// bounds:  -0x00004ab (-2^10.2228) <= r7  <= 0x000104ab (+2^16.0261)
mul.w r7, r7, r14
    //// bounds:  -0x40e99540 (-2^30.0204) <= r7  <= 0x01299540 (+2^24.2171)
add.w r8, r8, r7
    //// bounds:  -0x4174bd6f (-2^30.0325) <= r8  <= 0x05d4bd6f (+2^26.5437)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x1b4bd6f (-2^24.7706) <= r7  <= 0x4594bd6f (+2^30.1206)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =16448
RED1 r4, r3
    //// bounds:  -0x000048b (-2^10.1836) <= r4  <= 0x0001048b (+2^16.0254)
mul.w r4, r4, r14
    //// bounds:  -0x123e2c0 (-2^24.1893) <= r4  <= 0x4163e2c0 (+2^30.0310)
add.w r6, r6, r4
    //// bounds:  -0x1cf0aef (-2^24.8550) <= r6  <= 0x45ef0aef (+2^30.1279)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x420f0aef (-2^30.0457) <= r4  <= 0x05af0aef (+2^26.5068)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #640]
str.w r11, [r1, #660]
str.w r10, [r1, #680]
str.w r9, [r1, #700]
str.w r8, [r1, #720]
str.w r7, [r1, #740]
str.w r6, [r1, #760]
str.w r4, [r1, #780]
ldr.w r12, [sp, #388]
ldr.w r11, [sp, #400]
ldr.w r10, [sp, #412]
ldr.w r9, [sp, #424]
ldr.w r8, [sp, #436]
ldr.w r7, [sp, #448]
ldr.w r6, [sp, #460]
ldr.w r4, [sp, #472]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r8  <= 0x00010088 (+2^16.0030)
sub.w r12, r12, r8, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r12 <= 0x008a96ef (+2^23.1147)
add.w r8, r12, r8, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r8  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r7  <= 0x00010088 (+2^16.0030)
sub.w r11, r11, r7, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r11 <= 0x008a96ef (+2^23.1147)
add.w r7, r11, r7, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r7  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r6  <= 0x00010088 (+2^16.0030)
sub.w r10, r10, r6, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r10 <= 0x008a96ef (+2^23.1147)
add.w r6, r10, r6, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r6  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r4  <= 0x00010088 (+2^16.0030)
sub.w r9, r9, r4, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r9  <= 0x008a96ef (+2^23.1147)
add.w r4, r9, r4, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r4  <= 0x048a96ef (+2^26.1831)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r10 <= 0x0001048a (+2^16.0254)
sub.w r12, r12, r10, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r12 <= 0x011bd6ef (+2^24.1489)
add.w r10, r12, r10, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r10 <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r9  <= 0x0001048a (+2^16.0254)
sub.w r11, r11, r9, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r11 <= 0x011bd6ef (+2^24.1489)
add.w r9, r11, r9, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r9  <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r6  <= 0x0001048a (+2^16.0254)
add.w r8, r8, r6, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r8  <= 0x04ab282f (+2^26.2230)
sub.w r6, r8, r6, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r6  <= 0x048b282f (+2^26.1838)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r4  <= 0x0001048a (+2^16.0254)
add.w r7, r7, r4, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r7  <= 0x04ab282f (+2^26.2230)
sub.w r4, r7, r4, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r4  <= 0x048b282f (+2^26.1838)
/*** LAYER 6 ***/
ldr.w r14, =1020
RED1 r11, r3
    //// bounds:  -0x000251b (-2^13.2136) <= r11 <= 0x0001251b (+2^16.1953)
mul.w r11, r11, r14
    //// bounds:  -0x093d794 (-2^23.2079) <= r11 <= 0x048fd794 (+2^26.1896)
add.w r12, r12, r11
    //// bounds:  -0x25afae83 (-2^29.2360) <= r12 <= 0x05abae83 (+2^26.5035)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x29abae83 (-2^29.3810) <= r11 <= 0x01afae83 (+2^24.7538)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =1028
RED1 r9, r3
    //// bounds:  -0x000211b (-2^13.0490) <= r9  <= 0x0001211b (+2^16.1755)
mul.w r9, r9, r14
    //// bounds:  -0x084f06c (-2^23.0546) <= r9  <= 0x0488f06c (+2^26.1811)
sub.w r10, r10, r9
    //// bounds:  -0x9a4c75b (-2^27.2696) <= r10 <= 0x21a0c75b (+2^29.0716)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x5a0c75b (-2^26.4926) <= r9  <= 0x25a4c75b (+2^29.2343)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-16320
RED1 r7, r3
    //// bounds:  -0x00004ab (-2^10.2228) <= r7  <= 0x000104ab (+2^16.0261)
mul.w r7, r7, r14
    //// bounds:  -0x40e99540 (-2^30.0204) <= r7  <= 0x01299540 (+2^24.2171)
add.w r8, r8, r7
    //// bounds:  -0x4174bd6f (-2^30.0325) <= r8  <= 0x05d4bd6f (+2^26.5437)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x1b4bd6f (-2^24.7706) <= r7  <= 0x4594bd6f (+2^30.1206)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =16448
RED1 r4, r3
    //// bounds:  -0x000048b (-2^10.1836) <= r4  <= 0x0001048b (+2^16.0254)
mul.w r4, r4, r14
    //// bounds:  -0x123e2c0 (-2^24.1893) <= r4  <= 0x4163e2c0 (+2^30.0310)
add.w r6, r6, r4
    //// bounds:  -0x1cf0aef (-2^24.8550) <= r6  <= 0x45ef0aef (+2^30.1279)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x420f0aef (-2^30.0457) <= r4  <= 0x05af0aef (+2^26.5068)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 32 ***/
ldr.w r14, =1020
mul.w r3, r12, r14
    //// bounds:  -0x1fe0000 (-2^24.9944) <= r3  <= 0x01fe0000 (+2^24.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #652]
/*** baseaux 33 ***/
ldr.w r14, =-1020
mul.w r3, r11, r14
    //// bounds:  -0x1fe0000 (-2^24.9944) <= r3  <= 0x01fe0000 (+2^24.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #672]
/*** baseaux 34 ***/
ldr.w r14, =-1028
mul.w r3, r10, r14
    //// bounds:  -0x2020000 (-2^25.0056) <= r3  <= 0x02020000 (+2^25.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #692]
/*** baseaux 35 ***/
ldr.w r14, =1028
mul.w r3, r9, r14
    //// bounds:  -0x2020000 (-2^25.0056) <= r3  <= 0x02020000 (+2^25.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #712]
/*** baseaux 36 ***/
ldr.w r14, =-16320
mul.w r3, r8, r14
    //// bounds:  -0x1fe00000 (-2^28.9944) <= r3  <= 0x1fe00000 (+2^28.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #732]
/*** baseaux 37 ***/
ldr.w r14, =16320
mul.w r3, r7, r14
    //// bounds:  -0x1fe00000 (-2^28.9944) <= r3  <= 0x1fe00000 (+2^28.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #752]
/*** baseaux 38 ***/
ldr.w r14, =16448
mul.w r3, r6, r14
    //// bounds:  -0x20200000 (-2^29.0056) <= r3  <= 0x20200000 (+2^29.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #772]
/*** baseaux 39 ***/
ldr.w r14, =-16448
mul.w r3, r4, r14
    //// bounds:  -0x20200000 (-2^29.0056) <= r3  <= 0x20200000 (+2^29.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #792]
str.w r12, [r1, #644]
str.w r11, [r1, #664]
str.w r10, [r1, #684]
str.w r9, [r1, #704]
str.w r8, [r1, #724]
str.w r7, [r1, #744]
str.w r6, [r1, #764]
str.w r4, [r1, #784]
ldr.w r12, [sp, #392]
ldr.w r11, [sp, #404]
ldr.w r10, [sp, #416]
ldr.w r9, [sp, #428]
ldr.w r8, [sp, #440]
ldr.w r7, [sp, #452]
ldr.w r6, [sp, #464]
ldr.w r4, [sp, #476]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r8  <= 0x00010088 (+2^16.0030)
sub.w r12, r12, r8, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r12 <= 0x008a96ef (+2^23.1147)
add.w r8, r12, r8, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r8  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r7  <= 0x00010088 (+2^16.0030)
sub.w r11, r11, r7, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r11 <= 0x008a96ef (+2^23.1147)
add.w r7, r11, r7, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r7  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r6  <= 0x00010088 (+2^16.0030)
sub.w r10, r10, r6, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r10 <= 0x008a96ef (+2^23.1147)
add.w r6, r10, r6, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r6  <= 0x048a96ef (+2^26.1831)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000088 (-2^ 7.0875) <= r4  <= 0x00010088 (+2^16.0030)
sub.w r9, r9, r4, lsl #10
    //// bounds:  -0x48a96ef (-2^26.1831) <= r9  <= 0x008a96ef (+2^23.1147)
add.w r4, r9, r4, lsl #11
    //// bounds:  -0x08a96ef (-2^23.1147) <= r4  <= 0x048a96ef (+2^26.1831)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r10 <= 0x0001048a (+2^16.0254)
sub.w r12, r12, r10, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r12 <= 0x011bd6ef (+2^24.1489)
add.w r10, r12, r10, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r10 <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r9  <= 0x0001048a (+2^16.0254)
sub.w r11, r11, r9, lsl #13
    //// bounds:  -0x251bd6ef (-2^29.2137) <= r11 <= 0x011bd6ef (+2^24.1489)
add.w r9, r11, r9, lsl #14
    //// bounds:  -0x51bd6ef (-2^26.3530) <= r9  <= 0x211bd6ef (+2^29.0491)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r6  <= 0x0001048a (+2^16.0254)
add.w r8, r8, r6, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r8  <= 0x04ab282f (+2^26.2230)
sub.w r6, r8, r6, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r6  <= 0x048b282f (+2^26.1838)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000048a (-2^10.1824) <= r4  <= 0x0001048a (+2^16.0254)
add.w r7, r7, r4, lsl #5
    //// bounds:  -0x08b282f (-2^23.1206) <= r7  <= 0x04ab282f (+2^26.2230)
sub.w r4, r7, r4, lsl #6
    //// bounds:  -0x0ab282f (-2^23.4192) <= r4  <= 0x048b282f (+2^26.1838)
/*** LAYER 6 ***/
ldr.w r14, =1020
RED1 r11, r3
    //// bounds:  -0x000251b (-2^13.2136) <= r11 <= 0x0001251b (+2^16.1953)
mul.w r11, r11, r14
    //// bounds:  -0x093d794 (-2^23.2079) <= r11 <= 0x048fd794 (+2^26.1896)
add.w r12, r12, r11
    //// bounds:  -0x25afae83 (-2^29.2360) <= r12 <= 0x05abae83 (+2^26.5035)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x29abae83 (-2^29.3810) <= r11 <= 0x01afae83 (+2^24.7538)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =1028
RED1 r9, r3
    //// bounds:  -0x000211b (-2^13.0490) <= r9  <= 0x0001211b (+2^16.1755)
mul.w r9, r9, r14
    //// bounds:  -0x084f06c (-2^23.0546) <= r9  <= 0x0488f06c (+2^26.1811)
sub.w r10, r10, r9
    //// bounds:  -0x9a4c75b (-2^27.2696) <= r10 <= 0x21a0c75b (+2^29.0716)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x5a0c75b (-2^26.4926) <= r9  <= 0x25a4c75b (+2^29.2343)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-16320
RED1 r7, r3
    //// bounds:  -0x00004ab (-2^10.2228) <= r7  <= 0x000104ab (+2^16.0261)
mul.w r7, r7, r14
    //// bounds:  -0x40e99540 (-2^30.0204) <= r7  <= 0x01299540 (+2^24.2171)
add.w r8, r8, r7
    //// bounds:  -0x4174bd6f (-2^30.0325) <= r8  <= 0x05d4bd6f (+2^26.5437)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x1b4bd6f (-2^24.7706) <= r7  <= 0x4594bd6f (+2^30.1206)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =16448
RED1 r4, r3
    //// bounds:  -0x000048b (-2^10.1836) <= r4  <= 0x0001048b (+2^16.0254)
mul.w r4, r4, r14
    //// bounds:  -0x123e2c0 (-2^24.1893) <= r4  <= 0x4163e2c0 (+2^30.0310)
add.w r6, r6, r4
    //// bounds:  -0x1cf0aef (-2^24.8550) <= r6  <= 0x45ef0aef (+2^30.1279)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x420f0aef (-2^30.0457) <= r4  <= 0x05af0aef (+2^26.5068)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 32 ***/
ldr.w r14, =1020
mul.w r3, r12, r14
    //// bounds:  -0x1fe0000 (-2^24.9944) <= r3  <= 0x01fe0000 (+2^24.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #656]
/*** baseaux 33 ***/
ldr.w r14, =-1020
mul.w r3, r11, r14
    //// bounds:  -0x1fe0000 (-2^24.9944) <= r3  <= 0x01fe0000 (+2^24.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #676]
/*** baseaux 34 ***/
ldr.w r14, =-1028
mul.w r3, r10, r14
    //// bounds:  -0x2020000 (-2^25.0056) <= r3  <= 0x02020000 (+2^25.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #696]
/*** baseaux 35 ***/
ldr.w r14, =1028
mul.w r3, r9, r14
    //// bounds:  -0x2020000 (-2^25.0056) <= r3  <= 0x02020000 (+2^25.0056)
RED4 r3, r2
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #716]
/*** baseaux 36 ***/
ldr.w r14, =-16320
mul.w r3, r8, r14
    //// bounds:  -0x1fe00000 (-2^28.9944) <= r3  <= 0x1fe00000 (+2^28.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #736]
/*** baseaux 37 ***/
ldr.w r14, =16320
mul.w r3, r7, r14
    //// bounds:  -0x1fe00000 (-2^28.9944) <= r3  <= 0x1fe00000 (+2^28.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #756]
/*** baseaux 38 ***/
ldr.w r14, =16448
mul.w r3, r6, r14
    //// bounds:  -0x20200000 (-2^29.0056) <= r3  <= 0x20200000 (+2^29.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #776]
/*** baseaux 39 ***/
ldr.w r14, =-16448
mul.w r3, r4, r14
    //// bounds:  -0x20200000 (-2^29.0056) <= r3  <= 0x20200000 (+2^29.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #796]
str.w r12, [r1, #648]
str.w r11, [r1, #668]
str.w r10, [r1, #688]
str.w r9, [r1, #708]
str.w r8, [r1, #728]
str.w r7, [r1, #748]
str.w r6, [r1, #768]
str.w r4, [r1, #788]
ldr.w r12, [sp, #480]
ldr.w r11, [sp, #492]
ldr.w r10, [sp, #504]
ldr.w r9, [sp, #516]
ldr.w r8, [sp, #528]
ldr.w r7, [sp, #540]
ldr.w r6, [sp, #552]
ldr.w r4, [sp, #564]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
sub.w r8, r12, r8, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r8  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
sub.w r7, r11, r7, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r7  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r6, r10, r6, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r6  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
sub.w r4, r9, r4, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r4  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r12 <= 0x07fef801 (+2^26.9993)
add.w r10, r12, r10, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r10 <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r11 <= 0x07fef801 (+2^26.9993)
add.w r9, r11, r9, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r9  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r6  <= 0x000102aa (+2^16.0149)
sub.w r8, r8, r6, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r8  <= 0x02afa6ab (+2^25.4255)
add.w r6, r8, r6, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r6  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r4  <= 0x000102aa (+2^16.0149)
sub.w r7, r7, r4, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r7  <= 0x02afa6ab (+2^25.4255)
add.w r4, r7, r4, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r4  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 6 ***/
ldr.w r14, =4112
RED1 r11, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r11 <= 0x000107fe (+2^16.0444)
mul.w r11, r11, r14
    //// bounds:  -0x0805fe0 (-2^23.0042) <= r11 <= 0x10905fe0 (+2^28.0500)
add.w r12, r12, r11
    //// bounds:  -0x87f57e1 (-2^27.0870) <= r12 <= 0x188f57e1 (+2^28.6182)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x188f57e1 (-2^28.6182) <= r11 <= 0x087f57e1 (+2^27.0870)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4080
RED1 r9, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r9  <= 0x000107fe (+2^16.0444)
mul.w r9, r9, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r9  <= 0x106f6020 (+2^28.0387)
add.w r10, r10, r9
    //// bounds:  -0x87e5821 (-2^27.0864) <= r10 <= 0x186e5821 (+2^28.6106)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x186e5821 (-2^28.6106) <= r9  <= 0x087e5821 (+2^27.0864)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-255
RED1 r7, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r7  <= 0x000104af (+2^16.0262)
mul.w r7, r7, r14
    //// bounds:  -0x103aa51 (-2^24.0205) <= r7  <= 0x0004aa51 (+2^18.2220)
add.w r8, r8, r7
    //// bounds:  -0x5b350fc (-2^26.5111) <= r8  <= 0x02b450fc (+2^25.4353)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4b450fc (-2^26.2340) <= r7  <= 0x03b350fc (+2^25.8877)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =257
RED1 r4, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r4  <= 0x000104af (+2^16.0262)
mul.w r4, r4, r14
    //// bounds:  -0x004b3af (-2^18.2332) <= r4  <= 0x0105b3af (+2^24.0318)
add.w r6, r6, r4
    //// bounds:  -0x2b45a5a (-2^25.4354) <= r6  <= 0x05b55a5a (+2^26.5131)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x3b55a5a (-2^25.8908) <= r4  <= 0x04b45a5a (+2^26.2340)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #800]
str.w r11, [r1, #820]
str.w r10, [r1, #840]
str.w r9, [r1, #860]
str.w r8, [r1, #880]
str.w r7, [r1, #900]
str.w r6, [r1, #920]
str.w r4, [r1, #940]
ldr.w r12, [sp, #484]
ldr.w r11, [sp, #496]
ldr.w r10, [sp, #508]
ldr.w r9, [sp, #520]
ldr.w r8, [sp, #532]
ldr.w r7, [sp, #544]
ldr.w r6, [sp, #556]
ldr.w r4, [sp, #568]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
sub.w r8, r12, r8, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r8  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
sub.w r7, r11, r7, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r7  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r6, r10, r6, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r6  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
sub.w r4, r9, r4, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r4  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r12 <= 0x07fef801 (+2^26.9993)
add.w r10, r12, r10, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r10 <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r11 <= 0x07fef801 (+2^26.9993)
add.w r9, r11, r9, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r9  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r6  <= 0x000102aa (+2^16.0149)
sub.w r8, r8, r6, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r8  <= 0x02afa6ab (+2^25.4255)
add.w r6, r8, r6, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r6  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r4  <= 0x000102aa (+2^16.0149)
sub.w r7, r7, r4, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r7  <= 0x02afa6ab (+2^25.4255)
add.w r4, r7, r4, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r4  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 6 ***/
ldr.w r14, =4112
RED1 r11, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r11 <= 0x000107fe (+2^16.0444)
mul.w r11, r11, r14
    //// bounds:  -0x0805fe0 (-2^23.0042) <= r11 <= 0x10905fe0 (+2^28.0500)
add.w r12, r12, r11
    //// bounds:  -0x87f57e1 (-2^27.0870) <= r12 <= 0x188f57e1 (+2^28.6182)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x188f57e1 (-2^28.6182) <= r11 <= 0x087f57e1 (+2^27.0870)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4080
RED1 r9, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r9  <= 0x000107fe (+2^16.0444)
mul.w r9, r9, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r9  <= 0x106f6020 (+2^28.0387)
add.w r10, r10, r9
    //// bounds:  -0x87e5821 (-2^27.0864) <= r10 <= 0x186e5821 (+2^28.6106)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x186e5821 (-2^28.6106) <= r9  <= 0x087e5821 (+2^27.0864)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-255
RED1 r7, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r7  <= 0x000104af (+2^16.0262)
mul.w r7, r7, r14
    //// bounds:  -0x103aa51 (-2^24.0205) <= r7  <= 0x0004aa51 (+2^18.2220)
add.w r8, r8, r7
    //// bounds:  -0x5b350fc (-2^26.5111) <= r8  <= 0x02b450fc (+2^25.4353)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4b450fc (-2^26.2340) <= r7  <= 0x03b350fc (+2^25.8877)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =257
RED1 r4, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r4  <= 0x000104af (+2^16.0262)
mul.w r4, r4, r14
    //// bounds:  -0x004b3af (-2^18.2332) <= r4  <= 0x0105b3af (+2^24.0318)
add.w r6, r6, r4
    //// bounds:  -0x2b45a5a (-2^25.4354) <= r6  <= 0x05b55a5a (+2^26.5131)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x3b55a5a (-2^25.8908) <= r4  <= 0x04b45a5a (+2^26.2340)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 40 ***/
ldr.w r14, =4112
mul.w r3, r12, r14
    //// bounds:  -0x8080000 (-2^27.0056) <= r3  <= 0x08080000 (+2^27.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #812]
/*** baseaux 41 ***/
ldr.w r14, =-4112
mul.w r3, r11, r14
    //// bounds:  -0x8080000 (-2^27.0056) <= r3  <= 0x08080000 (+2^27.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #832]
/*** baseaux 42 ***/
ldr.w r14, =4080
mul.w r3, r10, r14
    //// bounds:  -0x7f80000 (-2^26.9944) <= r3  <= 0x07f80000 (+2^26.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #852]
/*** baseaux 43 ***/
ldr.w r14, =-4080
mul.w r3, r9, r14
    //// bounds:  -0x7f80000 (-2^26.9944) <= r3  <= 0x07f80000 (+2^26.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #872]
/*** baseaux 44 ***/
ldr.w r14, =-255
mul.w r3, r8, r14
    //// bounds:  -0x07f8000 (-2^22.9944) <= r3  <= 0x007f8000 (+2^22.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #892]
/*** baseaux 45 ***/
ldr.w r14, =255
mul.w r3, r7, r14
    //// bounds:  -0x07f8000 (-2^22.9944) <= r3  <= 0x007f8000 (+2^22.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #912]
/*** baseaux 46 ***/
ldr.w r14, =257
mul.w r3, r6, r14
    //// bounds:  -0x0808000 (-2^23.0056) <= r3  <= 0x00808000 (+2^23.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #932]
/*** baseaux 47 ***/
ldr.w r14, =-257
mul.w r3, r4, r14
    //// bounds:  -0x0808000 (-2^23.0056) <= r3  <= 0x00808000 (+2^23.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #952]
str.w r12, [r1, #804]
str.w r11, [r1, #824]
str.w r10, [r1, #844]
str.w r9, [r1, #864]
str.w r8, [r1, #884]
str.w r7, [r1, #904]
str.w r6, [r1, #924]
str.w r4, [r1, #944]
ldr.w r12, [sp, #488]
ldr.w r11, [sp, #500]
ldr.w r10, [sp, #512]
ldr.w r9, [sp, #524]
ldr.w r8, [sp, #536]
ldr.w r7, [sp, #548]
ldr.w r6, [sp, #560]
ldr.w r4, [sp, #572]
/*** LAYER 4 ***/
add.w r12, r12, r8, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
sub.w r8, r12, r8, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r8  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r11, r11, r7, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
sub.w r7, r11, r7, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r7  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r10, r10, r6, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
sub.w r6, r10, r6, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r6  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 4 ***/
add.w r9, r9, r4, lsl #2
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
sub.w r4, r9, r4, lsl #3
    //// bounds:  -0x2aa52ab (-2^25.4143) <= r4  <= 0x02aa52ab (+2^25.4143)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r12 <= 0x07fef801 (+2^26.9993)
add.w r10, r12, r10, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r10 <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #1
    //// bounds:  -0x7fef801 (-2^26.9993) <= r11 <= 0x07fef801 (+2^26.9993)
add.w r9, r11, r9, lsl #2
    //// bounds:  -0x7fef801 (-2^26.9993) <= r9  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r6  <= 0x000102aa (+2^16.0149)
sub.w r8, r8, r6, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r8  <= 0x02afa6ab (+2^25.4255)
add.w r6, r8, r6, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r6  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00002aa (-2^ 9.4136) <= r4  <= 0x000102aa (+2^16.0149)
sub.w r7, r7, r4, lsl #9
    //// bounds:  -0x4afa6ab (-2^26.2284) <= r7  <= 0x02afa6ab (+2^25.4255)
add.w r4, r7, r4, lsl #10
    //// bounds:  -0x2afa6ab (-2^25.4255) <= r4  <= 0x04afa6ab (+2^26.2284)
/*** LAYER 6 ***/
ldr.w r14, =4112
RED1 r11, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r11 <= 0x000107fe (+2^16.0444)
mul.w r11, r11, r14
    //// bounds:  -0x0805fe0 (-2^23.0042) <= r11 <= 0x10905fe0 (+2^28.0500)
add.w r12, r12, r11
    //// bounds:  -0x87f57e1 (-2^27.0870) <= r12 <= 0x188f57e1 (+2^28.6182)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x188f57e1 (-2^28.6182) <= r11 <= 0x087f57e1 (+2^27.0870)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4080
RED1 r9, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r9  <= 0x000107fe (+2^16.0444)
mul.w r9, r9, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r9  <= 0x106f6020 (+2^28.0387)
add.w r10, r10, r9
    //// bounds:  -0x87e5821 (-2^27.0864) <= r10 <= 0x186e5821 (+2^28.6106)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x186e5821 (-2^28.6106) <= r9  <= 0x087e5821 (+2^27.0864)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =-255
RED1 r7, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r7  <= 0x000104af (+2^16.0262)
mul.w r7, r7, r14
    //// bounds:  -0x103aa51 (-2^24.0205) <= r7  <= 0x0004aa51 (+2^18.2220)
add.w r8, r8, r7
    //// bounds:  -0x5b350fc (-2^26.5111) <= r8  <= 0x02b450fc (+2^25.4353)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4b450fc (-2^26.2340) <= r7  <= 0x03b350fc (+2^25.8877)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =257
RED1 r4, r3
    //// bounds:  -0x00004af (-2^10.2276) <= r4  <= 0x000104af (+2^16.0262)
mul.w r4, r4, r14
    //// bounds:  -0x004b3af (-2^18.2332) <= r4  <= 0x0105b3af (+2^24.0318)
add.w r6, r6, r4
    //// bounds:  -0x2b45a5a (-2^25.4354) <= r6  <= 0x05b55a5a (+2^26.5131)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0x3b55a5a (-2^25.8908) <= r4  <= 0x04b45a5a (+2^26.2340)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 40 ***/
ldr.w r14, =4112
mul.w r3, r12, r14
    //// bounds:  -0x8080000 (-2^27.0056) <= r3  <= 0x08080000 (+2^27.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #816]
/*** baseaux 41 ***/
ldr.w r14, =-4112
mul.w r3, r11, r14
    //// bounds:  -0x8080000 (-2^27.0056) <= r3  <= 0x08080000 (+2^27.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #836]
/*** baseaux 42 ***/
ldr.w r14, =4080
mul.w r3, r10, r14
    //// bounds:  -0x7f80000 (-2^26.9944) <= r3  <= 0x07f80000 (+2^26.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #856]
/*** baseaux 43 ***/
ldr.w r14, =-4080
mul.w r3, r9, r14
    //// bounds:  -0x7f80000 (-2^26.9944) <= r3  <= 0x07f80000 (+2^26.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #876]
/*** baseaux 44 ***/
ldr.w r14, =-255
mul.w r3, r8, r14
    //// bounds:  -0x07f8000 (-2^22.9944) <= r3  <= 0x007f8000 (+2^22.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #896]
/*** baseaux 45 ***/
ldr.w r14, =255
mul.w r3, r7, r14
    //// bounds:  -0x07f8000 (-2^22.9944) <= r3  <= 0x007f8000 (+2^22.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #916]
/*** baseaux 46 ***/
ldr.w r14, =257
mul.w r3, r6, r14
    //// bounds:  -0x0808000 (-2^23.0056) <= r3  <= 0x00808000 (+2^23.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #936]
/*** baseaux 47 ***/
ldr.w r14, =-257
mul.w r3, r4, r14
    //// bounds:  -0x0808000 (-2^23.0056) <= r3  <= 0x00808000 (+2^23.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #956]
str.w r12, [r1, #808]
str.w r11, [r1, #828]
str.w r10, [r1, #848]
str.w r9, [r1, #868]
str.w r8, [r1, #888]
str.w r7, [r1, #908]
str.w r6, [r1, #928]
str.w r4, [r1, #948]
ldr.w r12, [sp, #576]
ldr.w r11, [sp, #588]
ldr.w r10, [sp, #600]
ldr.w r9, [sp, #612]
ldr.w r8, [sp, #624]
ldr.w r7, [sp, #636]
ldr.w r6, [sp, #648]
ldr.w r4, [sp, #660]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
add.w r12, r12, r8, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r12 <= 0x440a86ff (+2^30.0883)
sub.w r8, r12, r8, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r8  <= 0x040a86ff (+2^26.0148)
RED1 r12, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r12 <= 0x0001440a (+2^16.3400)
RED1 r8, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r8  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
add.w r11, r11, r7, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r11 <= 0x440a86ff (+2^30.0883)
sub.w r7, r11, r7, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r7  <= 0x040a86ff (+2^26.0148)
RED1 r11, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r11 <= 0x0001440a (+2^16.3400)
RED1 r7, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r7  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
add.w r10, r10, r6, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r10 <= 0x440a86ff (+2^30.0883)
sub.w r6, r10, r6, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r6  <= 0x040a86ff (+2^26.0148)
RED1 r10, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r10 <= 0x0001440a (+2^16.3400)
RED1 r6, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r6  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
add.w r9, r9, r4, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r9  <= 0x440a86ff (+2^30.0883)
sub.w r4, r9, r4, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r4  <= 0x040a86ff (+2^26.0148)
RED1 r9, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r9  <= 0x0001440a (+2^16.3400)
RED1 r4, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r4  <= 0x0001540a (+2^16.4096)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r12 <= 0x0023490a (+2^21.1410)
add.w r10, r12, r10, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r10 <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r11 <= 0x0023490a (+2^21.1410)
add.w r9, r11, r9, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r9  <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r8, r8, r6, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r8  <= 0x4001540a (+2^30.0001)
sub.w r6, r8, r6
    //// bounds:  -0x4000d40a (-2^30.0001) <= r6  <= 0x4001d40a (+2^30.0002)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r7, r7, r4, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r7  <= 0x4001540a (+2^30.0001)
sub.w r4, r7, r4
    //// bounds:  -0x4000d40a (-2^30.0001) <= r4  <= 0x4001d40a (+2^30.0002)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 6 ***/
ldr.w r14, =32641
RED1 r11, r3
    //// bounds:  -0x00000a2 (-2^ 7.3399) <= r11 <= 0x000100a2 (+2^16.0036)
mul.w r11, r11, r14
    //// bounds:  -0x050afa2 (-2^22.3342) <= r11 <= 0x7fd1afa2 (+2^30.9980)
RED1 r11, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r11 <= 0x00017fd1 (+2^16.5843)
sub.w r12, r12, r11
    //// bounds:  -0x0a3c8db (-2^23.3557) <= r12 <= 0x0023c8db (+2^21.1613)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0x0a2c8db (-2^23.3468) <= r11 <= 0x0024c8db (+2^21.2010)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =32640
RED1 r9, r3
    //// bounds:  -0x00000a3 (-2^ 7.3487) <= r9  <= 0x000100a3 (+2^16.0036)
mul.w r9, r9, r14
    //// bounds:  -0x0512e80 (-2^22.3431) <= r9  <= 0x7fd12e80 (+2^30.9979)
RED1 r9, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r9  <= 0x00017fd1 (+2^16.5843)
add.w r10, r10, r9
    //// bounds:  -0x022c8db (-2^21.1204) <= r10 <= 0x00a4c8db (+2^23.3644)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x023c8db (-2^21.1613) <= r9  <= 0x00a3c8db (+2^23.3557)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2040
mul.w r7, r7, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r7  <= 0x09f607f8 (+2^27.3163)
sub.w r8, r8, r7
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r8  <= 0x01ff47f9 (+2^24.9980)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r7  <= 0x09f747f9 (+2^27.3170)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2056
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r6, r6, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r6  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #960]
str.w r11, [r1, #980]
str.w r10, [r1, #1000]
str.w r9, [r1, #1020]
str.w r8, [r1, #1040]
str.w r7, [r1, #1060]
str.w r6, [r1, #1080]
str.w r4, [r1, #1100]
ldr.w r12, [sp, #580]
ldr.w r11, [sp, #592]
ldr.w r10, [sp, #604]
ldr.w r9, [sp, #616]
ldr.w r8, [sp, #628]
ldr.w r7, [sp, #640]
ldr.w r6, [sp, #652]
ldr.w r4, [sp, #664]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
add.w r12, r12, r8, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r12 <= 0x440a86ff (+2^30.0883)
sub.w r8, r12, r8, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r8  <= 0x040a86ff (+2^26.0148)
RED1 r12, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r12 <= 0x0001440a (+2^16.3400)
RED1 r8, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r8  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
add.w r11, r11, r7, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r11 <= 0x440a86ff (+2^30.0883)
sub.w r7, r11, r7, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r7  <= 0x040a86ff (+2^26.0148)
RED1 r11, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r11 <= 0x0001440a (+2^16.3400)
RED1 r7, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r7  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
add.w r10, r10, r6, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r10 <= 0x440a86ff (+2^30.0883)
sub.w r6, r10, r6, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r6  <= 0x040a86ff (+2^26.0148)
RED1 r10, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r10 <= 0x0001440a (+2^16.3400)
RED1 r6, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r6  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
add.w r9, r9, r4, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r9  <= 0x440a86ff (+2^30.0883)
sub.w r4, r9, r4, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r4  <= 0x040a86ff (+2^26.0148)
RED1 r9, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r9  <= 0x0001440a (+2^16.3400)
RED1 r4, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r4  <= 0x0001540a (+2^16.4096)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r12 <= 0x0023490a (+2^21.1410)
add.w r10, r12, r10, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r10 <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r11 <= 0x0023490a (+2^21.1410)
add.w r9, r11, r9, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r9  <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r8, r8, r6, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r8  <= 0x4001540a (+2^30.0001)
sub.w r6, r8, r6
    //// bounds:  -0x4000d40a (-2^30.0001) <= r6  <= 0x4001d40a (+2^30.0002)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r7, r7, r4, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r7  <= 0x4001540a (+2^30.0001)
sub.w r4, r7, r4
    //// bounds:  -0x4000d40a (-2^30.0001) <= r4  <= 0x4001d40a (+2^30.0002)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 6 ***/
ldr.w r14, =32641
RED1 r11, r3
    //// bounds:  -0x00000a2 (-2^ 7.3399) <= r11 <= 0x000100a2 (+2^16.0036)
mul.w r11, r11, r14
    //// bounds:  -0x050afa2 (-2^22.3342) <= r11 <= 0x7fd1afa2 (+2^30.9980)
RED1 r11, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r11 <= 0x00017fd1 (+2^16.5843)
sub.w r12, r12, r11
    //// bounds:  -0x0a3c8db (-2^23.3557) <= r12 <= 0x0023c8db (+2^21.1613)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0x0a2c8db (-2^23.3468) <= r11 <= 0x0024c8db (+2^21.2010)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =32640
RED1 r9, r3
    //// bounds:  -0x00000a3 (-2^ 7.3487) <= r9  <= 0x000100a3 (+2^16.0036)
mul.w r9, r9, r14
    //// bounds:  -0x0512e80 (-2^22.3431) <= r9  <= 0x7fd12e80 (+2^30.9979)
RED1 r9, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r9  <= 0x00017fd1 (+2^16.5843)
add.w r10, r10, r9
    //// bounds:  -0x022c8db (-2^21.1204) <= r10 <= 0x00a4c8db (+2^23.3644)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x023c8db (-2^21.1613) <= r9  <= 0x00a3c8db (+2^23.3557)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2040
mul.w r7, r7, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r7  <= 0x09f607f8 (+2^27.3163)
sub.w r8, r8, r7
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r8  <= 0x01ff47f9 (+2^24.9980)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r7  <= 0x09f747f9 (+2^27.3170)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2056
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r6, r6, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r6  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 48 ***/
ldr.w r14, =-32641
mul.w r3, r12, r14
    //// bounds:  -0x3fc08000 (-2^29.9944) <= r3  <= 0x3fc08000 (+2^29.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #972]
/*** baseaux 49 ***/
ldr.w r14, =32641
mul.w r3, r11, r14
    //// bounds:  -0x3fc08000 (-2^29.9944) <= r3  <= 0x3fc08000 (+2^29.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #992]
/*** baseaux 50 ***/
ldr.w r14, =32640
mul.w r3, r10, r14
    //// bounds:  -0x3fc00000 (-2^29.9944) <= r3  <= 0x3fc00000 (+2^29.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1012]
/*** baseaux 51 ***/
ldr.w r14, =-32640
mul.w r3, r9, r14
    //// bounds:  -0x3fc00000 (-2^29.9944) <= r3  <= 0x3fc00000 (+2^29.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1032]
/*** baseaux 52 ***/
ldr.w r14, =-2040
mul.w r3, r8, r14
    //// bounds:  -0x3fc0000 (-2^25.9944) <= r3  <= 0x03fc0000 (+2^25.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1052]
/*** baseaux 53 ***/
ldr.w r14, =2040
mul.w r3, r7, r14
    //// bounds:  -0x3fc0000 (-2^25.9944) <= r3  <= 0x03fc0000 (+2^25.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1072]
/*** baseaux 54 ***/
ldr.w r14, =2056
mul.w r3, r6, r14
    //// bounds:  -0x4040000 (-2^26.0056) <= r3  <= 0x04040000 (+2^26.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1092]
/*** baseaux 55 ***/
ldr.w r14, =-2056
mul.w r3, r4, r14
    //// bounds:  -0x4040000 (-2^26.0056) <= r3  <= 0x04040000 (+2^26.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1112]
str.w r12, [r1, #964]
str.w r11, [r1, #984]
str.w r10, [r1, #1004]
str.w r9, [r1, #1024]
str.w r8, [r1, #1044]
str.w r7, [r1, #1064]
str.w r6, [r1, #1084]
str.w r4, [r1, #1104]
ldr.w r12, [sp, #584]
ldr.w r11, [sp, #596]
ldr.w r10, [sp, #608]
ldr.w r9, [sp, #620]
ldr.w r8, [sp, #632]
ldr.w r7, [sp, #644]
ldr.w r6, [sp, #656]
ldr.w r4, [sp, #668]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
add.w r12, r12, r8, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r12 <= 0x440a86ff (+2^30.0883)
sub.w r8, r12, r8, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r8  <= 0x040a86ff (+2^26.0148)
RED1 r12, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r12 <= 0x0001440a (+2^16.3400)
RED1 r8, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r8  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
add.w r11, r11, r7, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r11 <= 0x440a86ff (+2^30.0883)
sub.w r7, r11, r7, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r7  <= 0x040a86ff (+2^26.0148)
RED1 r11, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r11 <= 0x0001440a (+2^16.3400)
RED1 r7, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r7  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
add.w r10, r10, r6, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r10 <= 0x440a86ff (+2^30.0883)
sub.w r6, r10, r6, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r6  <= 0x040a86ff (+2^26.0148)
RED1 r10, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r10 <= 0x0001440a (+2^16.3400)
RED1 r6, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r6  <= 0x0001540a (+2^16.4096)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
add.w r9, r9, r4, lsl #14
    //// bounds:  -0x140a86ff (-2^28.3249) <= r9  <= 0x440a86ff (+2^30.0883)
sub.w r4, r9, r4, lsl #15
    //// bounds:  -0x540a86ff (-2^30.3930) <= r4  <= 0x040a86ff (+2^26.0148)
RED1 r9, r3
    //// bounds:  -0x000440a (-2^14.0883) <= r9  <= 0x0001440a (+2^16.3400)
RED1 r4, r3
    //// bounds:  -0x000540a (-2^14.3930) <= r4  <= 0x0001540a (+2^16.4096)
/*** LAYER 5 ***/
sub.w r12, r12, r10, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r12 <= 0x0023490a (+2^21.1410)
add.w r10, r12, r10, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r10 <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
sub.w r11, r11, r9, lsl #7
    //// bounds:  -0x0a2490a (-2^23.3424) <= r11 <= 0x0023490a (+2^21.1410)
add.w r9, r11, r9, lsl #8
    //// bounds:  -0x022490a (-2^21.0995) <= r9  <= 0x00a3490a (+2^23.3513)
/*** LAYER 5 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r8, r8, r6, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r8  <= 0x4001540a (+2^30.0001)
sub.w r6, r8, r6
    //// bounds:  -0x4000d40a (-2^30.0001) <= r6  <= 0x4001d40a (+2^30.0002)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r7, r7, r4, lsl #15
    //// bounds:  -0x4000540a (-2^30.0000) <= r7  <= 0x4001540a (+2^30.0001)
sub.w r4, r7, r4
    //// bounds:  -0x4000d40a (-2^30.0001) <= r4  <= 0x4001d40a (+2^30.0002)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 6 ***/
ldr.w r14, =32641
RED1 r11, r3
    //// bounds:  -0x00000a2 (-2^ 7.3399) <= r11 <= 0x000100a2 (+2^16.0036)
mul.w r11, r11, r14
    //// bounds:  -0x050afa2 (-2^22.3342) <= r11 <= 0x7fd1afa2 (+2^30.9980)
RED1 r11, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r11 <= 0x00017fd1 (+2^16.5843)
sub.w r12, r12, r11
    //// bounds:  -0x0a3c8db (-2^23.3557) <= r12 <= 0x0023c8db (+2^21.1613)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0x0a2c8db (-2^23.3468) <= r11 <= 0x0024c8db (+2^21.2010)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =32640
RED1 r9, r3
    //// bounds:  -0x00000a3 (-2^ 7.3487) <= r9  <= 0x000100a3 (+2^16.0036)
mul.w r9, r9, r14
    //// bounds:  -0x0512e80 (-2^22.3431) <= r9  <= 0x7fd12e80 (+2^30.9979)
RED1 r9, r3
    //// bounds:  -0x0007fd1 (-2^14.9979) <= r9  <= 0x00017fd1 (+2^16.5843)
add.w r10, r10, r9
    //// bounds:  -0x022c8db (-2^21.1204) <= r10 <= 0x00a4c8db (+2^23.3644)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x023c8db (-2^21.1613) <= r9  <= 0x00a3c8db (+2^23.3557)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2040
mul.w r7, r7, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r7  <= 0x09f607f8 (+2^27.3163)
sub.w r8, r8, r7
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r8  <= 0x01ff47f9 (+2^24.9980)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r7  <= 0x09f747f9 (+2^27.3170)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =2056
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r6, r6, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r6  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 48 ***/
ldr.w r14, =-32641
mul.w r3, r12, r14
    //// bounds:  -0x3fc08000 (-2^29.9944) <= r3  <= 0x3fc08000 (+2^29.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #976]
/*** baseaux 49 ***/
ldr.w r14, =32641
mul.w r3, r11, r14
    //// bounds:  -0x3fc08000 (-2^29.9944) <= r3  <= 0x3fc08000 (+2^29.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #996]
/*** baseaux 50 ***/
ldr.w r14, =32640
mul.w r3, r10, r14
    //// bounds:  -0x3fc00000 (-2^29.9944) <= r3  <= 0x3fc00000 (+2^29.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1016]
/*** baseaux 51 ***/
ldr.w r14, =-32640
mul.w r3, r9, r14
    //// bounds:  -0x3fc00000 (-2^29.9944) <= r3  <= 0x3fc00000 (+2^29.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1036]
/*** baseaux 52 ***/
ldr.w r14, =-2040
mul.w r3, r8, r14
    //// bounds:  -0x3fc0000 (-2^25.9944) <= r3  <= 0x03fc0000 (+2^25.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1056]
/*** baseaux 53 ***/
ldr.w r14, =2040
mul.w r3, r7, r14
    //// bounds:  -0x3fc0000 (-2^25.9944) <= r3  <= 0x03fc0000 (+2^25.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1076]
/*** baseaux 54 ***/
ldr.w r14, =2056
mul.w r3, r6, r14
    //// bounds:  -0x4040000 (-2^26.0056) <= r3  <= 0x04040000 (+2^26.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1096]
/*** baseaux 55 ***/
ldr.w r14, =-2056
mul.w r3, r4, r14
    //// bounds:  -0x4040000 (-2^26.0056) <= r3  <= 0x04040000 (+2^26.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1116]
str.w r12, [r1, #968]
str.w r11, [r1, #988]
str.w r10, [r1, #1008]
str.w r9, [r1, #1028]
str.w r8, [r1, #1048]
str.w r7, [r1, #1068]
str.w r6, [r1, #1088]
str.w r4, [r1, #1108]
ldr.w r12, [sp, #672]
ldr.w r11, [sp, #684]
ldr.w r10, [sp, #696]
ldr.w r9, [sp, #708]
ldr.w r8, [sp, #720]
ldr.w r7, [sp, #732]
ldr.w r6, [sp, #744]
ldr.w r4, [sp, #756]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
sub.w r12, r12, r8, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r12 <= 0x100c88ff (+2^28.0044)
add.w r8, r12, r8, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r8  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
sub.w r11, r11, r7, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r11 <= 0x100c88ff (+2^28.0044)
add.w r7, r11, r7, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r7  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
sub.w r10, r10, r6, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r10 <= 0x100c88ff (+2^28.0044)
add.w r6, r10, r6, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r6  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
sub.w r9, r9, r4, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r9  <= 0x100c88ff (+2^28.0044)
add.w r4, r9, r4, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r4  <= 0x104c88ff (+2^28.0267)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r10 <= 0x0001100c (+2^16.0877)
add.w r12, r12, r10, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r12 <= 0x188ce8ff (+2^28.6177)
sub.w r10, r12, r10, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r10 <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r9  <= 0x0001100c (+2^16.0877)
add.w r11, r11, r9, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r11 <= 0x188ce8ff (+2^28.6177)
sub.w r9, r11, r9, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r9  <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r6  <= 0x0001104c (+2^16.0890)
sub.w r8, r8, r6, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r8  <= 0x104d0b5f (+2^28.0269)
add.w r6, r8, r6, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r6  <= 0x10550b5f (+2^28.0296)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r4  <= 0x0001104c (+2^16.0890)
sub.w r7, r7, r4, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r7  <= 0x104d0b5f (+2^28.0269)
add.w r4, r7, r4, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r4  <= 0x10550b5f (+2^28.0296)
/*** LAYER 6 ***/
ldr.w r14, =514
RED1 r11, r3
    //// bounds:  -0x000188c (-2^12.6175) <= r11 <= 0x0001188c (+2^16.1321)
mul.w r11, r11, r14
    //// bounds:  -0x0314918 (-2^21.6231) <= r11 <= 0x02334918 (+2^25.1377)
add.w r12, r12, r11
    //// bounds:  -0x0fe3217 (-2^23.9898) <= r12 <= 0x1ac03217 (+2^28.7415)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x3003217 (-2^25.5853) <= r11 <= 0x18be3217 (+2^28.6289)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =510
RED1 r9, r3
    //// bounds:  -0x000108c (-2^12.0485) <= r9  <= 0x0001108c (+2^16.0904)
mul.w r9, r9, r14
    //// bounds:  -0x020f6e8 (-2^21.0428) <= r9  <= 0x021ef6e8 (+2^25.0847)
add.w r10, r10, r9
    //// bounds:  -0x8eddfe7 (-2^27.1585) <= r10 <= 0x12abdfe7 (+2^28.2228)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0xaebdfe7 (-2^27.4491) <= r9  <= 0x10addfe7 (+2^28.0600)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8224
RED1 r7, r3
    //// bounds:  -0x000104d (-2^12.0269) <= r7  <= 0x0001104d (+2^16.0891)
mul.w r7, r7, r14
    //// bounds:  -0x20ba9a0 (-2^25.0325) <= r7  <= 0x222ba9a0 (+2^29.0947)
sub.w r8, r8, r7
    //// bounds:  -0x2240b4ff (-2^29.0981) <= r8  <= 0x1258b4ff (+2^28.1974)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x220b4ff (-2^25.0893) <= r7  <= 0x3278b4ff (+2^29.6574)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8160
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
mul.w r4, r4, r14
    //// bounds:  -0x2089560 (-2^25.0240) <= r4  <= 0x21e89560 (+2^29.0836)
sub.w r6, r6, r4
    //// bounds:  -0x21f5a0bf (-2^29.0857) <= r6  <= 0x125da0bf (+2^28.1989)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x215a0bf (-2^25.0597) <= r4  <= 0x323da0bf (+2^29.6508)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1120]
str.w r11, [r1, #1140]
str.w r10, [r1, #1160]
b.w 1f
.ltorg /* constant pool */
1:
str.w r9, [r1, #1180]
str.w r8, [r1, #1200]
str.w r7, [r1, #1220]
str.w r6, [r1, #1240]
str.w r4, [r1, #1260]
ldr.w r12, [sp, #676]
ldr.w r11, [sp, #688]
ldr.w r10, [sp, #700]
ldr.w r9, [sp, #712]
ldr.w r8, [sp, #724]
ldr.w r7, [sp, #736]
ldr.w r6, [sp, #748]
ldr.w r4, [sp, #760]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
sub.w r12, r12, r8, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r12 <= 0x100c88ff (+2^28.0044)
add.w r8, r12, r8, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r8  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
sub.w r11, r11, r7, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r11 <= 0x100c88ff (+2^28.0044)
add.w r7, r11, r7, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r7  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
sub.w r10, r10, r6, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r10 <= 0x100c88ff (+2^28.0044)
add.w r6, r10, r6, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r6  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
sub.w r9, r9, r4, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r9  <= 0x100c88ff (+2^28.0044)
add.w r4, r9, r4, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r4  <= 0x104c88ff (+2^28.0267)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r10 <= 0x0001100c (+2^16.0877)
add.w r12, r12, r10, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r12 <= 0x188ce8ff (+2^28.6177)
sub.w r10, r12, r10, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r10 <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r9  <= 0x0001100c (+2^16.0877)
add.w r11, r11, r9, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r11 <= 0x188ce8ff (+2^28.6177)
sub.w r9, r11, r9, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r9  <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r6  <= 0x0001104c (+2^16.0890)
sub.w r8, r8, r6, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r8  <= 0x104d0b5f (+2^28.0269)
add.w r6, r8, r6, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r6  <= 0x10550b5f (+2^28.0296)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r4  <= 0x0001104c (+2^16.0890)
sub.w r7, r7, r4, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r7  <= 0x104d0b5f (+2^28.0269)
add.w r4, r7, r4, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r4  <= 0x10550b5f (+2^28.0296)
/*** LAYER 6 ***/
ldr.w r14, =514
RED1 r11, r3
    //// bounds:  -0x000188c (-2^12.6175) <= r11 <= 0x0001188c (+2^16.1321)
mul.w r11, r11, r14
    //// bounds:  -0x0314918 (-2^21.6231) <= r11 <= 0x02334918 (+2^25.1377)
add.w r12, r12, r11
    //// bounds:  -0x0fe3217 (-2^23.9898) <= r12 <= 0x1ac03217 (+2^28.7415)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x3003217 (-2^25.5853) <= r11 <= 0x18be3217 (+2^28.6289)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =510
RED1 r9, r3
    //// bounds:  -0x000108c (-2^12.0485) <= r9  <= 0x0001108c (+2^16.0904)
mul.w r9, r9, r14
    //// bounds:  -0x020f6e8 (-2^21.0428) <= r9  <= 0x021ef6e8 (+2^25.0847)
add.w r10, r10, r9
    //// bounds:  -0x8eddfe7 (-2^27.1585) <= r10 <= 0x12abdfe7 (+2^28.2228)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0xaebdfe7 (-2^27.4491) <= r9  <= 0x10addfe7 (+2^28.0600)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8224
RED1 r7, r3
    //// bounds:  -0x000104d (-2^12.0269) <= r7  <= 0x0001104d (+2^16.0891)
mul.w r7, r7, r14
    //// bounds:  -0x20ba9a0 (-2^25.0325) <= r7  <= 0x222ba9a0 (+2^29.0947)
sub.w r8, r8, r7
    //// bounds:  -0x2240b4ff (-2^29.0981) <= r8  <= 0x1258b4ff (+2^28.1974)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x220b4ff (-2^25.0893) <= r7  <= 0x3278b4ff (+2^29.6574)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8160
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
mul.w r4, r4, r14
    //// bounds:  -0x2089560 (-2^25.0240) <= r4  <= 0x21e89560 (+2^29.0836)
sub.w r6, r6, r4
    //// bounds:  -0x21f5a0bf (-2^29.0857) <= r6  <= 0x125da0bf (+2^28.1989)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x215a0bf (-2^25.0597) <= r4  <= 0x323da0bf (+2^29.6508)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 56 ***/
ldr.w r14, =514
mul.w r3, r12, r14
    //// bounds:  -0x1010000 (-2^24.0056) <= r3  <= 0x01010000 (+2^24.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1132]
/*** baseaux 57 ***/
ldr.w r14, =-514
mul.w r3, r11, r14
    //// bounds:  -0x1010000 (-2^24.0056) <= r3  <= 0x01010000 (+2^24.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1152]
/*** baseaux 58 ***/
ldr.w r14, =510
mul.w r3, r10, r14
    //// bounds:  -0x0ff0000 (-2^23.9944) <= r3  <= 0x00ff0000 (+2^23.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1172]
/*** baseaux 59 ***/
ldr.w r14, =-510
mul.w r3, r9, r14
    //// bounds:  -0x0ff0000 (-2^23.9944) <= r3  <= 0x00ff0000 (+2^23.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1192]
/*** baseaux 60 ***/
ldr.w r14, =-8224
mul.w r3, r8, r14
    //// bounds:  -0x10100000 (-2^28.0056) <= r3  <= 0x10100000 (+2^28.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1212]
/*** baseaux 61 ***/
ldr.w r14, =8224
mul.w r3, r7, r14
    //// bounds:  -0x10100000 (-2^28.0056) <= r3  <= 0x10100000 (+2^28.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1232]
/*** baseaux 62 ***/
ldr.w r14, =-8160
mul.w r3, r6, r14
    //// bounds:  -0xff00000 (-2^27.9944) <= r3  <= 0x0ff00000 (+2^27.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1252]
/*** baseaux 63 ***/
ldr.w r14, =8160
mul.w r3, r4, r14
    //// bounds:  -0xff00000 (-2^27.9944) <= r3  <= 0x0ff00000 (+2^27.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1272]
str.w r12, [r1, #1124]
str.w r11, [r1, #1144]
str.w r10, [r1, #1164]
str.w r9, [r1, #1184]
str.w r8, [r1, #1204]
str.w r7, [r1, #1224]
str.w r6, [r1, #1244]
str.w r4, [r1, #1264]
ldr.w r12, [sp, #680]
ldr.w r11, [sp, #692]
ldr.w r10, [sp, #704]
ldr.w r9, [sp, #716]
ldr.w r8, [sp, #728]
ldr.w r7, [sp, #740]
ldr.w r6, [sp, #752]
ldr.w r4, [sp, #764]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r8  <= 0x00011008 (+2^16.0876)
sub.w r12, r12, r8, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r12 <= 0x100c88ff (+2^28.0044)
add.w r8, r12, r8, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r8  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r7  <= 0x00011008 (+2^16.0876)
sub.w r11, r11, r7, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r11 <= 0x100c88ff (+2^28.0044)
add.w r7, r11, r7, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r7  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r6  <= 0x00011008 (+2^16.0876)
sub.w r10, r10, r6, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r10 <= 0x100c88ff (+2^28.0044)
add.w r6, r10, r6, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r6  <= 0x104c88ff (+2^28.0267)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0001008 (-2^12.0028) <= r4  <= 0x00011008 (+2^16.0876)
sub.w r9, r9, r4, lsl #6
    //// bounds:  -0x04c88ff (-2^22.2581) <= r9  <= 0x100c88ff (+2^28.0044)
add.w r4, r9, r4, lsl #7
    //// bounds:  -0x00c88ff (-2^19.6479) <= r4  <= 0x104c88ff (+2^28.0267)
/*** LAYER 5 ***/
RED1 r10, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r10 <= 0x0001100c (+2^16.0877)
add.w r12, r12, r10, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r12 <= 0x188ce8ff (+2^28.6177)
sub.w r10, r12, r10, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r10 <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000100c (-2^12.0042) <= r9  <= 0x0001100c (+2^16.0877)
add.w r11, r11, r9, lsl #11
    //// bounds:  -0x0cce8ff (-2^23.6788) <= r11 <= 0x188ce8ff (+2^28.6177)
sub.w r9, r11, r9, lsl #12
    //// bounds:  -0x8cce8ff (-2^27.1376) <= r9  <= 0x108ce8ff (+2^28.0488)
/*** LAYER 5 ***/
RED1 r6, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r6  <= 0x0001104c (+2^16.0890)
sub.w r8, r8, r6, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r8  <= 0x104d0b5f (+2^28.0269)
add.w r6, r8, r6, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r6  <= 0x10550b5f (+2^28.0296)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000104c (-2^12.0265) <= r4  <= 0x0001104c (+2^16.0890)
sub.w r7, r7, r4, lsl #3
    //// bounds:  -0x0150b5f (-2^20.3954) <= r7  <= 0x104d0b5f (+2^28.0269)
add.w r4, r7, r4, lsl #4
    //// bounds:  -0x00d0b5f (-2^19.7054) <= r4  <= 0x10550b5f (+2^28.0296)
/*** LAYER 6 ***/
ldr.w r14, =514
RED1 r11, r3
    //// bounds:  -0x000188c (-2^12.6175) <= r11 <= 0x0001188c (+2^16.1321)
mul.w r11, r11, r14
    //// bounds:  -0x0314918 (-2^21.6231) <= r11 <= 0x02334918 (+2^25.1377)
add.w r12, r12, r11
    //// bounds:  -0x0fe3217 (-2^23.9898) <= r12 <= 0x1ac03217 (+2^28.7415)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x3003217 (-2^25.5853) <= r11 <= 0x18be3217 (+2^28.6289)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =510
RED1 r9, r3
    //// bounds:  -0x000108c (-2^12.0485) <= r9  <= 0x0001108c (+2^16.0904)
mul.w r9, r9, r14
    //// bounds:  -0x020f6e8 (-2^21.0428) <= r9  <= 0x021ef6e8 (+2^25.0847)
add.w r10, r10, r9
    //// bounds:  -0x8eddfe7 (-2^27.1585) <= r10 <= 0x12abdfe7 (+2^28.2228)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0xaebdfe7 (-2^27.4491) <= r9  <= 0x10addfe7 (+2^28.0600)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8224
RED1 r7, r3
    //// bounds:  -0x000104d (-2^12.0269) <= r7  <= 0x0001104d (+2^16.0891)
mul.w r7, r7, r14
    //// bounds:  -0x20ba9a0 (-2^25.0325) <= r7  <= 0x222ba9a0 (+2^29.0947)
sub.w r8, r8, r7
    //// bounds:  -0x2240b4ff (-2^29.0981) <= r8  <= 0x1258b4ff (+2^28.1974)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x220b4ff (-2^25.0893) <= r7  <= 0x3278b4ff (+2^29.6574)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =8160
RED1 r4, r3
    //// bounds:  -0x0001055 (-2^12.0296) <= r4  <= 0x00011055 (+2^16.0892)
mul.w r4, r4, r14
    //// bounds:  -0x2089560 (-2^25.0240) <= r4  <= 0x21e89560 (+2^29.0836)
sub.w r6, r6, r4
    //// bounds:  -0x21f5a0bf (-2^29.0857) <= r6  <= 0x125da0bf (+2^28.1989)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x215a0bf (-2^25.0597) <= r4  <= 0x323da0bf (+2^29.6508)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 56 ***/
ldr.w r14, =514
mul.w r3, r12, r14
    //// bounds:  -0x1010000 (-2^24.0056) <= r3  <= 0x01010000 (+2^24.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1136]
/*** baseaux 57 ***/
ldr.w r14, =-514
mul.w r3, r11, r14
    //// bounds:  -0x1010000 (-2^24.0056) <= r3  <= 0x01010000 (+2^24.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1156]
/*** baseaux 58 ***/
ldr.w r14, =510
mul.w r3, r10, r14
    //// bounds:  -0x0ff0000 (-2^23.9944) <= r3  <= 0x00ff0000 (+2^23.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1176]
/*** baseaux 59 ***/
ldr.w r14, =-510
mul.w r3, r9, r14
    //// bounds:  -0x0ff0000 (-2^23.9944) <= r3  <= 0x00ff0000 (+2^23.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1196]
/*** baseaux 60 ***/
ldr.w r14, =-8224
mul.w r3, r8, r14
    //// bounds:  -0x10100000 (-2^28.0056) <= r3  <= 0x10100000 (+2^28.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1216]
/*** baseaux 61 ***/
ldr.w r14, =8224
mul.w r3, r7, r14
    //// bounds:  -0x10100000 (-2^28.0056) <= r3  <= 0x10100000 (+2^28.0056)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1236]
/*** baseaux 62 ***/
ldr.w r14, =-8160
mul.w r3, r6, r14
    //// bounds:  -0xff00000 (-2^27.9944) <= r3  <= 0x0ff00000 (+2^27.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1256]
/*** baseaux 63 ***/
ldr.w r14, =8160
mul.w r3, r4, r14
    //// bounds:  -0xff00000 (-2^27.9944) <= r3  <= 0x0ff00000 (+2^27.9944)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1276]
str.w r12, [r1, #1128]
str.w r11, [r1, #1148]
str.w r10, [r1, #1168]
str.w r9, [r1, #1188]
str.w r8, [r1, #1208]
str.w r7, [r1, #1228]
str.w r6, [r1, #1248]
str.w r4, [r1, #1268]
ldr.w r12, [sp, #768]
ldr.w r11, [sp, #780]
ldr.w r10, [sp, #792]
ldr.w r9, [sp, #804]
ldr.w r8, [sp, #816]
ldr.w r7, [sp, #828]
ldr.w r6, [sp, #840]
ldr.w r4, [sp, #852]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r8  <= 0x00010482 (+2^16.0252)
sub.w r12, r12, r8, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r12 <= 0x009a46ff (+2^23.2694)
add.w r8, r12, r8, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r8  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r7  <= 0x00010482 (+2^16.0252)
sub.w r11, r11, r7, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r11 <= 0x009a46ff (+2^23.2694)
add.w r7, r11, r7, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r7  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r6  <= 0x00010482 (+2^16.0252)
sub.w r10, r10, r6, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r10 <= 0x009a46ff (+2^23.2694)
add.w r6, r10, r6, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r6  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r4  <= 0x00010482 (+2^16.0252)
sub.w r9, r9, r4, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r9  <= 0x009a46ff (+2^23.2694)
add.w r4, r9, r4, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r4  <= 0x209a46ff (+2^29.0269)
/*** LAYER 5 ***/
ldr.w r14, =1020
RED1 r10, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r10 <= 0x00012512 (+2^16.1951)
mul.w r10, r10, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r10 <= 0x048fb3b8 (+2^26.1895)
add.w r12, r12, r10
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r12 <= 0x0529fab7 (+2^26.3685)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r10 <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r9  <= 0x00012512 (+2^16.1951)
mul.w r9, r9, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r9  <= 0x048fb3b8 (+2^26.1895)
add.w r11, r11, r9
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r11 <= 0x0529fab7 (+2^26.3685)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r9  <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
ldr.w r14, =1028
RED1 r6, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r6  <= 0x0001209a (+2^16.1729)
mul.w r6, r6, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r6  <= 0x0486ea68 (+2^26.1786)
sub.w r8, r8, r6
    //// bounds:  -0x9999a58 (-2^27.2630) <= r8  <= 0x211d3167 (+2^29.0494)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r6  <= 0x25213167 (+2^29.2145)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r4  <= 0x0001209a (+2^16.1729)
mul.w r4, r4, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r4  <= 0x0486ea68 (+2^26.1786)
sub.w r7, r7, r4
    //// bounds:  -0x9999a58 (-2^27.2630) <= r7  <= 0x211d3167 (+2^29.0494)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r4  <= 0x25213167 (+2^29.2145)
/*** LAYER 6 ***/
ldr.w r14, =2469
RED1 r11, r3
    //// bounds:  -0x00025a6 (-2^13.2345) <= r11 <= 0x000125a6 (+2^16.1979)
mul.w r11, r11, r14
    //// bounds:  -0x16b19fe (-2^24.5042) <= r11 <= 0x0b1019fe (+2^27.4677)
add.w r12, r12, r11
    //// bounds:  -0x27117da6 (-2^29.2879) <= r12 <= 0x103a14b5 (+2^28.0203)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x30b67da6 (-2^29.6062) <= r11 <= 0x069514b5 (+2^26.7186)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =23306
RED1 r9, r3
    //// bounds:  -0x00029a2 (-2^13.3796) <= r9  <= 0x000129a2 (+2^16.2174)
mul.w r9, r9, r14
    //// bounds:  -0xece3654 (-2^27.8881) <= r9  <= 0x69d83654 (+2^30.7258)
RED1 r9, r3
    //// bounds:  -0x00069d8 (-2^14.7258) <= r9  <= 0x000169d8 (+2^16.4992)
sub.w r10, r10, r9
    //// bounds:  -0x29a3cd80 (-2^29.3799) <= r10 <= 0x012e648f (+2^24.2403)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x29a2cd80 (-2^29.3798) <= r9  <= 0x012f648f (+2^24.2450)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26033
RED1 r7, r3
    //// bounds:  -0x000211d (-2^13.0493) <= r7  <= 0x0001211d (+2^16.1755)
mul.w r7, r7, r14
    //// bounds:  -0xd27560d (-2^27.7174) <= r7  <= 0x72d8560d (+2^30.8435)
RED1 r7, r3
    //// bounds:  -0x00072d8 (-2^14.8435) <= r7  <= 0x000172d8 (+2^16.5347)
add.w r8, r8, r7
    //// bounds:  -0x99a0d30 (-2^27.2633) <= r8  <= 0x211ea43f (+2^29.0496)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x99b0d30 (-2^27.2639) <= r7  <= 0x211da43f (+2^29.0494)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20326
RED1 r4, r3
    //// bounds:  -0x0002521 (-2^13.2145) <= r4  <= 0x00012521 (+2^16.1954)
mul.w r4, r4, r14
    //// bounds:  -0xb83fa26 (-2^27.5255) <= r4  <= 0x5ae9fa26 (+2^30.5064)
RED1 r4, r3
    //// bounds:  -0x0005ae9 (-2^14.5064) <= r4  <= 0x00015ae9 (+2^16.4384)
sub.w r6, r6, r4
    //// bounds:  -0x596f541 (-2^26.4828) <= r6  <= 0x25218c50 (+2^29.2146)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x595f541 (-2^26.4818) <= r4  <= 0x25228c50 (+2^29.2147)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1280]
str.w r11, [r1, #1300]
str.w r10, [r1, #1320]
str.w r9, [r1, #1340]
str.w r8, [r1, #1360]
str.w r7, [r1, #1380]
str.w r6, [r1, #1400]
str.w r4, [r1, #1420]
ldr.w r12, [sp, #772]
ldr.w r11, [sp, #784]
ldr.w r10, [sp, #796]
ldr.w r9, [sp, #808]
ldr.w r8, [sp, #820]
ldr.w r7, [sp, #832]
ldr.w r6, [sp, #844]
ldr.w r4, [sp, #856]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r8  <= 0x00010482 (+2^16.0252)
sub.w r12, r12, r8, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r12 <= 0x009a46ff (+2^23.2694)
add.w r8, r12, r8, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r8  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r7  <= 0x00010482 (+2^16.0252)
sub.w r11, r11, r7, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r11 <= 0x009a46ff (+2^23.2694)
add.w r7, r11, r7, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r7  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r6  <= 0x00010482 (+2^16.0252)
sub.w r10, r10, r6, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r10 <= 0x009a46ff (+2^23.2694)
add.w r6, r10, r6, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r6  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r4  <= 0x00010482 (+2^16.0252)
sub.w r9, r9, r4, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r9  <= 0x009a46ff (+2^23.2694)
add.w r4, r9, r4, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r4  <= 0x209a46ff (+2^29.0269)
/*** LAYER 5 ***/
ldr.w r14, =1020
RED1 r10, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r10 <= 0x00012512 (+2^16.1951)
mul.w r10, r10, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r10 <= 0x048fb3b8 (+2^26.1895)
add.w r12, r12, r10
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r12 <= 0x0529fab7 (+2^26.3685)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r10 <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r9  <= 0x00012512 (+2^16.1951)
mul.w r9, r9, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r9  <= 0x048fb3b8 (+2^26.1895)
add.w r11, r11, r9
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r11 <= 0x0529fab7 (+2^26.3685)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r9  <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
ldr.w r14, =1028
RED1 r6, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r6  <= 0x0001209a (+2^16.1729)
mul.w r6, r6, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r6  <= 0x0486ea68 (+2^26.1786)
sub.w r8, r8, r6
    //// bounds:  -0x9999a58 (-2^27.2630) <= r8  <= 0x211d3167 (+2^29.0494)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r6  <= 0x25213167 (+2^29.2145)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r4  <= 0x0001209a (+2^16.1729)
mul.w r4, r4, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r4  <= 0x0486ea68 (+2^26.1786)
sub.w r7, r7, r4
    //// bounds:  -0x9999a58 (-2^27.2630) <= r7  <= 0x211d3167 (+2^29.0494)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r4  <= 0x25213167 (+2^29.2145)
/*** LAYER 6 ***/
ldr.w r14, =2469
RED1 r11, r3
    //// bounds:  -0x00025a6 (-2^13.2345) <= r11 <= 0x000125a6 (+2^16.1979)
mul.w r11, r11, r14
    //// bounds:  -0x16b19fe (-2^24.5042) <= r11 <= 0x0b1019fe (+2^27.4677)
add.w r12, r12, r11
    //// bounds:  -0x27117da6 (-2^29.2879) <= r12 <= 0x103a14b5 (+2^28.0203)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x30b67da6 (-2^29.6062) <= r11 <= 0x069514b5 (+2^26.7186)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =23306
RED1 r9, r3
    //// bounds:  -0x00029a2 (-2^13.3796) <= r9  <= 0x000129a2 (+2^16.2174)
mul.w r9, r9, r14
    //// bounds:  -0xece3654 (-2^27.8881) <= r9  <= 0x69d83654 (+2^30.7258)
RED1 r9, r3
    //// bounds:  -0x00069d8 (-2^14.7258) <= r9  <= 0x000169d8 (+2^16.4992)
sub.w r10, r10, r9
    //// bounds:  -0x29a3cd80 (-2^29.3799) <= r10 <= 0x012e648f (+2^24.2403)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x29a2cd80 (-2^29.3798) <= r9  <= 0x012f648f (+2^24.2450)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26033
RED1 r7, r3
    //// bounds:  -0x000211d (-2^13.0493) <= r7  <= 0x0001211d (+2^16.1755)
mul.w r7, r7, r14
    //// bounds:  -0xd27560d (-2^27.7174) <= r7  <= 0x72d8560d (+2^30.8435)
RED1 r7, r3
    //// bounds:  -0x00072d8 (-2^14.8435) <= r7  <= 0x000172d8 (+2^16.5347)
add.w r8, r8, r7
    //// bounds:  -0x99a0d30 (-2^27.2633) <= r8  <= 0x211ea43f (+2^29.0496)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x99b0d30 (-2^27.2639) <= r7  <= 0x211da43f (+2^29.0494)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20326
RED1 r4, r3
    //// bounds:  -0x0002521 (-2^13.2145) <= r4  <= 0x00012521 (+2^16.1954)
mul.w r4, r4, r14
    //// bounds:  -0xb83fa26 (-2^27.5255) <= r4  <= 0x5ae9fa26 (+2^30.5064)
RED1 r4, r3
    //// bounds:  -0x0005ae9 (-2^14.5064) <= r4  <= 0x00015ae9 (+2^16.4384)
sub.w r6, r6, r4
    //// bounds:  -0x596f541 (-2^26.4828) <= r6  <= 0x25218c50 (+2^29.2146)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x595f541 (-2^26.4818) <= r4  <= 0x25228c50 (+2^29.2147)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 64 ***/
ldr.w r14, =2469
mul.w r3, r12, r14
    //// bounds:  -0x4d28000 (-2^26.2697) <= r3  <= 0x04d28000 (+2^26.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1292]
/*** baseaux 65 ***/
ldr.w r14, =-2469
mul.w r3, r11, r14
    //// bounds:  -0x4d28000 (-2^26.2697) <= r3  <= 0x04d28000 (+2^26.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1312]
/*** baseaux 66 ***/
ldr.w r14, =-23306
mul.w r3, r10, r14
    //// bounds:  -0x2d850000 (-2^29.5084) <= r3  <= 0x2d850000 (+2^29.5084)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1332]
/*** baseaux 67 ***/
ldr.w r14, =23306
mul.w r3, r9, r14
    //// bounds:  -0x2d850000 (-2^29.5084) <= r3  <= 0x2d850000 (+2^29.5084)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1352]
/*** baseaux 68 ***/
ldr.w r14, =26033
mul.w r3, r8, r14
    //// bounds:  -0x32d88000 (-2^29.6681) <= r3  <= 0x32d88000 (+2^29.6681)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1372]
/*** baseaux 69 ***/
ldr.w r14, =-26033
mul.w r3, r7, r14
    //// bounds:  -0x32d88000 (-2^29.6681) <= r3  <= 0x32d88000 (+2^29.6681)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1392]
/*** baseaux 70 ***/
ldr.w r14, =-20326
mul.w r3, r6, r14
    //// bounds:  -0x27b30000 (-2^29.3110) <= r3  <= 0x27b30000 (+2^29.3110)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1412]
/*** baseaux 71 ***/
ldr.w r14, =20326
mul.w r3, r4, r14
    //// bounds:  -0x27b30000 (-2^29.3110) <= r3  <= 0x27b30000 (+2^29.3110)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1432]
str.w r12, [r1, #1284]
str.w r11, [r1, #1304]
str.w r10, [r1, #1324]
str.w r9, [r1, #1344]
str.w r8, [r1, #1364]
str.w r7, [r1, #1384]
str.w r6, [r1, #1404]
str.w r4, [r1, #1424]
ldr.w r12, [sp, #776]
ldr.w r11, [sp, #788]
ldr.w r10, [sp, #800]
ldr.w r9, [sp, #812]
ldr.w r8, [sp, #824]
ldr.w r7, [sp, #836]
ldr.w r6, [sp, #848]
ldr.w r4, [sp, #860]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r8  <= 0x00010482 (+2^16.0252)
sub.w r12, r12, r8, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r12 <= 0x009a46ff (+2^23.2694)
add.w r8, r12, r8, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r8  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r7  <= 0x00010482 (+2^16.0252)
sub.w r11, r11, r7, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r11 <= 0x009a46ff (+2^23.2694)
add.w r7, r11, r7, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r7  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r6  <= 0x00010482 (+2^16.0252)
sub.w r10, r10, r6, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r10 <= 0x009a46ff (+2^23.2694)
add.w r6, r10, r6, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r6  <= 0x209a46ff (+2^29.0269)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000482 (-2^10.1724) <= r4  <= 0x00010482 (+2^16.0252)
sub.w r9, r9, r4, lsl #13
    //// bounds:  -0x2512aff0 (-2^29.2123) <= r9  <= 0x009a46ff (+2^23.2694)
add.w r4, r9, r4, lsl #14
    //// bounds:  -0x512aff0 (-2^26.3428) <= r4  <= 0x209a46ff (+2^29.0269)
/*** LAYER 5 ***/
ldr.w r14, =1020
RED1 r10, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r10 <= 0x00012512 (+2^16.1951)
mul.w r10, r10, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r10 <= 0x048fb3b8 (+2^26.1895)
add.w r12, r12, r10
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r12 <= 0x0529fab7 (+2^26.3685)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r10 <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0002512 (-2^13.2122) <= r9  <= 0x00012512 (+2^16.1951)
mul.w r9, r9, r14
    //// bounds:  -0x093b3b8 (-2^23.2065) <= r9  <= 0x048fb3b8 (+2^26.1895)
add.w r11, r11, r9
    //// bounds:  -0x25a663a8 (-2^29.2346) <= r11 <= 0x0529fab7 (+2^26.3685)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x29a263a8 (-2^29.3797) <= r9  <= 0x012dfab7 (+2^24.2383)
/*** LAYER 5 ***/
ldr.w r14, =1028
RED1 r6, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r6  <= 0x0001209a (+2^16.1729)
mul.w r6, r6, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r6  <= 0x0486ea68 (+2^26.1786)
sub.w r8, r8, r6
    //// bounds:  -0x9999a58 (-2^27.2630) <= r8  <= 0x211d3167 (+2^29.0494)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r6  <= 0x25213167 (+2^29.2145)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000209a (-2^13.0269) <= r4  <= 0x0001209a (+2^16.1729)
mul.w r4, r4, r14
    //// bounds:  -0x082ea68 (-2^23.0325) <= r4  <= 0x0486ea68 (+2^26.1786)
sub.w r7, r7, r4
    //// bounds:  -0x9999a58 (-2^27.2630) <= r7  <= 0x211d3167 (+2^29.0494)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x5959a58 (-2^26.4814) <= r4  <= 0x25213167 (+2^29.2145)
/*** LAYER 6 ***/
ldr.w r14, =2469
RED1 r11, r3
    //// bounds:  -0x00025a6 (-2^13.2345) <= r11 <= 0x000125a6 (+2^16.1979)
mul.w r11, r11, r14
    //// bounds:  -0x16b19fe (-2^24.5042) <= r11 <= 0x0b1019fe (+2^27.4677)
add.w r12, r12, r11
    //// bounds:  -0x27117da6 (-2^29.2879) <= r12 <= 0x103a14b5 (+2^28.0203)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x30b67da6 (-2^29.6062) <= r11 <= 0x069514b5 (+2^26.7186)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =23306
RED1 r9, r3
    //// bounds:  -0x00029a2 (-2^13.3796) <= r9  <= 0x000129a2 (+2^16.2174)
mul.w r9, r9, r14
    //// bounds:  -0xece3654 (-2^27.8881) <= r9  <= 0x69d83654 (+2^30.7258)
RED1 r9, r3
    //// bounds:  -0x00069d8 (-2^14.7258) <= r9  <= 0x000169d8 (+2^16.4992)
sub.w r10, r10, r9
    //// bounds:  -0x29a3cd80 (-2^29.3799) <= r10 <= 0x012e648f (+2^24.2403)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x29a2cd80 (-2^29.3798) <= r9  <= 0x012f648f (+2^24.2450)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26033
RED1 r7, r3
    //// bounds:  -0x000211d (-2^13.0493) <= r7  <= 0x0001211d (+2^16.1755)
mul.w r7, r7, r14
    //// bounds:  -0xd27560d (-2^27.7174) <= r7  <= 0x72d8560d (+2^30.8435)
RED1 r7, r3
    //// bounds:  -0x00072d8 (-2^14.8435) <= r7  <= 0x000172d8 (+2^16.5347)
add.w r8, r8, r7
    //// bounds:  -0x99a0d30 (-2^27.2633) <= r8  <= 0x211ea43f (+2^29.0496)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x99b0d30 (-2^27.2639) <= r7  <= 0x211da43f (+2^29.0494)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20326
RED1 r4, r3
    //// bounds:  -0x0002521 (-2^13.2145) <= r4  <= 0x00012521 (+2^16.1954)
mul.w r4, r4, r14
    //// bounds:  -0xb83fa26 (-2^27.5255) <= r4  <= 0x5ae9fa26 (+2^30.5064)
RED1 r4, r3
    //// bounds:  -0x0005ae9 (-2^14.5064) <= r4  <= 0x00015ae9 (+2^16.4384)
sub.w r6, r6, r4
    //// bounds:  -0x596f541 (-2^26.4828) <= r6  <= 0x25218c50 (+2^29.2146)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x595f541 (-2^26.4818) <= r4  <= 0x25228c50 (+2^29.2147)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 64 ***/
ldr.w r14, =2469
mul.w r3, r12, r14
    //// bounds:  -0x4d28000 (-2^26.2697) <= r3  <= 0x04d28000 (+2^26.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1296]
/*** baseaux 65 ***/
ldr.w r14, =-2469
mul.w r3, r11, r14
    //// bounds:  -0x4d28000 (-2^26.2697) <= r3  <= 0x04d28000 (+2^26.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1316]
/*** baseaux 66 ***/
ldr.w r14, =-23306
mul.w r3, r10, r14
    //// bounds:  -0x2d850000 (-2^29.5084) <= r3  <= 0x2d850000 (+2^29.5084)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1336]
/*** baseaux 67 ***/
ldr.w r14, =23306
mul.w r3, r9, r14
    //// bounds:  -0x2d850000 (-2^29.5084) <= r3  <= 0x2d850000 (+2^29.5084)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1356]
/*** baseaux 68 ***/
ldr.w r14, =26033
mul.w r3, r8, r14
    //// bounds:  -0x32d88000 (-2^29.6681) <= r3  <= 0x32d88000 (+2^29.6681)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1376]
/*** baseaux 69 ***/
ldr.w r14, =-26033
mul.w r3, r7, r14
    //// bounds:  -0x32d88000 (-2^29.6681) <= r3  <= 0x32d88000 (+2^29.6681)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1396]
/*** baseaux 70 ***/
ldr.w r14, =-20326
mul.w r3, r6, r14
    //// bounds:  -0x27b30000 (-2^29.3110) <= r3  <= 0x27b30000 (+2^29.3110)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1416]
/*** baseaux 71 ***/
ldr.w r14, =20326
mul.w r3, r4, r14
    //// bounds:  -0x27b30000 (-2^29.3110) <= r3  <= 0x27b30000 (+2^29.3110)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1436]
str.w r12, [r1, #1288]
str.w r11, [r1, #1308]
str.w r10, [r1, #1328]
str.w r9, [r1, #1348]
str.w r8, [r1, #1368]
str.w r7, [r1, #1388]
str.w r6, [r1, #1408]
str.w r4, [r1, #1428]
ldr.w r12, [sp, #864]
ldr.w r11, [sp, #876]
ldr.w r10, [sp, #888]
ldr.w r9, [sp, #900]
ldr.w r8, [sp, #912]
ldr.w r7, [sp, #924]
ldr.w r6, [sp, #936]
ldr.w r4, [sp, #948]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r8  <= 0x0001040a (+2^16.0226)
add.w r12, r12, r8, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r12 <= 0x042a883f (+2^26.0587)
sub.w r8, r12, r8, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r8  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r7  <= 0x0001040a (+2^16.0226)
add.w r11, r11, r7, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r11 <= 0x042a883f (+2^26.0587)
sub.w r7, r11, r7, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r7  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
add.w r10, r10, r6, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r10 <= 0x042a883f (+2^26.0587)
sub.w r6, r10, r6, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r6  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
add.w r9, r9, r4, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r9  <= 0x042a883f (+2^26.0587)
sub.w r4, r9, r4, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r4  <= 0x040a883f (+2^26.0148)
/*** LAYER 5 ***/
ldr.w r14, =-16320
RED1 r10, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r10 <= 0x0001042a (+2^16.0233)
mul.w r10, r10, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r10 <= 0x01097580 (+2^24.0523)
add.w r12, r12, r10
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r12 <= 0x0533fdbf (+2^26.3794)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r10 <= 0x44f3fdbf (+2^30.1075)
RED1 r12, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r12 <= 0x0001414c (+2^16.3278)
RED1 r10, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r10 <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r9  <= 0x01097580 (+2^24.0523)
add.w r11, r11, r9
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r11 <= 0x0533fdbf (+2^26.3794)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r9  <= 0x44f3fdbf (+2^30.1075)
RED1 r11, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r11 <= 0x0001414c (+2^16.3278)
RED1 r9, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r9  <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
ldr.w r14, =16448
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
mul.w r6, r6, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r6  <= 0x41438280 (+2^30.0282)
add.w r8, r8, r6
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r8  <= 0x454e0abf (+2^30.1149)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r6  <= 0x050e0abf (+2^26.3377)
RED1 r8, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r8  <= 0x0001454e (+2^16.3456)
RED1 r6, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r6  <= 0x000141e6 (+2^16.3305)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
mul.w r4, r4, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r4  <= 0x41438280 (+2^30.0282)
add.w r7, r7, r4
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r7  <= 0x454e0abf (+2^30.1149)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r4  <= 0x050e0abf (+2^26.3377)
RED1 r7, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r7  <= 0x0001454e (+2^16.3456)
RED1 r4, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r4  <= 0x000141e6 (+2^16.3305)
/*** LAYER 6 ***/
ldr.w r14, =27687
RED1 r11, r3
    //// bounds:  -0x0000001 <= r11 <= 0x00010001 (+2^16.0000)
mul.w r11, r11, r14
    //// bounds:  -0x0006c27 (-2^14.7569) <= r11 <= 0x6c276c27 (+2^30.7569)
add.w r12, r12, r11
    //// bounds:  -0x000ad73 (-2^15.4384) <= r12 <= 0x6c28ad73 (+2^30.7570)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6c27ad73 (-2^30.7570) <= r11 <= 0x0001ad73 (+2^16.7463)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9876
mul.w r9, r9, r14
    //// bounds:  -0xa63ee7c (-2^27.3772) <= r9  <= 0x30f7ee7c (+2^29.6138)
add.w r10, r10, r9
    //// bounds:  -0xa64336f (-2^27.3773) <= r10 <= 0x30f9336f (+2^29.6139)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x30f8336f (-2^29.6138) <= r9  <= 0x0a65336f (+2^27.3779)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =15767
mul.w r7, r7, r14
    //// bounds:  -0x10ac7702 (-2^28.0595) <= r7  <= 0x4e437702 (+2^30.2903)
add.w r8, r8, r7
    //// bounds:  -0x10acbc50 (-2^28.0596) <= r8  <= 0x4e44bc50 (+2^30.2904)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4e43bc50 (-2^30.2903) <= r7  <= 0x10adbc50 (+2^28.0599)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26942
RED1 r4, r3
    //// bounds:  -0x0000001 <= r4  <= 0x00010001 (+2^16.0000)
mul.w r4, r4, r14
    //// bounds:  -0x000693e (-2^14.7176) <= r4  <= 0x693e693e (+2^30.7176)
sub.w r6, r6, r4
    //// bounds:  -0x693eab24 (-2^30.7176) <= r6  <= 0x0001ab24 (+2^16.7386)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x000ab24 (-2^15.4190) <= r4  <= 0x693fab24 (+2^30.7177)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1440]
str.w r11, [r1, #1460]
str.w r10, [r1, #1480]
str.w r9, [r1, #1500]
str.w r8, [r1, #1520]
str.w r7, [r1, #1540]
str.w r6, [r1, #1560]
str.w r4, [r1, #1580]
ldr.w r12, [sp, #868]
ldr.w r11, [sp, #880]
ldr.w r10, [sp, #892]
ldr.w r9, [sp, #904]
ldr.w r8, [sp, #916]
ldr.w r7, [sp, #928]
ldr.w r6, [sp, #940]
ldr.w r4, [sp, #952]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r8  <= 0x0001040a (+2^16.0226)
add.w r12, r12, r8, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r12 <= 0x042a883f (+2^26.0587)
sub.w r8, r12, r8, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r8  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r7  <= 0x0001040a (+2^16.0226)
add.w r11, r11, r7, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r11 <= 0x042a883f (+2^26.0587)
sub.w r7, r11, r7, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r7  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
add.w r10, r10, r6, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r10 <= 0x042a883f (+2^26.0587)
sub.w r6, r10, r6, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r6  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
add.w r9, r9, r4, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r9  <= 0x042a883f (+2^26.0587)
sub.w r4, r9, r4, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r4  <= 0x040a883f (+2^26.0148)
/*** LAYER 5 ***/
ldr.w r14, =-16320
RED1 r10, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r10 <= 0x0001042a (+2^16.0233)
mul.w r10, r10, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r10 <= 0x01097580 (+2^24.0523)
add.w r12, r12, r10
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r12 <= 0x0533fdbf (+2^26.3794)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r10 <= 0x44f3fdbf (+2^30.1075)
RED1 r12, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r12 <= 0x0001414c (+2^16.3278)
RED1 r10, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r10 <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r9  <= 0x01097580 (+2^24.0523)
add.w r11, r11, r9
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r11 <= 0x0533fdbf (+2^26.3794)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r9  <= 0x44f3fdbf (+2^30.1075)
RED1 r11, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r11 <= 0x0001414c (+2^16.3278)
RED1 r9, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r9  <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
ldr.w r14, =16448
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
mul.w r6, r6, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r6  <= 0x41438280 (+2^30.0282)
add.w r8, r8, r6
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r8  <= 0x454e0abf (+2^30.1149)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r6  <= 0x050e0abf (+2^26.3377)
RED1 r8, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r8  <= 0x0001454e (+2^16.3456)
RED1 r6, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r6  <= 0x000141e6 (+2^16.3305)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
mul.w r4, r4, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r4  <= 0x41438280 (+2^30.0282)
add.w r7, r7, r4
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r7  <= 0x454e0abf (+2^30.1149)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r4  <= 0x050e0abf (+2^26.3377)
RED1 r7, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r7  <= 0x0001454e (+2^16.3456)
RED1 r4, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r4  <= 0x000141e6 (+2^16.3305)
/*** LAYER 6 ***/
ldr.w r14, =27687
RED1 r11, r3
    //// bounds:  -0x0000001 <= r11 <= 0x00010001 (+2^16.0000)
mul.w r11, r11, r14
    //// bounds:  -0x0006c27 (-2^14.7569) <= r11 <= 0x6c276c27 (+2^30.7569)
add.w r12, r12, r11
    //// bounds:  -0x000ad73 (-2^15.4384) <= r12 <= 0x6c28ad73 (+2^30.7570)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6c27ad73 (-2^30.7570) <= r11 <= 0x0001ad73 (+2^16.7463)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9876
mul.w r9, r9, r14
    //// bounds:  -0xa63ee7c (-2^27.3772) <= r9  <= 0x30f7ee7c (+2^29.6138)
add.w r10, r10, r9
    //// bounds:  -0xa64336f (-2^27.3773) <= r10 <= 0x30f9336f (+2^29.6139)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x30f8336f (-2^29.6138) <= r9  <= 0x0a65336f (+2^27.3779)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =15767
mul.w r7, r7, r14
    //// bounds:  -0x10ac7702 (-2^28.0595) <= r7  <= 0x4e437702 (+2^30.2903)
add.w r8, r8, r7
    //// bounds:  -0x10acbc50 (-2^28.0596) <= r8  <= 0x4e44bc50 (+2^30.2904)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4e43bc50 (-2^30.2903) <= r7  <= 0x10adbc50 (+2^28.0599)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26942
RED1 r4, r3
    //// bounds:  -0x0000001 <= r4  <= 0x00010001 (+2^16.0000)
mul.w r4, r4, r14
    //// bounds:  -0x000693e (-2^14.7176) <= r4  <= 0x693e693e (+2^30.7176)
sub.w r6, r6, r4
    //// bounds:  -0x693eab24 (-2^30.7176) <= r6  <= 0x0001ab24 (+2^16.7386)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x000ab24 (-2^15.4190) <= r4  <= 0x693fab24 (+2^30.7177)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 72 ***/
ldr.w r14, =27687
mul.w r3, r12, r14
    //// bounds:  -0x36138000 (-2^29.7569) <= r3  <= 0x36138000 (+2^29.7569)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1452]
/*** baseaux 73 ***/
ldr.w r14, =-27687
mul.w r3, r11, r14
    //// bounds:  -0x36138000 (-2^29.7569) <= r3  <= 0x36138000 (+2^29.7569)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1472]
/*** baseaux 74 ***/
ldr.w r14, =9876
mul.w r3, r10, r14
    //// bounds:  -0x134a0000 (-2^28.2697) <= r3  <= 0x134a0000 (+2^28.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1492]
/*** baseaux 75 ***/
ldr.w r14, =-9876
mul.w r3, r9, r14
    //// bounds:  -0x134a0000 (-2^28.2697) <= r3  <= 0x134a0000 (+2^28.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1512]
/*** baseaux 76 ***/
ldr.w r14, =15767
mul.w r3, r8, r14
    //// bounds:  -0x1ecb8000 (-2^28.9446) <= r3  <= 0x1ecb8000 (+2^28.9446)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1532]
/*** baseaux 77 ***/
ldr.w r14, =-15767
mul.w r3, r7, r14
    //// bounds:  -0x1ecb8000 (-2^28.9446) <= r3  <= 0x1ecb8000 (+2^28.9446)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1552]
/*** baseaux 78 ***/
ldr.w r14, =-26942
mul.w r3, r6, r14
    //// bounds:  -0x349f0000 (-2^29.7176) <= r3  <= 0x349f0000 (+2^29.7176)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1572]
/*** baseaux 79 ***/
ldr.w r14, =26942
mul.w r3, r4, r14
    //// bounds:  -0x349f0000 (-2^29.7176) <= r3  <= 0x349f0000 (+2^29.7176)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1592]
str.w r12, [r1, #1444]
str.w r11, [r1, #1464]
str.w r10, [r1, #1484]
str.w r9, [r1, #1504]
str.w r8, [r1, #1524]
str.w r7, [r1, #1544]
str.w r6, [r1, #1564]
str.w r4, [r1, #1584]
ldr.w r12, [sp, #872]
ldr.w r11, [sp, #884]
ldr.w r10, [sp, #896]
ldr.w r9, [sp, #908]
ldr.w r8, [sp, #920]
ldr.w r7, [sp, #932]
ldr.w r6, [sp, #944]
ldr.w r4, [sp, #956]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r8  <= 0x0001040a (+2^16.0226)
add.w r12, r12, r8, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r12 <= 0x042a883f (+2^26.0587)
sub.w r8, r12, r8, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r8  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r7  <= 0x0001040a (+2^16.0226)
add.w r11, r11, r7, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r11 <= 0x042a883f (+2^26.0587)
sub.w r7, r11, r7, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r7  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
add.w r10, r10, r6, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r10 <= 0x042a883f (+2^26.0587)
sub.w r6, r10, r6, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r6  <= 0x040a883f (+2^26.0148)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
add.w r9, r9, r4, lsl #5
    //// bounds:  -0x082f130 (-2^23.0328) <= r9  <= 0x042a883f (+2^26.0587)
sub.w r4, r9, r4, lsl #6
    //// bounds:  -0x0a2f130 (-2^23.3482) <= r4  <= 0x040a883f (+2^26.0148)
/*** LAYER 5 ***/
ldr.w r14, =-16320
RED1 r10, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r10 <= 0x0001042a (+2^16.0233)
mul.w r10, r10, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r10 <= 0x01097580 (+2^24.0523)
add.w r12, r12, r10
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r12 <= 0x0533fdbf (+2^26.3794)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r10 <= 0x44f3fdbf (+2^30.1075)
RED1 r12, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r12 <= 0x0001414c (+2^16.3278)
RED1 r10, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r10 <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x40c97580 (-2^30.0176) <= r9  <= 0x01097580 (+2^24.0523)
add.w r11, r11, r9
    //// bounds:  -0x414c66b0 (-2^30.0290) <= r11 <= 0x0533fdbf (+2^26.3794)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x18c66b0 (-2^24.6308) <= r9  <= 0x44f3fdbf (+2^30.1075)
RED1 r11, r3
    //// bounds:  -0x000414c (-2^14.0289) <= r11 <= 0x0001414c (+2^16.3278)
RED1 r9, r3
    //// bounds:  -0x00044f3 (-2^14.1075) <= r9  <= 0x000144f3 (+2^16.3441)
/*** LAYER 5 ***/
ldr.w r14, =16448
RED1 r6, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r6  <= 0x0001040a (+2^16.0226)
mul.w r6, r6, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r6  <= 0x41438280 (+2^30.0282)
add.w r8, r8, r6
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r8  <= 0x454e0abf (+2^30.1149)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r6  <= 0x050e0abf (+2^26.3377)
RED1 r8, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r8  <= 0x0001454e (+2^16.3456)
RED1 r6, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r6  <= 0x000141e6 (+2^16.3305)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000040a (-2^10.0140) <= r4  <= 0x0001040a (+2^16.0226)
mul.w r4, r4, r14
    //// bounds:  -0x1038280 (-2^24.0196) <= r4  <= 0x41438280 (+2^30.0282)
add.w r7, r7, r4
    //// bounds:  -0x1a673b0 (-2^24.7226) <= r7  <= 0x454e0abf (+2^30.1149)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x41e673b0 (-2^30.0422) <= r4  <= 0x050e0abf (+2^26.3377)
RED1 r7, r3
    //// bounds:  -0x000454e (-2^14.1149) <= r7  <= 0x0001454e (+2^16.3456)
RED1 r4, r3
    //// bounds:  -0x00041e6 (-2^14.0422) <= r4  <= 0x000141e6 (+2^16.3305)
/*** LAYER 6 ***/
ldr.w r14, =27687
RED1 r11, r3
    //// bounds:  -0x0000001 <= r11 <= 0x00010001 (+2^16.0000)
mul.w r11, r11, r14
    //// bounds:  -0x0006c27 (-2^14.7569) <= r11 <= 0x6c276c27 (+2^30.7569)
add.w r12, r12, r11
    //// bounds:  -0x000ad73 (-2^15.4384) <= r12 <= 0x6c28ad73 (+2^30.7570)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6c27ad73 (-2^30.7570) <= r11 <= 0x0001ad73 (+2^16.7463)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9876
mul.w r9, r9, r14
    //// bounds:  -0xa63ee7c (-2^27.3772) <= r9  <= 0x30f7ee7c (+2^29.6138)
add.w r10, r10, r9
    //// bounds:  -0xa64336f (-2^27.3773) <= r10 <= 0x30f9336f (+2^29.6139)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x30f8336f (-2^29.6138) <= r9  <= 0x0a65336f (+2^27.3779)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =15767
mul.w r7, r7, r14
    //// bounds:  -0x10ac7702 (-2^28.0595) <= r7  <= 0x4e437702 (+2^30.2903)
add.w r8, r8, r7
    //// bounds:  -0x10acbc50 (-2^28.0596) <= r8  <= 0x4e44bc50 (+2^30.2904)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x4e43bc50 (-2^30.2903) <= r7  <= 0x10adbc50 (+2^28.0599)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =26942
RED1 r4, r3
    //// bounds:  -0x0000001 <= r4  <= 0x00010001 (+2^16.0000)
mul.w r4, r4, r14
    //// bounds:  -0x000693e (-2^14.7176) <= r4  <= 0x693e693e (+2^30.7176)
sub.w r6, r6, r4
    //// bounds:  -0x693eab24 (-2^30.7176) <= r6  <= 0x0001ab24 (+2^16.7386)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x000ab24 (-2^15.4190) <= r4  <= 0x693fab24 (+2^30.7177)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 72 ***/
ldr.w r14, =27687
mul.w r3, r12, r14
    //// bounds:  -0x36138000 (-2^29.7569) <= r3  <= 0x36138000 (+2^29.7569)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1456]
/*** baseaux 73 ***/
ldr.w r14, =-27687
mul.w r3, r11, r14
    //// bounds:  -0x36138000 (-2^29.7569) <= r3  <= 0x36138000 (+2^29.7569)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1476]
/*** baseaux 74 ***/
ldr.w r14, =9876
mul.w r3, r10, r14
    //// bounds:  -0x134a0000 (-2^28.2697) <= r3  <= 0x134a0000 (+2^28.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1496]
/*** baseaux 75 ***/
ldr.w r14, =-9876
mul.w r3, r9, r14
    //// bounds:  -0x134a0000 (-2^28.2697) <= r3  <= 0x134a0000 (+2^28.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1516]
/*** baseaux 76 ***/
ldr.w r14, =15767
mul.w r3, r8, r14
    //// bounds:  -0x1ecb8000 (-2^28.9446) <= r3  <= 0x1ecb8000 (+2^28.9446)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1536]
/*** baseaux 77 ***/
ldr.w r14, =-15767
mul.w r3, r7, r14
    //// bounds:  -0x1ecb8000 (-2^28.9446) <= r3  <= 0x1ecb8000 (+2^28.9446)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1556]
/*** baseaux 78 ***/
ldr.w r14, =-26942
mul.w r3, r6, r14
    //// bounds:  -0x349f0000 (-2^29.7176) <= r3  <= 0x349f0000 (+2^29.7176)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1576]
/*** baseaux 79 ***/
ldr.w r14, =26942
mul.w r3, r4, r14
    //// bounds:  -0x349f0000 (-2^29.7176) <= r3  <= 0x349f0000 (+2^29.7176)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1596]
str.w r12, [r1, #1448]
str.w r11, [r1, #1468]
str.w r10, [r1, #1488]
str.w r9, [r1, #1508]
str.w r8, [r1, #1528]
str.w r7, [r1, #1548]
str.w r6, [r1, #1568]
str.w r4, [r1, #1588]
ldr.w r12, [sp, #960]
ldr.w r11, [sp, #972]
ldr.w r10, [sp, #984]
ldr.w r9, [sp, #996]
ldr.w r8, [sp, #1008]
ldr.w r7, [sp, #1020]
ldr.w r6, [sp, #1032]
ldr.w r4, [sp, #1044]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
add.w r8, r12, r8, lsl #2
    //// bounds:  0x00000000 <= r8  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
add.w r7, r11, r7, lsl #2
    //// bounds:  0x00000000 <= r7  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
add.w r6, r10, r6, lsl #2
    //// bounds:  0x00000000 <= r6  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
add.w r4, r9, r4, lsl #2
    //// bounds:  0x00000000 <= r4  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
ldr.w r14, =4112
RED1 r10, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r10 <= 0x00010554 (+2^16.0297)
mul.w r10, r10, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r10 <= 0x10659540 (+2^28.0353)
add.w r12, r12, r10
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r12 <= 0x130fe7eb (+2^28.2526)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r10 <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r9  <= 0x00010554 (+2^16.0297)
mul.w r9, r9, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r9  <= 0x10659540 (+2^28.0353)
add.w r11, r11, r9
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r11 <= 0x130fe7eb (+2^28.2526)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r9  <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
ldr.w r14, =4080
RED1 r6, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r6  <= 0x000107fe (+2^16.0444)
mul.w r6, r6, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r6  <= 0x106f6020 (+2^28.0387)
add.w r8, r8, r6
    //// bounds:  -0x07f6020 (-2^22.9929) <= r8  <= 0x186e5821 (+2^28.6106)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r6  <= 0x087e5821 (+2^27.0864)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r4  <= 0x000107fe (+2^16.0444)
mul.w r4, r4, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r4  <= 0x106f6020 (+2^28.0387)
add.w r7, r7, r4
    //// bounds:  -0x07f6020 (-2^22.9929) <= r7  <= 0x186e5821 (+2^28.6106)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r4  <= 0x087e5821 (+2^27.0864)
/*** LAYER 6 ***/
ldr.w r14, =24885
RED1 r11, r3
    //// bounds:  -0x000130f (-2^12.2524) <= r11 <= 0x0001130f (+2^16.1036)
mul.w r11, r11, r14
    //// bounds:  -0x73ca11b (-2^26.8554) <= r11 <= 0x6871a11b (+2^30.7066)
add.w r12, r12, r11
    //// bounds:  -0xce6dbb1 (-2^27.6895) <= r12 <= 0x7b818906 (+2^30.9484)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e1bdbb1 (-2^30.7828) <= r11 <= 0x1a4c8906 (+2^28.7169)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13471
RED1 r9, r3
    //// bounds:  -0x00015ba (-2^12.4414) <= r9  <= 0x000115ba (+2^16.1175)
mul.w r9, r9, r14
    //// bounds:  -0x4774686 (-2^26.1590) <= r9  <= 0x39164686 (+2^29.8351)
add.w r10, r10, r9
    //// bounds:  -0x1a31811c (-2^28.7111) <= r10 <= 0x3c162e71 (+2^29.9090)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4ed0811c (-2^30.3004) <= r9  <= 0x07772e71 (+2^26.9002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4938
RED1 r7, r3
    //// bounds:  -0x000186e (-2^12.6106) <= r7  <= 0x0001186e (+2^16.1315)
mul.w r7, r7, r14
    //// bounds:  -0x1d739cc (-2^24.8803) <= r7  <= 0x152139cc (+2^28.4012)
sub.w r8, r8, r7
    //// bounds:  -0x15a099ec (-2^28.4348) <= r8  <= 0x1a4591ed (+2^28.7154)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x25699ec (-2^25.2255) <= r7  <= 0x2d8f91ed (+2^29.5097)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =18925
RED1 r4, r3
    //// bounds:  -0x000106f (-2^12.0386) <= r4  <= 0x0001106f (+2^16.0898)
mul.w r4, r4, r14
    //// bounds:  -0x4beddc3 (-2^26.2466) <= r4  <= 0x4eabddc3 (+2^30.2978)
sub.w r6, r6, r4
    //// bounds:  -0x5f1b3de3 (-2^30.5715) <= r6  <= 0x0d3d35e4 (+2^27.7267)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x152e3de3 (-2^28.4047) <= r4  <= 0x572a35e4 (+2^30.4457)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1600]
str.w r11, [r1, #1620]
str.w r10, [r1, #1640]
str.w r9, [r1, #1660]
str.w r8, [r1, #1680]
str.w r7, [r1, #1700]
str.w r6, [r1, #1720]
str.w r4, [r1, #1740]
ldr.w r12, [sp, #964]
ldr.w r11, [sp, #976]
ldr.w r10, [sp, #988]
ldr.w r9, [sp, #1000]
ldr.w r8, [sp, #1012]
ldr.w r7, [sp, #1024]
ldr.w r6, [sp, #1036]
ldr.w r4, [sp, #1048]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
add.w r8, r12, r8, lsl #2
    //// bounds:  0x00000000 <= r8  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
add.w r7, r11, r7, lsl #2
    //// bounds:  0x00000000 <= r7  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
add.w r6, r10, r6, lsl #2
    //// bounds:  0x00000000 <= r6  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
add.w r4, r9, r4, lsl #2
    //// bounds:  0x00000000 <= r4  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
ldr.w r14, =4112
RED1 r10, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r10 <= 0x00010554 (+2^16.0297)
mul.w r10, r10, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r10 <= 0x10659540 (+2^28.0353)
add.w r12, r12, r10
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r12 <= 0x130fe7eb (+2^28.2526)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r10 <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r9  <= 0x00010554 (+2^16.0297)
mul.w r9, r9, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r9  <= 0x10659540 (+2^28.0353)
add.w r11, r11, r9
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r11 <= 0x130fe7eb (+2^28.2526)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r9  <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
ldr.w r14, =4080
RED1 r6, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r6  <= 0x000107fe (+2^16.0444)
mul.w r6, r6, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r6  <= 0x106f6020 (+2^28.0387)
add.w r8, r8, r6
    //// bounds:  -0x07f6020 (-2^22.9929) <= r8  <= 0x186e5821 (+2^28.6106)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r6  <= 0x087e5821 (+2^27.0864)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r4  <= 0x000107fe (+2^16.0444)
mul.w r4, r4, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r4  <= 0x106f6020 (+2^28.0387)
add.w r7, r7, r4
    //// bounds:  -0x07f6020 (-2^22.9929) <= r7  <= 0x186e5821 (+2^28.6106)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r4  <= 0x087e5821 (+2^27.0864)
/*** LAYER 6 ***/
ldr.w r14, =24885
RED1 r11, r3
    //// bounds:  -0x000130f (-2^12.2524) <= r11 <= 0x0001130f (+2^16.1036)
mul.w r11, r11, r14
    //// bounds:  -0x73ca11b (-2^26.8554) <= r11 <= 0x6871a11b (+2^30.7066)
add.w r12, r12, r11
    //// bounds:  -0xce6dbb1 (-2^27.6895) <= r12 <= 0x7b818906 (+2^30.9484)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e1bdbb1 (-2^30.7828) <= r11 <= 0x1a4c8906 (+2^28.7169)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13471
RED1 r9, r3
    //// bounds:  -0x00015ba (-2^12.4414) <= r9  <= 0x000115ba (+2^16.1175)
mul.w r9, r9, r14
    //// bounds:  -0x4774686 (-2^26.1590) <= r9  <= 0x39164686 (+2^29.8351)
add.w r10, r10, r9
    //// bounds:  -0x1a31811c (-2^28.7111) <= r10 <= 0x3c162e71 (+2^29.9090)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4ed0811c (-2^30.3004) <= r9  <= 0x07772e71 (+2^26.9002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4938
RED1 r7, r3
    //// bounds:  -0x000186e (-2^12.6106) <= r7  <= 0x0001186e (+2^16.1315)
mul.w r7, r7, r14
    //// bounds:  -0x1d739cc (-2^24.8803) <= r7  <= 0x152139cc (+2^28.4012)
sub.w r8, r8, r7
    //// bounds:  -0x15a099ec (-2^28.4348) <= r8  <= 0x1a4591ed (+2^28.7154)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x25699ec (-2^25.2255) <= r7  <= 0x2d8f91ed (+2^29.5097)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =18925
RED1 r4, r3
    //// bounds:  -0x000106f (-2^12.0386) <= r4  <= 0x0001106f (+2^16.0898)
mul.w r4, r4, r14
    //// bounds:  -0x4beddc3 (-2^26.2466) <= r4  <= 0x4eabddc3 (+2^30.2978)
sub.w r6, r6, r4
    //// bounds:  -0x5f1b3de3 (-2^30.5715) <= r6  <= 0x0d3d35e4 (+2^27.7267)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x152e3de3 (-2^28.4047) <= r4  <= 0x572a35e4 (+2^30.4457)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 80 ***/
ldr.w r14, =24885
mul.w r3, r12, r14
    //// bounds:  -0x309a8000 (-2^29.6030) <= r3  <= 0x309a8000 (+2^29.6030)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1612]
/*** baseaux 81 ***/
ldr.w r14, =-24885
mul.w r3, r11, r14
    //// bounds:  -0x309a8000 (-2^29.6030) <= r3  <= 0x309a8000 (+2^29.6030)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1632]
/*** baseaux 82 ***/
ldr.w r14, =13471
mul.w r3, r10, r14
    //// bounds:  -0x1a4f8000 (-2^28.7176) <= r3  <= 0x1a4f8000 (+2^28.7176)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1652]
/*** baseaux 83 ***/
ldr.w r14, =-13471
mul.w r3, r9, r14
    //// bounds:  -0x1a4f8000 (-2^28.7176) <= r3  <= 0x1a4f8000 (+2^28.7176)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1672]
/*** baseaux 84 ***/
ldr.w r14, =-4938
mul.w r3, r8, r14
    //// bounds:  -0x9a50000 (-2^27.2697) <= r3  <= 0x09a50000 (+2^27.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1692]
/*** baseaux 85 ***/
ldr.w r14, =4938
mul.w r3, r7, r14
    //// bounds:  -0x9a50000 (-2^27.2697) <= r3  <= 0x09a50000 (+2^27.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1712]
/*** baseaux 86 ***/
ldr.w r14, =-18925
mul.w r3, r6, r14
    //// bounds:  -0x24f68000 (-2^29.2080) <= r3  <= 0x24f68000 (+2^29.2080)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1732]
/*** baseaux 87 ***/
ldr.w r14, =18925
mul.w r3, r4, r14
    //// bounds:  -0x24f68000 (-2^29.2080) <= r3  <= 0x24f68000 (+2^29.2080)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1752]
str.w r12, [r1, #1604]
str.w r11, [r1, #1624]
str.w r10, [r1, #1644]
str.w r9, [r1, #1664]
str.w r8, [r1, #1684]
str.w r7, [r1, #1704]
str.w r6, [r1, #1724]
str.w r4, [r1, #1744]
ldr.w r12, [sp, #968]
ldr.w r11, [sp, #980]
ldr.w r10, [sp, #992]
ldr.w r9, [sp, #1004]
ldr.w r8, [sp, #1016]
ldr.w r7, [sp, #1028]
ldr.w r6, [sp, #1040]
ldr.w r4, [sp, #1052]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r12 <= 0x02aa52ab (+2^25.4143)
add.w r8, r12, r8, lsl #2
    //// bounds:  0x00000000 <= r8  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r11 <= 0x02aa52ab (+2^25.4143)
add.w r7, r11, r7, lsl #2
    //// bounds:  0x00000000 <= r7  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r10 <= 0x02aa52ab (+2^25.4143)
add.w r6, r10, r6, lsl #2
    //// bounds:  0x00000000 <= r6  <= 0x07fef801 (+2^26.9993)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #1
    //// bounds:  -0x554a556 (-2^26.4143) <= r9  <= 0x02aa52ab (+2^25.4143)
add.w r4, r9, r4, lsl #2
    //// bounds:  0x00000000 <= r4  <= 0x07fef801 (+2^26.9993)
/*** LAYER 5 ***/
ldr.w r14, =4112
RED1 r10, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r10 <= 0x00010554 (+2^16.0297)
mul.w r10, r10, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r10 <= 0x10659540 (+2^28.0353)
add.w r12, r12, r10
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r12 <= 0x130fe7eb (+2^28.2526)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r10 <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000554 (-2^10.4136) <= r9  <= 0x00010554 (+2^16.0297)
mul.w r9, r9, r14
    //// bounds:  -0x0559540 (-2^22.4193) <= r9  <= 0x10659540 (+2^28.0353)
add.w r11, r11, r9
    //// bounds:  -0x5aa3a96 (-2^26.5021) <= r11 <= 0x130fe7eb (+2^28.2526)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x15ba3a96 (-2^28.4414) <= r9  <= 0x02ffe7eb (+2^25.5848)
/*** LAYER 5 ***/
ldr.w r14, =4080
RED1 r6, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r6  <= 0x000107fe (+2^16.0444)
mul.w r6, r6, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r6  <= 0x106f6020 (+2^28.0387)
add.w r8, r8, r6
    //// bounds:  -0x07f6020 (-2^22.9929) <= r8  <= 0x186e5821 (+2^28.6106)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r6  <= 0x087e5821 (+2^27.0864)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00007fe (-2^10.9986) <= r4  <= 0x000107fe (+2^16.0444)
mul.w r4, r4, r14
    //// bounds:  -0x07f6020 (-2^22.9929) <= r4  <= 0x106f6020 (+2^28.0387)
add.w r7, r7, r4
    //// bounds:  -0x07f6020 (-2^22.9929) <= r7  <= 0x186e5821 (+2^28.6106)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x106f6020 (-2^28.0387) <= r4  <= 0x087e5821 (+2^27.0864)
/*** LAYER 6 ***/
ldr.w r14, =24885
RED1 r11, r3
    //// bounds:  -0x000130f (-2^12.2524) <= r11 <= 0x0001130f (+2^16.1036)
mul.w r11, r11, r14
    //// bounds:  -0x73ca11b (-2^26.8554) <= r11 <= 0x6871a11b (+2^30.7066)
add.w r12, r12, r11
    //// bounds:  -0xce6dbb1 (-2^27.6895) <= r12 <= 0x7b818906 (+2^30.9484)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e1bdbb1 (-2^30.7828) <= r11 <= 0x1a4c8906 (+2^28.7169)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13471
RED1 r9, r3
    //// bounds:  -0x00015ba (-2^12.4414) <= r9  <= 0x000115ba (+2^16.1175)
mul.w r9, r9, r14
    //// bounds:  -0x4774686 (-2^26.1590) <= r9  <= 0x39164686 (+2^29.8351)
add.w r10, r10, r9
    //// bounds:  -0x1a31811c (-2^28.7111) <= r10 <= 0x3c162e71 (+2^29.9090)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4ed0811c (-2^30.3004) <= r9  <= 0x07772e71 (+2^26.9002)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =4938
RED1 r7, r3
    //// bounds:  -0x000186e (-2^12.6106) <= r7  <= 0x0001186e (+2^16.1315)
mul.w r7, r7, r14
    //// bounds:  -0x1d739cc (-2^24.8803) <= r7  <= 0x152139cc (+2^28.4012)
sub.w r8, r8, r7
    //// bounds:  -0x15a099ec (-2^28.4348) <= r8  <= 0x1a4591ed (+2^28.7154)
add.w r7, r8, r7, lsl #1
    //// bounds:  -0x25699ec (-2^25.2255) <= r7  <= 0x2d8f91ed (+2^29.5097)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =18925
RED1 r4, r3
    //// bounds:  -0x000106f (-2^12.0386) <= r4  <= 0x0001106f (+2^16.0898)
mul.w r4, r4, r14
    //// bounds:  -0x4beddc3 (-2^26.2466) <= r4  <= 0x4eabddc3 (+2^30.2978)
sub.w r6, r6, r4
    //// bounds:  -0x5f1b3de3 (-2^30.5715) <= r6  <= 0x0d3d35e4 (+2^27.7267)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x152e3de3 (-2^28.4047) <= r4  <= 0x572a35e4 (+2^30.4457)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 80 ***/
ldr.w r14, =24885
mul.w r3, r12, r14
    //// bounds:  -0x309a8000 (-2^29.6030) <= r3  <= 0x309a8000 (+2^29.6030)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1616]
/*** baseaux 81 ***/
ldr.w r14, =-24885
mul.w r3, r11, r14
    //// bounds:  -0x309a8000 (-2^29.6030) <= r3  <= 0x309a8000 (+2^29.6030)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1636]
/*** baseaux 82 ***/
ldr.w r14, =13471
mul.w r3, r10, r14
    //// bounds:  -0x1a4f8000 (-2^28.7176) <= r3  <= 0x1a4f8000 (+2^28.7176)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1656]
/*** baseaux 83 ***/
ldr.w r14, =-13471
mul.w r3, r9, r14
    //// bounds:  -0x1a4f8000 (-2^28.7176) <= r3  <= 0x1a4f8000 (+2^28.7176)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1676]
/*** baseaux 84 ***/
ldr.w r14, =-4938
mul.w r3, r8, r14
    //// bounds:  -0x9a50000 (-2^27.2697) <= r3  <= 0x09a50000 (+2^27.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1696]
/*** baseaux 85 ***/
ldr.w r14, =4938
mul.w r3, r7, r14
    //// bounds:  -0x9a50000 (-2^27.2697) <= r3  <= 0x09a50000 (+2^27.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1716]
/*** baseaux 86 ***/
ldr.w r14, =-18925
mul.w r3, r6, r14
    //// bounds:  -0x24f68000 (-2^29.2080) <= r3  <= 0x24f68000 (+2^29.2080)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1736]
/*** baseaux 87 ***/
ldr.w r14, =18925
mul.w r3, r4, r14
    //// bounds:  -0x24f68000 (-2^29.2080) <= r3  <= 0x24f68000 (+2^29.2080)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1756]
str.w r12, [r1, #1608]
str.w r11, [r1, #1628]
str.w r10, [r1, #1648]
str.w r9, [r1, #1668]
str.w r8, [r1, #1688]
str.w r7, [r1, #1708]
str.w r6, [r1, #1728]
str.w r4, [r1, #1748]
ldr.w r12, [sp, #1056]
ldr.w r11, [sp, #1068]
ldr.w r10, [sp, #1080]
ldr.w r9, [sp, #1092]
ldr.w r8, [sp, #1104]
ldr.w r7, [sp, #1116]
ldr.w r6, [sp, #1128]
ldr.w r4, [sp, #1140]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r8  <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r8, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r12 <= 0x008cb8ef (+2^23.1367)
add.w r8, r12, r8, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r8  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r7  <= 0x00010221 (+2^16.0119)
sub.w r11, r11, r7, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r11 <= 0x008cb8ef (+2^23.1367)
add.w r7, r11, r7, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r7  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r6  <= 0x00010221 (+2^16.0119)
sub.w r10, r10, r6, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r10 <= 0x008cb8ef (+2^23.1367)
add.w r6, r10, r6, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r6  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r4  <= 0x00010221 (+2^16.0119)
sub.w r9, r9, r4, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r9  <= 0x008cb8ef (+2^23.1367)
add.w r4, r9, r4, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r4  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 5 ***/
ldr.w r14, =-255
RED1 r10, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r10 <= 0x00010426 (+2^16.0232)
mul.w r10, r10, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r10 <= 0x000421da (+2^18.0469)
add.w r12, r12, r10
    //// bounds:  -0x5293f96 (-2^26.3677) <= r12 <= 0x0090dac9 (+2^23.1785)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r10 <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r9  <= 0x00010426 (+2^16.0232)
mul.w r9, r9, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r9  <= 0x000421da (+2^18.0469)
add.w r11, r11, r9
    //// bounds:  -0x5293f96 (-2^26.3677) <= r11 <= 0x0090dac9 (+2^23.1785)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r9  <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
ldr.w r14, =257
RED1 r6, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r6  <= 0x0001028c (+2^16.0143)
mul.w r6, r6, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r6  <= 0x01038e8c (+2^24.0199)
add.w r8, r8, r6
    //// bounds:  -0x228ac48 (-2^25.1103) <= r8  <= 0x0390477b (+2^25.8333)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r6  <= 0x028f477b (+2^25.3560)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r4  <= 0x0001028c (+2^16.0143)
mul.w r4, r4, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r4  <= 0x01038e8c (+2^24.0199)
add.w r7, r7, r4
    //// bounds:  -0x228ac48 (-2^25.1103) <= r7  <= 0x0390477b (+2^25.8333)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r4  <= 0x028f477b (+2^25.3560)
/*** LAYER 6 ***/
ldr.w r14, =11653
RED1 r11, r3
    //// bounds:  -0x0000529 (-2^10.3674) <= r11 <= 0x00010529 (+2^16.0288)
mul.w r11, r11, r14
    //// bounds:  -0x0eae34d (-2^23.8758) <= r11 <= 0x2e6fe34d (+2^29.5372)
add.w r12, r12, r11
    //// bounds:  -0x61422e3 (-2^26.6038) <= r12 <= 0x2f00be16 (+2^29.5547)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x339922e3 (-2^29.6892) <= r11 <= 0x017bbe16 (+2^24.5689)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =31534
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x200ed8c (-2^25.0026) <= r9  <= 0x7d2eed8c (+2^30.9679)
RED1 r9, r3
    //// bounds:  -0x0007d2e (-2^14.9679) <= r9  <= 0x00017d2e (+2^16.5743)
sub.w r10, r10, r9
    //// bounds:  -0x42bbcc4 (-2^26.0603) <= r10 <= 0x019057f7 (+2^24.6451)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x42abcc4 (-2^26.0590) <= r9  <= 0x019157f7 (+2^24.6487)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =10163
RED1 r7, r3
    //// bounds:  -0x0000390 (-2^ 9.8329) <= r7  <= 0x00010390 (+2^16.0199)
mul.w r7, r7, r14
    //// bounds:  -0x08d6db0 (-2^23.1439) <= r7  <= 0x28406db0 (+2^29.3310)
add.w r8, r8, r7
    //// bounds:  -0x2b619f8 (-2^25.4390) <= r8  <= 0x2bd0b52b (+2^29.4534)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2a6919f8 (-2^29.4064) <= r7  <= 0x041db52b (+2^26.0413)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19752
RED1 r4, r3
    //// bounds:  -0x0000329 (-2^ 9.6600) <= r4  <= 0x00010329 (+2^16.0177)
mul.w r4, r4, r14
    //// bounds:  -0x0f3d368 (-2^23.9297) <= r4  <= 0x4e1bd368 (+2^30.2874)
sub.w r6, r6, r4
    //// bounds:  -0x51457fb0 (-2^30.3447) <= r6  <= 0x03831ae3 (+2^25.8123)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x41d7fb0 (-2^26.0410) <= r4  <= 0x50ab1ae3 (+2^30.3339)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1760]
str.w r11, [r1, #1780]
str.w r10, [r1, #1800]
str.w r9, [r1, #1820]
str.w r8, [r1, #1840]
str.w r7, [r1, #1860]
str.w r6, [r1, #1880]
str.w r4, [r1, #1900]
ldr.w r12, [sp, #1060]
ldr.w r11, [sp, #1072]
ldr.w r10, [sp, #1084]
ldr.w r9, [sp, #1096]
ldr.w r8, [sp, #1108]
ldr.w r7, [sp, #1120]
ldr.w r6, [sp, #1132]
ldr.w r4, [sp, #1144]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r8  <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r8, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r12 <= 0x008cb8ef (+2^23.1367)
add.w r8, r12, r8, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r8  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r7  <= 0x00010221 (+2^16.0119)
sub.w r11, r11, r7, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r11 <= 0x008cb8ef (+2^23.1367)
add.w r7, r11, r7, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r7  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r6  <= 0x00010221 (+2^16.0119)
sub.w r10, r10, r6, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r10 <= 0x008cb8ef (+2^23.1367)
add.w r6, r10, r6, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r6  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r4  <= 0x00010221 (+2^16.0119)
sub.w r9, r9, r4, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r9  <= 0x008cb8ef (+2^23.1367)
add.w r4, r9, r4, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r4  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 5 ***/
ldr.w r14, =-255
RED1 r10, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r10 <= 0x00010426 (+2^16.0232)
mul.w r10, r10, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r10 <= 0x000421da (+2^18.0469)
add.w r12, r12, r10
    //// bounds:  -0x5293f96 (-2^26.3677) <= r12 <= 0x0090dac9 (+2^23.1785)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r10 <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r9  <= 0x00010426 (+2^16.0232)
mul.w r9, r9, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r9  <= 0x000421da (+2^18.0469)
add.w r11, r11, r9
    //// bounds:  -0x5293f96 (-2^26.3677) <= r11 <= 0x0090dac9 (+2^23.1785)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r9  <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
ldr.w r14, =257
RED1 r6, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r6  <= 0x0001028c (+2^16.0143)
mul.w r6, r6, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r6  <= 0x01038e8c (+2^24.0199)
add.w r8, r8, r6
    //// bounds:  -0x228ac48 (-2^25.1103) <= r8  <= 0x0390477b (+2^25.8333)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r6  <= 0x028f477b (+2^25.3560)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r4  <= 0x0001028c (+2^16.0143)
mul.w r4, r4, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r4  <= 0x01038e8c (+2^24.0199)
add.w r7, r7, r4
    //// bounds:  -0x228ac48 (-2^25.1103) <= r7  <= 0x0390477b (+2^25.8333)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r4  <= 0x028f477b (+2^25.3560)
/*** LAYER 6 ***/
ldr.w r14, =11653
RED1 r11, r3
    //// bounds:  -0x0000529 (-2^10.3674) <= r11 <= 0x00010529 (+2^16.0288)
mul.w r11, r11, r14
    //// bounds:  -0x0eae34d (-2^23.8758) <= r11 <= 0x2e6fe34d (+2^29.5372)
add.w r12, r12, r11
    //// bounds:  -0x61422e3 (-2^26.6038) <= r12 <= 0x2f00be16 (+2^29.5547)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x339922e3 (-2^29.6892) <= r11 <= 0x017bbe16 (+2^24.5689)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =31534
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x200ed8c (-2^25.0026) <= r9  <= 0x7d2eed8c (+2^30.9679)
RED1 r9, r3
    //// bounds:  -0x0007d2e (-2^14.9679) <= r9  <= 0x00017d2e (+2^16.5743)
sub.w r10, r10, r9
    //// bounds:  -0x42bbcc4 (-2^26.0603) <= r10 <= 0x019057f7 (+2^24.6451)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x42abcc4 (-2^26.0590) <= r9  <= 0x019157f7 (+2^24.6487)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =10163
RED1 r7, r3
    //// bounds:  -0x0000390 (-2^ 9.8329) <= r7  <= 0x00010390 (+2^16.0199)
mul.w r7, r7, r14
    //// bounds:  -0x08d6db0 (-2^23.1439) <= r7  <= 0x28406db0 (+2^29.3310)
add.w r8, r8, r7
    //// bounds:  -0x2b619f8 (-2^25.4390) <= r8  <= 0x2bd0b52b (+2^29.4534)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2a6919f8 (-2^29.4064) <= r7  <= 0x041db52b (+2^26.0413)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19752
RED1 r4, r3
    //// bounds:  -0x0000329 (-2^ 9.6600) <= r4  <= 0x00010329 (+2^16.0177)
mul.w r4, r4, r14
    //// bounds:  -0x0f3d368 (-2^23.9297) <= r4  <= 0x4e1bd368 (+2^30.2874)
sub.w r6, r6, r4
    //// bounds:  -0x51457fb0 (-2^30.3447) <= r6  <= 0x03831ae3 (+2^25.8123)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x41d7fb0 (-2^26.0410) <= r4  <= 0x50ab1ae3 (+2^30.3339)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 88 ***/
ldr.w r14, =11653
mul.w r3, r12, r14
    //// bounds:  -0x16c28000 (-2^28.5084) <= r3  <= 0x16c28000 (+2^28.5084)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1772]
/*** baseaux 89 ***/
ldr.w r14, =-11653
mul.w r3, r11, r14
    //// bounds:  -0x16c28000 (-2^28.5084) <= r3  <= 0x16c28000 (+2^28.5084)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1792]
/*** baseaux 90 ***/
ldr.w r14, =-31534
mul.w r3, r10, r14
    //// bounds:  -0x3d970000 (-2^29.9446) <= r3  <= 0x3d970000 (+2^29.9446)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1812]
/*** baseaux 91 ***/
ldr.w r14, =31534
mul.w r3, r9, r14
    //// bounds:  -0x3d970000 (-2^29.9446) <= r3  <= 0x3d970000 (+2^29.9446)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1832]
/*** baseaux 92 ***/
ldr.w r14, =10163
mul.w r3, r8, r14
    //// bounds:  -0x13d98000 (-2^28.3110) <= r3  <= 0x13d98000 (+2^28.3110)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1852]
/*** baseaux 93 ***/
ldr.w r14, =-10163
mul.w r3, r7, r14
    //// bounds:  -0x13d98000 (-2^28.3110) <= r3  <= 0x13d98000 (+2^28.3110)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1872]
/*** baseaux 94 ***/
ldr.w r14, =-19752
mul.w r3, r6, r14
    //// bounds:  -0x26940000 (-2^29.2697) <= r3  <= 0x26940000 (+2^29.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1892]
/*** baseaux 95 ***/
ldr.w r14, =19752
mul.w r3, r4, r14
    //// bounds:  -0x26940000 (-2^29.2697) <= r3  <= 0x26940000 (+2^29.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1912]
str.w r12, [r1, #1764]
str.w r11, [r1, #1784]
str.w r10, [r1, #1804]
str.w r9, [r1, #1824]
str.w r8, [r1, #1844]
str.w r7, [r1, #1864]
str.w r6, [r1, #1884]
str.w r4, [r1, #1904]
ldr.w r12, [sp, #1064]
ldr.w r11, [sp, #1076]
ldr.w r10, [sp, #1088]
ldr.w r9, [sp, #1100]
ldr.w r8, [sp, #1112]
ldr.w r7, [sp, #1124]
ldr.w r6, [sp, #1136]
ldr.w r4, [sp, #1148]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r8  <= 0x00010221 (+2^16.0119)
sub.w r12, r12, r8, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r12 <= 0x008cb8ef (+2^23.1367)
add.w r8, r12, r8, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r8  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r7  <= 0x00010221 (+2^16.0119)
sub.w r11, r11, r7, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r11 <= 0x008cb8ef (+2^23.1367)
add.w r7, r11, r7, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r7  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r6  <= 0x00010221 (+2^16.0119)
sub.w r10, r10, r6, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r10 <= 0x008cb8ef (+2^23.1367)
add.w r6, r10, r6, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r6  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000221 (-2^ 9.0901) <= r4  <= 0x00010221 (+2^16.0119)
sub.w r9, r9, r4, lsl #9
    //// bounds:  -0x4261dbc (-2^26.0527) <= r9  <= 0x008cb8ef (+2^23.1367)
add.w r4, r9, r4, lsl #10
    //// bounds:  -0x2261dbc (-2^25.1036) <= r4  <= 0x028cb8ef (+2^25.3503)
/*** LAYER 5 ***/
ldr.w r14, =-255
RED1 r10, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r10 <= 0x00010426 (+2^16.0232)
mul.w r10, r10, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r10 <= 0x000421da (+2^18.0469)
add.w r12, r12, r10
    //// bounds:  -0x5293f96 (-2^26.3677) <= r12 <= 0x0090dac9 (+2^23.1785)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r10 <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000426 (-2^10.0526) <= r9  <= 0x00010426 (+2^16.0232)
mul.w r9, r9, r14
    //// bounds:  -0x10321da (-2^24.0175) <= r9  <= 0x000421da (+2^18.0469)
add.w r11, r11, r9
    //// bounds:  -0x5293f96 (-2^26.3677) <= r11 <= 0x0090dac9 (+2^23.1785)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x42a3f96 (-2^26.0583) <= r9  <= 0x018fdac9 (+2^24.6433)
/*** LAYER 5 ***/
ldr.w r14, =257
RED1 r6, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r6  <= 0x0001028c (+2^16.0143)
mul.w r6, r6, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r6  <= 0x01038e8c (+2^24.0199)
add.w r8, r8, r6
    //// bounds:  -0x228ac48 (-2^25.1103) <= r8  <= 0x0390477b (+2^25.8333)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r6  <= 0x028f477b (+2^25.3560)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000028c (-2^ 9.3487) <= r4  <= 0x0001028c (+2^16.0143)
mul.w r4, r4, r14
    //// bounds:  -0x0028e8c (-2^17.3544) <= r4  <= 0x01038e8c (+2^24.0199)
add.w r7, r7, r4
    //// bounds:  -0x228ac48 (-2^25.1103) <= r7  <= 0x0390477b (+2^25.8333)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x329ac48 (-2^25.6612) <= r4  <= 0x028f477b (+2^25.3560)
/*** LAYER 6 ***/
ldr.w r14, =11653
RED1 r11, r3
    //// bounds:  -0x0000529 (-2^10.3674) <= r11 <= 0x00010529 (+2^16.0288)
mul.w r11, r11, r14
    //// bounds:  -0x0eae34d (-2^23.8758) <= r11 <= 0x2e6fe34d (+2^29.5372)
add.w r12, r12, r11
    //// bounds:  -0x61422e3 (-2^26.6038) <= r12 <= 0x2f00be16 (+2^29.5547)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x339922e3 (-2^29.6892) <= r11 <= 0x017bbe16 (+2^24.5689)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =31534
RED1 r9, r3
    //// bounds:  -0x000042a (-2^10.0580) <= r9  <= 0x0001042a (+2^16.0233)
mul.w r9, r9, r14
    //// bounds:  -0x200ed8c (-2^25.0026) <= r9  <= 0x7d2eed8c (+2^30.9679)
RED1 r9, r3
    //// bounds:  -0x0007d2e (-2^14.9679) <= r9  <= 0x00017d2e (+2^16.5743)
sub.w r10, r10, r9
    //// bounds:  -0x42bbcc4 (-2^26.0603) <= r10 <= 0x019057f7 (+2^24.6451)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x42abcc4 (-2^26.0590) <= r9  <= 0x019157f7 (+2^24.6487)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =10163
RED1 r7, r3
    //// bounds:  -0x0000390 (-2^ 9.8329) <= r7  <= 0x00010390 (+2^16.0199)
mul.w r7, r7, r14
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x08d6db0 (-2^23.1439) <= r7  <= 0x28406db0 (+2^29.3310)
add.w r8, r8, r7
    //// bounds:  -0x2b619f8 (-2^25.4390) <= r8  <= 0x2bd0b52b (+2^29.4534)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2a6919f8 (-2^29.4064) <= r7  <= 0x041db52b (+2^26.0413)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19752
RED1 r4, r3
    //// bounds:  -0x0000329 (-2^ 9.6600) <= r4  <= 0x00010329 (+2^16.0177)
mul.w r4, r4, r14
    //// bounds:  -0x0f3d368 (-2^23.9297) <= r4  <= 0x4e1bd368 (+2^30.2874)
sub.w r6, r6, r4
    //// bounds:  -0x51457fb0 (-2^30.3447) <= r6  <= 0x03831ae3 (+2^25.8123)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x41d7fb0 (-2^26.0410) <= r4  <= 0x50ab1ae3 (+2^30.3339)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 88 ***/
ldr.w r14, =11653
mul.w r3, r12, r14
    //// bounds:  -0x16c28000 (-2^28.5084) <= r3  <= 0x16c28000 (+2^28.5084)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1776]
/*** baseaux 89 ***/
ldr.w r14, =-11653
mul.w r3, r11, r14
    //// bounds:  -0x16c28000 (-2^28.5084) <= r3  <= 0x16c28000 (+2^28.5084)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1796]
/*** baseaux 90 ***/
ldr.w r14, =-31534
mul.w r3, r10, r14
    //// bounds:  -0x3d970000 (-2^29.9446) <= r3  <= 0x3d970000 (+2^29.9446)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1816]
/*** baseaux 91 ***/
ldr.w r14, =31534
mul.w r3, r9, r14
    //// bounds:  -0x3d970000 (-2^29.9446) <= r3  <= 0x3d970000 (+2^29.9446)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1836]
/*** baseaux 92 ***/
ldr.w r14, =10163
mul.w r3, r8, r14
    //// bounds:  -0x13d98000 (-2^28.3110) <= r3  <= 0x13d98000 (+2^28.3110)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1856]
/*** baseaux 93 ***/
ldr.w r14, =-10163
mul.w r3, r7, r14
    //// bounds:  -0x13d98000 (-2^28.3110) <= r3  <= 0x13d98000 (+2^28.3110)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1876]
/*** baseaux 94 ***/
ldr.w r14, =-19752
mul.w r3, r6, r14
    //// bounds:  -0x26940000 (-2^29.2697) <= r3  <= 0x26940000 (+2^29.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1896]
/*** baseaux 95 ***/
ldr.w r14, =19752
mul.w r3, r4, r14
    //// bounds:  -0x26940000 (-2^29.2697) <= r3  <= 0x26940000 (+2^29.2697)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1916]
str.w r12, [r1, #1768]
str.w r11, [r1, #1788]
str.w r10, [r1, #1808]
str.w r9, [r1, #1828]
str.w r8, [r1, #1848]
str.w r7, [r1, #1868]
str.w r6, [r1, #1888]
str.w r4, [r1, #1908]
ldr.w r12, [sp, #1152]
ldr.w r11, [sp, #1164]
ldr.w r10, [sp, #1176]
ldr.w r9, [sp, #1188]
ldr.w r8, [sp, #1200]
ldr.w r7, [sp, #1212]
ldr.w r6, [sp, #1224]
ldr.w r4, [sp, #1236]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r12 <= 0x00315e7d (+2^21.6255)
add.w r8, r12, r8, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r8  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r11 <= 0x00315e7d (+2^21.6255)
add.w r7, r11, r7, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r7  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r10 <= 0x00315e7d (+2^21.6255)
add.w r6, r10, r6, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r6  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r9  <= 0x00315e7d (+2^21.6255)
add.w r4, r9, r4, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r4  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 5 ***/
ldr.w r14, =32641
RED1 r10, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r10 <= 0x000100b0 (+2^16.0039)
mul.w r10, r10, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r10 <= 0x7fd8a8b0 (+2^30.9983)
RED1 r10, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r10 <= 0x00017fd8 (+2^16.5844)
sub.w r12, r12, r10
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r12 <= 0x0031de55 (+2^21.6401)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r10 <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r9  <= 0x7fd8a8b0 (+2^30.9983)
RED1 r9, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r9  <= 0x00017fd8 (+2^16.5844)
sub.w r11, r11, r9
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r11 <= 0x0031de55 (+2^21.6401)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r9  <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
ldr.w r14, =32640
RED1 r6, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r6  <= 0x000100b1 (+2^16.0039)
mul.w r6, r6, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r6  <= 0x7fd82780 (+2^30.9982)
RED1 r6, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r6  <= 0x00017fd8 (+2^16.5844)
add.w r8, r8, r6
    //// bounds:  -0x030de55 (-2^21.6108) <= r8  <= 0x00b2de55 (+2^23.4828)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r6  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r4  <= 0x7fd82780 (+2^30.9982)
RED1 r4, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r4  <= 0x00017fd8 (+2^16.5844)
add.w r7, r7, r4
    //// bounds:  -0x030de55 (-2^21.6108) <= r7  <= 0x00b2de55 (+2^23.4828)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r4  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 6 ***/
ldr.w r14, =27974
RED1 r11, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r11 <= 0x000100b1 (+2^16.0039)
mul.w r11, r11, r14
    //// bounds:  -0x04b8d66 (-2^22.2394) <= r11 <= 0x6d918d66 (+2^30.7757)
add.w r12, r12, r11
    //// bounds:  -0x0fd6bbb (-2^23.9854) <= r12 <= 0x6dc36bbb (+2^30.7783)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e436bbb (-2^30.7848) <= r11 <= 0x007d6bbb (+2^22.9706)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =17811
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x02fd510 (-2^21.5799) <= r9  <= 0x45c2d510 (+2^30.1244)
add.w r10, r10, r9
    //// bounds:  -0x0e0b365 (-2^23.8119) <= r10 <= 0x45f5b365 (+2^30.1285)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4673b365 (-2^30.1386) <= r9  <= 0x0062b365 (+2^22.6250)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11175
RED1 r7, r3
    //// bounds:  -0x00000b2 (-2^ 7.4757) <= r7  <= 0x000100b2 (+2^16.0039)
mul.w r7, r7, r14
    //// bounds:  -0x01e5a1e (-2^20.9237) <= r7  <= 0x2bc55a1e (+2^29.4519)
add.w r8, r8, r7
    //// bounds:  -0x04f3873 (-2^22.3078) <= r8  <= 0x2c783873 (+2^29.4747)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2bf63873 (-2^29.4582) <= r7  <= 0x00d13873 (+2^23.7089)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22828
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x03da76c (-2^21.9461) <= r4  <= 0x5969a76c (+2^30.4824)
sub.w r6, r6, r4
    //// bounds:  -0x599b85c1 (-2^30.4855) <= r6  <= 0x00ef85c1 (+2^23.9040)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x06f85c1 (-2^22.8012) <= r4  <= 0x5a1b85c1 (+2^30.4936)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #1920]
str.w r11, [r1, #1940]
str.w r10, [r1, #1960]
str.w r9, [r1, #1980]
str.w r8, [r1, #2000]
str.w r7, [r1, #2020]
str.w r6, [r1, #2040]
str.w r4, [r1, #2060]
ldr.w r12, [sp, #1156]
ldr.w r11, [sp, #1168]
ldr.w r10, [sp, #1180]
ldr.w r9, [sp, #1192]
ldr.w r8, [sp, #1204]
ldr.w r7, [sp, #1216]
ldr.w r6, [sp, #1228]
ldr.w r4, [sp, #1240]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r12 <= 0x00315e7d (+2^21.6255)
add.w r8, r12, r8, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r8  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r11 <= 0x00315e7d (+2^21.6255)
add.w r7, r11, r7, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r7  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r10 <= 0x00315e7d (+2^21.6255)
add.w r6, r10, r6, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r6  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r9  <= 0x00315e7d (+2^21.6255)
add.w r4, r9, r4, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r4  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 5 ***/
ldr.w r14, =32641
RED1 r10, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r10 <= 0x000100b0 (+2^16.0039)
mul.w r10, r10, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r10 <= 0x7fd8a8b0 (+2^30.9983)
RED1 r10, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r10 <= 0x00017fd8 (+2^16.5844)
sub.w r12, r12, r10
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r12 <= 0x0031de55 (+2^21.6401)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r10 <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r9  <= 0x7fd8a8b0 (+2^30.9983)
RED1 r9, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r9  <= 0x00017fd8 (+2^16.5844)
sub.w r11, r11, r9
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r11 <= 0x0031de55 (+2^21.6401)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r9  <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
ldr.w r14, =32640
RED1 r6, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r6  <= 0x000100b1 (+2^16.0039)
mul.w r6, r6, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r6  <= 0x7fd82780 (+2^30.9982)
RED1 r6, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r6  <= 0x00017fd8 (+2^16.5844)
add.w r8, r8, r6
    //// bounds:  -0x030de55 (-2^21.6108) <= r8  <= 0x00b2de55 (+2^23.4828)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r6  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r4  <= 0x7fd82780 (+2^30.9982)
RED1 r4, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r4  <= 0x00017fd8 (+2^16.5844)
add.w r7, r7, r4
    //// bounds:  -0x030de55 (-2^21.6108) <= r7  <= 0x00b2de55 (+2^23.4828)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r4  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 6 ***/
ldr.w r14, =27974
RED1 r11, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r11 <= 0x000100b1 (+2^16.0039)
mul.w r11, r11, r14
    //// bounds:  -0x04b8d66 (-2^22.2394) <= r11 <= 0x6d918d66 (+2^30.7757)
add.w r12, r12, r11
    //// bounds:  -0x0fd6bbb (-2^23.9854) <= r12 <= 0x6dc36bbb (+2^30.7783)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e436bbb (-2^30.7848) <= r11 <= 0x007d6bbb (+2^22.9706)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =17811
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x02fd510 (-2^21.5799) <= r9  <= 0x45c2d510 (+2^30.1244)
add.w r10, r10, r9
    //// bounds:  -0x0e0b365 (-2^23.8119) <= r10 <= 0x45f5b365 (+2^30.1285)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4673b365 (-2^30.1386) <= r9  <= 0x0062b365 (+2^22.6250)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11175
RED1 r7, r3
    //// bounds:  -0x00000b2 (-2^ 7.4757) <= r7  <= 0x000100b2 (+2^16.0039)
mul.w r7, r7, r14
    //// bounds:  -0x01e5a1e (-2^20.9237) <= r7  <= 0x2bc55a1e (+2^29.4519)
add.w r8, r8, r7
    //// bounds:  -0x04f3873 (-2^22.3078) <= r8  <= 0x2c783873 (+2^29.4747)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2bf63873 (-2^29.4582) <= r7  <= 0x00d13873 (+2^23.7089)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22828
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x03da76c (-2^21.9461) <= r4  <= 0x5969a76c (+2^30.4824)
sub.w r6, r6, r4
    //// bounds:  -0x599b85c1 (-2^30.4855) <= r6  <= 0x00ef85c1 (+2^23.9040)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x06f85c1 (-2^22.8012) <= r4  <= 0x5a1b85c1 (+2^30.4936)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 96 ***/
ldr.w r14, =27974
mul.w r3, r12, r14
    //// bounds:  -0x36a30000 (-2^29.7718) <= r3  <= 0x36a30000 (+2^29.7718)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1932]
/*** baseaux 97 ***/
ldr.w r14, =-27974
mul.w r3, r11, r14
    //// bounds:  -0x36a30000 (-2^29.7718) <= r3  <= 0x36a30000 (+2^29.7718)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1952]
/*** baseaux 98 ***/
ldr.w r14, =17811
mul.w r3, r10, r14
    //// bounds:  -0x22c98000 (-2^29.1205) <= r3  <= 0x22c98000 (+2^29.1205)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1972]
/*** baseaux 99 ***/
ldr.w r14, =-17811
mul.w r3, r9, r14
    //// bounds:  -0x22c98000 (-2^29.1205) <= r3  <= 0x22c98000 (+2^29.1205)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1992]
/*** baseaux 100 ***/
ldr.w r14, =11175
mul.w r3, r8, r14
    //// bounds:  -0x15d38000 (-2^28.4480) <= r3  <= 0x15d38000 (+2^28.4480)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2012]
/*** baseaux 101 ***/
ldr.w r14, =-11175
mul.w r3, r7, r14
    //// bounds:  -0x15d38000 (-2^28.4480) <= r3  <= 0x15d38000 (+2^28.4480)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2032]
/*** baseaux 102 ***/
ldr.w r14, =-22828
mul.w r3, r6, r14
    //// bounds:  -0x2c960000 (-2^29.4785) <= r3  <= 0x2c960000 (+2^29.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2052]
/*** baseaux 103 ***/
ldr.w r14, =22828
mul.w r3, r4, r14
    //// bounds:  -0x2c960000 (-2^29.4785) <= r3  <= 0x2c960000 (+2^29.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2072]
str.w r12, [r1, #1924]
str.w r11, [r1, #1944]
str.w r10, [r1, #1964]
str.w r9, [r1, #1984]
str.w r8, [r1, #2004]
str.w r7, [r1, #2024]
str.w r6, [r1, #2044]
str.w r4, [r1, #2064]
ldr.w r12, [sp, #1160]
ldr.w r11, [sp, #1172]
ldr.w r10, [sp, #1184]
ldr.w r9, [sp, #1196]
ldr.w r8, [sp, #1208]
ldr.w r7, [sp, #1220]
ldr.w r6, [sp, #1232]
ldr.w r4, [sp, #1244]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r12 <= 0x00315e7d (+2^21.6255)
add.w r8, r12, r8, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r8  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r11 <= 0x00315e7d (+2^21.6255)
add.w r7, r11, r7, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r7  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r10 <= 0x00315e7d (+2^21.6255)
add.w r6, r10, r6, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r6  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #7
    //// bounds:  -0x0b05e7d (-2^23.4625) <= r9  <= 0x00315e7d (+2^21.6255)
add.w r4, r9, r4, lsl #8
    //// bounds:  -0x0305e7d (-2^21.5960) <= r4  <= 0x00b15e7d (+2^23.4706)
/*** LAYER 5 ***/
ldr.w r14, =32641
RED1 r10, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r10 <= 0x000100b0 (+2^16.0039)
mul.w r10, r10, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r10 <= 0x7fd8a8b0 (+2^30.9983)
RED1 r10, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r10 <= 0x00017fd8 (+2^16.5844)
sub.w r12, r12, r10
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r12 <= 0x0031de55 (+2^21.6401)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r10 <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x057a8b0 (-2^22.4538) <= r9  <= 0x7fd8a8b0 (+2^30.9983)
RED1 r9, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r9  <= 0x00017fd8 (+2^16.5844)
sub.w r11, r11, r9
    //// bounds:  -0x0b1de55 (-2^23.4747) <= r11 <= 0x0031de55 (+2^21.6401)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x0b0de55 (-2^23.4665) <= r9  <= 0x0032de55 (+2^21.6687)
/*** LAYER 5 ***/
ldr.w r14, =32640
RED1 r6, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r6  <= 0x000100b1 (+2^16.0039)
mul.w r6, r6, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r6  <= 0x7fd82780 (+2^30.9982)
RED1 r6, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r6  <= 0x00017fd8 (+2^16.5844)
add.w r8, r8, r6
    //// bounds:  -0x030de55 (-2^21.6108) <= r8  <= 0x00b2de55 (+2^23.4828)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r6  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x0582780 (-2^22.4620) <= r4  <= 0x7fd82780 (+2^30.9982)
RED1 r4, r3
    //// bounds:  -0x0007fd8 (-2^14.9982) <= r4  <= 0x00017fd8 (+2^16.5844)
add.w r7, r7, r4
    //// bounds:  -0x030de55 (-2^21.6108) <= r7  <= 0x00b2de55 (+2^23.4828)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0x031de55 (-2^21.6401) <= r4  <= 0x00b1de55 (+2^23.4747)
/*** LAYER 6 ***/
ldr.w r14, =27974
RED1 r11, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r11 <= 0x000100b1 (+2^16.0039)
mul.w r11, r11, r14
    //// bounds:  -0x04b8d66 (-2^22.2394) <= r11 <= 0x6d918d66 (+2^30.7757)
add.w r12, r12, r11
    //// bounds:  -0x0fd6bbb (-2^23.9854) <= r12 <= 0x6dc36bbb (+2^30.7783)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x6e436bbb (-2^30.7848) <= r11 <= 0x007d6bbb (+2^22.9706)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =17811
RED1 r9, r3
    //// bounds:  -0x00000b0 (-2^ 7.4594) <= r9  <= 0x000100b0 (+2^16.0039)
mul.w r9, r9, r14
    //// bounds:  -0x02fd510 (-2^21.5799) <= r9  <= 0x45c2d510 (+2^30.1244)
add.w r10, r10, r9
    //// bounds:  -0x0e0b365 (-2^23.8119) <= r10 <= 0x45f5b365 (+2^30.1285)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x4673b365 (-2^30.1386) <= r9  <= 0x0062b365 (+2^22.6250)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11175
RED1 r7, r3
    //// bounds:  -0x00000b2 (-2^ 7.4757) <= r7  <= 0x000100b2 (+2^16.0039)
mul.w r7, r7, r14
    //// bounds:  -0x01e5a1e (-2^20.9237) <= r7  <= 0x2bc55a1e (+2^29.4519)
add.w r8, r8, r7
    //// bounds:  -0x04f3873 (-2^22.3078) <= r8  <= 0x2c783873 (+2^29.4747)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2bf63873 (-2^29.4582) <= r7  <= 0x00d13873 (+2^23.7089)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22828
RED1 r4, r3
    //// bounds:  -0x00000b1 (-2^ 7.4676) <= r4  <= 0x000100b1 (+2^16.0039)
mul.w r4, r4, r14
    //// bounds:  -0x03da76c (-2^21.9461) <= r4  <= 0x5969a76c (+2^30.4824)
sub.w r6, r6, r4
    //// bounds:  -0x599b85c1 (-2^30.4855) <= r6  <= 0x00ef85c1 (+2^23.9040)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x06f85c1 (-2^22.8012) <= r4  <= 0x5a1b85c1 (+2^30.4936)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 96 ***/
ldr.w r14, =27974
mul.w r3, r12, r14
    //// bounds:  -0x36a30000 (-2^29.7718) <= r3  <= 0x36a30000 (+2^29.7718)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1936]
/*** baseaux 97 ***/
ldr.w r14, =-27974
mul.w r3, r11, r14
    //// bounds:  -0x36a30000 (-2^29.7718) <= r3  <= 0x36a30000 (+2^29.7718)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1956]
/*** baseaux 98 ***/
ldr.w r14, =17811
mul.w r3, r10, r14
    //// bounds:  -0x22c98000 (-2^29.1205) <= r3  <= 0x22c98000 (+2^29.1205)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1976]
/*** baseaux 99 ***/
ldr.w r14, =-17811
mul.w r3, r9, r14
    //// bounds:  -0x22c98000 (-2^29.1205) <= r3  <= 0x22c98000 (+2^29.1205)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #1996]
/*** baseaux 100 ***/
ldr.w r14, =11175
mul.w r3, r8, r14
    //// bounds:  -0x15d38000 (-2^28.4480) <= r3  <= 0x15d38000 (+2^28.4480)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2016]
/*** baseaux 101 ***/
ldr.w r14, =-11175
mul.w r3, r7, r14
    //// bounds:  -0x15d38000 (-2^28.4480) <= r3  <= 0x15d38000 (+2^28.4480)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2036]
/*** baseaux 102 ***/
ldr.w r14, =-22828
mul.w r3, r6, r14
    //// bounds:  -0x2c960000 (-2^29.4785) <= r3  <= 0x2c960000 (+2^29.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2056]
/*** baseaux 103 ***/
ldr.w r14, =22828
mul.w r3, r4, r14
    //// bounds:  -0x2c960000 (-2^29.4785) <= r3  <= 0x2c960000 (+2^29.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2076]
str.w r12, [r1, #1928]
str.w r11, [r1, #1948]
str.w r10, [r1, #1968]
str.w r9, [r1, #1988]
str.w r8, [r1, #2008]
str.w r7, [r1, #2028]
str.w r6, [r1, #2048]
str.w r4, [r1, #2068]
ldr.w r12, [sp, #1248]
ldr.w r11, [sp, #1260]
ldr.w r10, [sp, #1272]
ldr.w r9, [sp, #1284]
ldr.w r8, [sp, #1296]
ldr.w r7, [sp, #1308]
ldr.w r6, [sp, #1320]
ldr.w r4, [sp, #1332]
/*** LAYER 4 ***/
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
sub.w r12, r12, r8, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r12 <= 0x40015ffc (+2^30.0001)
sub.w r8, r12, r8
    //// bounds:  -0x4000dffc (-2^30.0001) <= r8  <= 0x4001dffc (+2^30.0002)
RED1 r12, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r12 <= 0x00014001 (+2^16.3219)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
sub.w r11, r11, r7, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r11 <= 0x40015ffc (+2^30.0001)
sub.w r7, r11, r7
    //// bounds:  -0x4000dffc (-2^30.0001) <= r7  <= 0x4001dffc (+2^30.0002)
RED1 r11, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r11 <= 0x00014001 (+2^16.3219)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r6, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r10 <= 0x40015ffc (+2^30.0001)
sub.w r6, r10, r6
    //// bounds:  -0x4000dffc (-2^30.0001) <= r6  <= 0x4001dffc (+2^30.0002)
RED1 r10, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r10 <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r9, r9, r4, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r9  <= 0x40015ffc (+2^30.0001)
sub.w r4, r9, r4
    //// bounds:  -0x4000dffc (-2^30.0001) <= r4  <= 0x4001dffc (+2^30.0002)
RED1 r9, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r9  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
ldr.w r14, =2040
mul.w r10, r10, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r10 <= 0x09f607f8 (+2^27.3163)
sub.w r12, r12, r10
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r12 <= 0x01ff47f9 (+2^24.9980)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r10 <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
mul.w r9, r9, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r9  <= 0x09f607f8 (+2^27.3163)
sub.w r11, r11, r9
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r11 <= 0x01ff47f9 (+2^24.9980)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r9  <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
ldr.w r14, =2056
mul.w r6, r6, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r6  <= 0x0a0a0808 (+2^27.3276)
add.w r8, r8, r6
    //// bounds:  -0x2024809 (-2^25.0064) <= r8  <= 0x0a0b4809 (+2^27.3283)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r6  <= 0x02034809 (+2^25.0092)
/*** LAYER 5 ***/
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r7, r7, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r7  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
/*** LAYER 6 ***/
ldr.w r14, =5707
RED1 r11, r3
    //// bounds:  -0x00009f6 (-2^11.3163) <= r11 <= 0x000109f6 (+2^16.0551)
mul.w r11, r11, r14
    //// bounds:  -0x0de0f12 (-2^23.7948) <= r11 <= 0x17290f12 (+2^28.5336)
sub.w r12, r12, r11
    //// bounds:  -0x211f570b (-2^29.0497) <= r12 <= 0x02dd570b (+2^25.5183)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0xad4570b (-2^27.4369) <= r11 <= 0x1928570b (+2^28.6529)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19178
RED1 r9, r3
    //// bounds:  -0x00009f7 (-2^11.3168) <= r9  <= 0x000109f7 (+2^16.0551)
mul.w r9, r9, r14
    //// bounds:  -0x2ea81c6 (-2^25.5440) <= r9  <= 0x4dd481c6 (+2^30.2823)
sub.w r10, r10, r9
    //// bounds:  -0x4fd2c9bf (-2^30.3187) <= r10 <= 0x0ce1c9bf (+2^27.6873)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x4e8c9bf (-2^26.2955) <= r9  <= 0x57cbc9bf (+2^30.4561)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =25775
RED1 r7, r3
    //// bounds:  -0x0000a0b (-2^11.3281) <= r7  <= 0x00010a0b (+2^16.0555)
mul.w r7, r7, r14
    //// bounds:  -0x3f32985 (-2^25.9818) <= r7  <= 0x68a22985 (+2^30.7092)
add.w r8, r8, r7
    //// bounds:  -0x5f5718e (-2^26.5750) <= r8  <= 0x72ad718e (+2^30.8414)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x6aa4718e (-2^30.7366) <= r7  <= 0x0dfe718e (+2^27.8067)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20837
RED1 r4, r3
    //// bounds:  -0x0000a0a (-2^11.3276) <= r4  <= 0x00010a0a (+2^16.0555)
mul.w r4, r4, r14
    //// bounds:  -0x3311ff2 (-2^25.6744) <= r4  <= 0x54961ff2 (+2^30.4024)
sub.w r6, r6, r4
    //// bounds:  -0x5ea067fb (-2^30.5642) <= r6  <= 0x053467fb (+2^26.3798)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0xd3b67fb (-2^27.7260) <= r4  <= 0x569967fb (+2^30.4363)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #2080]
str.w r11, [r1, #2100]
str.w r10, [r1, #2120]
str.w r9, [r1, #2140]
str.w r8, [r1, #2160]
str.w r7, [r1, #2180]
str.w r6, [r1, #2200]
str.w r4, [r1, #2220]
ldr.w r12, [sp, #1252]
ldr.w r11, [sp, #1264]
ldr.w r10, [sp, #1276]
ldr.w r9, [sp, #1288]
ldr.w r8, [sp, #1300]
ldr.w r7, [sp, #1312]
ldr.w r6, [sp, #1324]
ldr.w r4, [sp, #1336]
/*** LAYER 4 ***/
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
sub.w r12, r12, r8, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r12 <= 0x40015ffc (+2^30.0001)
sub.w r8, r12, r8
    //// bounds:  -0x4000dffc (-2^30.0001) <= r8  <= 0x4001dffc (+2^30.0002)
RED1 r12, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r12 <= 0x00014001 (+2^16.3219)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
sub.w r11, r11, r7, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r11 <= 0x40015ffc (+2^30.0001)
sub.w r7, r11, r7
    //// bounds:  -0x4000dffc (-2^30.0001) <= r7  <= 0x4001dffc (+2^30.0002)
RED1 r11, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r11 <= 0x00014001 (+2^16.3219)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r6, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r10 <= 0x40015ffc (+2^30.0001)
sub.w r6, r10, r6
    //// bounds:  -0x4000dffc (-2^30.0001) <= r6  <= 0x4001dffc (+2^30.0002)
RED1 r10, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r10 <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r9, r9, r4, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r9  <= 0x40015ffc (+2^30.0001)
sub.w r4, r9, r4
    //// bounds:  -0x4000dffc (-2^30.0001) <= r4  <= 0x4001dffc (+2^30.0002)
RED1 r9, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r9  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
ldr.w r14, =2040
mul.w r10, r10, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r10 <= 0x09f607f8 (+2^27.3163)
sub.w r12, r12, r10
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r12 <= 0x01ff47f9 (+2^24.9980)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r10 <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
mul.w r9, r9, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r9  <= 0x09f607f8 (+2^27.3163)
sub.w r11, r11, r9
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r11 <= 0x01ff47f9 (+2^24.9980)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r9  <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
ldr.w r14, =2056
mul.w r6, r6, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r6  <= 0x0a0a0808 (+2^27.3276)
add.w r8, r8, r6
    //// bounds:  -0x2024809 (-2^25.0064) <= r8  <= 0x0a0b4809 (+2^27.3283)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r6  <= 0x02034809 (+2^25.0092)
/*** LAYER 5 ***/
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r7, r7, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r7  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
/*** LAYER 6 ***/
ldr.w r14, =5707
RED1 r11, r3
    //// bounds:  -0x00009f6 (-2^11.3163) <= r11 <= 0x000109f6 (+2^16.0551)
mul.w r11, r11, r14
    //// bounds:  -0x0de0f12 (-2^23.7948) <= r11 <= 0x17290f12 (+2^28.5336)
sub.w r12, r12, r11
    //// bounds:  -0x211f570b (-2^29.0497) <= r12 <= 0x02dd570b (+2^25.5183)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0xad4570b (-2^27.4369) <= r11 <= 0x1928570b (+2^28.6529)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19178
RED1 r9, r3
    //// bounds:  -0x00009f7 (-2^11.3168) <= r9  <= 0x000109f7 (+2^16.0551)
mul.w r9, r9, r14
    //// bounds:  -0x2ea81c6 (-2^25.5440) <= r9  <= 0x4dd481c6 (+2^30.2823)
sub.w r10, r10, r9
    //// bounds:  -0x4fd2c9bf (-2^30.3187) <= r10 <= 0x0ce1c9bf (+2^27.6873)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x4e8c9bf (-2^26.2955) <= r9  <= 0x57cbc9bf (+2^30.4561)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =25775
RED1 r7, r3
    //// bounds:  -0x0000a0b (-2^11.3281) <= r7  <= 0x00010a0b (+2^16.0555)
mul.w r7, r7, r14
    //// bounds:  -0x3f32985 (-2^25.9818) <= r7  <= 0x68a22985 (+2^30.7092)
add.w r8, r8, r7
    //// bounds:  -0x5f5718e (-2^26.5750) <= r8  <= 0x72ad718e (+2^30.8414)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x6aa4718e (-2^30.7366) <= r7  <= 0x0dfe718e (+2^27.8067)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20837
RED1 r4, r3
    //// bounds:  -0x0000a0a (-2^11.3276) <= r4  <= 0x00010a0a (+2^16.0555)
mul.w r4, r4, r14
    //// bounds:  -0x3311ff2 (-2^25.6744) <= r4  <= 0x54961ff2 (+2^30.4024)
sub.w r6, r6, r4
    //// bounds:  -0x5ea067fb (-2^30.5642) <= r6  <= 0x053467fb (+2^26.3798)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0xd3b67fb (-2^27.7260) <= r4  <= 0x569967fb (+2^30.4363)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 104 ***/
ldr.w r14, =-5707
mul.w r3, r12, r14
    //// bounds:  -0xb258000 (-2^27.4785) <= r3  <= 0x0b258000 (+2^27.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2092]
/*** baseaux 105 ***/
ldr.w r14, =5707
mul.w r3, r11, r14
    //// bounds:  -0xb258000 (-2^27.4785) <= r3  <= 0x0b258000 (+2^27.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2112]
/*** baseaux 106 ***/
ldr.w r14, =-19178
mul.w r3, r10, r14
    //// bounds:  -0x25750000 (-2^29.2272) <= r3  <= 0x25750000 (+2^29.2272)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2132]
/*** baseaux 107 ***/
ldr.w r14, =19178
mul.w r3, r9, r14
    //// bounds:  -0x25750000 (-2^29.2272) <= r3  <= 0x25750000 (+2^29.2272)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2152]
/*** baseaux 108 ***/
ldr.w r14, =25775
mul.w r3, r8, r14
    //// bounds:  -0x32578000 (-2^29.6537) <= r3  <= 0x32578000 (+2^29.6537)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2172]
/*** baseaux 109 ***/
ldr.w r14, =-25775
mul.w r3, r7, r14
    //// bounds:  -0x32578000 (-2^29.6537) <= r3  <= 0x32578000 (+2^29.6537)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2192]
/*** baseaux 110 ***/
ldr.w r14, =-20837
mul.w r3, r6, r14
    //// bounds:  -0x28b28000 (-2^29.3469) <= r3  <= 0x28b28000 (+2^29.3469)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2212]
/*** baseaux 111 ***/
ldr.w r14, =20837
mul.w r3, r4, r14
    //// bounds:  -0x28b28000 (-2^29.3469) <= r3  <= 0x28b28000 (+2^29.3469)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2232]
str.w r12, [r1, #2084]
str.w r11, [r1, #2104]
str.w r10, [r1, #2124]
str.w r9, [r1, #2144]
str.w r8, [r1, #2164]
str.w r7, [r1, #2184]
str.w r6, [r1, #2204]
str.w r4, [r1, #2224]
ldr.w r12, [sp, #1256]
ldr.w r11, [sp, #1268]
ldr.w r10, [sp, #1280]
ldr.w r9, [sp, #1292]
ldr.w r8, [sp, #1304]
ldr.w r7, [sp, #1316]
ldr.w r6, [sp, #1328]
ldr.w r4, [sp, #1340]
/*** LAYER 4 ***/
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
sub.w r12, r12, r8, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r12 <= 0x40015ffc (+2^30.0001)
sub.w r8, r12, r8
    //// bounds:  -0x4000dffc (-2^30.0001) <= r8  <= 0x4001dffc (+2^30.0002)
RED1 r12, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r12 <= 0x00014001 (+2^16.3219)
RED1 r8, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r8  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
sub.w r11, r11, r7, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r11 <= 0x40015ffc (+2^30.0001)
sub.w r7, r11, r7
    //// bounds:  -0x4000dffc (-2^30.0001) <= r7  <= 0x4001dffc (+2^30.0002)
RED1 r11, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r11 <= 0x00014001 (+2^16.3219)
RED1 r7, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r7  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
sub.w r10, r10, r6, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r10 <= 0x40015ffc (+2^30.0001)
sub.w r6, r10, r6
    //// bounds:  -0x4000dffc (-2^30.0001) <= r6  <= 0x4001dffc (+2^30.0002)
RED1 r10, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r10 <= 0x00014001 (+2^16.3219)
RED1 r6, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r6  <= 0x00014001 (+2^16.3219)
/*** LAYER 4 ***/
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
sub.w r9, r9, r4, lsl #15
    //// bounds:  -0x40005ffc (-2^30.0000) <= r9  <= 0x40015ffc (+2^30.0001)
sub.w r4, r9, r4
    //// bounds:  -0x4000dffc (-2^30.0001) <= r4  <= 0x4001dffc (+2^30.0002)
RED1 r9, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r9  <= 0x00014001 (+2^16.3219)
RED1 r4, r3
    //// bounds:  -0x0004001 (-2^14.0001) <= r4  <= 0x00014001 (+2^16.3219)
/*** LAYER 5 ***/
ldr.w r14, =2040
mul.w r10, r10, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r10 <= 0x09f607f8 (+2^27.3163)
sub.w r12, r12, r10
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r12 <= 0x01ff47f9 (+2^24.9980)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r10 <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
mul.w r9, r9, r14
    //// bounds:  -0x1fe07f8 (-2^24.9944) <= r9  <= 0x09f607f8 (+2^27.3163)
sub.w r11, r11, r9
    //// bounds:  -0x9f647f9 (-2^27.3164) <= r11 <= 0x01ff47f9 (+2^24.9980)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x1fe47f9 (-2^24.9951) <= r9  <= 0x09f747f9 (+2^27.3170)
/*** LAYER 5 ***/
ldr.w r14, =2056
mul.w r6, r6, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r6  <= 0x0a0a0808 (+2^27.3276)
add.w r8, r8, r6
    //// bounds:  -0x2024809 (-2^25.0064) <= r8  <= 0x0a0b4809 (+2^27.3283)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r6  <= 0x02034809 (+2^25.0092)
/*** LAYER 5 ***/
mul.w r4, r4, r14
    //// bounds:  -0x2020808 (-2^25.0057) <= r4  <= 0x0a0a0808 (+2^27.3276)
add.w r7, r7, r4
    //// bounds:  -0x2024809 (-2^25.0064) <= r7  <= 0x0a0b4809 (+2^27.3283)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa0a4809 (-2^27.3277) <= r4  <= 0x02034809 (+2^25.0092)
/*** LAYER 6 ***/
ldr.w r14, =5707
RED1 r11, r3
    //// bounds:  -0x00009f6 (-2^11.3163) <= r11 <= 0x000109f6 (+2^16.0551)
mul.w r11, r11, r14
    //// bounds:  -0x0de0f12 (-2^23.7948) <= r11 <= 0x17290f12 (+2^28.5336)
sub.w r12, r12, r11
    //// bounds:  -0x211f570b (-2^29.0497) <= r12 <= 0x02dd570b (+2^25.5183)
add.w r11, r12, r11, lsl #1
    //// bounds:  -0xad4570b (-2^27.4369) <= r11 <= 0x1928570b (+2^28.6529)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =19178
RED1 r9, r3
    //// bounds:  -0x00009f7 (-2^11.3168) <= r9  <= 0x000109f7 (+2^16.0551)
mul.w r9, r9, r14
    //// bounds:  -0x2ea81c6 (-2^25.5440) <= r9  <= 0x4dd481c6 (+2^30.2823)
sub.w r10, r10, r9
    //// bounds:  -0x4fd2c9bf (-2^30.3187) <= r10 <= 0x0ce1c9bf (+2^27.6873)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x4e8c9bf (-2^26.2955) <= r9  <= 0x57cbc9bf (+2^30.4561)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =25775
RED1 r7, r3
    //// bounds:  -0x0000a0b (-2^11.3281) <= r7  <= 0x00010a0b (+2^16.0555)
mul.w r7, r7, r14
    //// bounds:  -0x3f32985 (-2^25.9818) <= r7  <= 0x68a22985 (+2^30.7092)
add.w r8, r8, r7
    //// bounds:  -0x5f5718e (-2^26.5750) <= r8  <= 0x72ad718e (+2^30.8414)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x6aa4718e (-2^30.7366) <= r7  <= 0x0dfe718e (+2^27.8067)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =20837
RED1 r4, r3
    //// bounds:  -0x0000a0a (-2^11.3276) <= r4  <= 0x00010a0a (+2^16.0555)
mul.w r4, r4, r14
    //// bounds:  -0x3311ff2 (-2^25.6744) <= r4  <= 0x54961ff2 (+2^30.4024)
sub.w r6, r6, r4
    //// bounds:  -0x5ea067fb (-2^30.5642) <= r6  <= 0x053467fb (+2^26.3798)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0xd3b67fb (-2^27.7260) <= r4  <= 0x569967fb (+2^30.4363)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 104 ***/
ldr.w r14, =-5707
mul.w r3, r12, r14
    //// bounds:  -0xb258000 (-2^27.4785) <= r3  <= 0x0b258000 (+2^27.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2096]
/*** baseaux 105 ***/
ldr.w r14, =5707
mul.w r3, r11, r14
    //// bounds:  -0xb258000 (-2^27.4785) <= r3  <= 0x0b258000 (+2^27.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2116]
/*** baseaux 106 ***/
ldr.w r14, =-19178
mul.w r3, r10, r14
    //// bounds:  -0x25750000 (-2^29.2272) <= r3  <= 0x25750000 (+2^29.2272)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2136]
/*** baseaux 107 ***/
ldr.w r14, =19178
mul.w r3, r9, r14
    //// bounds:  -0x25750000 (-2^29.2272) <= r3  <= 0x25750000 (+2^29.2272)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2156]
/*** baseaux 108 ***/
ldr.w r14, =25775
mul.w r3, r8, r14
    //// bounds:  -0x32578000 (-2^29.6537) <= r3  <= 0x32578000 (+2^29.6537)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2176]
/*** baseaux 109 ***/
ldr.w r14, =-25775
mul.w r3, r7, r14
    //// bounds:  -0x32578000 (-2^29.6537) <= r3  <= 0x32578000 (+2^29.6537)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2196]
/*** baseaux 110 ***/
ldr.w r14, =-20837
mul.w r3, r6, r14
    //// bounds:  -0x28b28000 (-2^29.3469) <= r3  <= 0x28b28000 (+2^29.3469)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2216]
/*** baseaux 111 ***/
ldr.w r14, =20837
mul.w r3, r4, r14
    //// bounds:  -0x28b28000 (-2^29.3469) <= r3  <= 0x28b28000 (+2^29.3469)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2236]
str.w r12, [r1, #2088]
str.w r11, [r1, #2108]
str.w r10, [r1, #2128]
str.w r9, [r1, #2148]
str.w r8, [r1, #2168]
str.w r7, [r1, #2188]
str.w r6, [r1, #2208]
str.w r4, [r1, #2228]
b.w 1f
.ltorg /* constant pool */
1:
ldr.w r12, [sp, #1344]
ldr.w r11, [sp, #1356]
ldr.w r10, [sp, #1368]
ldr.w r9, [sp, #1380]
ldr.w r8, [sp, #1392]
ldr.w r7, [sp, #1404]
ldr.w r6, [sp, #1416]
ldr.w r4, [sp, #1428]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r8  <= 0x00010060 (+2^16.0021)
add.w r12, r12, r8, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r12 <= 0x08247db7 (+2^27.0255)
sub.w r8, r12, r8, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r8  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r7  <= 0x00010060 (+2^16.0021)
add.w r11, r11, r7, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r11 <= 0x08247db7 (+2^27.0255)
sub.w r7, r11, r7, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r7  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r6  <= 0x00010060 (+2^16.0021)
add.w r10, r10, r6, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r10 <= 0x08247db7 (+2^27.0255)
sub.w r6, r10, r6, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r6  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r4  <= 0x00010060 (+2^16.0021)
add.w r9, r9, r4, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r9  <= 0x08247db7 (+2^27.0255)
sub.w r4, r9, r4, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r4  <= 0x00247db7 (+2^21.1895)
/*** LAYER 5 ***/
ldr.w r14, =514
RED1 r10, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r10 <= 0x00010824 (+2^16.0452)
mul.w r10, r10, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r10 <= 0x02125848 (+2^25.0508)
add.w r12, r12, r10
    //// bounds:  -0x073d5ff (-2^22.8559) <= r12 <= 0x0a36d5ff (+2^27.3525)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r10 <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r9  <= 0x00010824 (+2^16.0452)
mul.w r9, r9, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r9  <= 0x02125848 (+2^25.0508)
add.w r11, r11, r9
    //// bounds:  -0x073d5ff (-2^22.8559) <= r11 <= 0x0a36d5ff (+2^27.3525)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r9  <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
ldr.w r14, =510
RED1 r6, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r6  <= 0x00010863 (+2^16.0465)
mul.w r6, r6, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r6  <= 0x020eb53a (+2^25.0409)
add.w r8, r8, r6
    //// bounds:  -0x87432f1 (-2^27.0796) <= r8  <= 0x023332f1 (+2^25.1375)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r6  <= 0x003532f1 (+2^21.7333)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r4  <= 0x00010863 (+2^16.0465)
mul.w r4, r4, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r4  <= 0x020eb53a (+2^25.0409)
add.w r7, r7, r4
    //// bounds:  -0x87432f1 (-2^27.0796) <= r7  <= 0x023332f1 (+2^25.1375)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r4  <= 0x003532f1 (+2^21.7333)
/*** LAYER 6 ***/
ldr.w r14, =19881
RED1 r11, r3
    //// bounds:  -0x0000a36 (-2^11.3520) <= r11 <= 0x00010a36 (+2^16.0564)
mul.w r11, r11, r14
    //// bounds:  -0x318fba6 (-2^25.6311) <= r11 <= 0x50c1fba6 (+2^30.3355)
add.w r12, r12, r11
    //// bounds:  -0x38cd1a5 (-2^25.8278) <= r12 <= 0x5af8d1a5 (+2^30.5073)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x5135d1a5 (-2^30.3436) <= r11 <= 0x0d4fd1a5 (+2^27.7346)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22350
RED1 r9, r3
    //// bounds:  -0x0000834 (-2^11.0362) <= r9  <= 0x00010834 (+2^16.0455)
mul.w r9, r9, r14
    //// bounds:  -0x2cc2bd8 (-2^25.4842) <= r9  <= 0x5a1a2bd8 (+2^30.4935)
sub.w r10, r10, r9
    //// bounds:  -0x5c9001d7 (-2^30.5324) <= r10 <= 0x0b0101d7 (+2^27.4599)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x54201d7 (-2^26.3945) <= r9  <= 0x624f01d7 (+2^30.6192)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9589
RED1 r7, r3
    //// bounds:  -0x0000874 (-2^11.0795) <= r7  <= 0x00010874 (+2^16.0469)
mul.w r7, r7, r14
    //// bounds:  -0x13ca104 (-2^24.3066) <= r7  <= 0x26b1a104 (+2^29.2740)
add.w r8, r8, r7
    //// bounds:  -0x9b0d3f5 (-2^27.2766) <= r8  <= 0x28e4d3f5 (+2^29.3538)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2f25d3f5 (-2^29.5591) <= r7  <= 0x036fd3f5 (+2^25.7811)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =29915
RED1 r4, r3
    //// bounds:  -0x0000a72 (-2^11.3848) <= r4  <= 0x00010a72 (+2^16.0577)
mul.w r4, r4, r14
    //// bounds:  -0x4c49786 (-2^26.2534) <= r4  <= 0x799f9786 (+2^30.9263)
RED1 r4, r3
    //// bounds:  -0x000799f (-2^14.9262) <= r4  <= 0x0001799f (+2^16.5608)
add.w r6, r6, r4
    //// bounds:  -0xa72ac90 (-2^27.3851) <= r6  <= 0x0036ac90 (+2^21.7728)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa73ac90 (-2^27.3857) <= r4  <= 0x0035ac90 (+2^21.7462)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #2240]
str.w r11, [r1, #2260]
str.w r10, [r1, #2280]
str.w r9, [r1, #2300]
str.w r8, [r1, #2320]
str.w r7, [r1, #2340]
str.w r6, [r1, #2360]
str.w r4, [r1, #2380]
ldr.w r12, [sp, #1348]
ldr.w r11, [sp, #1360]
ldr.w r10, [sp, #1372]
ldr.w r9, [sp, #1384]
ldr.w r8, [sp, #1396]
ldr.w r7, [sp, #1408]
ldr.w r6, [sp, #1420]
ldr.w r4, [sp, #1432]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r8  <= 0x00010060 (+2^16.0021)
add.w r12, r12, r8, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r12 <= 0x08247db7 (+2^27.0255)
sub.w r8, r12, r8, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r8  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r7  <= 0x00010060 (+2^16.0021)
add.w r11, r11, r7, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r11 <= 0x08247db7 (+2^27.0255)
sub.w r7, r11, r7, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r7  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r6  <= 0x00010060 (+2^16.0021)
add.w r10, r10, r6, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r10 <= 0x08247db7 (+2^27.0255)
sub.w r6, r10, r6, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r6  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r4  <= 0x00010060 (+2^16.0021)
add.w r9, r9, r4, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r9  <= 0x08247db7 (+2^27.0255)
sub.w r4, r9, r4, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r4  <= 0x00247db7 (+2^21.1895)
/*** LAYER 5 ***/
ldr.w r14, =514
RED1 r10, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r10 <= 0x00010824 (+2^16.0452)
mul.w r10, r10, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r10 <= 0x02125848 (+2^25.0508)
add.w r12, r12, r10
    //// bounds:  -0x073d5ff (-2^22.8559) <= r12 <= 0x0a36d5ff (+2^27.3525)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r10 <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r9  <= 0x00010824 (+2^16.0452)
mul.w r9, r9, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r9  <= 0x02125848 (+2^25.0508)
add.w r11, r11, r9
    //// bounds:  -0x073d5ff (-2^22.8559) <= r11 <= 0x0a36d5ff (+2^27.3525)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r9  <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
ldr.w r14, =510
RED1 r6, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r6  <= 0x00010863 (+2^16.0465)
mul.w r6, r6, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r6  <= 0x020eb53a (+2^25.0409)
add.w r8, r8, r6
    //// bounds:  -0x87432f1 (-2^27.0796) <= r8  <= 0x023332f1 (+2^25.1375)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r6  <= 0x003532f1 (+2^21.7333)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r4  <= 0x00010863 (+2^16.0465)
mul.w r4, r4, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r4  <= 0x020eb53a (+2^25.0409)
add.w r7, r7, r4
    //// bounds:  -0x87432f1 (-2^27.0796) <= r7  <= 0x023332f1 (+2^25.1375)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r4  <= 0x003532f1 (+2^21.7333)
/*** LAYER 6 ***/
ldr.w r14, =19881
RED1 r11, r3
    //// bounds:  -0x0000a36 (-2^11.3520) <= r11 <= 0x00010a36 (+2^16.0564)
mul.w r11, r11, r14
    //// bounds:  -0x318fba6 (-2^25.6311) <= r11 <= 0x50c1fba6 (+2^30.3355)
add.w r12, r12, r11
    //// bounds:  -0x38cd1a5 (-2^25.8278) <= r12 <= 0x5af8d1a5 (+2^30.5073)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x5135d1a5 (-2^30.3436) <= r11 <= 0x0d4fd1a5 (+2^27.7346)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22350
RED1 r9, r3
    //// bounds:  -0x0000834 (-2^11.0362) <= r9  <= 0x00010834 (+2^16.0455)
mul.w r9, r9, r14
    //// bounds:  -0x2cc2bd8 (-2^25.4842) <= r9  <= 0x5a1a2bd8 (+2^30.4935)
sub.w r10, r10, r9
    //// bounds:  -0x5c9001d7 (-2^30.5324) <= r10 <= 0x0b0101d7 (+2^27.4599)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x54201d7 (-2^26.3945) <= r9  <= 0x624f01d7 (+2^30.6192)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9589
RED1 r7, r3
    //// bounds:  -0x0000874 (-2^11.0795) <= r7  <= 0x00010874 (+2^16.0469)
mul.w r7, r7, r14
    //// bounds:  -0x13ca104 (-2^24.3066) <= r7  <= 0x26b1a104 (+2^29.2740)
add.w r8, r8, r7
    //// bounds:  -0x9b0d3f5 (-2^27.2766) <= r8  <= 0x28e4d3f5 (+2^29.3538)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2f25d3f5 (-2^29.5591) <= r7  <= 0x036fd3f5 (+2^25.7811)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =29915
RED1 r4, r3
    //// bounds:  -0x0000a72 (-2^11.3848) <= r4  <= 0x00010a72 (+2^16.0577)
mul.w r4, r4, r14
    //// bounds:  -0x4c49786 (-2^26.2534) <= r4  <= 0x799f9786 (+2^30.9263)
RED1 r4, r3
    //// bounds:  -0x000799f (-2^14.9262) <= r4  <= 0x0001799f (+2^16.5608)
add.w r6, r6, r4
    //// bounds:  -0xa72ac90 (-2^27.3851) <= r6  <= 0x0036ac90 (+2^21.7728)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa73ac90 (-2^27.3857) <= r4  <= 0x0035ac90 (+2^21.7462)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 112 ***/
ldr.w r14, =19881
mul.w r3, r12, r14
    //// bounds:  -0x26d48000 (-2^29.2791) <= r3  <= 0x26d48000 (+2^29.2791)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2252]
/*** baseaux 113 ***/
ldr.w r14, =-19881
mul.w r3, r11, r14
    //// bounds:  -0x26d48000 (-2^29.2791) <= r3  <= 0x26d48000 (+2^29.2791)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2272]
/*** baseaux 114 ***/
ldr.w r14, =-22350
mul.w r3, r10, r14
    //// bounds:  -0x2ba70000 (-2^29.4480) <= r3  <= 0x2ba70000 (+2^29.4480)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2292]
/*** baseaux 115 ***/
ldr.w r14, =22350
mul.w r3, r9, r14
    //// bounds:  -0x2ba70000 (-2^29.4480) <= r3  <= 0x2ba70000 (+2^29.4480)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2312]
/*** baseaux 116 ***/
ldr.w r14, =9589
mul.w r3, r8, r14
    //// bounds:  -0x12ba8000 (-2^28.2272) <= r3  <= 0x12ba8000 (+2^28.2272)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2332]
/*** baseaux 117 ***/
ldr.w r14, =-9589
mul.w r3, r7, r14
    //// bounds:  -0x12ba8000 (-2^28.2272) <= r3  <= 0x12ba8000 (+2^28.2272)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2352]
/*** baseaux 118 ***/
ldr.w r14, =29915
mul.w r3, r6, r14
    //// bounds:  -0x3a6d8000 (-2^29.8686) <= r3  <= 0x3a6d8000 (+2^29.8686)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2372]
/*** baseaux 119 ***/
ldr.w r14, =-29915
mul.w r3, r4, r14
    //// bounds:  -0x3a6d8000 (-2^29.8686) <= r3  <= 0x3a6d8000 (+2^29.8686)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2392]
str.w r12, [r1, #2244]
str.w r11, [r1, #2264]
str.w r10, [r1, #2284]
str.w r9, [r1, #2304]
str.w r8, [r1, #2324]
str.w r7, [r1, #2344]
str.w r6, [r1, #2364]
str.w r4, [r1, #2384]
ldr.w r12, [sp, #1352]
ldr.w r11, [sp, #1364]
ldr.w r10, [sp, #1376]
ldr.w r9, [sp, #1388]
ldr.w r8, [sp, #1400]
ldr.w r7, [sp, #1412]
ldr.w r6, [sp, #1424]
ldr.w r4, [sp, #1436]
/*** LAYER 4 ***/
RED1 r8, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r8  <= 0x00010060 (+2^16.0021)
add.w r12, r12, r8, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r12 <= 0x08247db7 (+2^27.0255)
sub.w r8, r12, r8, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r8  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r7, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r7  <= 0x00010060 (+2^16.0021)
add.w r11, r11, r7, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r11 <= 0x08247db7 (+2^27.0255)
sub.w r7, r11, r7, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r7  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r6, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r6  <= 0x00010060 (+2^16.0021)
add.w r10, r10, r6, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r10 <= 0x08247db7 (+2^27.0255)
sub.w r6, r10, r6, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r6  <= 0x00247db7 (+2^21.1895)
/*** LAYER 4 ***/
RED1 r4, r3
    //// bounds:  -0x0000060 (-2^ 6.5850) <= r4  <= 0x00010060 (+2^16.0021)
add.w r9, r9, r4, lsl #11
    //// bounds:  -0x0637db7 (-2^22.6365) <= r9  <= 0x08247db7 (+2^27.0255)
sub.w r4, r9, r4, lsl #12
    //// bounds:  -0x8637db7 (-2^27.0684) <= r4  <= 0x00247db7 (+2^21.1895)
/*** LAYER 5 ***/
ldr.w r14, =514
RED1 r10, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r10 <= 0x00010824 (+2^16.0452)
mul.w r10, r10, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r10 <= 0x02125848 (+2^25.0508)
add.w r12, r12, r10
    //// bounds:  -0x073d5ff (-2^22.8559) <= r12 <= 0x0a36d5ff (+2^27.3525)
sub.w r10, r12, r10, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r10 <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x0000824 (-2^11.0251) <= r9  <= 0x00010824 (+2^16.0452)
mul.w r9, r9, r14
    //// bounds:  -0x0105848 (-2^20.0308) <= r9  <= 0x02125848 (+2^25.0508)
add.w r11, r11, r9
    //// bounds:  -0x073d5ff (-2^22.8559) <= r11 <= 0x0a36d5ff (+2^27.3525)
sub.w r9, r11, r9, lsl #1
    //// bounds:  -0x275d5ff (-2^25.2988) <= r9  <= 0x0834d5ff (+2^27.0367)
/*** LAYER 5 ***/
ldr.w r14, =510
RED1 r6, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r6  <= 0x00010863 (+2^16.0465)
mul.w r6, r6, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r6  <= 0x020eb53a (+2^25.0409)
add.w r8, r8, r6
    //// bounds:  -0x87432f1 (-2^27.0796) <= r8  <= 0x023332f1 (+2^25.1375)
sub.w r6, r8, r6, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r6  <= 0x003532f1 (+2^21.7333)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x0000863 (-2^11.0681) <= r4  <= 0x00010863 (+2^16.0465)
mul.w r4, r4, r14
    //// bounds:  -0x010b53a (-2^20.0625) <= r4  <= 0x020eb53a (+2^25.0409)
add.w r7, r7, r4
    //// bounds:  -0x87432f1 (-2^27.0796) <= r7  <= 0x023332f1 (+2^25.1375)
sub.w r4, r7, r4, lsl #1
    //// bounds:  -0xa7232f1 (-2^27.3849) <= r4  <= 0x003532f1 (+2^21.7333)
/*** LAYER 6 ***/
ldr.w r14, =19881
RED1 r11, r3
    //// bounds:  -0x0000a36 (-2^11.3520) <= r11 <= 0x00010a36 (+2^16.0564)
mul.w r11, r11, r14
    //// bounds:  -0x318fba6 (-2^25.6311) <= r11 <= 0x50c1fba6 (+2^30.3355)
add.w r12, r12, r11
    //// bounds:  -0x38cd1a5 (-2^25.8278) <= r12 <= 0x5af8d1a5 (+2^30.5073)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x5135d1a5 (-2^30.3436) <= r11 <= 0x0d4fd1a5 (+2^27.7346)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =22350
RED1 r9, r3
    //// bounds:  -0x0000834 (-2^11.0362) <= r9  <= 0x00010834 (+2^16.0455)
mul.w r9, r9, r14
    //// bounds:  -0x2cc2bd8 (-2^25.4842) <= r9  <= 0x5a1a2bd8 (+2^30.4935)
sub.w r10, r10, r9
    //// bounds:  -0x5c9001d7 (-2^30.5324) <= r10 <= 0x0b0101d7 (+2^27.4599)
add.w r9, r10, r9, lsl #1
    //// bounds:  -0x54201d7 (-2^26.3945) <= r9  <= 0x624f01d7 (+2^30.6192)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =9589
RED1 r7, r3
    //// bounds:  -0x0000874 (-2^11.0795) <= r7  <= 0x00010874 (+2^16.0469)
mul.w r7, r7, r14
    //// bounds:  -0x13ca104 (-2^24.3066) <= r7  <= 0x26b1a104 (+2^29.2740)
add.w r8, r8, r7
    //// bounds:  -0x9b0d3f5 (-2^27.2766) <= r8  <= 0x28e4d3f5 (+2^29.3538)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x2f25d3f5 (-2^29.5591) <= r7  <= 0x036fd3f5 (+2^25.7811)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =29915
RED1 r4, r3
    //// bounds:  -0x0000a72 (-2^11.3848) <= r4  <= 0x00010a72 (+2^16.0577)
mul.w r4, r4, r14
    //// bounds:  -0x4c49786 (-2^26.2534) <= r4  <= 0x799f9786 (+2^30.9263)
RED1 r4, r3
    //// bounds:  -0x000799f (-2^14.9262) <= r4  <= 0x0001799f (+2^16.5608)
add.w r6, r6, r4
    //// bounds:  -0xa72ac90 (-2^27.3851) <= r6  <= 0x0036ac90 (+2^21.7728)
sub.w r4, r6, r4, lsl #1
    //// bounds:  -0xa73ac90 (-2^27.3857) <= r4  <= 0x0035ac90 (+2^21.7462)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 112 ***/
ldr.w r14, =19881
mul.w r3, r12, r14
    //// bounds:  -0x26d48000 (-2^29.2791) <= r3  <= 0x26d48000 (+2^29.2791)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2256]
/*** baseaux 113 ***/
ldr.w r14, =-19881
mul.w r3, r11, r14
    //// bounds:  -0x26d48000 (-2^29.2791) <= r3  <= 0x26d48000 (+2^29.2791)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2276]
/*** baseaux 114 ***/
ldr.w r14, =-22350
mul.w r3, r10, r14
    //// bounds:  -0x2ba70000 (-2^29.4480) <= r3  <= 0x2ba70000 (+2^29.4480)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2296]
/*** baseaux 115 ***/
ldr.w r14, =22350
mul.w r3, r9, r14
    //// bounds:  -0x2ba70000 (-2^29.4480) <= r3  <= 0x2ba70000 (+2^29.4480)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2316]
/*** baseaux 116 ***/
ldr.w r14, =9589
mul.w r3, r8, r14
    //// bounds:  -0x12ba8000 (-2^28.2272) <= r3  <= 0x12ba8000 (+2^28.2272)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2336]
/*** baseaux 117 ***/
ldr.w r14, =-9589
mul.w r3, r7, r14
    //// bounds:  -0x12ba8000 (-2^28.2272) <= r3  <= 0x12ba8000 (+2^28.2272)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2356]
/*** baseaux 118 ***/
ldr.w r14, =29915
mul.w r3, r6, r14
    //// bounds:  -0x3a6d8000 (-2^29.8686) <= r3  <= 0x3a6d8000 (+2^29.8686)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2376]
/*** baseaux 119 ***/
ldr.w r14, =-29915
mul.w r3, r4, r14
    //// bounds:  -0x3a6d8000 (-2^29.8686) <= r3  <= 0x3a6d8000 (+2^29.8686)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2396]
str.w r12, [r1, #2248]
str.w r11, [r1, #2268]
str.w r10, [r1, #2288]
str.w r9, [r1, #2308]
str.w r8, [r1, #2328]
str.w r7, [r1, #2348]
str.w r6, [r1, #2368]
str.w r4, [r1, #2388]
ldr.w r12, [sp, #1440]
ldr.w r11, [sp, #1452]
ldr.w r10, [sp, #1464]
ldr.w r9, [sp, #1476]
ldr.w r8, [sp, #1488]
ldr.w r7, [sp, #1500]
ldr.w r6, [sp, #1512]
ldr.w r4, [sp, #1524]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r12 <= 0x01656b6f (+2^24.4815)
add.w r8, r12, r8, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r8  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r11 <= 0x01656b6f (+2^24.4815)
add.w r7, r11, r7, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r7  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r10 <= 0x01656b6f (+2^24.4815)
add.w r6, r10, r6, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r6  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r9  <= 0x01656b6f (+2^24.4815)
add.w r4, r9, r4, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r4  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 5 ***/
ldr.w r14, =8224
RED1 r10, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r10 <= 0x0001032c (+2^16.0178)
mul.w r10, r10, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r10 <= 0x2085e580 (+2^29.0234)
sub.w r12, r12, r10
    //// bounds:  -0x23b250ef (-2^29.1577) <= r12 <= 0x01cb50ef (+2^24.8433)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r10 <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r9  <= 0x0001032c (+2^16.0178)
mul.w r9, r9, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r9  <= 0x2085e580 (+2^29.0234)
sub.w r11, r11, r9
    //// bounds:  -0x23b250ef (-2^29.1577) <= r11 <= 0x01cb50ef (+2^24.8433)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r9  <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
ldr.w r14, =8160
RED1 r6, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r6  <= 0x0001036d (+2^16.0192)
mul.w r6, r6, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r6  <= 0x204d3260 (+2^29.0135)
sub.w r8, r8, r6
    //// bounds:  -0x21719dcf (-2^29.0637) <= r8  <= 0x03da9dcf (+2^25.9463)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r6  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r4  <= 0x0001036d (+2^16.0192)
mul.w r4, r4, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r4  <= 0x204d3260 (+2^29.0135)
sub.w r7, r7, r4
    //// bounds:  -0x21719dcf (-2^29.0637) <= r7  <= 0x03da9dcf (+2^25.9463)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r4  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 6 ***/
ldr.w r14, =23863
RED1 r11, r3
    //// bounds:  -0x00023b2 (-2^13.1577) <= r11 <= 0x000123b2 (+2^16.1883)
mul.w r11, r11, r14
    //// bounds:  -0xcff553e (-2^27.7002) <= r11 <= 0x6a36553e (+2^30.7308)
RED1 r11, r3
    //// bounds:  -0x0006a36 (-2^14.7308) <= r11 <= 0x00016a36 (+2^16.5007)
add.w r12, r12, r11
    //// bounds:  -0x23b2bb25 (-2^29.1578) <= r12 <= 0x01ccbb25 (+2^24.8478)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x23b3bb25 (-2^29.1579) <= r11 <= 0x01cbbb25 (+2^24.8446)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13987
RED1 r9, r3
    //// bounds:  -0x00021eb (-2^13.0840) <= r9  <= 0x000121eb (+2^16.1795)
mul.w r9, r9, r14
    //// bounds:  -0x73d2aa1 (-2^26.8558) <= r9  <= 0x3de02aa1 (+2^29.9513)
add.w r10, r10, r9
    //// bounds:  -0xacf7b90 (-2^27.4344) <= r10 <= 0x5fcb7b90 (+2^30.5819)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x41727b90 (-2^30.0323) <= r9  <= 0x29287b90 (+2^29.3631)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11414
RED1 r7, r3
    //// bounds:  -0x0002171 (-2^13.0636) <= r7  <= 0x00012171 (+2^16.1771)
mul.w r7, r7, r14
    //// bounds:  -0x5d30436 (-2^26.5421) <= r7  <= 0x32690436 (+2^29.6556)
add.w r8, r8, r7
    //// bounds:  -0x2744a205 (-2^29.2953) <= r8  <= 0x3643a205 (+2^29.7619)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x53daa205 (-2^30.3898) <= r7  <= 0x09ada205 (+2^27.2747)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =27181
RED1 r4, r3
    //// bounds:  -0x00023ba (-2^13.1589) <= r4  <= 0x000123ba (+2^16.1885)
mul.w r4, r4, r14
    //// bounds:  -0xed14bb2 (-2^27.8892) <= r4  <= 0x78fe4bb2 (+2^30.9188)
RED1 r4, r3
    //// bounds:  -0x00078fe (-2^14.9188) <= r4  <= 0x000178fe (+2^16.5584)
sub.w r6, r6, r4
    //// bounds:  -0x19316cd (-2^24.6550) <= r6  <= 0x23bb16cd (+2^29.1591)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x19216cd (-2^24.6514) <= r4  <= 0x23bc16cd (+2^29.1593)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
str.w r12, [r1, #2400]
str.w r11, [r1, #2420]
str.w r10, [r1, #2440]
str.w r9, [r1, #2460]
str.w r8, [r1, #2480]
str.w r7, [r1, #2500]
str.w r6, [r1, #2520]
str.w r4, [r1, #2540]
ldr.w r12, [sp, #1444]
ldr.w r11, [sp, #1456]
ldr.w r10, [sp, #1468]
ldr.w r9, [sp, #1480]
ldr.w r8, [sp, #1492]
ldr.w r7, [sp, #1504]
ldr.w r6, [sp, #1516]
ldr.w r4, [sp, #1528]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r12 <= 0x01656b6f (+2^24.4815)
add.w r8, r12, r8, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r8  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r11 <= 0x01656b6f (+2^24.4815)
add.w r7, r11, r7, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r7  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r10 <= 0x01656b6f (+2^24.4815)
add.w r6, r10, r6, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r6  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r9  <= 0x01656b6f (+2^24.4815)
add.w r4, r9, r4, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r4  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 5 ***/
ldr.w r14, =8224
RED1 r10, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r10 <= 0x0001032c (+2^16.0178)
mul.w r10, r10, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r10 <= 0x2085e580 (+2^29.0234)
sub.w r12, r12, r10
    //// bounds:  -0x23b250ef (-2^29.1577) <= r12 <= 0x01cb50ef (+2^24.8433)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r10 <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r9  <= 0x0001032c (+2^16.0178)
mul.w r9, r9, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r9  <= 0x2085e580 (+2^29.0234)
sub.w r11, r11, r9
    //// bounds:  -0x23b250ef (-2^29.1577) <= r11 <= 0x01cb50ef (+2^24.8433)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r9  <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
ldr.w r14, =8160
RED1 r6, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r6  <= 0x0001036d (+2^16.0192)
mul.w r6, r6, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r6  <= 0x204d3260 (+2^29.0135)
sub.w r8, r8, r6
    //// bounds:  -0x21719dcf (-2^29.0637) <= r8  <= 0x03da9dcf (+2^25.9463)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r6  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r4  <= 0x0001036d (+2^16.0192)
mul.w r4, r4, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r4  <= 0x204d3260 (+2^29.0135)
sub.w r7, r7, r4
    //// bounds:  -0x21719dcf (-2^29.0637) <= r7  <= 0x03da9dcf (+2^25.9463)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r4  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 6 ***/
ldr.w r14, =23863
RED1 r11, r3
    //// bounds:  -0x00023b2 (-2^13.1577) <= r11 <= 0x000123b2 (+2^16.1883)
mul.w r11, r11, r14
    //// bounds:  -0xcff553e (-2^27.7002) <= r11 <= 0x6a36553e (+2^30.7308)
RED1 r11, r3
    //// bounds:  -0x0006a36 (-2^14.7308) <= r11 <= 0x00016a36 (+2^16.5007)
add.w r12, r12, r11
    //// bounds:  -0x23b2bb25 (-2^29.1578) <= r12 <= 0x01ccbb25 (+2^24.8478)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x23b3bb25 (-2^29.1579) <= r11 <= 0x01cbbb25 (+2^24.8446)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13987
RED1 r9, r3
    //// bounds:  -0x00021eb (-2^13.0840) <= r9  <= 0x000121eb (+2^16.1795)
mul.w r9, r9, r14
    //// bounds:  -0x73d2aa1 (-2^26.8558) <= r9  <= 0x3de02aa1 (+2^29.9513)
add.w r10, r10, r9
    //// bounds:  -0xacf7b90 (-2^27.4344) <= r10 <= 0x5fcb7b90 (+2^30.5819)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x41727b90 (-2^30.0323) <= r9  <= 0x29287b90 (+2^29.3631)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11414
RED1 r7, r3
    //// bounds:  -0x0002171 (-2^13.0636) <= r7  <= 0x00012171 (+2^16.1771)
mul.w r7, r7, r14
    //// bounds:  -0x5d30436 (-2^26.5421) <= r7  <= 0x32690436 (+2^29.6556)
add.w r8, r8, r7
    //// bounds:  -0x2744a205 (-2^29.2953) <= r8  <= 0x3643a205 (+2^29.7619)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x53daa205 (-2^30.3898) <= r7  <= 0x09ada205 (+2^27.2747)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =27181
RED1 r4, r3
    //// bounds:  -0x00023ba (-2^13.1589) <= r4  <= 0x000123ba (+2^16.1885)
mul.w r4, r4, r14
    //// bounds:  -0xed14bb2 (-2^27.8892) <= r4  <= 0x78fe4bb2 (+2^30.9188)
RED1 r4, r3
    //// bounds:  -0x00078fe (-2^14.9188) <= r4  <= 0x000178fe (+2^16.5584)
sub.w r6, r6, r4
    //// bounds:  -0x19316cd (-2^24.6550) <= r6  <= 0x23bb16cd (+2^29.1591)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x19216cd (-2^24.6514) <= r4  <= 0x23bc16cd (+2^29.1593)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 120 ***/
ldr.w r14, =23863
mul.w r3, r12, r14
    //// bounds:  -0x2e9b8000 (-2^29.5425) <= r3  <= 0x2e9b8000 (+2^29.5425)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2412]
/*** baseaux 121 ***/
ldr.w r14, =-23863
mul.w r3, r11, r14
    //// bounds:  -0x2e9b8000 (-2^29.5425) <= r3  <= 0x2e9b8000 (+2^29.5425)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2432]
/*** baseaux 122 ***/
ldr.w r14, =13987
mul.w r3, r10, r14
    //// bounds:  -0x1b518000 (-2^28.7718) <= r3  <= 0x1b518000 (+2^28.7718)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2452]
/*** baseaux 123 ***/
ldr.w r14, =-13987
mul.w r3, r9, r14
    //// bounds:  -0x1b518000 (-2^28.7718) <= r3  <= 0x1b518000 (+2^28.7718)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2472]
/*** baseaux 124 ***/
ldr.w r14, =11414
mul.w r3, r8, r14
    //// bounds:  -0x164b0000 (-2^28.4785) <= r3  <= 0x164b0000 (+2^28.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2492]
/*** baseaux 125 ***/
ldr.w r14, =-11414
mul.w r3, r7, r14
    //// bounds:  -0x164b0000 (-2^28.4785) <= r3  <= 0x164b0000 (+2^28.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2512]
/*** baseaux 126 ***/
ldr.w r14, =-27181
mul.w r3, r6, r14
    //// bounds:  -0x35168000 (-2^29.7303) <= r3  <= 0x35168000 (+2^29.7303)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2532]
/*** baseaux 127 ***/
ldr.w r14, =27181
mul.w r3, r4, r14
    //// bounds:  -0x35168000 (-2^29.7303) <= r3  <= 0x35168000 (+2^29.7303)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2552]
str.w r12, [r1, #2404]
str.w r11, [r1, #2424]
str.w r10, [r1, #2444]
str.w r9, [r1, #2464]
str.w r8, [r1, #2484]
str.w r7, [r1, #2504]
str.w r6, [r1, #2524]
str.w r4, [r1, #2544]
ldr.w r12, [sp, #1448]
ldr.w r11, [sp, #1460]
ldr.w r10, [sp, #1472]
ldr.w r9, [sp, #1484]
ldr.w r8, [sp, #1496]
ldr.w r7, [sp, #1508]
ldr.w r6, [sp, #1520]
ldr.w r4, [sp, #1532]
/*** LAYER 4 ***/
sub.w r12, r12, r8, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r12 <= 0x01656b6f (+2^24.4815)
add.w r8, r12, r8, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r8  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r11, r11, r7, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r11 <= 0x01656b6f (+2^24.4815)
add.w r7, r11, r7, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r7  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r10, r10, r6, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r10 <= 0x01656b6f (+2^24.4815)
add.w r6, r10, r6, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r6  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 4 ***/
sub.w r9, r9, r4, lsl #3
    //// bounds:  -0x32c6b6f (-2^25.6661) <= r9  <= 0x01656b6f (+2^24.4815)
add.w r4, r9, r4, lsl #4
    //// bounds:  -0x1246b6f (-2^24.1919) <= r4  <= 0x036d6b6f (+2^25.7771)
/*** LAYER 5 ***/
ldr.w r14, =8224
RED1 r10, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r10 <= 0x0001032c (+2^16.0178)
mul.w r10, r10, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r10 <= 0x2085e580 (+2^29.0234)
sub.w r12, r12, r10
    //// bounds:  -0x23b250ef (-2^29.1577) <= r12 <= 0x01cb50ef (+2^24.8433)
add.w r10, r12, r10, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r10 <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
RED1 r9, r3
    //// bounds:  -0x000032c (-2^ 9.6653) <= r9  <= 0x0001032c (+2^16.0178)
mul.w r9, r9, r14
    //// bounds:  -0x065e580 (-2^22.6710) <= r9  <= 0x2085e580 (+2^29.0234)
sub.w r11, r11, r9
    //// bounds:  -0x23b250ef (-2^29.1577) <= r11 <= 0x01cb50ef (+2^24.8433)
add.w r9, r11, r9, lsl #1
    //// bounds:  -0x39250ef (-2^25.8365) <= r9  <= 0x21eb50ef (+2^29.0840)
/*** LAYER 5 ***/
ldr.w r14, =8160
RED1 r6, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r6  <= 0x0001036d (+2^16.0192)
mul.w r6, r6, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r6  <= 0x204d3260 (+2^29.0135)
sub.w r8, r8, r6
    //// bounds:  -0x21719dcf (-2^29.0637) <= r8  <= 0x03da9dcf (+2^25.9463)
add.w r6, r8, r6, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r6  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 5 ***/
RED1 r4, r3
    //// bounds:  -0x000036d (-2^ 9.7764) <= r4  <= 0x0001036d (+2^16.0192)
mul.w r4, r4, r14
    //// bounds:  -0x06d3260 (-2^22.7708) <= r4  <= 0x204d3260 (+2^29.0135)
sub.w r7, r7, r4
    //// bounds:  -0x21719dcf (-2^29.0637) <= r7  <= 0x03da9dcf (+2^25.9463)
add.w r4, r7, r4, lsl #1
    //// bounds:  -0x1919dcf (-2^24.6497) <= r4  <= 0x23ba9dcf (+2^29.1590)
/*** LAYER 6 ***/
ldr.w r14, =23863
RED1 r11, r3
    //// bounds:  -0x00023b2 (-2^13.1577) <= r11 <= 0x000123b2 (+2^16.1883)
mul.w r11, r11, r14
    //// bounds:  -0xcff553e (-2^27.7002) <= r11 <= 0x6a36553e (+2^30.7308)
RED1 r11, r3
    //// bounds:  -0x0006a36 (-2^14.7308) <= r11 <= 0x00016a36 (+2^16.5007)
add.w r12, r12, r11
    //// bounds:  -0x23b2bb25 (-2^29.1578) <= r12 <= 0x01ccbb25 (+2^24.8478)
sub.w r11, r12, r11, lsl #1
    //// bounds:  -0x23b3bb25 (-2^29.1579) <= r11 <= 0x01cbbb25 (+2^24.8446)
RED4 r12, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r12 <= 0x00008000 (+2^15.0000)
RED4 r11, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r11 <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =13987
RED1 r9, r3
    //// bounds:  -0x00021eb (-2^13.0840) <= r9  <= 0x000121eb (+2^16.1795)
mul.w r9, r9, r14
    //// bounds:  -0x73d2aa1 (-2^26.8558) <= r9  <= 0x3de02aa1 (+2^29.9513)
add.w r10, r10, r9
    //// bounds:  -0xacf7b90 (-2^27.4344) <= r10 <= 0x5fcb7b90 (+2^30.5819)
sub.w r9, r10, r9, lsl #1
    //// bounds:  -0x41727b90 (-2^30.0323) <= r9  <= 0x29287b90 (+2^29.3631)
RED4 r10, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r10 <= 0x00008000 (+2^15.0000)
RED4 r9, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r9  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =11414
RED1 r7, r3
    //// bounds:  -0x0002171 (-2^13.0636) <= r7  <= 0x00012171 (+2^16.1771)
mul.w r7, r7, r14
    //// bounds:  -0x5d30436 (-2^26.5421) <= r7  <= 0x32690436 (+2^29.6556)
add.w r8, r8, r7
    //// bounds:  -0x2744a205 (-2^29.2953) <= r8  <= 0x3643a205 (+2^29.7619)
sub.w r7, r8, r7, lsl #1
    //// bounds:  -0x53daa205 (-2^30.3898) <= r7  <= 0x09ada205 (+2^27.2747)
RED4 r8, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r8  <= 0x00008000 (+2^15.0000)
RED4 r7, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r7  <= 0x00008000 (+2^15.0000)
/*** LAYER 6 ***/
ldr.w r14, =27181
RED1 r4, r3
    //// bounds:  -0x00023ba (-2^13.1589) <= r4  <= 0x000123ba (+2^16.1885)
mul.w r4, r4, r14
    //// bounds:  -0xed14bb2 (-2^27.8892) <= r4  <= 0x78fe4bb2 (+2^30.9188)
RED1 r4, r3
    //// bounds:  -0x00078fe (-2^14.9188) <= r4  <= 0x000178fe (+2^16.5584)
sub.w r6, r6, r4
    //// bounds:  -0x19316cd (-2^24.6550) <= r6  <= 0x23bb16cd (+2^29.1591)
add.w r4, r6, r4, lsl #1
    //// bounds:  -0x19216cd (-2^24.6514) <= r4  <= 0x23bc16cd (+2^29.1593)
RED4 r6, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r6  <= 0x00008000 (+2^15.0000)
RED4 r4, r3
    //// bounds:  -0x0008000 (-2^15.0000) <= r4  <= 0x00008000 (+2^15.0000)
/*** baseaux 120 ***/
ldr.w r14, =23863
mul.w r3, r12, r14
    //// bounds:  -0x2e9b8000 (-2^29.5425) <= r3  <= 0x2e9b8000 (+2^29.5425)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2416]
/*** baseaux 121 ***/
ldr.w r14, =-23863
mul.w r3, r11, r14
    //// bounds:  -0x2e9b8000 (-2^29.5425) <= r3  <= 0x2e9b8000 (+2^29.5425)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2436]
/*** baseaux 122 ***/
ldr.w r14, =13987
mul.w r3, r10, r14
    //// bounds:  -0x1b518000 (-2^28.7718) <= r3  <= 0x1b518000 (+2^28.7718)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2456]
/*** baseaux 123 ***/
ldr.w r14, =-13987
mul.w r3, r9, r14
    //// bounds:  -0x1b518000 (-2^28.7718) <= r3  <= 0x1b518000 (+2^28.7718)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2476]
/*** baseaux 124 ***/
ldr.w r14, =11414
mul.w r3, r8, r14
    //// bounds:  -0x164b0000 (-2^28.4785) <= r3  <= 0x164b0000 (+2^28.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2496]
/*** baseaux 125 ***/
ldr.w r14, =-11414
mul.w r3, r7, r14
    //// bounds:  -0x164b0000 (-2^28.4785) <= r3  <= 0x164b0000 (+2^28.4785)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2516]
/*** baseaux 126 ***/
ldr.w r14, =-27181
mul.w r3, r6, r14
    //// bounds:  -0x35168000 (-2^29.7303) <= r3  <= 0x35168000 (+2^29.7303)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2536]
/*** baseaux 127 ***/
ldr.w r14, =27181
mul.w r3, r4, r14
    //// bounds:  -0x35168000 (-2^29.7303) <= r3  <= 0x35168000 (+2^29.7303)
RED4 r3, r2
    //// bounds:  -0x0008000 (-2^15.0000) <= r3  <= 0x00008000 (+2^15.0000)
str.w r3, [r1, #2556]
str.w r12, [r1, #2408]
str.w r11, [r1, #2428]
str.w r10, [r1, #2448]
str.w r9, [r1, #2468]
str.w r8, [r1, #2488]
str.w r7, [r1, #2508]
str.w r6, [r1, #2528]
str.w r4, [r1, #2548]
add sp, #1544
    pop {r4-r11, pc}
    .ltorg
    
/* minimum available registers: 2 */
