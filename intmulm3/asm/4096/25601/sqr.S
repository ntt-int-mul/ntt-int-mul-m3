    .syntax unified
    .cpu cortex-m3
    .section .text

    .align 2
    .global basesqr_25601
    .type basesqr_25601, %function
    basesqr_25601:
    push {r4-r11, lr}
    
ldr.w r10, [r1, #0]
ldr.w r9, [r1, #4]
ldr.w r8, [r1, #8]
ldr.w r7, [r1, #12]
ldr.w r6, [r1, #16]
ldr.w r5, [r1, #20]
/*** basesqr 0 ***/
/* computing z0 = x0^2 + 2*zeta^0*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
        .macro MONTRED z, tmp
            mul.w \tmp, \z, r11
            sbfx.w \tmp, \tmp, #0, #16
            mls.w \z, \tmp, r12, \z
            asr.w \z, #16
        .endm
        
ldr.w r11, =39937
ldr.w r12, =25601
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3067
mul.w r4, r4, r14
    //// bounds:  -0x2cd18b9 (-2^25.4860) <= r4  <= 0x02cd18b9 (+2^25.4860)
mla.w r4, r10, r10, r4
    //// bounds:  -0xca83252 (-2^27.6619) <= r4  <= 0x0ca83252 (+2^27.6619)
MONTRED r4, r3
    //// bounds:  -0x0003ea8 (-2^13.9694) <= r4  <= 0x00003ea8 (+2^13.9694)
str.w r4, [r0, #0]
/* computing z1 = 2x0x1 + zeta^0 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11267
mul.w r4, r4, r14
    //// bounds:  -0xa4a5791 (-2^27.3632) <= r4  <= 0x0a4a5791 (+2^27.3632)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e008ac3 (-2^28.9070) <= r4  <= 0x1e008ac3 (+2^28.9070)
MONTRED r4, r3
    //// bounds:  -0x0005000 (-2^14.3219) <= r4  <= 0x00005001 (+2^14.3220)
str.w r4, [r0, #4]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #8]
/*** basesqr 1 ***/
/* computing z0 = x0^2 + 2*zeta^1*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3067
mul.w r4, r4, r14
    //// bounds:  -0x2cd18b9 (-2^25.4860) <= r4  <= 0x02cd18b9 (+2^25.4860)
mla.w r4, r7, r7, r4
    //// bounds:  -0xca83252 (-2^27.6619) <= r4  <= 0x0ca83252 (+2^27.6619)
MONTRED r4, r3
    //// bounds:  -0x0003ea8 (-2^13.9694) <= r4  <= 0x00003ea8 (+2^13.9694)
str.w r4, [r0, #12]
/* computing z1 = 2x0x1 + zeta^1 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11267
mul.w r4, r4, r14
    //// bounds:  -0xa4a5791 (-2^27.3632) <= r4  <= 0x0a4a5791 (+2^27.3632)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e008ac3 (-2^28.9070) <= r4  <= 0x1e008ac3 (+2^28.9070)
MONTRED r4, r3
    //// bounds:  -0x0005000 (-2^14.3219) <= r4  <= 0x00005001 (+2^14.3220)
str.w r4, [r0, #16]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #20]
ldr.w r10, [r1, #24]
ldr.w r9, [r1, #28]
ldr.w r8, [r1, #32]
ldr.w r7, [r1, #36]
ldr.w r6, [r1, #40]
ldr.w r5, [r1, #44]
/*** basesqr 2 ***/
/* computing z0 = x0^2 + 2*zeta^2*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4301
mul.w r4, r4, r14
    //// bounds:  -0x3ed9e5f (-2^25.9739) <= r4  <= 0x03ed9e5f (+2^25.9739)
mla.w r4, r10, r10, r4
    //// bounds:  -0xdc8b7f8 (-2^27.7849) <= r4  <= 0x0dc8b7f8 (+2^27.7849)
MONTRED r4, r3
    //// bounds:  -0x0003fc8 (-2^13.9951) <= r4  <= 0x00003fc9 (+2^13.9951)
str.w r4, [r0, #24]
/* computing z1 = 2x0x1 + zeta^2 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10650
mul.w r4, r4, r14
    //// bounds:  -0x9ba14be (-2^27.2820) <= r4  <= 0x09ba14be (+2^27.2820)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d7047f0 (-2^28.8796) <= r4  <= 0x1d7047f0 (+2^28.8796)
MONTRED r4, r3
    //// bounds:  -0x0004f70 (-2^14.3117) <= r4  <= 0x00004f70 (+2^14.3117)
str.w r4, [r0, #28]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #32]
/*** basesqr 3 ***/
/* computing z0 = x0^2 + 2*zeta^3*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4301
mul.w r4, r4, r14
    //// bounds:  -0x3ed9e5f (-2^25.9739) <= r4  <= 0x03ed9e5f (+2^25.9739)
mla.w r4, r7, r7, r4
    //// bounds:  -0xdc8b7f8 (-2^27.7849) <= r4  <= 0x0dc8b7f8 (+2^27.7849)
MONTRED r4, r3
    //// bounds:  -0x0003fc8 (-2^13.9951) <= r4  <= 0x00003fc9 (+2^13.9951)
str.w r4, [r0, #36]
/* computing z1 = 2x0x1 + zeta^3 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10650
mul.w r4, r4, r14
    //// bounds:  -0x9ba14be (-2^27.2820) <= r4  <= 0x09ba14be (+2^27.2820)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d7047f0 (-2^28.8796) <= r4  <= 0x1d7047f0 (+2^28.8796)
MONTRED r4, r3
    //// bounds:  -0x0004f70 (-2^14.3117) <= r4  <= 0x00004f70 (+2^14.3117)
str.w r4, [r0, #40]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #44]
ldr.w r10, [r1, #48]
ldr.w r9, [r1, #52]
ldr.w r8, [r1, #56]
ldr.w r7, [r1, #60]
ldr.w r6, [r1, #64]
ldr.w r5, [r1, #68]
/*** basesqr 4 ***/
/* computing z0 = x0^2 + 2*zeta^4*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5288
mul.w r4, r4, r14
    //// bounds:  -0x4d463b8 (-2^26.2719) <= r4  <= 0x04d463b8 (+2^26.2719)
mla.w r4, r10, r10, r4
    //// bounds:  -0xeaf7d51 (-2^27.8763) <= r4  <= 0x0eaf7d51 (+2^27.8763)
MONTRED r4, r3
    //// bounds:  -0x00040af (-2^14.0153) <= r4  <= 0x000040af (+2^14.0153)
str.w r4, [r0, #48]
/* computing z1 = 2x0x1 + zeta^4 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2644
mul.w r4, r4, r14
    //// bounds:  -0x26a31dc (-2^25.2719) <= r4  <= 0x026a31dc (+2^25.2719)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1620650e (-2^28.4677) <= r4  <= 0x1620650e (+2^28.4677)
MONTRED r4, r3
    //// bounds:  -0x0004820 (-2^14.1724) <= r4  <= 0x00004820 (+2^14.1724)
str.w r4, [r0, #52]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #56]
/*** basesqr 5 ***/
/* computing z0 = x0^2 + 2*zeta^5*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5288
mul.w r4, r4, r14
    //// bounds:  -0x4d463b8 (-2^26.2719) <= r4  <= 0x04d463b8 (+2^26.2719)
mla.w r4, r7, r7, r4
    //// bounds:  -0xeaf7d51 (-2^27.8763) <= r4  <= 0x0eaf7d51 (+2^27.8763)
MONTRED r4, r3
    //// bounds:  -0x00040af (-2^14.0153) <= r4  <= 0x000040af (+2^14.0153)
str.w r4, [r0, #60]
/* computing z1 = 2x0x1 + zeta^5 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2644
mul.w r4, r4, r14
    //// bounds:  -0x26a31dc (-2^25.2719) <= r4  <= 0x026a31dc (+2^25.2719)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1620650e (-2^28.4677) <= r4  <= 0x1620650e (+2^28.4677)
MONTRED r4, r3
    //// bounds:  -0x0004820 (-2^14.1724) <= r4  <= 0x00004820 (+2^14.1724)
str.w r4, [r0, #64]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #68]
ldr.w r10, [r1, #72]
ldr.w r9, [r1, #76]
ldr.w r8, [r1, #80]
ldr.w r7, [r1, #84]
ldr.w r6, [r1, #88]
ldr.w r5, [r1, #92]
/*** basesqr 6 ***/
/* computing z0 = x0^2 + 2*zeta^6*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1247
mul.w r4, r4, r14
    //// bounds:  -0x1238fc5 (-2^24.1877) <= r4  <= 0x01238fc5 (+2^24.1877)
mla.w r4, r10, r10, r4
    //// bounds:  -0xafea95e (-2^27.4587) <= r4  <= 0x0afea95e (+2^27.4587)
MONTRED r4, r3
    //// bounds:  -0x0003cfe (-2^13.9306) <= r4  <= 0x00003cff (+2^13.9306)
str.w r4, [r0, #72]
/* computing z1 = 2x0x1 + zeta^6 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12177
mul.w r4, r4, r14
    //// bounds:  -0xb1f1c0b (-2^27.4753) <= r4  <= 0x0b1f1c0b (+2^27.4753)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ed54f3d (-2^28.9464) <= r4  <= 0x1ed54f3d (+2^28.9464)
MONTRED r4, r3
    //// bounds:  -0x00050d5 (-2^14.3369) <= r4  <= 0x000050d5 (+2^14.3369)
str.w r4, [r0, #76]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #80]
/*** basesqr 7 ***/
/* computing z0 = x0^2 + 2*zeta^7*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1247
mul.w r4, r4, r14
    //// bounds:  -0x1238fc5 (-2^24.1877) <= r4  <= 0x01238fc5 (+2^24.1877)
mla.w r4, r7, r7, r4
    //// bounds:  -0xafea95e (-2^27.4587) <= r4  <= 0x0afea95e (+2^27.4587)
MONTRED r4, r3
    //// bounds:  -0x0003cfe (-2^13.9306) <= r4  <= 0x00003cff (+2^13.9306)
str.w r4, [r0, #84]
/* computing z1 = 2x0x1 + zeta^7 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12177
mul.w r4, r4, r14
    //// bounds:  -0xb1f1c0b (-2^27.4753) <= r4  <= 0x0b1f1c0b (+2^27.4753)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ed54f3d (-2^28.9464) <= r4  <= 0x1ed54f3d (+2^28.9464)
MONTRED r4, r3
    //// bounds:  -0x00050d5 (-2^14.3369) <= r4  <= 0x000050d5 (+2^14.3369)
str.w r4, [r0, #88]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #92]
ldr.w r10, [r1, #96]
ldr.w r9, [r1, #100]
ldr.w r8, [r1, #104]
ldr.w r7, [r1, #108]
ldr.w r6, [r1, #112]
ldr.w r5, [r1, #116]
/*** basesqr 8 ***/
/* computing z0 = x0^2 + 2*zeta^8*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5523
mul.w r4, r4, r14
    //// bounds:  -0x50b55c1 (-2^26.3346) <= r4  <= 0x050b55c1 (+2^26.3346)
mla.w r4, r10, r10, r4
    //// bounds:  -0xee66f5a (-2^27.8973) <= r4  <= 0x0ee66f5a (+2^27.8973)
MONTRED r4, r3
    //// bounds:  -0x00040e6 (-2^14.0201) <= r4  <= 0x000040e6 (+2^14.0201)
str.w r4, [r0, #96]
/* computing z1 = 2x0x1 + zeta^8 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10039
mul.w r4, r4, r14
    //// bounds:  -0x92b390d (-2^27.1967) <= r4  <= 0x092b390d (+2^27.1967)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ce16c3f (-2^28.8520) <= r4  <= 0x1ce16c3f (+2^28.8520)
MONTRED r4, r3
    //// bounds:  -0x0004ee1 (-2^14.3016) <= r4  <= 0x00004ee1 (+2^14.3016)
str.w r4, [r0, #100]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #104]
/*** basesqr 9 ***/
/* computing z0 = x0^2 + 2*zeta^9*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5523
mul.w r4, r4, r14
    //// bounds:  -0x50b55c1 (-2^26.3346) <= r4  <= 0x050b55c1 (+2^26.3346)
mla.w r4, r7, r7, r4
    //// bounds:  -0xee66f5a (-2^27.8973) <= r4  <= 0x0ee66f5a (+2^27.8973)
MONTRED r4, r3
    //// bounds:  -0x00040e6 (-2^14.0201) <= r4  <= 0x000040e6 (+2^14.0201)
str.w r4, [r0, #108]
/* computing z1 = 2x0x1 + zeta^9 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10039
mul.w r4, r4, r14
    //// bounds:  -0x92b390d (-2^27.1967) <= r4  <= 0x092b390d (+2^27.1967)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ce16c3f (-2^28.8520) <= r4  <= 0x1ce16c3f (+2^28.8520)
MONTRED r4, r3
    //// bounds:  -0x0004ee1 (-2^14.3016) <= r4  <= 0x00004ee1 (+2^14.3016)
str.w r4, [r0, #112]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #116]
ldr.w r10, [r1, #120]
ldr.w r9, [r1, #124]
ldr.w r8, [r1, #128]
ldr.w r7, [r1, #132]
ldr.w r6, [r1, #136]
ldr.w r5, [r1, #140]
/*** basesqr 10 ***/
/* computing z0 = x0^2 + 2*zeta^10*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12355
mul.w r4, r4, r14
    //// bounds:  -0xb48ba51 (-2^27.4962) <= r4  <= 0x0b48ba51 (+2^27.4962)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1523d3ea (-2^28.4019) <= r4  <= 0x1523d3ea (+2^28.4019)
MONTRED r4, r3
    //// bounds:  -0x0004723 (-2^14.1525) <= r4  <= 0x00004724 (+2^14.1526)
str.w r4, [r0, #120]
/* computing z1 = 2x0x1 + zeta^10 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6623
mul.w r4, r4, r14
    //// bounds:  -0x60c86c5 (-2^26.5967) <= r4  <= 0x060c86c5 (+2^26.5967)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x19c2b9f7 (-2^28.6871) <= r4  <= 0x19c2b9f7 (+2^28.6871)
MONTRED r4, r3
    //// bounds:  -0x0004bc2 (-2^14.2433) <= r4  <= 0x00004bc3 (+2^14.2434)
str.w r4, [r0, #124]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #128]
/*** basesqr 11 ***/
/* computing z0 = x0^2 + 2*zeta^11*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12355
mul.w r4, r4, r14
    //// bounds:  -0xb48ba51 (-2^27.4962) <= r4  <= 0x0b48ba51 (+2^27.4962)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1523d3ea (-2^28.4019) <= r4  <= 0x1523d3ea (+2^28.4019)
MONTRED r4, r3
    //// bounds:  -0x0004723 (-2^14.1525) <= r4  <= 0x00004724 (+2^14.1526)
str.w r4, [r0, #132]
/* computing z1 = 2x0x1 + zeta^11 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6623
mul.w r4, r4, r14
    //// bounds:  -0x60c86c5 (-2^26.5967) <= r4  <= 0x060c86c5 (+2^26.5967)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x19c2b9f7 (-2^28.6871) <= r4  <= 0x19c2b9f7 (+2^28.6871)
MONTRED r4, r3
    //// bounds:  -0x0004bc2 (-2^14.2433) <= r4  <= 0x00004bc3 (+2^14.2434)
str.w r4, [r0, #136]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #140]
ldr.w r10, [r1, #144]
ldr.w r9, [r1, #148]
ldr.w r8, [r1, #152]
ldr.w r7, [r1, #156]
ldr.w r6, [r1, #160]
ldr.w r5, [r1, #164]
/*** basesqr 12 ***/
/* computing z0 = x0^2 + 2*zeta^12*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9601
mul.w r4, r4, r14
    //// bounds:  -0x8c4d05b (-2^27.1324) <= r4  <= 0x08c4d05b (+2^27.1324)
mla.w r4, r10, r10, r4
    //// bounds:  -0x129fe9f4 (-2^28.2191) <= r4  <= 0x129fe9f4 (+2^28.2191)
MONTRED r4, r3
    //// bounds:  -0x00044a0 (-2^14.1007) <= r4  <= 0x000044a0 (+2^14.1007)
str.w r4, [r0, #144]
/* computing z1 = 2x0x1 + zeta^12 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8000
mul.w r4, r4, r14
    //// bounds:  -0x74e7bc0 (-2^26.8692) <= r4  <= 0x074e7bc0 (+2^26.8692)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b04aef2 (-2^28.7559) <= r4  <= 0x1b04aef2 (+2^28.7559)
MONTRED r4, r3
    //// bounds:  -0x0004d04 (-2^14.2671) <= r4  <= 0x00004d05 (+2^14.2672)
str.w r4, [r0, #148]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #152]
/*** basesqr 13 ***/
/* computing z0 = x0^2 + 2*zeta^13*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9601
mul.w r4, r4, r14
    //// bounds:  -0x8c4d05b (-2^27.1324) <= r4  <= 0x08c4d05b (+2^27.1324)
mla.w r4, r7, r7, r4
    //// bounds:  -0x129fe9f4 (-2^28.2191) <= r4  <= 0x129fe9f4 (+2^28.2191)
MONTRED r4, r3
    //// bounds:  -0x00044a0 (-2^14.1007) <= r4  <= 0x000044a0 (+2^14.1007)
str.w r4, [r0, #156]
/* computing z1 = 2x0x1 + zeta^13 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8000
mul.w r4, r4, r14
    //// bounds:  -0x74e7bc0 (-2^26.8692) <= r4  <= 0x074e7bc0 (+2^26.8692)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b04aef2 (-2^28.7559) <= r4  <= 0x1b04aef2 (+2^28.7559)
MONTRED r4, r3
    //// bounds:  -0x0004d04 (-2^14.2671) <= r4  <= 0x00004d05 (+2^14.2672)
str.w r4, [r0, #160]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #164]
ldr.w r10, [r1, #168]
ldr.w r9, [r1, #172]
ldr.w r8, [r1, #176]
ldr.w r7, [r1, #180]
ldr.w r6, [r1, #184]
ldr.w r5, [r1, #188]
/*** basesqr 14 ***/
/* computing z0 = x0^2 + 2*zeta^14*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-100
mul.w r4, r4, r14
    //// bounds:  -0x017618c (-2^20.5473) <= r4  <= 0x0017618c (+2^20.5473)
mla.w r4, r10, r10, r4
    //// bounds:  -0x9f27b25 (-2^27.3143) <= r4  <= 0x09f27b25 (+2^27.3143)
MONTRED r4, r3
    //// bounds:  -0x0003bf2 (-2^13.9056) <= r4  <= 0x00003bf2 (+2^13.9056)
str.w r4, [r0, #168]
/* computing z1 = 2x0x1 + zeta^14 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-50
mul.w r4, r4, r14
    //// bounds:  -0x00bb0c6 (-2^19.5473) <= r4  <= 0x000bb0c6 (+2^19.5473)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13c1e3f8 (-2^28.3043) <= r4  <= 0x13c1e3f8 (+2^28.3043)
MONTRED r4, r3
    //// bounds:  -0x00045c1 (-2^14.1242) <= r4  <= 0x000045c2 (+2^14.1243)
str.w r4, [r0, #172]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #176]
/*** basesqr 15 ***/
/* computing z0 = x0^2 + 2*zeta^15*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =100
mul.w r4, r4, r14
    //// bounds:  -0x017618c (-2^20.5473) <= r4  <= 0x0017618c (+2^20.5473)
mla.w r4, r7, r7, r4
    //// bounds:  -0x9f27b25 (-2^27.3143) <= r4  <= 0x09f27b25 (+2^27.3143)
MONTRED r4, r3
    //// bounds:  -0x0003bf2 (-2^13.9056) <= r4  <= 0x00003bf2 (+2^13.9056)
str.w r4, [r0, #180]
/* computing z1 = 2x0x1 + zeta^15 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =50
mul.w r4, r4, r14
    //// bounds:  -0x00bb0c6 (-2^19.5473) <= r4  <= 0x000bb0c6 (+2^19.5473)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13c1e3f8 (-2^28.3043) <= r4  <= 0x13c1e3f8 (+2^28.3043)
MONTRED r4, r3
    //// bounds:  -0x00045c1 (-2^14.1242) <= r4  <= 0x000045c2 (+2^14.1243)
str.w r4, [r0, #184]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #188]
ldr.w r10, [r1, #192]
ldr.w r9, [r1, #196]
ldr.w r8, [r1, #200]
ldr.w r7, [r1, #204]
ldr.w r6, [r1, #208]
ldr.w r5, [r1, #212]
/*** basesqr 16 ***/
/* computing z0 = x0^2 + 2*zeta^16*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11286
mul.w r4, r4, r14
    //// bounds:  -0xa4ec8d2 (-2^27.3657) <= r4  <= 0x0a4ec8d2 (+2^27.3657)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1429e26b (-2^28.3337) <= r4  <= 0x1429e26b (+2^28.3337)
MONTRED r4, r3
    //// bounds:  -0x0004629 (-2^14.1326) <= r4  <= 0x0000462a (+2^14.1327)
str.w r4, [r0, #192]
/* computing z1 = 2x0x1 + zeta^16 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5643
mul.w r4, r4, r14
    //// bounds:  -0x5276469 (-2^26.3657) <= r4  <= 0x05276469 (+2^26.3657)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x18dd979b (-2^28.6361) <= r4  <= 0x18dd979b (+2^28.6361)
MONTRED r4, r3
    //// bounds:  -0x0004add (-2^14.2262) <= r4  <= 0x00004ade (+2^14.2263)
str.w r4, [r0, #196]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #200]
/*** basesqr 17 ***/
/* computing z0 = x0^2 + 2*zeta^17*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11286
mul.w r4, r4, r14
    //// bounds:  -0xa4ec8d2 (-2^27.3657) <= r4  <= 0x0a4ec8d2 (+2^27.3657)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1429e26b (-2^28.3337) <= r4  <= 0x1429e26b (+2^28.3337)
MONTRED r4, r3
    //// bounds:  -0x0004629 (-2^14.1326) <= r4  <= 0x0000462a (+2^14.1327)
str.w r4, [r0, #204]
/* computing z1 = 2x0x1 + zeta^17 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5643
mul.w r4, r4, r14
    //// bounds:  -0x5276469 (-2^26.3657) <= r4  <= 0x05276469 (+2^26.3657)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x18dd979b (-2^28.6361) <= r4  <= 0x18dd979b (+2^28.6361)
MONTRED r4, r3
    //// bounds:  -0x0004add (-2^14.2262) <= r4  <= 0x00004ade (+2^14.2263)
str.w r4, [r0, #208]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #212]
ldr.w r10, [r1, #216]
ldr.w r9, [r1, #220]
ldr.w r8, [r1, #224]
ldr.w r7, [r1, #228]
ldr.w r6, [r1, #232]
ldr.w r5, [r1, #236]
/*** basesqr 18 ***/
/* computing z0 = x0^2 + 2*zeta^18*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11911
mul.w r4, r4, r14
    //// bounds:  -0xae0ea7d (-2^27.4434) <= r4  <= 0x0ae0ea7d (+2^27.4434)
mla.w r4, r10, r10, r4
    //// bounds:  -0x14bc0416 (-2^28.3740) <= r4  <= 0x14bc0416 (+2^28.3740)
MONTRED r4, r3
    //// bounds:  -0x00046bc (-2^14.1443) <= r4  <= 0x000046bc (+2^14.1443)
str.w r4, [r0, #216]
/* computing z1 = 2x0x1 + zeta^18 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6845
mul.w r4, r4, r14
    //// bounds:  -0x6406eaf (-2^26.6442) <= r4  <= 0x06406eaf (+2^26.6442)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x19f6a1e1 (-2^28.6984) <= r4  <= 0x19f6a1e1 (+2^28.6984)
MONTRED r4, r3
    //// bounds:  -0x0004bf6 (-2^14.2472) <= r4  <= 0x00004bf7 (+2^14.2473)
str.w r4, [r0, #220]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #224]
/*** basesqr 19 ***/
/* computing z0 = x0^2 + 2*zeta^19*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11911
mul.w r4, r4, r14
    //// bounds:  -0xae0ea7d (-2^27.4434) <= r4  <= 0x0ae0ea7d (+2^27.4434)
mla.w r4, r7, r7, r4
    //// bounds:  -0x14bc0416 (-2^28.3740) <= r4  <= 0x14bc0416 (+2^28.3740)
MONTRED r4, r3
    //// bounds:  -0x00046bc (-2^14.1443) <= r4  <= 0x000046bc (+2^14.1443)
str.w r4, [r0, #228]
/* computing z1 = 2x0x1 + zeta^19 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6845
mul.w r4, r4, r14
    //// bounds:  -0x6406eaf (-2^26.6442) <= r4  <= 0x06406eaf (+2^26.6442)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x19f6a1e1 (-2^28.6984) <= r4  <= 0x19f6a1e1 (+2^28.6984)
MONTRED r4, r3
    //// bounds:  -0x0004bf6 (-2^14.2472) <= r4  <= 0x00004bf7 (+2^14.2473)
str.w r4, [r0, #232]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #236]
ldr.w r10, [r1, #240]
ldr.w r9, [r1, #244]
ldr.w r8, [r1, #248]
ldr.w r7, [r1, #252]
ldr.w r6, [r1, #256]
ldr.w r5, [r1, #260]
/*** basesqr 20 ***/
/* computing z0 = x0^2 + 2*zeta^20*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11067
mul.w r4, r4, r14
    //// bounds:  -0xa1b9479 (-2^27.3374) <= r4  <= 0x0a1b9479 (+2^27.3374)
mla.w r4, r10, r10, r4
    //// bounds:  -0x13f6ae12 (-2^28.3193) <= r4  <= 0x13f6ae12 (+2^28.3193)
MONTRED r4, r3
    //// bounds:  -0x00045f6 (-2^14.1285) <= r4  <= 0x000045f7 (+2^14.1286)
str.w r4, [r0, #240]
/* computing z1 = 2x0x1 + zeta^20 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7267
mul.w r4, r4, r14
    //// bounds:  -0x6a319b1 (-2^26.7306) <= r4  <= 0x06a319b1 (+2^26.7306)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a594ce3 (-2^28.7197) <= r4  <= 0x1a594ce3 (+2^28.7197)
MONTRED r4, r3
    //// bounds:  -0x0004c59 (-2^14.2545) <= r4  <= 0x00004c59 (+2^14.2545)
str.w r4, [r0, #244]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #248]
/*** basesqr 21 ***/
/* computing z0 = x0^2 + 2*zeta^21*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11067
mul.w r4, r4, r14
    //// bounds:  -0xa1b9479 (-2^27.3374) <= r4  <= 0x0a1b9479 (+2^27.3374)
mla.w r4, r7, r7, r4
    //// bounds:  -0x13f6ae12 (-2^28.3193) <= r4  <= 0x13f6ae12 (+2^28.3193)
MONTRED r4, r3
    //// bounds:  -0x00045f6 (-2^14.1285) <= r4  <= 0x000045f7 (+2^14.1286)
str.w r4, [r0, #252]
/* computing z1 = 2x0x1 + zeta^21 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7267
mul.w r4, r4, r14
    //// bounds:  -0x6a319b1 (-2^26.7306) <= r4  <= 0x06a319b1 (+2^26.7306)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a594ce3 (-2^28.7197) <= r4  <= 0x1a594ce3 (+2^28.7197)
MONTRED r4, r3
    //// bounds:  -0x0004c59 (-2^14.2545) <= r4  <= 0x00004c59 (+2^14.2545)
str.w r4, [r0, #256]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #260]
ldr.w r10, [r1, #264]
ldr.w r9, [r1, #268]
ldr.w r8, [r1, #272]
ldr.w r7, [r1, #276]
ldr.w r6, [r1, #280]
ldr.w r5, [r1, #284]
/*** basesqr 22 ***/
/* computing z0 = x0^2 + 2*zeta^22*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4251
mul.w r4, r4, r14
    //// bounds:  -0x3e1ed99 (-2^25.9570) <= r4  <= 0x03e1ed99 (+2^25.9570)
mla.w r4, r10, r10, r4
    //// bounds:  -0xdbd0732 (-2^27.7801) <= r4  <= 0x0dbd0732 (+2^27.7801)
MONTRED r4, r3
    //// bounds:  -0x0003fbd (-2^13.9941) <= r4  <= 0x00003fbd (+2^13.9941)
str.w r4, [r0, #264]
/* computing z1 = 2x0x1 + zeta^22 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10675
mul.w r4, r4, r14
    //// bounds:  -0x9bfed21 (-2^27.2854) <= r4  <= 0x09bfed21 (+2^27.2854)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d762053 (-2^28.8808) <= r4  <= 0x1d762053 (+2^28.8808)
MONTRED r4, r3
    //// bounds:  -0x0004f76 (-2^14.3122) <= r4  <= 0x00004f76 (+2^14.3122)
str.w r4, [r0, #268]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #272]
/*** basesqr 23 ***/
/* computing z0 = x0^2 + 2*zeta^23*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4251
mul.w r4, r4, r14
    //// bounds:  -0x3e1ed99 (-2^25.9570) <= r4  <= 0x03e1ed99 (+2^25.9570)
mla.w r4, r7, r7, r4
    //// bounds:  -0xdbd0732 (-2^27.7801) <= r4  <= 0x0dbd0732 (+2^27.7801)
MONTRED r4, r3
    //// bounds:  -0x0003fbd (-2^13.9941) <= r4  <= 0x00003fbd (+2^13.9941)
str.w r4, [r0, #276]
/* computing z1 = 2x0x1 + zeta^23 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10675
mul.w r4, r4, r14
    //// bounds:  -0x9bfed21 (-2^27.2854) <= r4  <= 0x09bfed21 (+2^27.2854)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d762053 (-2^28.8808) <= r4  <= 0x1d762053 (+2^28.8808)
MONTRED r4, r3
    //// bounds:  -0x0004f76 (-2^14.3122) <= r4  <= 0x00004f76 (+2^14.3122)
str.w r4, [r0, #280]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #284]
ldr.w r10, [r1, #288]
ldr.w r9, [r1, #292]
ldr.w r8, [r1, #296]
ldr.w r7, [r1, #300]
ldr.w r6, [r1, #304]
ldr.w r5, [r1, #308]
/*** basesqr 24 ***/
/* computing z0 = x0^2 + 2*zeta^24*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2544
mul.w r4, r4, r14
    //// bounds:  -0x252d050 (-2^25.2163) <= r4  <= 0x0252d050 (+2^25.2163)
mla.w r4, r10, r10, r4
    //// bounds:  -0xc2de9e9 (-2^27.6064) <= r4  <= 0x0c2de9e9 (+2^27.6064)
MONTRED r4, r3
    //// bounds:  -0x0003e2e (-2^13.9584) <= r4  <= 0x00003e2e (+2^13.9584)
str.w r4, [r0, #288]
/* computing z1 = 2x0x1 + zeta^24 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1272
mul.w r4, r4, r14
    //// bounds:  -0x1296828 (-2^24.2163) <= r4  <= 0x01296828 (+2^24.2163)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x14df9b5a (-2^28.3836) <= r4  <= 0x14df9b5a (+2^28.3836)
MONTRED r4, r3
    //// bounds:  -0x00046df (-2^14.1471) <= r4  <= 0x000046e0 (+2^14.1472)
str.w r4, [r0, #292]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #296]
/*** basesqr 25 ***/
/* computing z0 = x0^2 + 2*zeta^25*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2544
mul.w r4, r4, r14
    //// bounds:  -0x252d050 (-2^25.2163) <= r4  <= 0x0252d050 (+2^25.2163)
mla.w r4, r7, r7, r4
    //// bounds:  -0xc2de9e9 (-2^27.6064) <= r4  <= 0x0c2de9e9 (+2^27.6064)
MONTRED r4, r3
    //// bounds:  -0x0003e2e (-2^13.9584) <= r4  <= 0x00003e2e (+2^13.9584)
str.w r4, [r0, #300]
/* computing z1 = 2x0x1 + zeta^25 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1272
mul.w r4, r4, r14
    //// bounds:  -0x1296828 (-2^24.2163) <= r4  <= 0x01296828 (+2^24.2163)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x14df9b5a (-2^28.3836) <= r4  <= 0x14df9b5a (+2^28.3836)
MONTRED r4, r3
    //// bounds:  -0x00046df (-2^14.1471) <= r4  <= 0x000046e0 (+2^14.1472)
str.w r4, [r0, #304]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #308]
ldr.w r10, [r1, #312]
ldr.w r9, [r1, #316]
ldr.w r8, [r1, #320]
ldr.w r7, [r1, #324]
ldr.w r6, [r1, #328]
ldr.w r5, [r1, #332]
/*** basesqr 26 ***/
/* computing z0 = x0^2 + 2*zeta^26*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2576
mul.w r4, r4, r14
    //// bounds:  -0x25a4bb0 (-2^25.2343) <= r4  <= 0x025a4bb0 (+2^25.2343)
mla.w r4, r10, r10, r4
    //// bounds:  -0xc356549 (-2^27.6098) <= r4  <= 0x0c356549 (+2^27.6098)
MONTRED r4, r3
    //// bounds:  -0x0003e35 (-2^13.9590) <= r4  <= 0x00003e35 (+2^13.9590)
str.w r4, [r0, #312]
/* computing z1 = 2x0x1 + zeta^26 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1288
mul.w r4, r4, r14
    //// bounds:  -0x12d25d8 (-2^24.2343) <= r4  <= 0x012d25d8 (+2^24.2343)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x14e3590a (-2^28.3846) <= r4  <= 0x14e3590a (+2^28.3846)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x00046e3 (-2^14.1474) <= r4  <= 0x000046e3 (+2^14.1474)
str.w r4, [r0, #316]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #320]
/*** basesqr 27 ***/
/* computing z0 = x0^2 + 2*zeta^27*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2576
mul.w r4, r4, r14
    //// bounds:  -0x25a4bb0 (-2^25.2343) <= r4  <= 0x025a4bb0 (+2^25.2343)
mla.w r4, r7, r7, r4
    //// bounds:  -0xc356549 (-2^27.6098) <= r4  <= 0x0c356549 (+2^27.6098)
MONTRED r4, r3
    //// bounds:  -0x0003e35 (-2^13.9590) <= r4  <= 0x00003e35 (+2^13.9590)
str.w r4, [r0, #324]
/* computing z1 = 2x0x1 + zeta^27 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1288
mul.w r4, r4, r14
    //// bounds:  -0x12d25d8 (-2^24.2343) <= r4  <= 0x012d25d8 (+2^24.2343)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x14e3590a (-2^28.3846) <= r4  <= 0x14e3590a (+2^28.3846)
MONTRED r4, r3
    //// bounds:  -0x00046e3 (-2^14.1474) <= r4  <= 0x000046e3 (+2^14.1474)
str.w r4, [r0, #328]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #332]
ldr.w r10, [r1, #336]
ldr.w r9, [r1, #340]
ldr.w r8, [r1, #344]
ldr.w r7, [r1, #348]
ldr.w r6, [r1, #352]
ldr.w r5, [r1, #356]
/*** basesqr 28 ***/
/* computing z0 = x0^2 + 2*zeta^28*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9428
mul.w r4, r4, r14
    //// bounds:  -0x89c5d5c (-2^27.1061) <= r4  <= 0x089c5d5c (+2^27.1061)
mla.w r4, r10, r10, r4
    //// bounds:  -0x127776f5 (-2^28.2069) <= r4  <= 0x127776f5 (+2^28.2069)
MONTRED r4, r3
    //// bounds:  -0x0004477 (-2^14.0973) <= r4  <= 0x00004477 (+2^14.0973)
str.w r4, [r0, #336]
/* computing z1 = 2x0x1 + zeta^28 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4714
mul.w r4, r4, r14
    //// bounds:  -0x44e2eae (-2^26.1061) <= r4  <= 0x044e2eae (+2^26.1061)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x180461e0 (-2^28.5860) <= r4  <= 0x180461e0 (+2^28.5860)
MONTRED r4, r3
    //// bounds:  -0x0004a04 (-2^14.2098) <= r4  <= 0x00004a04 (+2^14.2098)
str.w r4, [r0, #340]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #344]
/*** basesqr 29 ***/
/* computing z0 = x0^2 + 2*zeta^29*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9428
mul.w r4, r4, r14
    //// bounds:  -0x89c5d5c (-2^27.1061) <= r4  <= 0x089c5d5c (+2^27.1061)
mla.w r4, r7, r7, r4
    //// bounds:  -0x127776f5 (-2^28.2069) <= r4  <= 0x127776f5 (+2^28.2069)
MONTRED r4, r3
    //// bounds:  -0x0004477 (-2^14.0973) <= r4  <= 0x00004477 (+2^14.0973)
str.w r4, [r0, #348]
/* computing z1 = 2x0x1 + zeta^29 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4714
mul.w r4, r4, r14
    //// bounds:  -0x44e2eae (-2^26.1061) <= r4  <= 0x044e2eae (+2^26.1061)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x180461e0 (-2^28.5860) <= r4  <= 0x180461e0 (+2^28.5860)
MONTRED r4, r3
    //// bounds:  -0x0004a04 (-2^14.2098) <= r4  <= 0x00004a04 (+2^14.2098)
str.w r4, [r0, #352]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #356]
ldr.w r10, [r1, #360]
ldr.w r9, [r1, #364]
ldr.w r8, [r1, #368]
ldr.w r7, [r1, #372]
ldr.w r6, [r1, #376]
ldr.w r5, [r1, #380]
/*** basesqr 30 ***/
/* computing z0 = x0^2 + 2*zeta^30*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1979
mul.w r4, r4, r14
    //// bounds:  -0x1ceb5f9 (-2^24.8540) <= r4  <= 0x01ceb5f9 (+2^24.8540)
mla.w r4, r10, r10, r4
    //// bounds:  -0xba9cf92 (-2^27.5439) <= r4  <= 0x0ba9cf92 (+2^27.5439)
MONTRED r4, r3
    //// bounds:  -0x0003da9 (-2^13.9463) <= r4  <= 0x00003daa (+2^13.9464)
str.w r4, [r0, #360]
/* computing z1 = 2x0x1 + zeta^30 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11811
mul.w r4, r4, r14
    //// bounds:  -0xac988f1 (-2^27.4313) <= r4  <= 0x0ac988f1 (+2^27.4313)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e7fbc23 (-2^28.9307) <= r4  <= 0x1e7fbc23 (+2^28.9307)
MONTRED r4, r3
    //// bounds:  -0x000507f (-2^14.3308) <= r4  <= 0x00005080 (+2^14.3309)
str.w r4, [r0, #364]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #368]
/*** basesqr 31 ***/
/* computing z0 = x0^2 + 2*zeta^31*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1979
mul.w r4, r4, r14
    //// bounds:  -0x1ceb5f9 (-2^24.8540) <= r4  <= 0x01ceb5f9 (+2^24.8540)
mla.w r4, r7, r7, r4
    //// bounds:  -0xba9cf92 (-2^27.5439) <= r4  <= 0x0ba9cf92 (+2^27.5439)
MONTRED r4, r3
    //// bounds:  -0x0003da9 (-2^13.9463) <= r4  <= 0x00003daa (+2^13.9464)
str.w r4, [r0, #372]
/* computing z1 = 2x0x1 + zeta^31 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11811
mul.w r4, r4, r14
    //// bounds:  -0xac988f1 (-2^27.4313) <= r4  <= 0x0ac988f1 (+2^27.4313)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e7fbc23 (-2^28.9307) <= r4  <= 0x1e7fbc23 (+2^28.9307)
MONTRED r4, r3
    //// bounds:  -0x000507f (-2^14.3308) <= r4  <= 0x00005080 (+2^14.3309)
str.w r4, [r0, #376]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #380]
ldr.w r10, [r1, #384]
ldr.w r9, [r1, #388]
ldr.w r8, [r1, #392]
ldr.w r7, [r1, #396]
ldr.w r6, [r1, #400]
ldr.w r5, [r1, #404]
/*** basesqr 32 ***/
/* computing z0 = x0^2 + 2*zeta^32*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11281
mul.w r4, r4, r14
    //// bounds:  -0xa4d9d8b (-2^27.3650) <= r4  <= 0x0a4d9d8b (+2^27.3650)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1428b724 (-2^28.3334) <= r4  <= 0x1428b724 (+2^28.3334)
MONTRED r4, r3
    //// bounds:  -0x0004628 (-2^14.1325) <= r4  <= 0x00004629 (+2^14.1326)
str.w r4, [r0, #384]
/* computing z1 = 2x0x1 + zeta^32 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7160
mul.w r4, r4, r14
    //// bounds:  -0x68a1528 (-2^26.7092) <= r4  <= 0x068a1528 (+2^26.7092)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a40485a (-2^28.7143) <= r4  <= 0x1a40485a (+2^28.7143)
MONTRED r4, r3
    //// bounds:  -0x0004c40 (-2^14.2527) <= r4  <= 0x00004c40 (+2^14.2527)
str.w r4, [r0, #388]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #392]
/*** basesqr 33 ***/
/* computing z0 = x0^2 + 2*zeta^33*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11281
mul.w r4, r4, r14
    //// bounds:  -0xa4d9d8b (-2^27.3650) <= r4  <= 0x0a4d9d8b (+2^27.3650)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1428b724 (-2^28.3334) <= r4  <= 0x1428b724 (+2^28.3334)
MONTRED r4, r3
    //// bounds:  -0x0004628 (-2^14.1325) <= r4  <= 0x00004629 (+2^14.1326)
str.w r4, [r0, #396]
/* computing z1 = 2x0x1 + zeta^33 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7160
mul.w r4, r4, r14
    //// bounds:  -0x68a1528 (-2^26.7092) <= r4  <= 0x068a1528 (+2^26.7092)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a40485a (-2^28.7143) <= r4  <= 0x1a40485a (+2^28.7143)
MONTRED r4, r3
    //// bounds:  -0x0004c40 (-2^14.2527) <= r4  <= 0x00004c40 (+2^14.2527)
str.w r4, [r0, #400]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #404]
ldr.w r10, [r1, #408]
ldr.w r9, [r1, #412]
ldr.w r8, [r1, #416]
ldr.w r7, [r1, #420]
ldr.w r6, [r1, #424]
ldr.w r5, [r1, #428]
/*** basesqr 34 ***/
/* computing z0 = x0^2 + 2*zeta^34*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12711
mul.w r4, r4, r14
    //// bounds:  -0xb9bf6dd (-2^27.5372) <= r4  <= 0x0b9bf6dd (+2^27.5372)
mla.w r4, r10, r10, r4
    //// bounds:  -0x15771076 (-2^28.4239) <= r4  <= 0x15771076 (+2^28.4239)
MONTRED r4, r3
    //// bounds:  -0x0004777 (-2^14.1592) <= r4  <= 0x00004777 (+2^14.1592)
str.w r4, [r0, #408]
/* computing z1 = 2x0x1 + zeta^34 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6445
mul.w r4, r4, r14
    //// bounds:  -0x5e2e87f (-2^26.5574) <= r4  <= 0x05e2e87f (+2^26.5574)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x19991bb1 (-2^28.6780) <= r4  <= 0x19991bb1 (+2^28.6780)
MONTRED r4, r3
    //// bounds:  -0x0004b99 (-2^14.2403) <= r4  <= 0x00004b99 (+2^14.2403)
str.w r4, [r0, #412]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #416]
/*** basesqr 35 ***/
/* computing z0 = x0^2 + 2*zeta^35*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12711
mul.w r4, r4, r14
    //// bounds:  -0xb9bf6dd (-2^27.5372) <= r4  <= 0x0b9bf6dd (+2^27.5372)
mla.w r4, r7, r7, r4
    //// bounds:  -0x15771076 (-2^28.4239) <= r4  <= 0x15771076 (+2^28.4239)
MONTRED r4, r3
    //// bounds:  -0x0004777 (-2^14.1592) <= r4  <= 0x00004777 (+2^14.1592)
str.w r4, [r0, #420]
/* computing z1 = 2x0x1 + zeta^35 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6445
mul.w r4, r4, r14
    //// bounds:  -0x5e2e87f (-2^26.5574) <= r4  <= 0x05e2e87f (+2^26.5574)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x19991bb1 (-2^28.6780) <= r4  <= 0x19991bb1 (+2^28.6780)
MONTRED r4, r3
    //// bounds:  -0x0004b99 (-2^14.2403) <= r4  <= 0x00004b99 (+2^14.2403)
str.w r4, [r0, #424]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #428]
ldr.w r10, [r1, #432]
ldr.w r9, [r1, #436]
ldr.w r8, [r1, #440]
ldr.w r7, [r1, #444]
ldr.w r6, [r1, #448]
ldr.w r5, [r1, #452]
/*** basesqr 36 ***/
/* computing z0 = x0^2 + 2*zeta^36*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7503
mul.w r4, r4, r14
    //// bounds:  -0x6da4795 (-2^26.7767) <= r4  <= 0x06da4795 (+2^26.7767)
mla.w r4, r10, r10, r4
    //// bounds:  -0x10b5612e (-2^28.0625) <= r4  <= 0x10b5612e (+2^28.0625)
MONTRED r4, r3
    //// bounds:  -0x00042b5 (-2^14.0598) <= r4  <= 0x000042b5 (+2^14.0598)
str.w r4, [r0, #432]
/* computing z1 = 2x0x1 + zeta^36 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9049
mul.w r4, r4, r14
    //// bounds:  -0x843c023 (-2^27.0470) <= r4  <= 0x0843c023 (+2^27.0470)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1bf9f355 (-2^28.8061) <= r4  <= 0x1bf9f355 (+2^28.8061)
MONTRED r4, r3
    //// bounds:  -0x0004dfa (-2^14.2850) <= r4  <= 0x00004dfa (+2^14.2850)
str.w r4, [r0, #436]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #440]
/*** basesqr 37 ***/
/* computing z0 = x0^2 + 2*zeta^37*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7503
mul.w r4, r4, r14
    //// bounds:  -0x6da4795 (-2^26.7767) <= r4  <= 0x06da4795 (+2^26.7767)
mla.w r4, r7, r7, r4
    //// bounds:  -0x10b5612e (-2^28.0625) <= r4  <= 0x10b5612e (+2^28.0625)
MONTRED r4, r3
    //// bounds:  -0x00042b5 (-2^14.0598) <= r4  <= 0x000042b5 (+2^14.0598)
str.w r4, [r0, #444]
/* computing z1 = 2x0x1 + zeta^37 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9049
mul.w r4, r4, r14
    //// bounds:  -0x843c023 (-2^27.0470) <= r4  <= 0x0843c023 (+2^27.0470)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1bf9f355 (-2^28.8061) <= r4  <= 0x1bf9f355 (+2^28.8061)
MONTRED r4, r3
    //// bounds:  -0x0004dfa (-2^14.2850) <= r4  <= 0x00004dfa (+2^14.2850)
str.w r4, [r0, #448]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #452]
ldr.w r10, [r1, #456]
ldr.w r9, [r1, #460]
ldr.w r8, [r1, #464]
ldr.w r7, [r1, #468]
ldr.w r6, [r1, #472]
ldr.w r5, [r1, #476]
/*** basesqr 38 ***/
/* computing z0 = x0^2 + 2*zeta^38*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2767
mul.w r4, r4, r14
    //// bounds:  -0x286f415 (-2^25.3375) <= r4  <= 0x0286f415 (+2^25.3375)
mla.w r4, r10, r10, r4
    //// bounds:  -0xc620dae (-2^27.6303) <= r4  <= 0x0c620dae (+2^27.6303)
MONTRED r4, r3
    //// bounds:  -0x0003e62 (-2^13.9631) <= r4  <= 0x00003e62 (+2^13.9631)
str.w r4, [r0, #456]
/* computing z1 = 2x0x1 + zeta^38 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11417
mul.w r4, r4, r14
    //// bounds:  -0xa6d69e3 (-2^27.3823) <= r4  <= 0x0a6d69e3 (+2^27.3823)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e239d15 (-2^28.9136) <= r4  <= 0x1e239d15 (+2^28.9136)
MONTRED r4, r3
    //// bounds:  -0x0005023 (-2^14.3244) <= r4  <= 0x00005024 (+2^14.3245)
str.w r4, [r0, #460]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #464]
/*** basesqr 39 ***/
/* computing z0 = x0^2 + 2*zeta^39*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2767
mul.w r4, r4, r14
    //// bounds:  -0x286f415 (-2^25.3375) <= r4  <= 0x0286f415 (+2^25.3375)
mla.w r4, r7, r7, r4
    //// bounds:  -0xc620dae (-2^27.6303) <= r4  <= 0x0c620dae (+2^27.6303)
MONTRED r4, r3
    //// bounds:  -0x0003e62 (-2^13.9631) <= r4  <= 0x00003e62 (+2^13.9631)
str.w r4, [r0, #468]
/* computing z1 = 2x0x1 + zeta^39 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11417
mul.w r4, r4, r14
    //// bounds:  -0xa6d69e3 (-2^27.3823) <= r4  <= 0x0a6d69e3 (+2^27.3823)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e239d15 (-2^28.9136) <= r4  <= 0x1e239d15 (+2^28.9136)
MONTRED r4, r3
    //// bounds:  -0x0005023 (-2^14.3244) <= r4  <= 0x00005024 (+2^14.3245)
str.w r4, [r0, #472]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #476]
ldr.w r10, [r1, #480]
ldr.w r9, [r1, #484]
ldr.w r8, [r1, #488]
ldr.w r7, [r1, #492]
ldr.w r6, [r1, #496]
ldr.w r5, [r1, #500]
/*** basesqr 40 ***/
/* computing z0 = x0^2 + 2*zeta^40*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6263
mul.w r4, r4, r14
    //// bounds:  -0x5b85acd (-2^26.5160) <= r4  <= 0x05b85acd (+2^26.5160)
mla.w r4, r10, r10, r4
    //// bounds:  -0xf937466 (-2^27.9613) <= r4  <= 0x0f937466 (+2^27.9613)
MONTRED r4, r3
    //// bounds:  -0x0004193 (-2^14.0351) <= r4  <= 0x00004193 (+2^14.0351)
str.w r4, [r0, #480]
/* computing z1 = 2x0x1 + zeta^40 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9669
mul.w r4, r4, r14
    //// bounds:  -0x8d4b687 (-2^27.1426) <= r4  <= 0x08d4b687 (+2^27.1426)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c8ae9b9 (-2^28.8350) <= r4  <= 0x1c8ae9b9 (+2^28.8350)
MONTRED r4, r3
    //// bounds:  -0x0004e8b (-2^14.2954) <= r4  <= 0x00004e8b (+2^14.2954)
str.w r4, [r0, #484]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #488]
/*** basesqr 41 ***/
/* computing z0 = x0^2 + 2*zeta^41*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6263
mul.w r4, r4, r14
    //// bounds:  -0x5b85acd (-2^26.5160) <= r4  <= 0x05b85acd (+2^26.5160)
mla.w r4, r7, r7, r4
    //// bounds:  -0xf937466 (-2^27.9613) <= r4  <= 0x0f937466 (+2^27.9613)
MONTRED r4, r3
    //// bounds:  -0x0004193 (-2^14.0351) <= r4  <= 0x00004193 (+2^14.0351)
str.w r4, [r0, #492]
/* computing z1 = 2x0x1 + zeta^41 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9669
mul.w r4, r4, r14
    //// bounds:  -0x8d4b687 (-2^27.1426) <= r4  <= 0x08d4b687 (+2^27.1426)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c8ae9b9 (-2^28.8350) <= r4  <= 0x1c8ae9b9 (+2^28.8350)
MONTRED r4, r3
    //// bounds:  -0x0004e8b (-2^14.2954) <= r4  <= 0x00004e8b (+2^14.2954)
str.w r4, [r0, #496]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #500]
ldr.w r10, [r1, #504]
ldr.w r9, [r1, #508]
ldr.w r8, [r1, #512]
ldr.w r7, [r1, #516]
ldr.w r6, [r1, #520]
ldr.w r5, [r1, #524]
/*** basesqr 42 ***/
/* computing z0 = x0^2 + 2*zeta^42*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3641
mul.w r4, r4, r14
    //// bounds:  -0x3534dc3 (-2^25.7335) <= r4  <= 0x03534dc3 (+2^25.7335)
mla.w r4, r10, r10, r4
    //// bounds:  -0xd2e675c (-2^27.7204) <= r4  <= 0x0d2e675c (+2^27.7204)
MONTRED r4, r3
    //// bounds:  -0x0003f2e (-2^13.9814) <= r4  <= 0x00003f2e (+2^13.9814)
str.w r4, [r0, #504]
/* computing z1 = 2x0x1 + zeta^42 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10980
mul.w r4, r4, r14
    //// bounds:  -0xa073d0c (-2^27.3260) <= r4  <= 0x0a073d0c (+2^27.3260)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1dbd703e (-2^28.8943) <= r4  <= 0x1dbd703e (+2^28.8943)
MONTRED r4, r3
    //// bounds:  -0x0004fbd (-2^14.3172) <= r4  <= 0x00004fbd (+2^14.3172)
str.w r4, [r0, #508]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #512]
/*** basesqr 43 ***/
/* computing z0 = x0^2 + 2*zeta^43*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3641
mul.w r4, r4, r14
    //// bounds:  -0x3534dc3 (-2^25.7335) <= r4  <= 0x03534dc3 (+2^25.7335)
mla.w r4, r7, r7, r4
    //// bounds:  -0xd2e675c (-2^27.7204) <= r4  <= 0x0d2e675c (+2^27.7204)
MONTRED r4, r3
    //// bounds:  -0x0003f2e (-2^13.9814) <= r4  <= 0x00003f2e (+2^13.9814)
str.w r4, [r0, #516]
/* computing z1 = 2x0x1 + zeta^43 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10980
mul.w r4, r4, r14
    //// bounds:  -0xa073d0c (-2^27.3260) <= r4  <= 0x0a073d0c (+2^27.3260)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1dbd703e (-2^28.8943) <= r4  <= 0x1dbd703e (+2^28.8943)
MONTRED r4, r3
    //// bounds:  -0x0004fbd (-2^14.3172) <= r4  <= 0x00004fbd (+2^14.3172)
str.w r4, [r0, #520]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #524]
ldr.w r10, [r1, #528]
ldr.w r9, [r1, #532]
ldr.w r8, [r1, #536]
ldr.w r7, [r1, #540]
ldr.w r6, [r1, #544]
ldr.w r5, [r1, #548]
/*** basesqr 44 ***/
/* computing z0 = x0^2 + 2*zeta^44*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-548
mul.w r4, r4, r14
    //// bounds:  -0x08020cc (-2^23.0014) <= r4  <= 0x008020cc (+2^23.0014)
mla.w r4, r10, r10, r4
    //// bounds:  -0xa5b3a65 (-2^27.3724) <= r4  <= 0x0a5b3a65 (+2^27.3724)
MONTRED r4, r3
    //// bounds:  -0x0003c5b (-2^13.9154) <= r4  <= 0x00003c5b (+2^13.9154)
str.w r4, [r0, #528]
/* computing z1 = 2x0x1 + zeta^44 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-274
mul.w r4, r4, r14
    //// bounds:  -0x0401066 (-2^22.0014) <= r4  <= 0x00401066 (+2^22.0014)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13f64398 (-2^28.3192) <= r4  <= 0x13f64398 (+2^28.3192)
MONTRED r4, r3
    //// bounds:  -0x00045f6 (-2^14.1285) <= r4  <= 0x000045f6 (+2^14.1285)
str.w r4, [r0, #532]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #536]
/*** basesqr 45 ***/
/* computing z0 = x0^2 + 2*zeta^45*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =548
mul.w r4, r4, r14
    //// bounds:  -0x08020cc (-2^23.0014) <= r4  <= 0x008020cc (+2^23.0014)
mla.w r4, r7, r7, r4
    //// bounds:  -0xa5b3a65 (-2^27.3724) <= r4  <= 0x0a5b3a65 (+2^27.3724)
MONTRED r4, r3
    //// bounds:  -0x0003c5b (-2^13.9154) <= r4  <= 0x00003c5b (+2^13.9154)
str.w r4, [r0, #540]
/* computing z1 = 2x0x1 + zeta^45 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =274
mul.w r4, r4, r14
    //// bounds:  -0x0401066 (-2^22.0014) <= r4  <= 0x00401066 (+2^22.0014)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13f64398 (-2^28.3192) <= r4  <= 0x13f64398 (+2^28.3192)
MONTRED r4, r3
    //// bounds:  -0x00045f6 (-2^14.1285) <= r4  <= 0x000045f6 (+2^14.1285)
str.w r4, [r0, #544]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #548]
ldr.w r10, [r1, #552]
ldr.w r9, [r1, #556]
ldr.w r8, [r1, #560]
ldr.w r7, [r1, #564]
ldr.w r6, [r1, #568]
ldr.w r5, [r1, #572]
/*** basesqr 46 ***/
/* computing z0 = x0^2 + 2*zeta^46*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10877
mul.w r4, r4, r14
    //// bounds:  -0x9ef27ef (-2^27.3124) <= r4  <= 0x09ef27ef (+2^27.3124)
mla.w r4, r10, r10, r4
    //// bounds:  -0x13ca4188 (-2^28.3067) <= r4  <= 0x13ca4188 (+2^28.3067)
MONTRED r4, r3
    //// bounds:  -0x00045ca (-2^14.1249) <= r4  <= 0x000045ca (+2^14.1249)
str.w r4, [r0, #552]
/* computing z1 = 2x0x1 + zeta^46 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7362
mul.w r4, r4, r14
    //// bounds:  -0x6b94ff6 (-2^26.7493) <= r4  <= 0x06b94ff6 (+2^26.7493)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a6f8328 (-2^28.7244) <= r4  <= 0x1a6f8328 (+2^28.7244)
MONTRED r4, r3
    //// bounds:  -0x0004c6f (-2^14.2561) <= r4  <= 0x00004c70 (+2^14.2562)
str.w r4, [r0, #556]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #560]
/*** basesqr 47 ***/
/* computing z0 = x0^2 + 2*zeta^47*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10877
mul.w r4, r4, r14
    //// bounds:  -0x9ef27ef (-2^27.3124) <= r4  <= 0x09ef27ef (+2^27.3124)
mla.w r4, r7, r7, r4
    //// bounds:  -0x13ca4188 (-2^28.3067) <= r4  <= 0x13ca4188 (+2^28.3067)
MONTRED r4, r3
    //// bounds:  -0x00045ca (-2^14.1249) <= r4  <= 0x000045ca (+2^14.1249)
str.w r4, [r0, #564]
/* computing z1 = 2x0x1 + zeta^47 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7362
mul.w r4, r4, r14
    //// bounds:  -0x6b94ff6 (-2^26.7493) <= r4  <= 0x06b94ff6 (+2^26.7493)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a6f8328 (-2^28.7244) <= r4  <= 0x1a6f8328 (+2^28.7244)
MONTRED r4, r3
    //// bounds:  -0x0004c6f (-2^14.2561) <= r4  <= 0x00004c70 (+2^14.2562)
str.w r4, [r0, #568]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #572]
ldr.w r10, [r1, #576]
ldr.w r9, [r1, #580]
ldr.w r8, [r1, #584]
ldr.w r7, [r1, #588]
ldr.w r6, [r1, #592]
ldr.w r5, [r1, #596]
/*** basesqr 48 ***/
/* computing z0 = x0^2 + 2*zeta^48*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6902
mul.w r4, r4, r14
    //// bounds:  -0x64dc272 (-2^26.6562) <= r4  <= 0x064dc272 (+2^26.6562)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1028dc0b (-2^28.0143) <= r4  <= 0x1028dc0b (+2^28.0143)
MONTRED r4, r3
    //// bounds:  -0x0004228 (-2^14.0478) <= r4  <= 0x00004229 (+2^14.0479)
str.w r4, [r0, #576]
/* computing z1 = 2x0x1 + zeta^48 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3451
mul.w r4, r4, r14
    //// bounds:  -0x326e139 (-2^25.6562) <= r4  <= 0x0326e139 (+2^25.6562)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x16dd146b (-2^28.5150) <= r4  <= 0x16dd146b (+2^28.5150)
MONTRED r4, r3
    //// bounds:  -0x00048dd (-2^14.1871) <= r4  <= 0x000048dd (+2^14.1871)
str.w r4, [r0, #580]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #584]
/*** basesqr 49 ***/
/* computing z0 = x0^2 + 2*zeta^49*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6902
mul.w r4, r4, r14
    //// bounds:  -0x64dc272 (-2^26.6562) <= r4  <= 0x064dc272 (+2^26.6562)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1028dc0b (-2^28.0143) <= r4  <= 0x1028dc0b (+2^28.0143)
MONTRED r4, r3
    //// bounds:  -0x0004228 (-2^14.0478) <= r4  <= 0x00004229 (+2^14.0479)
str.w r4, [r0, #588]
/* computing z1 = 2x0x1 + zeta^49 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3451
mul.w r4, r4, r14
    //// bounds:  -0x326e139 (-2^25.6562) <= r4  <= 0x0326e139 (+2^25.6562)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x16dd146b (-2^28.5150) <= r4  <= 0x16dd146b (+2^28.5150)
MONTRED r4, r3
    //// bounds:  -0x00048dd (-2^14.1871) <= r4  <= 0x000048dd (+2^14.1871)
str.w r4, [r0, #592]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #596]
ldr.w r10, [r1, #600]
ldr.w r9, [r1, #604]
ldr.w r8, [r1, #608]
ldr.w r7, [r1, #612]
ldr.w r6, [r1, #616]
ldr.w r5, [r1, #620]
/*** basesqr 50 ***/
/* computing z0 = x0^2 + 2*zeta^50*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3477
mul.w r4, r4, r14
    //// bounds:  -0x32cf577 (-2^25.6670) <= r4  <= 0x032cf577 (+2^25.6670)
mla.w r4, r10, r10, r4
    //// bounds:  -0xd080f10 (-2^27.7039) <= r4  <= 0x0d080f10 (+2^27.7039)
MONTRED r4, r3
    //// bounds:  -0x0003f08 (-2^13.9780) <= r4  <= 0x00003f08 (+2^13.9780)
str.w r4, [r0, #600]
/* computing z1 = 2x0x1 + zeta^50 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11062
mul.w r4, r4, r14
    //// bounds:  -0xa1a6932 (-2^27.3367) <= r4  <= 0x0a1a6932 (+2^27.3367)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1dd09c64 (-2^28.8980) <= r4  <= 0x1dd09c64 (+2^28.8980)
MONTRED r4, r3
    //// bounds:  -0x0004fd0 (-2^14.3185) <= r4  <= 0x00004fd1 (+2^14.3186)
str.w r4, [r0, #604]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #608]
/*** basesqr 51 ***/
/* computing z0 = x0^2 + 2*zeta^51*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3477
mul.w r4, r4, r14
    //// bounds:  -0x32cf577 (-2^25.6670) <= r4  <= 0x032cf577 (+2^25.6670)
mla.w r4, r7, r7, r4
    //// bounds:  -0xd080f10 (-2^27.7039) <= r4  <= 0x0d080f10 (+2^27.7039)
MONTRED r4, r3
    //// bounds:  -0x0003f08 (-2^13.9780) <= r4  <= 0x00003f08 (+2^13.9780)
str.w r4, [r0, #612]
/* computing z1 = 2x0x1 + zeta^51 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11062
mul.w r4, r4, r14
    //// bounds:  -0xa1a6932 (-2^27.3367) <= r4  <= 0x0a1a6932 (+2^27.3367)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1dd09c64 (-2^28.8980) <= r4  <= 0x1dd09c64 (+2^28.8980)
MONTRED r4, r3
    //// bounds:  -0x0004fd0 (-2^14.3185) <= r4  <= 0x00004fd1 (+2^14.3186)
str.w r4, [r0, #616]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #620]
ldr.w r10, [r1, #624]
ldr.w r9, [r1, #628]
ldr.w r8, [r1, #632]
ldr.w r7, [r1, #636]
ldr.w r6, [r1, #640]
ldr.w r5, [r1, #644]
/*** basesqr 52 ***/
/* computing z0 = x0^2 + 2*zeta^52*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11007
mul.w r4, r4, r14
    //// bounds:  -0xa0d8d25 (-2^27.3295) <= r4  <= 0x0a0d8d25 (+2^27.3295)
mla.w r4, r10, r10, r4
    //// bounds:  -0x13e8a6be (-2^28.3153) <= r4  <= 0x13e8a6be (+2^28.3153)
MONTRED r4, r3
    //// bounds:  -0x00045e8 (-2^14.1273) <= r4  <= 0x000045e9 (+2^14.1274)
str.w r4, [r0, #624]
/* computing z1 = 2x0x1 + zeta^52 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7297
mul.w r4, r4, r14
    //// bounds:  -0x6aa1d5b (-2^26.7365) <= r4  <= 0x06aa1d5b (+2^26.7365)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a60508d (-2^28.7212) <= r4  <= 0x1a60508d (+2^28.7212)
MONTRED r4, r3
    //// bounds:  -0x0004c60 (-2^14.2550) <= r4  <= 0x00004c60 (+2^14.2550)
str.w r4, [r0, #628]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #632]
/*** basesqr 53 ***/
/* computing z0 = x0^2 + 2*zeta^53*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11007
mul.w r4, r4, r14
    //// bounds:  -0xa0d8d25 (-2^27.3295) <= r4  <= 0x0a0d8d25 (+2^27.3295)
mla.w r4, r7, r7, r4
    //// bounds:  -0x13e8a6be (-2^28.3153) <= r4  <= 0x13e8a6be (+2^28.3153)
MONTRED r4, r3
    //// bounds:  -0x00045e8 (-2^14.1273) <= r4  <= 0x000045e9 (+2^14.1274)
str.w r4, [r0, #636]
/* computing z1 = 2x0x1 + zeta^53 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7297
mul.w r4, r4, r14
    //// bounds:  -0x6aa1d5b (-2^26.7365) <= r4  <= 0x06aa1d5b (+2^26.7365)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a60508d (-2^28.7212) <= r4  <= 0x1a60508d (+2^28.7212)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0004c60 (-2^14.2550) <= r4  <= 0x00004c60 (+2^14.2550)
str.w r4, [r0, #640]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #644]
ldr.w r10, [r1, #648]
ldr.w r9, [r1, #652]
ldr.w r8, [r1, #656]
ldr.w r7, [r1, #660]
ldr.w r6, [r1, #664]
ldr.w r5, [r1, #668]
/*** basesqr 54 ***/
/* computing z0 = x0^2 + 2*zeta^54*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5349
mul.w r4, r4, r14
    //// bounds:  -0x4e2a6e7 (-2^26.2885) <= r4  <= 0x04e2a6e7 (+2^26.2885)
mla.w r4, r10, r10, r4
    //// bounds:  -0xebdc080 (-2^27.8818) <= r4  <= 0x0ebdc080 (+2^27.8818)
MONTRED r4, r3
    //// bounds:  -0x00040bd (-2^14.0165) <= r4  <= 0x000040be (+2^14.0166)
str.w r4, [r0, #648]
/* computing z1 = 2x0x1 + zeta^54 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10126
mul.w r4, r4, r14
    //// bounds:  -0x93f907a (-2^27.2092) <= r4  <= 0x093f907a (+2^27.2092)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1cf5c3ac (-2^28.8560) <= r4  <= 0x1cf5c3ac (+2^28.8560)
MONTRED r4, r3
    //// bounds:  -0x0004ef5 (-2^14.3030) <= r4  <= 0x00004ef6 (+2^14.3031)
str.w r4, [r0, #652]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #656]
/*** basesqr 55 ***/
/* computing z0 = x0^2 + 2*zeta^55*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5349
mul.w r4, r4, r14
    //// bounds:  -0x4e2a6e7 (-2^26.2885) <= r4  <= 0x04e2a6e7 (+2^26.2885)
mla.w r4, r7, r7, r4
    //// bounds:  -0xebdc080 (-2^27.8818) <= r4  <= 0x0ebdc080 (+2^27.8818)
MONTRED r4, r3
    //// bounds:  -0x00040bd (-2^14.0165) <= r4  <= 0x000040be (+2^14.0166)
str.w r4, [r0, #660]
/* computing z1 = 2x0x1 + zeta^55 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10126
mul.w r4, r4, r14
    //// bounds:  -0x93f907a (-2^27.2092) <= r4  <= 0x093f907a (+2^27.2092)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1cf5c3ac (-2^28.8560) <= r4  <= 0x1cf5c3ac (+2^28.8560)
MONTRED r4, r3
    //// bounds:  -0x0004ef5 (-2^14.3030) <= r4  <= 0x00004ef6 (+2^14.3031)
str.w r4, [r0, #664]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #668]
ldr.w r10, [r1, #672]
ldr.w r9, [r1, #676]
ldr.w r8, [r1, #680]
ldr.w r7, [r1, #684]
ldr.w r6, [r1, #688]
ldr.w r5, [r1, #692]
/*** basesqr 56 ***/
/* computing z0 = x0^2 + 2*zeta^56*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1828
mul.w r4, r4, r14
    //// bounds:  -0x1ab67cc (-2^24.7395) <= r4  <= 0x01ab67cc (+2^24.7395)
mla.w r4, r10, r10, r4
    //// bounds:  -0xb868165 (-2^27.5267) <= r4  <= 0x0b868165 (+2^27.5267)
MONTRED r4, r3
    //// bounds:  -0x0003d86 (-2^13.9431) <= r4  <= 0x00003d87 (+2^13.9432)
str.w r4, [r0, #672]
/* computing z1 = 2x0x1 + zeta^56 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-914
mul.w r4, r4, r14
    //// bounds:  -0x0d5b3e6 (-2^23.7395) <= r4  <= 0x00d5b3e6 (+2^23.7395)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x148be718 (-2^28.3608) <= r4  <= 0x148be718 (+2^28.3608)
MONTRED r4, r3
    //// bounds:  -0x000468c (-2^14.1405) <= r4  <= 0x0000468c (+2^14.1405)
str.w r4, [r0, #676]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #680]
/*** basesqr 57 ***/
/* computing z0 = x0^2 + 2*zeta^57*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1828
mul.w r4, r4, r14
    //// bounds:  -0x1ab67cc (-2^24.7395) <= r4  <= 0x01ab67cc (+2^24.7395)
mla.w r4, r7, r7, r4
    //// bounds:  -0xb868165 (-2^27.5267) <= r4  <= 0x0b868165 (+2^27.5267)
MONTRED r4, r3
    //// bounds:  -0x0003d86 (-2^13.9431) <= r4  <= 0x00003d87 (+2^13.9432)
str.w r4, [r0, #684]
/* computing z1 = 2x0x1 + zeta^57 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =914
mul.w r4, r4, r14
    //// bounds:  -0x0d5b3e6 (-2^23.7395) <= r4  <= 0x00d5b3e6 (+2^23.7395)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x148be718 (-2^28.3608) <= r4  <= 0x148be718 (+2^28.3608)
MONTRED r4, r3
    //// bounds:  -0x000468c (-2^14.1405) <= r4  <= 0x0000468c (+2^14.1405)
str.w r4, [r0, #688]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #692]
ldr.w r10, [r1, #696]
ldr.w r9, [r1, #700]
ldr.w r8, [r1, #704]
ldr.w r7, [r1, #708]
ldr.w r6, [r1, #712]
ldr.w r5, [r1, #716]
/*** basesqr 58 ***/
/* computing z0 = x0^2 + 2*zeta^58*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10869
mul.w r4, r4, r14
    //// bounds:  -0x9ed4917 (-2^27.3113) <= r4  <= 0x09ed4917 (+2^27.3113)
mla.w r4, r10, r10, r4
    //// bounds:  -0x13c862b0 (-2^28.3062) <= r4  <= 0x13c862b0 (+2^28.3062)
MONTRED r4, r3
    //// bounds:  -0x00045c8 (-2^14.1248) <= r4  <= 0x000045c8 (+2^14.1248)
str.w r4, [r0, #696]
/* computing z1 = 2x0x1 + zeta^58 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7366
mul.w r4, r4, r14
    //// bounds:  -0x6ba3f62 (-2^26.7501) <= r4  <= 0x06ba3f62 (+2^26.7501)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a707294 (-2^28.7246) <= r4  <= 0x1a707294 (+2^28.7246)
MONTRED r4, r3
    //// bounds:  -0x0004c70 (-2^14.2562) <= r4  <= 0x00004c70 (+2^14.2562)
str.w r4, [r0, #700]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #704]
/*** basesqr 59 ***/
/* computing z0 = x0^2 + 2*zeta^59*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10869
mul.w r4, r4, r14
    //// bounds:  -0x9ed4917 (-2^27.3113) <= r4  <= 0x09ed4917 (+2^27.3113)
mla.w r4, r7, r7, r4
    //// bounds:  -0x13c862b0 (-2^28.3062) <= r4  <= 0x13c862b0 (+2^28.3062)
MONTRED r4, r3
    //// bounds:  -0x00045c8 (-2^14.1248) <= r4  <= 0x000045c8 (+2^14.1248)
str.w r4, [r0, #708]
/* computing z1 = 2x0x1 + zeta^59 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7366
mul.w r4, r4, r14
    //// bounds:  -0x6ba3f62 (-2^26.7501) <= r4  <= 0x06ba3f62 (+2^26.7501)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a707294 (-2^28.7246) <= r4  <= 0x1a707294 (+2^28.7246)
MONTRED r4, r3
    //// bounds:  -0x0004c70 (-2^14.2562) <= r4  <= 0x00004c70 (+2^14.2562)
str.w r4, [r0, #712]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #716]
ldr.w r10, [r1, #720]
ldr.w r9, [r1, #724]
ldr.w r8, [r1, #728]
ldr.w r7, [r1, #732]
ldr.w r6, [r1, #736]
ldr.w r5, [r1, #740]
/*** basesqr 60 ***/
/* computing z0 = x0^2 + 2*zeta^60*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12708
mul.w r4, r4, r14
    //// bounds:  -0xb9b434c (-2^27.5369) <= r4  <= 0x0b9b434c (+2^27.5369)
mla.w r4, r10, r10, r4
    //// bounds:  -0x15765ce5 (-2^28.4237) <= r4  <= 0x15765ce5 (+2^28.4237)
MONTRED r4, r3
    //// bounds:  -0x0004776 (-2^14.1591) <= r4  <= 0x00004776 (+2^14.1591)
str.w r4, [r0, #720]
/* computing z1 = 2x0x1 + zeta^60 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6354
mul.w r4, r4, r14
    //// bounds:  -0x5cda1a6 (-2^26.5369) <= r4  <= 0x05cda1a6 (+2^26.5369)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1983d4d8 (-2^28.6733) <= r4  <= 0x1983d4d8 (+2^28.6733)
MONTRED r4, r3
    //// bounds:  -0x0004b83 (-2^14.2386) <= r4  <= 0x00004b84 (+2^14.2387)
str.w r4, [r0, #724]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #728]
/*** basesqr 61 ***/
/* computing z0 = x0^2 + 2*zeta^61*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12708
mul.w r4, r4, r14
    //// bounds:  -0xb9b434c (-2^27.5369) <= r4  <= 0x0b9b434c (+2^27.5369)
mla.w r4, r7, r7, r4
    //// bounds:  -0x15765ce5 (-2^28.4237) <= r4  <= 0x15765ce5 (+2^28.4237)
MONTRED r4, r3
    //// bounds:  -0x0004776 (-2^14.1591) <= r4  <= 0x00004776 (+2^14.1591)
str.w r4, [r0, #732]
/* computing z1 = 2x0x1 + zeta^61 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6354
mul.w r4, r4, r14
    //// bounds:  -0x5cda1a6 (-2^26.5369) <= r4  <= 0x05cda1a6 (+2^26.5369)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1983d4d8 (-2^28.6733) <= r4  <= 0x1983d4d8 (+2^28.6733)
MONTRED r4, r3
    //// bounds:  -0x0004b83 (-2^14.2386) <= r4  <= 0x00004b84 (+2^14.2387)
str.w r4, [r0, #736]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #740]
ldr.w r10, [r1, #744]
ldr.w r9, [r1, #748]
ldr.w r8, [r1, #752]
ldr.w r7, [r1, #756]
ldr.w r6, [r1, #760]
ldr.w r5, [r1, #764]
/*** basesqr 62 ***/
/* computing z0 = x0^2 + 2*zeta^62*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10801
mul.w r4, r4, r14
    //// bounds:  -0x9dd62eb (-2^27.3023) <= r4  <= 0x09dd62eb (+2^27.3023)
mla.w r4, r10, r10, r4
    //// bounds:  -0x13b87c84 (-2^28.3016) <= r4  <= 0x13b87c84 (+2^28.3016)
MONTRED r4, r3
    //// bounds:  -0x00045b8 (-2^14.1235) <= r4  <= 0x000045b8 (+2^14.1235)
str.w r4, [r0, #744]
/* computing z1 = 2x0x1 + zeta^62 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7400
mul.w r4, r4, r14
    //// bounds:  -0x6c23278 (-2^26.7567) <= r4  <= 0x06c23278 (+2^26.7567)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a7865aa (-2^28.7263) <= r4  <= 0x1a7865aa (+2^28.7263)
MONTRED r4, r3
    //// bounds:  -0x0004c78 (-2^14.2568) <= r4  <= 0x00004c78 (+2^14.2568)
str.w r4, [r0, #748]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #752]
/*** basesqr 63 ***/
/* computing z0 = x0^2 + 2*zeta^63*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10801
mul.w r4, r4, r14
    //// bounds:  -0x9dd62eb (-2^27.3023) <= r4  <= 0x09dd62eb (+2^27.3023)
mla.w r4, r7, r7, r4
    //// bounds:  -0x13b87c84 (-2^28.3016) <= r4  <= 0x13b87c84 (+2^28.3016)
MONTRED r4, r3
    //// bounds:  -0x00045b8 (-2^14.1235) <= r4  <= 0x000045b8 (+2^14.1235)
str.w r4, [r0, #756]
/* computing z1 = 2x0x1 + zeta^63 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7400
mul.w r4, r4, r14
    //// bounds:  -0x6c23278 (-2^26.7567) <= r4  <= 0x06c23278 (+2^26.7567)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a7865aa (-2^28.7263) <= r4  <= 0x1a7865aa (+2^28.7263)
MONTRED r4, r3
    //// bounds:  -0x0004c78 (-2^14.2568) <= r4  <= 0x00004c78 (+2^14.2568)
str.w r4, [r0, #760]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #764]
ldr.w r10, [r1, #768]
ldr.w r9, [r1, #772]
ldr.w r8, [r1, #776]
ldr.w r7, [r1, #780]
ldr.w r6, [r1, #784]
ldr.w r5, [r1, #788]
/*** basesqr 64 ***/
/* computing z0 = x0^2 + 2*zeta^64*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4541
mul.w r4, r4, r14
    //// bounds:  -0x425bbaf (-2^26.0522) <= r4  <= 0x0425bbaf (+2^26.0522)
mla.w r4, r10, r10, r4
    //// bounds:  -0xe00d548 (-2^27.8077) <= r4  <= 0x0e00d548 (+2^27.8077)
MONTRED r4, r3
    //// bounds:  -0x0004000 (-2^14.0000) <= r4  <= 0x00004001 (+2^14.0001)
str.w r4, [r0, #768]
/* computing z1 = 2x0x1 + zeta^64 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10530
mul.w r4, r4, r14
    //// bounds:  -0x99e0616 (-2^27.2656) <= r4  <= 0x099e0616 (+2^27.2656)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d543948 (-2^28.8743) <= r4  <= 0x1d543948 (+2^28.8743)
MONTRED r4, r3
    //// bounds:  -0x0004f54 (-2^14.3098) <= r4  <= 0x00004f54 (+2^14.3098)
str.w r4, [r0, #772]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #776]
/*** basesqr 65 ***/
/* computing z0 = x0^2 + 2*zeta^65*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4541
mul.w r4, r4, r14
    //// bounds:  -0x425bbaf (-2^26.0522) <= r4  <= 0x0425bbaf (+2^26.0522)
mla.w r4, r7, r7, r4
    //// bounds:  -0xe00d548 (-2^27.8077) <= r4  <= 0x0e00d548 (+2^27.8077)
MONTRED r4, r3
    //// bounds:  -0x0004000 (-2^14.0000) <= r4  <= 0x00004001 (+2^14.0001)
str.w r4, [r0, #780]
/* computing z1 = 2x0x1 + zeta^65 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10530
mul.w r4, r4, r14
    //// bounds:  -0x99e0616 (-2^27.2656) <= r4  <= 0x099e0616 (+2^27.2656)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d543948 (-2^28.8743) <= r4  <= 0x1d543948 (+2^28.8743)
MONTRED r4, r3
    //// bounds:  -0x0004f54 (-2^14.3098) <= r4  <= 0x00004f54 (+2^14.3098)
str.w r4, [r0, #784]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #788]
ldr.w r10, [r1, #792]
ldr.w r9, [r1, #796]
ldr.w r8, [r1, #800]
ldr.w r7, [r1, #804]
ldr.w r6, [r1, #808]
ldr.w r5, [r1, #812]
/*** basesqr 66 ***/
/* computing z0 = x0^2 + 2*zeta^66*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9732
mul.w r4, r4, r14
    //// bounds:  -0x8e3716c (-2^27.1519) <= r4  <= 0x08e3716c (+2^27.1519)
mla.w r4, r10, r10, r4
    //// bounds:  -0x12be8b05 (-2^28.2284) <= r4  <= 0x12be8b05 (+2^28.2284)
MONTRED r4, r3
    //// bounds:  -0x00044be (-2^14.1031) <= r4  <= 0x000044bf (+2^14.1032)
str.w r4, [r0, #792]
/* computing z1 = 2x0x1 + zeta^66 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4866
mul.w r4, r4, r14
    //// bounds:  -0x471b8b6 (-2^26.1519) <= r4  <= 0x0471b8b6 (+2^26.1519)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1827ebe8 (-2^28.5943) <= r4  <= 0x1827ebe8 (+2^28.5943)
MONTRED r4, r3
    //// bounds:  -0x0004a28 (-2^14.2125) <= r4  <= 0x00004a28 (+2^14.2125)
str.w r4, [r0, #796]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #800]
/*** basesqr 67 ***/
/* computing z0 = x0^2 + 2*zeta^67*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9732
mul.w r4, r4, r14
    //// bounds:  -0x8e3716c (-2^27.1519) <= r4  <= 0x08e3716c (+2^27.1519)
mla.w r4, r7, r7, r4
    //// bounds:  -0x12be8b05 (-2^28.2284) <= r4  <= 0x12be8b05 (+2^28.2284)
MONTRED r4, r3
    //// bounds:  -0x00044be (-2^14.1031) <= r4  <= 0x000044bf (+2^14.1032)
str.w r4, [r0, #804]
/* computing z1 = 2x0x1 + zeta^67 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4866
mul.w r4, r4, r14
    //// bounds:  -0x471b8b6 (-2^26.1519) <= r4  <= 0x0471b8b6 (+2^26.1519)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1827ebe8 (-2^28.5943) <= r4  <= 0x1827ebe8 (+2^28.5943)
MONTRED r4, r3
    //// bounds:  -0x0004a28 (-2^14.2125) <= r4  <= 0x00004a28 (+2^14.2125)
str.w r4, [r0, #808]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #812]
ldr.w r10, [r1, #816]
ldr.w r9, [r1, #820]
ldr.w r8, [r1, #824]
ldr.w r7, [r1, #828]
ldr.w r6, [r1, #832]
ldr.w r5, [r1, #836]
/*** basesqr 68 ***/
/* computing z0 = x0^2 + 2*zeta^68*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9382
mul.w r4, r4, r14
    //// bounds:  -0x8919c02 (-2^27.0991) <= r4  <= 0x08919c02 (+2^27.0991)
mla.w r4, r10, r10, r4
    //// bounds:  -0x126cb59b (-2^28.2036) <= r4  <= 0x126cb59b (+2^28.2036)
MONTRED r4, r3
    //// bounds:  -0x000446c (-2^14.0964) <= r4  <= 0x0000446d (+2^14.0965)
str.w r4, [r0, #816]
/* computing z1 = 2x0x1 + zeta^68 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4691
mul.w r4, r4, r14
    //// bounds:  -0x448ce01 (-2^26.0991) <= r4  <= 0x0448ce01 (+2^26.0991)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17ff0133 (-2^28.5847) <= r4  <= 0x17ff0133 (+2^28.5847)
MONTRED r4, r3
    //// bounds:  -0x00049ff (-2^14.2094) <= r4  <= 0x000049ff (+2^14.2094)
str.w r4, [r0, #820]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #824]
/*** basesqr 69 ***/
/* computing z0 = x0^2 + 2*zeta^69*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9382
mul.w r4, r4, r14
    //// bounds:  -0x8919c02 (-2^27.0991) <= r4  <= 0x08919c02 (+2^27.0991)
mla.w r4, r7, r7, r4
    //// bounds:  -0x126cb59b (-2^28.2036) <= r4  <= 0x126cb59b (+2^28.2036)
MONTRED r4, r3
    //// bounds:  -0x000446c (-2^14.0964) <= r4  <= 0x0000446d (+2^14.0965)
str.w r4, [r0, #828]
/* computing z1 = 2x0x1 + zeta^69 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4691
mul.w r4, r4, r14
    //// bounds:  -0x448ce01 (-2^26.0991) <= r4  <= 0x0448ce01 (+2^26.0991)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17ff0133 (-2^28.5847) <= r4  <= 0x17ff0133 (+2^28.5847)
MONTRED r4, r3
    //// bounds:  -0x00049ff (-2^14.2094) <= r4  <= 0x000049ff (+2^14.2094)
str.w r4, [r0, #832]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #836]
ldr.w r10, [r1, #840]
ldr.w r9, [r1, #844]
ldr.w r8, [r1, #848]
ldr.w r7, [r1, #852]
ldr.w r6, [r1, #856]
ldr.w r5, [r1, #860]
/*** basesqr 70 ***/
/* computing z0 = x0^2 + 2*zeta^70*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9339
mul.w r4, r4, r14
    //// bounds:  -0x8878e39 (-2^27.0925) <= r4  <= 0x08878e39 (+2^27.0925)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1262a7d2 (-2^28.2005) <= r4  <= 0x1262a7d2 (+2^28.2005)
MONTRED r4, r3
    //// bounds:  -0x0004462 (-2^14.0956) <= r4  <= 0x00004463 (+2^14.0956)
str.w r4, [r0, #840]
/* computing z1 = 2x0x1 + zeta^70 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8131
mul.w r4, r4, r14
    //// bounds:  -0x76d1cd1 (-2^26.8926) <= r4  <= 0x076d1cd1 (+2^26.8926)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b235003 (-2^28.7622) <= r4  <= 0x1b235003 (+2^28.7622)
MONTRED r4, r3
    //// bounds:  -0x0004d23 (-2^14.2693) <= r4  <= 0x00004d23 (+2^14.2693)
str.w r4, [r0, #844]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #848]
/*** basesqr 71 ***/
/* computing z0 = x0^2 + 2*zeta^71*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9339
mul.w r4, r4, r14
    //// bounds:  -0x8878e39 (-2^27.0925) <= r4  <= 0x08878e39 (+2^27.0925)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1262a7d2 (-2^28.2005) <= r4  <= 0x1262a7d2 (+2^28.2005)
MONTRED r4, r3
    //// bounds:  -0x0004462 (-2^14.0956) <= r4  <= 0x00004463 (+2^14.0956)
str.w r4, [r0, #852]
/* computing z1 = 2x0x1 + zeta^71 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8131
mul.w r4, r4, r14
    //// bounds:  -0x76d1cd1 (-2^26.8926) <= r4  <= 0x076d1cd1 (+2^26.8926)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b235003 (-2^28.7622) <= r4  <= 0x1b235003 (+2^28.7622)
MONTRED r4, r3
    //// bounds:  -0x0004d23 (-2^14.2693) <= r4  <= 0x00004d23 (+2^14.2693)
str.w r4, [r0, #856]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #860]
ldr.w r10, [r1, #864]
ldr.w r9, [r1, #868]
ldr.w r8, [r1, #872]
ldr.w r7, [r1, #876]
ldr.w r6, [r1, #880]
ldr.w r5, [r1, #884]
/*** basesqr 72 ***/
/* computing z0 = x0^2 + 2*zeta^72*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =765
mul.w r4, r4, r14
    //// bounds:  -0x0b2dd6f (-2^23.4827) <= r4  <= 0x00b2dd6f (+2^23.4827)
mla.w r4, r10, r10, r4
    //// bounds:  -0xa8df708 (-2^27.3998) <= r4  <= 0x0a8df708 (+2^27.3998)
MONTRED r4, r3
    //// bounds:  -0x0003c8e (-2^13.9202) <= r4  <= 0x00003c8e (+2^13.9202)
str.w r4, [r0, #864]
/* computing z1 = 2x0x1 + zeta^72 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12418
mul.w r4, r4, r14
    //// bounds:  -0xb577536 (-2^27.5036) <= r4  <= 0x0b577536 (+2^27.5036)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1f0da868 (-2^28.9567) <= r4  <= 0x1f0da868 (+2^28.9567)
MONTRED r4, r3
    //// bounds:  -0x000510d (-2^14.3408) <= r4  <= 0x0000510e (+2^14.3408)
str.w r4, [r0, #868]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #872]
/*** basesqr 73 ***/
/* computing z0 = x0^2 + 2*zeta^73*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-765
mul.w r4, r4, r14
    //// bounds:  -0x0b2dd6f (-2^23.4827) <= r4  <= 0x00b2dd6f (+2^23.4827)
mla.w r4, r7, r7, r4
    //// bounds:  -0xa8df708 (-2^27.3998) <= r4  <= 0x0a8df708 (+2^27.3998)
MONTRED r4, r3
    //// bounds:  -0x0003c8e (-2^13.9202) <= r4  <= 0x00003c8e (+2^13.9202)
str.w r4, [r0, #876]
/* computing z1 = 2x0x1 + zeta^73 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12418
mul.w r4, r4, r14
    //// bounds:  -0xb577536 (-2^27.5036) <= r4  <= 0x0b577536 (+2^27.5036)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1f0da868 (-2^28.9567) <= r4  <= 0x1f0da868 (+2^28.9567)
MONTRED r4, r3
    //// bounds:  -0x000510d (-2^14.3408) <= r4  <= 0x0000510e (+2^14.3408)
str.w r4, [r0, #880]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #884]
ldr.w r10, [r1, #888]
ldr.w r9, [r1, #892]
ldr.w r8, [r1, #896]
ldr.w r7, [r1, #900]
ldr.w r6, [r1, #904]
ldr.w r5, [r1, #908]
/*** basesqr 74 ***/
/* computing z0 = x0^2 + 2*zeta^74*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5605
mul.w r4, r4, r14
    //// bounds:  -0x51e81e7 (-2^26.3559) <= r4  <= 0x051e81e7 (+2^26.3559)
mla.w r4, r10, r10, r4
    //// bounds:  -0xef99b80 (-2^27.9045) <= r4  <= 0x0ef99b80 (+2^27.9045)
MONTRED r4, r3
    //// bounds:  -0x00040f9 (-2^14.0218) <= r4  <= 0x000040fa (+2^14.0218)
str.w r4, [r0, #888]
/* computing z1 = 2x0x1 + zeta^74 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9998
mul.w r4, r4, r14
    //// bounds:  -0x921a2fa (-2^27.1908) <= r4  <= 0x0921a2fa (+2^27.1908)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1cd7d62c (-2^28.8502) <= r4  <= 0x1cd7d62c (+2^28.8502)
MONTRED r4, r3
    //// bounds:  -0x0004ed7 (-2^14.3009) <= r4  <= 0x00004ed8 (+2^14.3009)
str.w r4, [r0, #892]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #896]
/*** basesqr 75 ***/
/* computing z0 = x0^2 + 2*zeta^75*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5605
mul.w r4, r4, r14
    //// bounds:  -0x51e81e7 (-2^26.3559) <= r4  <= 0x051e81e7 (+2^26.3559)
mla.w r4, r7, r7, r4
    //// bounds:  -0xef99b80 (-2^27.9045) <= r4  <= 0x0ef99b80 (+2^27.9045)
MONTRED r4, r3
    //// bounds:  -0x00040f9 (-2^14.0218) <= r4  <= 0x000040fa (+2^14.0218)
str.w r4, [r0, #900]
/* computing z1 = 2x0x1 + zeta^75 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9998
mul.w r4, r4, r14
    //// bounds:  -0x921a2fa (-2^27.1908) <= r4  <= 0x0921a2fa (+2^27.1908)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1cd7d62c (-2^28.8502) <= r4  <= 0x1cd7d62c (+2^28.8502)
MONTRED r4, r3
    //// bounds:  -0x0004ed7 (-2^14.3009) <= r4  <= 0x00004ed8 (+2^14.3009)
str.w r4, [r0, #904]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #908]
ldr.w r10, [r1, #912]
ldr.w r9, [r1, #916]
ldr.w r8, [r1, #920]
ldr.w r7, [r1, #924]
ldr.w r6, [r1, #928]
ldr.w r5, [r1, #932]
/*** basesqr 76 ***/
/* computing z0 = x0^2 + 2*zeta^76*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7671
mul.w r4, r4, r14
    //// bounds:  -0x7018f4d (-2^26.8086) <= r4  <= 0x07018f4d (+2^26.8086)
mla.w r4, r10, r10, r4
    //// bounds:  -0x10dca8e6 (-2^28.0757) <= r4  <= 0x10dca8e6 (+2^28.0757)
MONTRED r4, r3
    //// bounds:  -0x00042dc (-2^14.0631) <= r4  <= 0x000042dd (+2^14.0631)
str.w r4, [r0, #912]
/* computing z1 = 2x0x1 + zeta^76 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8965
mul.w r4, r4, r14
    //// bounds:  -0x8301c47 (-2^27.0335) <= r4  <= 0x08301c47 (+2^27.0335)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1be64f79 (-2^28.8022) <= r4  <= 0x1be64f79 (+2^28.8022)
MONTRED r4, r3
    //// bounds:  -0x0004de6 (-2^14.2835) <= r4  <= 0x00004de6 (+2^14.2835)
str.w r4, [r0, #916]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #920]
/*** basesqr 77 ***/
/* computing z0 = x0^2 + 2*zeta^77*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7671
mul.w r4, r4, r14
    //// bounds:  -0x7018f4d (-2^26.8086) <= r4  <= 0x07018f4d (+2^26.8086)
mla.w r4, r7, r7, r4
    //// bounds:  -0x10dca8e6 (-2^28.0757) <= r4  <= 0x10dca8e6 (+2^28.0757)
MONTRED r4, r3
    //// bounds:  -0x00042dc (-2^14.0631) <= r4  <= 0x000042dd (+2^14.0631)
str.w r4, [r0, #924]
/* computing z1 = 2x0x1 + zeta^77 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8965
mul.w r4, r4, r14
    //// bounds:  -0x8301c47 (-2^27.0335) <= r4  <= 0x08301c47 (+2^27.0335)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1be64f79 (-2^28.8022) <= r4  <= 0x1be64f79 (+2^28.8022)
MONTRED r4, r3
    //// bounds:  -0x0004de6 (-2^14.2835) <= r4  <= 0x00004de6 (+2^14.2835)
str.w r4, [r0, #928]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #932]
ldr.w r10, [r1, #936]
ldr.w r9, [r1, #940]
ldr.w r8, [r1, #944]
ldr.w r7, [r1, #948]
ldr.w r6, [r1, #952]
ldr.w r5, [r1, #956]
/*** basesqr 78 ***/
/* computing z0 = x0^2 + 2*zeta^78*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1488
mul.w r4, r4, r14
    //// bounds:  -0x15be8f0 (-2^24.4426) <= r4  <= 0x015be8f0 (+2^24.4426)
mla.w r4, r10, r10, r4
    //// bounds:  -0xb370289 (-2^27.4873) <= r4  <= 0x0b370289 (+2^27.4873)
MONTRED r4, r3
    //// bounds:  -0x0003d37 (-2^13.9358) <= r4  <= 0x00003d37 (+2^13.9358)
str.w r4, [r0, #936]
/* computing z1 = 2x0x1 + zeta^78 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-744
mul.w r4, r4, r14
    //// bounds:  -0x0adf478 (-2^23.4426) <= r4  <= 0x00adf478 (+2^23.4426)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x146427aa (-2^28.3499) <= r4  <= 0x146427aa (+2^28.3499)
MONTRED r4, r3
    //// bounds:  -0x0004664 (-2^14.1373) <= r4  <= 0x00004664 (+2^14.1373)
str.w r4, [r0, #940]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #944]
/*** basesqr 79 ***/
/* computing z0 = x0^2 + 2*zeta^79*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1488
mul.w r4, r4, r14
    //// bounds:  -0x15be8f0 (-2^24.4426) <= r4  <= 0x015be8f0 (+2^24.4426)
mla.w r4, r7, r7, r4
    //// bounds:  -0xb370289 (-2^27.4873) <= r4  <= 0x0b370289 (+2^27.4873)
MONTRED r4, r3
    //// bounds:  -0x0003d37 (-2^13.9358) <= r4  <= 0x00003d37 (+2^13.9358)
str.w r4, [r0, #948]
/* computing z1 = 2x0x1 + zeta^79 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =744
mul.w r4, r4, r14
    //// bounds:  -0x0adf478 (-2^23.4426) <= r4  <= 0x00adf478 (+2^23.4426)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x146427aa (-2^28.3499) <= r4  <= 0x146427aa (+2^28.3499)
MONTRED r4, r3
    //// bounds:  -0x0004664 (-2^14.1373) <= r4  <= 0x00004664 (+2^14.1373)
str.w r4, [r0, #952]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #956]
ldr.w r10, [r1, #960]
ldr.w r9, [r1, #964]
ldr.w r8, [r1, #968]
ldr.w r7, [r1, #972]
ldr.w r6, [r1, #976]
ldr.w r5, [r1, #980]
/*** basesqr 80 ***/
/* computing z0 = x0^2 + 2*zeta^80*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3079
mul.w r4, r4, r14
    //// bounds:  -0x2cfe6fd (-2^25.4917) <= r4  <= 0x02cfe6fd (+2^25.4917)
mla.w r4, r10, r10, r4
    //// bounds:  -0xcab0096 (-2^27.6631) <= r4  <= 0x0cab0096 (+2^27.6631)
MONTRED r4, r3
    //// bounds:  -0x0003eab (-2^13.9697) <= r4  <= 0x00003eab (+2^13.9697)
str.w r4, [r0, #960]
/* computing z1 = 2x0x1 + zeta^80 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11261
mul.w r4, r4, r14
    //// bounds:  -0xa48f06f (-2^27.3625) <= r4  <= 0x0a48f06f (+2^27.3625)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1dff23a1 (-2^28.9067) <= r4  <= 0x1dff23a1 (+2^28.9067)
MONTRED r4, r3
    //// bounds:  -0x0004fff (-2^14.3219) <= r4  <= 0x00004fff (+2^14.3219)
str.w r4, [r0, #964]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #968]
/*** basesqr 81 ***/
/* computing z0 = x0^2 + 2*zeta^81*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3079
mul.w r4, r4, r14
    //// bounds:  -0x2cfe6fd (-2^25.4917) <= r4  <= 0x02cfe6fd (+2^25.4917)
mla.w r4, r7, r7, r4
    //// bounds:  -0xcab0096 (-2^27.6631) <= r4  <= 0x0cab0096 (+2^27.6631)
MONTRED r4, r3
    //// bounds:  -0x0003eab (-2^13.9697) <= r4  <= 0x00003eab (+2^13.9697)
str.w r4, [r0, #972]
/* computing z1 = 2x0x1 + zeta^81 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11261
mul.w r4, r4, r14
    //// bounds:  -0xa48f06f (-2^27.3625) <= r4  <= 0x0a48f06f (+2^27.3625)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1dff23a1 (-2^28.9067) <= r4  <= 0x1dff23a1 (+2^28.9067)
MONTRED r4, r3
    //// bounds:  -0x0004fff (-2^14.3219) <= r4  <= 0x00004fff (+2^14.3219)
str.w r4, [r0, #976]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #980]
ldr.w r10, [r1, #984]
ldr.w r9, [r1, #988]
ldr.w r8, [r1, #992]
ldr.w r7, [r1, #996]
ldr.w r6, [r1, #1000]
ldr.w r5, [r1, #1004]
/*** basesqr 82 ***/
/* computing z0 = x0^2 + 2*zeta^82*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6221
mul.w r4, r4, r14
    //// bounds:  -0x5ae88df (-2^26.5063) <= r4  <= 0x05ae88df (+2^26.5063)
mla.w r4, r10, r10, r4
    //// bounds:  -0xf89a278 (-2^27.9577) <= r4  <= 0x0f89a278 (+2^27.9577)
MONTRED r4, r3
    //// bounds:  -0x0004189 (-2^14.0342) <= r4  <= 0x0000418a (+2^14.0343)
str.w r4, [r0, #984]
/* computing z1 = 2x0x1 + zeta^82 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9690
mul.w r4, r4, r14
    //// bounds:  -0x8d99f7e (-2^27.1457) <= r4  <= 0x08d99f7e (+2^27.1457)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c8fd2b0 (-2^28.8360) <= r4  <= 0x1c8fd2b0 (+2^28.8360)
MONTRED r4, r3
    //// bounds:  -0x0004e8f (-2^14.2957) <= r4  <= 0x00004e90 (+2^14.2958)
str.w r4, [r0, #988]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #992]
/*** basesqr 83 ***/
/* computing z0 = x0^2 + 2*zeta^83*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6221
mul.w r4, r4, r14
    //// bounds:  -0x5ae88df (-2^26.5063) <= r4  <= 0x05ae88df (+2^26.5063)
mla.w r4, r7, r7, r4
    //// bounds:  -0xf89a278 (-2^27.9577) <= r4  <= 0x0f89a278 (+2^27.9577)
MONTRED r4, r3
    //// bounds:  -0x0004189 (-2^14.0342) <= r4  <= 0x0000418a (+2^14.0343)
str.w r4, [r0, #996]
/* computing z1 = 2x0x1 + zeta^83 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9690
mul.w r4, r4, r14
    //// bounds:  -0x8d99f7e (-2^27.1457) <= r4  <= 0x08d99f7e (+2^27.1457)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c8fd2b0 (-2^28.8360) <= r4  <= 0x1c8fd2b0 (+2^28.8360)
MONTRED r4, r3
    //// bounds:  -0x0004e8f (-2^14.2957) <= r4  <= 0x00004e90 (+2^14.2958)
str.w r4, [r0, #1000]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1004]
ldr.w r10, [r1, #1008]
ldr.w r9, [r1, #1012]
ldr.w r8, [r1, #1016]
ldr.w r7, [r1, #1020]
ldr.w r6, [r1, #1024]
ldr.w r5, [r1, #1028]
/*** basesqr 84 ***/
/* computing z0 = x0^2 + 2*zeta^84*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12095
mul.w r4, r4, r14
    //// bounds:  -0xb0befe5 (-2^27.4655) <= r4  <= 0x0b0befe5 (+2^27.4655)
mla.w r4, r10, r10, r4
    //// bounds:  -0x14e7097e (-2^28.3856) <= r4  <= 0x14e7097e (+2^28.3856)
MONTRED r4, r3
    //// bounds:  -0x00046e7 (-2^14.1478) <= r4  <= 0x000046e7 (+2^14.1478)
str.w r4, [r0, #1008]
/* computing z1 = 2x0x1 + zeta^84 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6753
mul.w r4, r4, r14
    //// bounds:  -0x62aebfb (-2^26.6247) <= r4  <= 0x062aebfb (+2^26.6247)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x19e11f2d (-2^28.6937) <= r4  <= 0x19e11f2d (+2^28.6937)
MONTRED r4, r3
    //// bounds:  -0x0004be1 (-2^14.2456) <= r4  <= 0x00004be1 (+2^14.2456)
str.w r4, [r0, #1012]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1016]
/*** basesqr 85 ***/
/* computing z0 = x0^2 + 2*zeta^85*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12095
mul.w r4, r4, r14
    //// bounds:  -0xb0befe5 (-2^27.4655) <= r4  <= 0x0b0befe5 (+2^27.4655)
mla.w r4, r7, r7, r4
    //// bounds:  -0x14e7097e (-2^28.3856) <= r4  <= 0x14e7097e (+2^28.3856)
MONTRED r4, r3
    //// bounds:  -0x00046e7 (-2^14.1478) <= r4  <= 0x000046e7 (+2^14.1478)
str.w r4, [r0, #1020]
/* computing z1 = 2x0x1 + zeta^85 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6753
mul.w r4, r4, r14
    //// bounds:  -0x62aebfb (-2^26.6247) <= r4  <= 0x062aebfb (+2^26.6247)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x19e11f2d (-2^28.6937) <= r4  <= 0x19e11f2d (+2^28.6937)
MONTRED r4, r3
    //// bounds:  -0x0004be1 (-2^14.2456) <= r4  <= 0x00004be1 (+2^14.2456)
str.w r4, [r0, #1024]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1028]
ldr.w r10, [r1, #1032]
ldr.w r9, [r1, #1036]
ldr.w r8, [r1, #1040]
ldr.w r7, [r1, #1044]
ldr.w r6, [r1, #1048]
ldr.w r5, [r1, #1052]
/*** basesqr 86 ***/
/* computing z0 = x0^2 + 2*zeta^86*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10476
mul.w r4, r4, r14
    //// bounds:  -0x99165e4 (-2^27.2582) <= r4  <= 0x099165e4 (+2^27.2582)
mla.w r4, r10, r10, r4
    //// bounds:  -0x136c7f7d (-2^28.2798) <= r4  <= 0x136c7f7d (+2^28.2798)
MONTRED r4, r3
    //// bounds:  -0x000456c (-2^14.1173) <= r4  <= 0x0000456c (+2^14.1173)
str.w r4, [r0, #1032]
/* computing z1 = 2x0x1 + zeta^86 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5238
mul.w r4, r4, r14
    //// bounds:  -0x4c8b2f2 (-2^26.2582) <= r4  <= 0x04c8b2f2 (+2^26.2582)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x187ee624 (-2^28.6145) <= r4  <= 0x187ee624 (+2^28.6145)
MONTRED r4, r3
    //// bounds:  -0x0004a7f (-2^14.2191) <= r4  <= 0x00004a7f (+2^14.2191)
str.w r4, [r0, #1036]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1040]
/*** basesqr 87 ***/
/* computing z0 = x0^2 + 2*zeta^87*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10476
mul.w r4, r4, r14
    //// bounds:  -0x99165e4 (-2^27.2582) <= r4  <= 0x099165e4 (+2^27.2582)
mla.w r4, r7, r7, r4
    //// bounds:  -0x136c7f7d (-2^28.2798) <= r4  <= 0x136c7f7d (+2^28.2798)
MONTRED r4, r3
    //// bounds:  -0x000456c (-2^14.1173) <= r4  <= 0x0000456c (+2^14.1173)
str.w r4, [r0, #1044]
/* computing z1 = 2x0x1 + zeta^87 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5238
mul.w r4, r4, r14
    //// bounds:  -0x4c8b2f2 (-2^26.2582) <= r4  <= 0x04c8b2f2 (+2^26.2582)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x187ee624 (-2^28.6145) <= r4  <= 0x187ee624 (+2^28.6145)
MONTRED r4, r3
    //// bounds:  -0x0004a7f (-2^14.2191) <= r4  <= 0x00004a7f (+2^14.2191)
str.w r4, [r0, #1048]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1052]
ldr.w r10, [r1, #1056]
ldr.w r9, [r1, #1060]
ldr.w r8, [r1, #1064]
ldr.w r7, [r1, #1068]
ldr.w r6, [r1, #1072]
ldr.w r5, [r1, #1076]
/*** basesqr 88 ***/
/* computing z0 = x0^2 + 2*zeta^88*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6179
mul.w r4, r4, r14
    //// bounds:  -0x5a4b6f1 (-2^26.4966) <= r4  <= 0x05a4b6f1 (+2^26.4966)
mla.w r4, r10, r10, r4
    //// bounds:  -0xf7fd08a (-2^27.9541) <= r4  <= 0x0f7fd08a (+2^27.9541)
MONTRED r4, r3
    //// bounds:  -0x000417f (-2^14.0333) <= r4  <= 0x00004180 (+2^14.0334)
str.w r4, [r0, #1056]
/* computing z1 = 2x0x1 + zeta^88 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9711
mul.w r4, r4, r14
    //// bounds:  -0x8de8875 (-2^27.1488) <= r4  <= 0x08de8875 (+2^27.1488)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c94bba7 (-2^28.8370) <= r4  <= 0x1c94bba7 (+2^28.8370)
MONTRED r4, r3
    //// bounds:  -0x0004e94 (-2^14.2961) <= r4  <= 0x00004e95 (+2^14.2961)
str.w r4, [r0, #1060]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1064]
/*** basesqr 89 ***/
/* computing z0 = x0^2 + 2*zeta^89*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6179
mul.w r4, r4, r14
    //// bounds:  -0x5a4b6f1 (-2^26.4966) <= r4  <= 0x05a4b6f1 (+2^26.4966)
mla.w r4, r7, r7, r4
    //// bounds:  -0xf7fd08a (-2^27.9541) <= r4  <= 0x0f7fd08a (+2^27.9541)
MONTRED r4, r3
    //// bounds:  -0x000417f (-2^14.0333) <= r4  <= 0x00004180 (+2^14.0334)
str.w r4, [r0, #1068]
/* computing z1 = 2x0x1 + zeta^89 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9711
mul.w r4, r4, r14
    //// bounds:  -0x8de8875 (-2^27.1488) <= r4  <= 0x08de8875 (+2^27.1488)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c94bba7 (-2^28.8370) <= r4  <= 0x1c94bba7 (+2^28.8370)
MONTRED r4, r3
    //// bounds:  -0x0004e94 (-2^14.2961) <= r4  <= 0x00004e95 (+2^14.2961)
str.w r4, [r0, #1072]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1076]
ldr.w r10, [r1, #1080]
ldr.w r9, [r1, #1084]
ldr.w r8, [r1, #1088]
ldr.w r7, [r1, #1092]
ldr.w r6, [r1, #1096]
ldr.w r5, [r1, #1100]
/*** basesqr 90 ***/
/* computing z0 = x0^2 + 2*zeta^90*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9799
mul.w r4, r4, r14
    //// bounds:  -0x8f31bbd (-2^27.1618) <= r4  <= 0x08f31bbd (+2^27.1618)
mla.w r4, r10, r10, r4
    //// bounds:  -0x12ce3556 (-2^28.2331) <= r4  <= 0x12ce3556 (+2^28.2331)
MONTRED r4, r3
    //// bounds:  -0x00044ce (-2^14.1044) <= r4  <= 0x000044ce (+2^14.1044)
str.w r4, [r0, #1080]
/* computing z1 = 2x0x1 + zeta^90 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7901
mul.w r4, r4, r14
    //// bounds:  -0x737560f (-2^26.8512) <= r4  <= 0x0737560f (+2^26.8512)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1aed8941 (-2^28.7510) <= r4  <= 0x1aed8941 (+2^28.7510)
MONTRED r4, r3
    //// bounds:  -0x0004ced (-2^14.2654) <= r4  <= 0x00004cee (+2^14.2655)
str.w r4, [r0, #1084]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1088]
/*** basesqr 91 ***/
/* computing z0 = x0^2 + 2*zeta^91*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9799
mul.w r4, r4, r14
    //// bounds:  -0x8f31bbd (-2^27.1618) <= r4  <= 0x08f31bbd (+2^27.1618)
mla.w r4, r7, r7, r4
    //// bounds:  -0x12ce3556 (-2^28.2331) <= r4  <= 0x12ce3556 (+2^28.2331)
MONTRED r4, r3
    //// bounds:  -0x00044ce (-2^14.1044) <= r4  <= 0x000044ce (+2^14.1044)
str.w r4, [r0, #1092]
/* computing z1 = 2x0x1 + zeta^91 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7901
mul.w r4, r4, r14
    //// bounds:  -0x737560f (-2^26.8512) <= r4  <= 0x0737560f (+2^26.8512)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1aed8941 (-2^28.7510) <= r4  <= 0x1aed8941 (+2^28.7510)
MONTRED r4, r3
    //// bounds:  -0x0004ced (-2^14.2654) <= r4  <= 0x00004cee (+2^14.2655)
str.w r4, [r0, #1096]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1100]
ldr.w r10, [r1, #1104]
ldr.w r9, [r1, #1108]
ldr.w r8, [r1, #1112]
ldr.w r7, [r1, #1116]
ldr.w r6, [r1, #1120]
ldr.w r5, [r1, #1124]
/*** basesqr 92 ***/
/* computing z0 = x0^2 + 2*zeta^92*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4101
mul.w r4, r4, r14
    //// bounds:  -0x3bedb47 (-2^25.9052) <= r4  <= 0x03bedb47 (+2^25.9052)
mla.w r4, r10, r10, r4
    //// bounds:  -0xd99f4e0 (-2^27.7657) <= r4  <= 0x0d99f4e0 (+2^27.7657)
MONTRED r4, r3
    //// bounds:  -0x0003f9a (-2^13.9910) <= r4  <= 0x00003f9a (+2^13.9910)
str.w r4, [r0, #1104]
/* computing z1 = 2x0x1 + zeta^92 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10750
mul.w r4, r4, r14
    //// bounds:  -0x9d1764a (-2^27.2955) <= r4  <= 0x09d1764a (+2^27.2955)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d87a97c (-2^28.8841) <= r4  <= 0x1d87a97c (+2^28.8841)
MONTRED r4, r3
    //// bounds:  -0x0004f87 (-2^14.3134) <= r4  <= 0x00004f88 (+2^14.3134)
str.w r4, [r0, #1108]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1112]
/*** basesqr 93 ***/
/* computing z0 = x0^2 + 2*zeta^93*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4101
mul.w r4, r4, r14
    //// bounds:  -0x3bedb47 (-2^25.9052) <= r4  <= 0x03bedb47 (+2^25.9052)
mla.w r4, r7, r7, r4
    //// bounds:  -0xd99f4e0 (-2^27.7657) <= r4  <= 0x0d99f4e0 (+2^27.7657)
MONTRED r4, r3
    //// bounds:  -0x0003f9a (-2^13.9910) <= r4  <= 0x00003f9a (+2^13.9910)
str.w r4, [r0, #1116]
/* computing z1 = 2x0x1 + zeta^93 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10750
mul.w r4, r4, r14
    //// bounds:  -0x9d1764a (-2^27.2955) <= r4  <= 0x09d1764a (+2^27.2955)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d87a97c (-2^28.8841) <= r4  <= 0x1d87a97c (+2^28.8841)
MONTRED r4, r3
    //// bounds:  -0x0004f87 (-2^14.3134) <= r4  <= 0x00004f88 (+2^14.3134)
str.w r4, [r0, #1120]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1124]
ldr.w r10, [r1, #1128]
ldr.w r9, [r1, #1132]
ldr.w r8, [r1, #1136]
ldr.w r7, [r1, #1140]
ldr.w r6, [r1, #1144]
ldr.w r5, [r1, #1148]
/*** basesqr 94 ***/
/* computing z0 = x0^2 + 2*zeta^94*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9466
mul.w r4, r4, r14
    //// bounds:  -0x8a53fde (-2^27.1120) <= r4  <= 0x08a53fde (+2^27.1120)
mla.w r4, r10, r10, r4
    //// bounds:  -0x12805977 (-2^28.2096) <= r4  <= 0x12805977 (+2^28.2096)
MONTRED r4, r3
    //// bounds:  -0x0004480 (-2^14.0980) <= r4  <= 0x00004480 (+2^14.0980)
str.w r4, [r0, #1128]
/* computing z1 = 2x0x1 + zeta^94 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4733
mul.w r4, r4, r14
    //// bounds:  -0x4529fef (-2^26.1120) <= r4  <= 0x04529fef (+2^26.1120)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1808d321 (-2^28.5870) <= r4  <= 0x1808d321 (+2^28.5870)
MONTRED r4, r3
    //// bounds:  -0x0004a08 (-2^14.2101) <= r4  <= 0x00004a09 (+2^14.2101)
str.w r4, [r0, #1132]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1136]
/*** basesqr 95 ***/
/* computing z0 = x0^2 + 2*zeta^95*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9466
mul.w r4, r4, r14
    //// bounds:  -0x8a53fde (-2^27.1120) <= r4  <= 0x08a53fde (+2^27.1120)
mla.w r4, r7, r7, r4
    //// bounds:  -0x12805977 (-2^28.2096) <= r4  <= 0x12805977 (+2^28.2096)
MONTRED r4, r3
    //// bounds:  -0x0004480 (-2^14.0980) <= r4  <= 0x00004480 (+2^14.0980)
str.w r4, [r0, #1140]
/* computing z1 = 2x0x1 + zeta^95 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4733
mul.w r4, r4, r14
    //// bounds:  -0x4529fef (-2^26.1120) <= r4  <= 0x04529fef (+2^26.1120)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1808d321 (-2^28.5870) <= r4  <= 0x1808d321 (+2^28.5870)
MONTRED r4, r3
    //// bounds:  -0x0004a08 (-2^14.2101) <= r4  <= 0x00004a09 (+2^14.2101)
str.w r4, [r0, #1144]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1148]
ldr.w r10, [r1, #1152]
ldr.w r9, [r1, #1156]
ldr.w r8, [r1, #1160]
ldr.w r7, [r1, #1164]
ldr.w r6, [r1, #1168]
ldr.w r5, [r1, #1172]
/*** basesqr 96 ***/
/* computing z0 = x0^2 + 2*zeta^96*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7087
mul.w r4, r4, r14
    //// bounds:  -0x67903b5 (-2^26.6944) <= r4  <= 0x067903b5 (+2^26.6944)
mla.w r4, r10, r10, r4
    //// bounds:  -0x10541d4e (-2^28.0293) <= r4  <= 0x10541d4e (+2^28.0293)
MONTRED r4, r3
    //// bounds:  -0x0004254 (-2^14.0515) <= r4  <= 0x00004254 (+2^14.0515)
str.w r4, [r0, #1152]
/* computing z1 = 2x0x1 + zeta^96 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9257
mul.w r4, r4, r14
    //// bounds:  -0x8746213 (-2^27.0797) <= r4  <= 0x08746213 (+2^27.0797)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c2a9545 (-2^28.8159) <= r4  <= 0x1c2a9545 (+2^28.8159)
MONTRED r4, r3
    //// bounds:  -0x0004e2a (-2^14.2884) <= r4  <= 0x00004e2b (+2^14.2885)
str.w r4, [r0, #1156]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1160]
/*** basesqr 97 ***/
/* computing z0 = x0^2 + 2*zeta^97*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7087
mul.w r4, r4, r14
    //// bounds:  -0x67903b5 (-2^26.6944) <= r4  <= 0x067903b5 (+2^26.6944)
mla.w r4, r7, r7, r4
    //// bounds:  -0x10541d4e (-2^28.0293) <= r4  <= 0x10541d4e (+2^28.0293)
MONTRED r4, r3
    //// bounds:  -0x0004254 (-2^14.0515) <= r4  <= 0x00004254 (+2^14.0515)
str.w r4, [r0, #1164]
/* computing z1 = 2x0x1 + zeta^97 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9257
mul.w r4, r4, r14
    //// bounds:  -0x8746213 (-2^27.0797) <= r4  <= 0x08746213 (+2^27.0797)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c2a9545 (-2^28.8159) <= r4  <= 0x1c2a9545 (+2^28.8159)
MONTRED r4, r3
    //// bounds:  -0x0004e2a (-2^14.2884) <= r4  <= 0x00004e2b (+2^14.2885)
str.w r4, [r0, #1168]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1172]
ldr.w r10, [r1, #1176]
ldr.w r9, [r1, #1180]
ldr.w r8, [r1, #1184]
ldr.w r7, [r1, #1188]
ldr.w r6, [r1, #1192]
ldr.w r5, [r1, #1196]
/*** basesqr 98 ***/
/* computing z0 = x0^2 + 2*zeta^98*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7476
mul.w r4, r4, r14
    //// bounds:  -0x6d3f77c (-2^26.7715) <= r4  <= 0x06d3f77c (+2^26.7715)
mla.w r4, r10, r10, r4
    //// bounds:  -0x10af1115 (-2^28.0604) <= r4  <= 0x10af1115 (+2^28.0604)
MONTRED r4, r3
    //// bounds:  -0x00042af (-2^14.0593) <= r4  <= 0x000042af (+2^14.0593)
str.w r4, [r0, #1176]
/* computing z1 = 2x0x1 + zeta^98 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3738
mul.w r4, r4, r14
    //// bounds:  -0x369fbbe (-2^25.7715) <= r4  <= 0x0369fbbe (+2^25.7715)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17202ef0 (-2^28.5314) <= r4  <= 0x17202ef0 (+2^28.5314)
MONTRED r4, r3
    //// bounds:  -0x0004920 (-2^14.1923) <= r4  <= 0x00004920 (+2^14.1923)
str.w r4, [r0, #1180]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1184]
/*** basesqr 99 ***/
/* computing z0 = x0^2 + 2*zeta^99*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7476
mul.w r4, r4, r14
    //// bounds:  -0x6d3f77c (-2^26.7715) <= r4  <= 0x06d3f77c (+2^26.7715)
mla.w r4, r7, r7, r4
    //// bounds:  -0x10af1115 (-2^28.0604) <= r4  <= 0x10af1115 (+2^28.0604)
MONTRED r4, r3
    //// bounds:  -0x00042af (-2^14.0593) <= r4  <= 0x000042af (+2^14.0593)
str.w r4, [r0, #1188]
/* computing z1 = 2x0x1 + zeta^99 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3738
mul.w r4, r4, r14
    //// bounds:  -0x369fbbe (-2^25.7715) <= r4  <= 0x0369fbbe (+2^25.7715)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17202ef0 (-2^28.5314) <= r4  <= 0x17202ef0 (+2^28.5314)
MONTRED r4, r3
    //// bounds:  -0x0004920 (-2^14.1923) <= r4  <= 0x00004920 (+2^14.1923)
str.w r4, [r0, #1192]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1196]
ldr.w r10, [r1, #1200]
ldr.w r9, [r1, #1204]
ldr.w r8, [r1, #1208]
ldr.w r7, [r1, #1212]
ldr.w r6, [r1, #1216]
ldr.w r5, [r1, #1220]
/*** basesqr 100 ***/
/* computing z0 = x0^2 + 2*zeta^100*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7144
mul.w r4, r4, r14
    //// bounds:  -0x6865778 (-2^26.7059) <= r4  <= 0x06865778 (+2^26.7059)
mla.w r4, r10, r10, r4
    //// bounds:  -0x10617111 (-2^28.0339) <= r4  <= 0x10617111 (+2^28.0339)
MONTRED r4, r3
    //// bounds:  -0x0004261 (-2^14.0527) <= r4  <= 0x00004261 (+2^14.0527)
str.w r4, [r0, #1200]
/* computing z1 = 2x0x1 + zeta^100 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3572
mul.w r4, r4, r14
    //// bounds:  -0x3432bbc (-2^25.7059) <= r4  <= 0x03432bbc (+2^25.7059)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x16f95eee (-2^28.5219) <= r4  <= 0x16f95eee (+2^28.5219)
MONTRED r4, r3
    //// bounds:  -0x00048f9 (-2^14.1893) <= r4  <= 0x000048f9 (+2^14.1893)
str.w r4, [r0, #1204]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1208]
/*** basesqr 101 ***/
/* computing z0 = x0^2 + 2*zeta^101*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7144
mul.w r4, r4, r14
    //// bounds:  -0x6865778 (-2^26.7059) <= r4  <= 0x06865778 (+2^26.7059)
mla.w r4, r7, r7, r4
    //// bounds:  -0x10617111 (-2^28.0339) <= r4  <= 0x10617111 (+2^28.0339)
MONTRED r4, r3
    //// bounds:  -0x0004261 (-2^14.0527) <= r4  <= 0x00004261 (+2^14.0527)
str.w r4, [r0, #1212]
/* computing z1 = 2x0x1 + zeta^101 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3572
mul.w r4, r4, r14
    //// bounds:  -0x3432bbc (-2^25.7059) <= r4  <= 0x03432bbc (+2^25.7059)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x16f95eee (-2^28.5219) <= r4  <= 0x16f95eee (+2^28.5219)
MONTRED r4, r3
    //// bounds:  -0x00048f9 (-2^14.1893) <= r4  <= 0x000048f9 (+2^14.1893)
str.w r4, [r0, #1216]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1220]
ldr.w r10, [r1, #1224]
ldr.w r9, [r1, #1228]
ldr.w r8, [r1, #1232]
ldr.w r7, [r1, #1236]
ldr.w r6, [r1, #1240]
ldr.w r5, [r1, #1244]
/*** basesqr 102 ***/
/* computing z0 = x0^2 + 2*zeta^102*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9005
mul.w r4, r4, r14
    //// bounds:  -0x839767f (-2^27.0399) <= r4  <= 0x0839767f (+2^27.0399)
mla.w r4, r10, r10, r4
    //// bounds:  -0x12149018 (-2^28.1763) <= r4  <= 0x12149018 (+2^28.1763)
MONTRED r4, r3
    //// bounds:  -0x0004414 (-2^14.0891) <= r4  <= 0x00004415 (+2^14.0892)
str.w r4, [r0, #1224]
/* computing z1 = 2x0x1 + zeta^102 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8298
mul.w r4, r4, r14
    //// bounds:  -0x79428ae (-2^26.9220) <= r4  <= 0x079428ae (+2^26.9220)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b4a5be0 (-2^28.7703) <= r4  <= 0x1b4a5be0 (+2^28.7703)
MONTRED r4, r3
    //// bounds:  -0x0004d4a (-2^14.2722) <= r4  <= 0x00004d4a (+2^14.2722)
str.w r4, [r0, #1228]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1232]
/*** basesqr 103 ***/
/* computing z0 = x0^2 + 2*zeta^103*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9005
mul.w r4, r4, r14
    //// bounds:  -0x839767f (-2^27.0399) <= r4  <= 0x0839767f (+2^27.0399)
mla.w r4, r7, r7, r4
    //// bounds:  -0x12149018 (-2^28.1763) <= r4  <= 0x12149018 (+2^28.1763)
MONTRED r4, r3
    //// bounds:  -0x0004414 (-2^14.0891) <= r4  <= 0x00004415 (+2^14.0892)
str.w r4, [r0, #1236]
/* computing z1 = 2x0x1 + zeta^103 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8298
mul.w r4, r4, r14
    //// bounds:  -0x79428ae (-2^26.9220) <= r4  <= 0x079428ae (+2^26.9220)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b4a5be0 (-2^28.7703) <= r4  <= 0x1b4a5be0 (+2^28.7703)
MONTRED r4, r3
    //// bounds:  -0x0004d4a (-2^14.2722) <= r4  <= 0x00004d4a (+2^14.2722)
str.w r4, [r0, #1240]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1244]
ldr.w r10, [r1, #1248]
ldr.w r9, [r1, #1252]
ldr.w r8, [r1, #1256]
ldr.w r7, [r1, #1260]
ldr.w r6, [r1, #1264]
ldr.w r5, [r1, #1268]
/*** basesqr 104 ***/
/* computing z0 = x0^2 + 2*zeta^104*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5126
mul.w r4, r4, r14
    //// bounds:  -0x4ae8322 (-2^26.2270) <= r4  <= 0x04ae8322 (+2^26.2270)
mla.w r4, r10, r10, r4
    //// bounds:  -0xe899cbb (-2^27.8617) <= r4  <= 0x0e899cbb (+2^27.8617)
MONTRED r4, r3
    //// bounds:  -0x0004089 (-2^14.0120) <= r4  <= 0x0000408a (+2^14.0121)
str.w r4, [r0, #1248]
/* computing z1 = 2x0x1 + zeta^104 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2563
mul.w r4, r4, r14
    //// bounds:  -0x2574191 (-2^25.2270) <= r4  <= 0x02574191 (+2^25.2270)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x160d74c3 (-2^28.4629) <= r4  <= 0x160d74c3 (+2^28.4629)
MONTRED r4, r3
    //// bounds:  -0x000480d (-2^14.1709) <= r4  <= 0x0000480d (+2^14.1709)
str.w r4, [r0, #1252]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1256]
/*** basesqr 105 ***/
/* computing z0 = x0^2 + 2*zeta^105*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5126
mul.w r4, r4, r14
    //// bounds:  -0x4ae8322 (-2^26.2270) <= r4  <= 0x04ae8322 (+2^26.2270)
mla.w r4, r7, r7, r4
    //// bounds:  -0xe899cbb (-2^27.8617) <= r4  <= 0x0e899cbb (+2^27.8617)
MONTRED r4, r3
    //// bounds:  -0x0004089 (-2^14.0120) <= r4  <= 0x0000408a (+2^14.0121)
str.w r4, [r0, #1260]
/* computing z1 = 2x0x1 + zeta^105 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2563
mul.w r4, r4, r14
    //// bounds:  -0x2574191 (-2^25.2270) <= r4  <= 0x02574191 (+2^25.2270)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x160d74c3 (-2^28.4629) <= r4  <= 0x160d74c3 (+2^28.4629)
MONTRED r4, r3
    //// bounds:  -0x000480d (-2^14.1709) <= r4  <= 0x0000480d (+2^14.1709)
str.w r4, [r0, #1264]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1268]
ldr.w r10, [r1, #1272]
ldr.w r9, [r1, #1276]
ldr.w r8, [r1, #1280]
ldr.w r7, [r1, #1284]
ldr.w r6, [r1, #1288]
ldr.w r5, [r1, #1292]
/*** basesqr 106 ***/
/* computing z0 = x0^2 + 2*zeta^106*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =928
mul.w r4, r4, r14
    //// bounds:  -0x0d8f9e0 (-2^23.7614) <= r4  <= 0x00d8f9e0 (+2^23.7614)
mla.w r4, r10, r10, r4
    //// bounds:  -0xab41379 (-2^27.4200) <= r4  <= 0x0ab41379 (+2^27.4200)
MONTRED r4, r3
    //// bounds:  -0x0003cb4 (-2^13.9237) <= r4  <= 0x00003cb4 (+2^13.9237)
str.w r4, [r0, #1272]
/* computing z1 = 2x0x1 + zeta^106 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =464
mul.w r4, r4, r14
    //// bounds:  -0x06c7cf0 (-2^22.7614) <= r4  <= 0x006c7cf0 (+2^22.7614)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1422b022 (-2^28.3317) <= r4  <= 0x1422b022 (+2^28.3317)
MONTRED r4, r3
    //// bounds:  -0x0004622 (-2^14.1320) <= r4  <= 0x00004623 (+2^14.1321)
str.w r4, [r0, #1276]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1280]
/*** basesqr 107 ***/
/* computing z0 = x0^2 + 2*zeta^107*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-928
mul.w r4, r4, r14
    //// bounds:  -0x0d8f9e0 (-2^23.7614) <= r4  <= 0x00d8f9e0 (+2^23.7614)
mla.w r4, r7, r7, r4
    //// bounds:  -0xab41379 (-2^27.4200) <= r4  <= 0x0ab41379 (+2^27.4200)
MONTRED r4, r3
    //// bounds:  -0x0003cb4 (-2^13.9237) <= r4  <= 0x00003cb4 (+2^13.9237)
str.w r4, [r0, #1284]
/* computing z1 = 2x0x1 + zeta^107 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-464
mul.w r4, r4, r14
    //// bounds:  -0x06c7cf0 (-2^22.7614) <= r4  <= 0x006c7cf0 (+2^22.7614)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1422b022 (-2^28.3317) <= r4  <= 0x1422b022 (+2^28.3317)
MONTRED r4, r3
    //// bounds:  -0x0004622 (-2^14.1320) <= r4  <= 0x00004623 (+2^14.1321)
str.w r4, [r0, #1288]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1292]
ldr.w r10, [r1, #1296]
ldr.w r9, [r1, #1300]
ldr.w r8, [r1, #1304]
ldr.w r7, [r1, #1308]
ldr.w r6, [r1, #1312]
ldr.w r5, [r1, #1316]
/*** basesqr 108 ***/
/* computing z0 = x0^2 + 2*zeta^108*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2010
mul.w r4, r4, r14
    //// bounds:  -0x1d5f57e (-2^24.8764) <= r4  <= 0x01d5f57e (+2^24.8764)
mla.w r4, r10, r10, r4
    //// bounds:  -0xbb10f17 (-2^27.5474) <= r4  <= 0x0bb10f17 (+2^27.5474)
MONTRED r4, r3
    //// bounds:  -0x0003db1 (-2^13.9470) <= r4  <= 0x00003db1 (+2^13.9470)
str.w r4, [r0, #1296]
/* computing z1 = 2x0x1 + zeta^108 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1005
mul.w r4, r4, r14
    //// bounds:  -0x0eafabf (-2^23.8764) <= r4  <= 0x00eafabf (+2^23.8764)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x14a12df1 (-2^28.3666) <= r4  <= 0x14a12df1 (+2^28.3666)
MONTRED r4, r3
    //// bounds:  -0x00046a1 (-2^14.1422) <= r4  <= 0x000046a1 (+2^14.1422)
str.w r4, [r0, #1300]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1304]
/*** basesqr 109 ***/
/* computing z0 = x0^2 + 2*zeta^109*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2010
mul.w r4, r4, r14
    //// bounds:  -0x1d5f57e (-2^24.8764) <= r4  <= 0x01d5f57e (+2^24.8764)
mla.w r4, r7, r7, r4
    //// bounds:  -0xbb10f17 (-2^27.5474) <= r4  <= 0x0bb10f17 (+2^27.5474)
MONTRED r4, r3
    //// bounds:  -0x0003db1 (-2^13.9470) <= r4  <= 0x00003db1 (+2^13.9470)
str.w r4, [r0, #1308]
/* computing z1 = 2x0x1 + zeta^109 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1005
mul.w r4, r4, r14
    //// bounds:  -0x0eafabf (-2^23.8764) <= r4  <= 0x00eafabf (+2^23.8764)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x14a12df1 (-2^28.3666) <= r4  <= 0x14a12df1 (+2^28.3666)
MONTRED r4, r3
    //// bounds:  -0x00046a1 (-2^14.1422) <= r4  <= 0x000046a1 (+2^14.1422)
str.w r4, [r0, #1312]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1316]
ldr.w r10, [r1, #1320]
ldr.w r9, [r1, #1324]
ldr.w r8, [r1, #1328]
ldr.w r7, [r1, #1332]
ldr.w r6, [r1, #1336]
ldr.w r5, [r1, #1340]
/*** basesqr 110 ***/
/* computing z0 = x0^2 + 2*zeta^110*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11213
mul.w r4, r4, r14
    //// bounds:  -0xa3db75f (-2^27.3563) <= r4  <= 0x0a3db75f (+2^27.3563)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1418d0f8 (-2^28.3289) <= r4  <= 0x1418d0f8 (+2^28.3289)
MONTRED r4, r3
    //// bounds:  -0x0004618 (-2^14.1312) <= r4  <= 0x00004619 (+2^14.1313)
str.w r4, [r0, #1320]
/* computing z1 = 2x0x1 + zeta^110 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7194
mul.w r4, r4, r14
    //// bounds:  -0x692083e (-2^26.7160) <= r4  <= 0x0692083e (+2^26.7160)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a483b70 (-2^28.7160) <= r4  <= 0x1a483b70 (+2^28.7160)
MONTRED r4, r3
    //// bounds:  -0x0004c48 (-2^14.2533) <= r4  <= 0x00004c48 (+2^14.2533)
str.w r4, [r0, #1324]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1328]
/*** basesqr 111 ***/
/* computing z0 = x0^2 + 2*zeta^111*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11213
mul.w r4, r4, r14
    //// bounds:  -0xa3db75f (-2^27.3563) <= r4  <= 0x0a3db75f (+2^27.3563)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1418d0f8 (-2^28.3289) <= r4  <= 0x1418d0f8 (+2^28.3289)
MONTRED r4, r3
    //// bounds:  -0x0004618 (-2^14.1312) <= r4  <= 0x00004619 (+2^14.1313)
str.w r4, [r0, #1332]
/* computing z1 = 2x0x1 + zeta^111 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7194
mul.w r4, r4, r14
    //// bounds:  -0x692083e (-2^26.7160) <= r4  <= 0x0692083e (+2^26.7160)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a483b70 (-2^28.7160) <= r4  <= 0x1a483b70 (+2^28.7160)
MONTRED r4, r3
    //// bounds:  -0x0004c48 (-2^14.2533) <= r4  <= 0x00004c48 (+2^14.2533)
str.w r4, [r0, #1336]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1340]
ldr.w r10, [r1, #1344]
ldr.w r9, [r1, #1348]
ldr.w r8, [r1, #1352]
ldr.w r7, [r1, #1356]
ldr.w r6, [r1, #1360]
ldr.w r5, [r1, #1364]
/*** basesqr 112 ***/
/* computing z0 = x0^2 + 2*zeta^112*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6442
mul.w r4, r4, r14
    //// bounds:  -0x5e234ee (-2^26.5567) <= r4  <= 0x05e234ee (+2^26.5567)
mla.w r4, r10, r10, r4
    //// bounds:  -0xfbd4e87 (-2^27.9763) <= r4  <= 0x0fbd4e87 (+2^27.9763)
MONTRED r4, r3
    //// bounds:  -0x00041bd (-2^14.0387) <= r4  <= 0x000041bd (+2^14.0387)
str.w r4, [r0, #1344]
/* computing z1 = 2x0x1 + zeta^112 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3221
mul.w r4, r4, r14
    //// bounds:  -0x2f11a77 (-2^25.5567) <= r4  <= 0x02f11a77 (+2^25.5567)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x16a74da9 (-2^28.5017) <= r4  <= 0x16a74da9 (+2^28.5017)
MONTRED r4, r3
    //// bounds:  -0x00048a7 (-2^14.1829) <= r4  <= 0x000048a7 (+2^14.1829)
str.w r4, [r0, #1348]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1352]
/*** basesqr 113 ***/
/* computing z0 = x0^2 + 2*zeta^113*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6442
mul.w r4, r4, r14
    //// bounds:  -0x5e234ee (-2^26.5567) <= r4  <= 0x05e234ee (+2^26.5567)
mla.w r4, r7, r7, r4
    //// bounds:  -0xfbd4e87 (-2^27.9763) <= r4  <= 0x0fbd4e87 (+2^27.9763)
MONTRED r4, r3
    //// bounds:  -0x00041bd (-2^14.0387) <= r4  <= 0x000041bd (+2^14.0387)
str.w r4, [r0, #1356]
/* computing z1 = 2x0x1 + zeta^113 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3221
mul.w r4, r4, r14
    //// bounds:  -0x2f11a77 (-2^25.5567) <= r4  <= 0x02f11a77 (+2^25.5567)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x16a74da9 (-2^28.5017) <= r4  <= 0x16a74da9 (+2^28.5017)
MONTRED r4, r3
    //// bounds:  -0x00048a7 (-2^14.1829) <= r4  <= 0x000048a7 (+2^14.1829)
str.w r4, [r0, #1360]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1364]
ldr.w r10, [r1, #1368]
ldr.w r9, [r1, #1372]
ldr.w r8, [r1, #1376]
ldr.w r7, [r1, #1380]
ldr.w r6, [r1, #1384]
ldr.w r5, [r1, #1388]
/*** basesqr 114 ***/
/* computing z0 = x0^2 + 2*zeta^114*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6680
mul.w r4, r4, r14
    //// bounds:  -0x619da88 (-2^26.6090) <= r4  <= 0x0619da88 (+2^26.6090)
mla.w r4, r10, r10, r4
    //// bounds:  -0xff4f421 (-2^27.9961) <= r4  <= 0x0ff4f421 (+2^27.9961)
MONTRED r4, r3
    //// bounds:  -0x00041f5 (-2^14.0435) <= r4  <= 0x000041f5 (+2^14.0435)
str.w r4, [r0, #1368]
/* computing z1 = 2x0x1 + zeta^114 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3340
mul.w r4, r4, r14
    //// bounds:  -0x30ced44 (-2^25.6090) <= r4  <= 0x030ced44 (+2^25.6090)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x16c32076 (-2^28.5086) <= r4  <= 0x16c32076 (+2^28.5086)
MONTRED r4, r3
    //// bounds:  -0x00048c3 (-2^14.1851) <= r4  <= 0x000048c3 (+2^14.1851)
str.w r4, [r0, #1372]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1376]
/*** basesqr 115 ***/
/* computing z0 = x0^2 + 2*zeta^115*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6680
mul.w r4, r4, r14
    //// bounds:  -0x619da88 (-2^26.6090) <= r4  <= 0x0619da88 (+2^26.6090)
mla.w r4, r7, r7, r4
    //// bounds:  -0xff4f421 (-2^27.9961) <= r4  <= 0x0ff4f421 (+2^27.9961)
MONTRED r4, r3
    //// bounds:  -0x00041f5 (-2^14.0435) <= r4  <= 0x000041f5 (+2^14.0435)
str.w r4, [r0, #1380]
/* computing z1 = 2x0x1 + zeta^115 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3340
mul.w r4, r4, r14
    //// bounds:  -0x30ced44 (-2^25.6090) <= r4  <= 0x030ced44 (+2^25.6090)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x16c32076 (-2^28.5086) <= r4  <= 0x16c32076 (+2^28.5086)
MONTRED r4, r3
    //// bounds:  -0x00048c3 (-2^14.1851) <= r4  <= 0x000048c3 (+2^14.1851)
str.w r4, [r0, #1384]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1388]
ldr.w r10, [r1, #1392]
ldr.w r9, [r1, #1396]
ldr.w r8, [r1, #1400]
ldr.w r7, [r1, #1404]
ldr.w r6, [r1, #1408]
ldr.w r5, [r1, #1412]
/*** basesqr 116 ***/
/* computing z0 = x0^2 + 2*zeta^116*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6082
mul.w r4, r4, r14
    //// bounds:  -0x58e08f6 (-2^26.4737) <= r4  <= 0x058e08f6 (+2^26.4737)
mla.w r4, r10, r10, r4
    //// bounds:  -0xf69228f (-2^27.9459) <= r4  <= 0x0f69228f (+2^27.9459)
MONTRED r4, r3
    //// bounds:  -0x0004169 (-2^14.0314) <= r4  <= 0x00004169 (+2^14.0314)
str.w r4, [r0, #1392]
/* computing z1 = 2x0x1 + zeta^116 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3041
mul.w r4, r4, r14
    //// bounds:  -0x2c7047b (-2^25.4737) <= r4  <= 0x02c7047b (+2^25.4737)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x167d37ad (-2^28.4912) <= r4  <= 0x167d37ad (+2^28.4912)
MONTRED r4, r3
    //// bounds:  -0x000487d (-2^14.1797) <= r4  <= 0x0000487d (+2^14.1797)
str.w r4, [r0, #1396]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1400]
/*** basesqr 117 ***/
/* computing z0 = x0^2 + 2*zeta^117*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6082
mul.w r4, r4, r14
    //// bounds:  -0x58e08f6 (-2^26.4737) <= r4  <= 0x058e08f6 (+2^26.4737)
mla.w r4, r7, r7, r4
    //// bounds:  -0xf69228f (-2^27.9459) <= r4  <= 0x0f69228f (+2^27.9459)
MONTRED r4, r3
    //// bounds:  -0x0004169 (-2^14.0314) <= r4  <= 0x00004169 (+2^14.0314)
str.w r4, [r0, #1404]
/* computing z1 = 2x0x1 + zeta^117 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3041
mul.w r4, r4, r14
    //// bounds:  -0x2c7047b (-2^25.4737) <= r4  <= 0x02c7047b (+2^25.4737)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x167d37ad (-2^28.4912) <= r4  <= 0x167d37ad (+2^28.4912)
MONTRED r4, r3
    //// bounds:  -0x000487d (-2^14.1797) <= r4  <= 0x0000487d (+2^14.1797)
str.w r4, [r0, #1408]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1412]
ldr.w r10, [r1, #1416]
ldr.w r9, [r1, #1420]
ldr.w r8, [r1, #1424]
ldr.w r7, [r1, #1428]
ldr.w r6, [r1, #1432]
ldr.w r5, [r1, #1436]
/*** basesqr 118 ***/
/* computing z0 = x0^2 + 2*zeta^118*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-282
mul.w r4, r4, r14
    //// bounds:  -0x041ef3e (-2^22.0430) <= r4  <= 0x0041ef3e (+2^22.0430)
mla.w r4, r10, r10, r4
    //// bounds:  -0xa1d08d7 (-2^27.3382) <= r4  <= 0x0a1d08d7 (+2^27.3382)
MONTRED r4, r3
    //// bounds:  -0x0003c1d (-2^13.9096) <= r4  <= 0x00003c1d (+2^13.9096)
str.w r4, [r0, #1416]
/* computing z1 = 2x0x1 + zeta^118 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-141
mul.w r4, r4, r14
    //// bounds:  -0x020f79f (-2^21.0430) <= r4  <= 0x0020f79f (+2^21.0430)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13d72ad1 (-2^28.3104) <= r4  <= 0x13d72ad1 (+2^28.3104)
MONTRED r4, r3
    //// bounds:  -0x00045d7 (-2^14.1260) <= r4  <= 0x000045d7 (+2^14.1260)
str.w r4, [r0, #1420]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1424]
/*** basesqr 119 ***/
/* computing z0 = x0^2 + 2*zeta^119*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =282
mul.w r4, r4, r14
    //// bounds:  -0x041ef3e (-2^22.0430) <= r4  <= 0x0041ef3e (+2^22.0430)
mla.w r4, r7, r7, r4
    //// bounds:  -0xa1d08d7 (-2^27.3382) <= r4  <= 0x0a1d08d7 (+2^27.3382)
MONTRED r4, r3
    //// bounds:  -0x0003c1d (-2^13.9096) <= r4  <= 0x00003c1d (+2^13.9096)
str.w r4, [r0, #1428]
/* computing z1 = 2x0x1 + zeta^119 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =141
mul.w r4, r4, r14
    //// bounds:  -0x020f79f (-2^21.0430) <= r4  <= 0x0020f79f (+2^21.0430)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13d72ad1 (-2^28.3104) <= r4  <= 0x13d72ad1 (+2^28.3104)
MONTRED r4, r3
    //// bounds:  -0x00045d7 (-2^14.1260) <= r4  <= 0x000045d7 (+2^14.1260)
str.w r4, [r0, #1432]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1436]
ldr.w r10, [r1, #1440]
ldr.w r9, [r1, #1444]
ldr.w r8, [r1, #1448]
ldr.w r7, [r1, #1452]
ldr.w r6, [r1, #1456]
ldr.w r5, [r1, #1460]
/*** basesqr 120 ***/
/* computing z0 = x0^2 + 2*zeta^120*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10816
mul.w r4, r4, r14
    //// bounds:  -0x9e0e4c0 (-2^27.3043) <= r4  <= 0x09e0e4c0 (+2^27.3043)
mla.w r4, r10, r10, r4
    //// bounds:  -0x13bbfe59 (-2^28.3026) <= r4  <= 0x13bbfe59 (+2^28.3026)
MONTRED r4, r3
    //// bounds:  -0x00045bc (-2^14.1238) <= r4  <= 0x000045bc (+2^14.1238)
str.w r4, [r0, #1440]
/* computing z1 = 2x0x1 + zeta^120 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5408
mul.w r4, r4, r14
    //// bounds:  -0x4f07260 (-2^26.3043) <= r4  <= 0x04f07260 (+2^26.3043)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x18a6a592 (-2^28.6236) <= r4  <= 0x18a6a592 (+2^28.6236)
MONTRED r4, r3
    //// bounds:  -0x0004aa6 (-2^14.2220) <= r4  <= 0x00004aa7 (+2^14.2221)
str.w r4, [r0, #1444]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1448]
/*** basesqr 121 ***/
/* computing z0 = x0^2 + 2*zeta^121*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10816
mul.w r4, r4, r14
    //// bounds:  -0x9e0e4c0 (-2^27.3043) <= r4  <= 0x09e0e4c0 (+2^27.3043)
mla.w r4, r7, r7, r4
    //// bounds:  -0x13bbfe59 (-2^28.3026) <= r4  <= 0x13bbfe59 (+2^28.3026)
MONTRED r4, r3
    //// bounds:  -0x00045bc (-2^14.1238) <= r4  <= 0x000045bc (+2^14.1238)
str.w r4, [r0, #1452]
/* computing z1 = 2x0x1 + zeta^121 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5408
mul.w r4, r4, r14
    //// bounds:  -0x4f07260 (-2^26.3043) <= r4  <= 0x04f07260 (+2^26.3043)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x18a6a592 (-2^28.6236) <= r4  <= 0x18a6a592 (+2^28.6236)
MONTRED r4, r3
    //// bounds:  -0x0004aa6 (-2^14.2220) <= r4  <= 0x00004aa7 (+2^14.2221)
str.w r4, [r0, #1456]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1460]
ldr.w r10, [r1, #1464]
ldr.w r9, [r1, #1468]
ldr.w r8, [r1, #1472]
ldr.w r7, [r1, #1476]
ldr.w r6, [r1, #1480]
ldr.w r5, [r1, #1484]
/*** basesqr 122 ***/
/* computing z0 = x0^2 + 2*zeta^122*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10308
mul.w r4, r4, r14
    //// bounds:  -0x96a1e2c (-2^27.2349) <= r4  <= 0x096a1e2c (+2^27.2349)
mla.w r4, r10, r10, r4
    //// bounds:  -0x134537c5 (-2^28.2683) <= r4  <= 0x134537c5 (+2^28.2683)
MONTRED r4, r3
    //// bounds:  -0x0004545 (-2^14.1141) <= r4  <= 0x00004545 (+2^14.1141)
str.w r4, [r0, #1464]
/* computing z1 = 2x0x1 + zeta^122 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5154
mul.w r4, r4, r14
    //// bounds:  -0x4b50f16 (-2^26.2349) <= r4  <= 0x04b50f16 (+2^26.2349)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x186b4248 (-2^28.6099) <= r4  <= 0x186b4248 (+2^28.6099)
MONTRED r4, r3
    //// bounds:  -0x0004a6b (-2^14.2176) <= r4  <= 0x00004a6b (+2^14.2176)
str.w r4, [r0, #1468]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1472]
/*** basesqr 123 ***/
/* computing z0 = x0^2 + 2*zeta^123*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10308
mul.w r4, r4, r14
    //// bounds:  -0x96a1e2c (-2^27.2349) <= r4  <= 0x096a1e2c (+2^27.2349)
mla.w r4, r7, r7, r4
    //// bounds:  -0x134537c5 (-2^28.2683) <= r4  <= 0x134537c5 (+2^28.2683)
MONTRED r4, r3
    //// bounds:  -0x0004545 (-2^14.1141) <= r4  <= 0x00004545 (+2^14.1141)
str.w r4, [r0, #1476]
/* computing z1 = 2x0x1 + zeta^123 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5154
mul.w r4, r4, r14
    //// bounds:  -0x4b50f16 (-2^26.2349) <= r4  <= 0x04b50f16 (+2^26.2349)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x186b4248 (-2^28.6099) <= r4  <= 0x186b4248 (+2^28.6099)
MONTRED r4, r3
    //// bounds:  -0x0004a6b (-2^14.2176) <= r4  <= 0x00004a6b (+2^14.2176)
str.w r4, [r0, #1480]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1484]
ldr.w r10, [r1, #1488]
ldr.w r9, [r1, #1492]
ldr.w r8, [r1, #1496]
ldr.w r7, [r1, #1500]
ldr.w r6, [r1, #1504]
ldr.w r5, [r1, #1508]
/*** basesqr 124 ***/
/* computing z0 = x0^2 + 2*zeta^124*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8864
mul.w r4, r4, r14
    //// bounds:  -0x8187ee0 (-2^27.0172) <= r4  <= 0x08187ee0 (+2^27.0172)
mla.w r4, r10, r10, r4
    //// bounds:  -0x11f39879 (-2^28.1660) <= r4  <= 0x11f39879 (+2^28.1660)
MONTRED r4, r3
    //// bounds:  -0x00043f3 (-2^14.0864) <= r4  <= 0x000043f4 (+2^14.0865)
str.w r4, [r0, #1488]
/* computing z1 = 2x0x1 + zeta^124 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4432
mul.w r4, r4, r14
    //// bounds:  -0x40c3f70 (-2^26.0172) <= r4  <= 0x040c3f70 (+2^26.0172)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17c272a2 (-2^28.5704) <= r4  <= 0x17c272a2 (+2^28.5704)
MONTRED r4, r3
    //// bounds:  -0x00049c2 (-2^14.2047) <= r4  <= 0x000049c2 (+2^14.2047)
str.w r4, [r0, #1492]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1496]
/*** basesqr 125 ***/
/* computing z0 = x0^2 + 2*zeta^125*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8864
mul.w r4, r4, r14
    //// bounds:  -0x8187ee0 (-2^27.0172) <= r4  <= 0x08187ee0 (+2^27.0172)
mla.w r4, r7, r7, r4
    //// bounds:  -0x11f39879 (-2^28.1660) <= r4  <= 0x11f39879 (+2^28.1660)
MONTRED r4, r3
    //// bounds:  -0x00043f3 (-2^14.0864) <= r4  <= 0x000043f4 (+2^14.0865)
str.w r4, [r0, #1500]
/* computing z1 = 2x0x1 + zeta^125 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4432
mul.w r4, r4, r14
    //// bounds:  -0x40c3f70 (-2^26.0172) <= r4  <= 0x040c3f70 (+2^26.0172)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17c272a2 (-2^28.5704) <= r4  <= 0x17c272a2 (+2^28.5704)
MONTRED r4, r3
    //// bounds:  -0x00049c2 (-2^14.2047) <= r4  <= 0x000049c2 (+2^14.2047)
str.w r4, [r0, #1504]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1508]
ldr.w r10, [r1, #1512]
ldr.w r9, [r1, #1516]
ldr.w r8, [r1, #1520]
ldr.w r7, [r1, #1524]
ldr.w r6, [r1, #1528]
ldr.w r5, [r1, #1532]
/*** basesqr 126 ***/
/* computing z0 = x0^2 + 2*zeta^126*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10185
mul.w r4, r4, r14
    //// bounds:  -0x94d5bf3 (-2^27.2176) <= r4  <= 0x094d5bf3 (+2^27.2176)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1328758c (-2^28.2599) <= r4  <= 0x1328758c (+2^28.2599)
MONTRED r4, r3
    //// bounds:  -0x0004528 (-2^14.1118) <= r4  <= 0x00004528 (+2^14.1118)
str.w r4, [r0, #1512]
/* computing z1 = 2x0x1 + zeta^126 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7708
mul.w r4, r4, r14
    //// bounds:  -0x70a35f4 (-2^26.8156) <= r4  <= 0x070a35f4 (+2^26.8156)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ac06926 (-2^28.7416) <= r4  <= 0x1ac06926 (+2^28.7416)
MONTRED r4, r3
    //// bounds:  -0x0004cc0 (-2^14.2621) <= r4  <= 0x00004cc0 (+2^14.2621)
str.w r4, [r0, #1516]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1520]
/*** basesqr 127 ***/
/* computing z0 = x0^2 + 2*zeta^127*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10185
mul.w r4, r4, r14
    //// bounds:  -0x94d5bf3 (-2^27.2176) <= r4  <= 0x094d5bf3 (+2^27.2176)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1328758c (-2^28.2599) <= r4  <= 0x1328758c (+2^28.2599)
MONTRED r4, r3
    //// bounds:  -0x0004528 (-2^14.1118) <= r4  <= 0x00004528 (+2^14.1118)
str.w r4, [r0, #1524]
/* computing z1 = 2x0x1 + zeta^127 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7708
mul.w r4, r4, r14
    //// bounds:  -0x70a35f4 (-2^26.8156) <= r4  <= 0x070a35f4 (+2^26.8156)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ac06926 (-2^28.7416) <= r4  <= 0x1ac06926 (+2^28.7416)
MONTRED r4, r3
    //// bounds:  -0x0004cc0 (-2^14.2621) <= r4  <= 0x00004cc0 (+2^14.2621)
str.w r4, [r0, #1528]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1532]
ldr.w r10, [r1, #1536]
ldr.w r9, [r1, #1540]
ldr.w r8, [r1, #1544]
ldr.w r7, [r1, #1548]
ldr.w r6, [r1, #1552]
ldr.w r5, [r1, #1556]
/*** basesqr 128 ***/
/* computing z0 = x0^2 + 2*zeta^128*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2217
mul.w r4, r4, r14
    //// bounds:  -0x2065b93 (-2^25.0178) <= r4  <= 0x02065b93 (+2^25.0178)
mla.w r4, r10, r10, r4
    //// bounds:  -0xbe1752c (-2^27.5705) <= r4  <= 0x0be1752c (+2^27.5705)
MONTRED r4, r3
    //// bounds:  -0x0003de1 (-2^13.9514) <= r4  <= 0x00003de1 (+2^13.9514)
str.w r4, [r0, #1536]
/* computing z1 = 2x0x1 + zeta^128 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11692
mul.w r4, r4, r14
    //// bounds:  -0xaadb624 (-2^27.4166) <= r4  <= 0x0aadb624 (+2^27.4166)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e63e956 (-2^28.9255) <= r4  <= 0x1e63e956 (+2^28.9255)
MONTRED r4, r3
    //// bounds:  -0x0005064 (-2^14.3290) <= r4  <= 0x00005064 (+2^14.3290)
str.w r4, [r0, #1540]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1544]
/*** basesqr 129 ***/
/* computing z0 = x0^2 + 2*zeta^129*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2217
mul.w r4, r4, r14
    //// bounds:  -0x2065b93 (-2^25.0178) <= r4  <= 0x02065b93 (+2^25.0178)
mla.w r4, r7, r7, r4
    //// bounds:  -0xbe1752c (-2^27.5705) <= r4  <= 0x0be1752c (+2^27.5705)
MONTRED r4, r3
    //// bounds:  -0x0003de1 (-2^13.9514) <= r4  <= 0x00003de1 (+2^13.9514)
str.w r4, [r0, #1548]
/* computing z1 = 2x0x1 + zeta^129 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11692
mul.w r4, r4, r14
    //// bounds:  -0xaadb624 (-2^27.4166) <= r4  <= 0x0aadb624 (+2^27.4166)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e63e956 (-2^28.9255) <= r4  <= 0x1e63e956 (+2^28.9255)
MONTRED r4, r3
    //// bounds:  -0x0005064 (-2^14.3290) <= r4  <= 0x00005064 (+2^14.3290)
str.w r4, [r0, #1552]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1556]
ldr.w r10, [r1, #1560]
ldr.w r9, [r1, #1564]
ldr.w r8, [r1, #1568]
ldr.w r7, [r1, #1572]
ldr.w r6, [r1, #1576]
ldr.w r5, [r1, #1580]
/*** basesqr 130 ***/
/* computing z0 = x0^2 + 2*zeta^130*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3694
mul.w r4, r4, r14
    //// bounds:  -0x35fb21a (-2^25.7544) <= r4  <= 0x035fb21a (+2^25.7544)
mla.w r4, r10, r10, r4
    //// bounds:  -0xd3acbb3 (-2^27.7257) <= r4  <= 0x0d3acbb3 (+2^27.7257)
MONTRED r4, r3
    //// bounds:  -0x0003f3a (-2^13.9825) <= r4  <= 0x00003f3b (+2^13.9825)
str.w r4, [r0, #1560]
/* computing z1 = 2x0x1 + zeta^130 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1847
mul.w r4, r4, r14
    //// bounds:  -0x1afd90d (-2^24.7544) <= r4  <= 0x01afd90d (+2^24.7544)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x15660c3f (-2^28.4194) <= r4  <= 0x15660c3f (+2^28.4194)
MONTRED r4, r3
    //// bounds:  -0x0004766 (-2^14.1578) <= r4  <= 0x00004766 (+2^14.1578)
str.w r4, [r0, #1564]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1568]
/*** basesqr 131 ***/
/* computing z0 = x0^2 + 2*zeta^131*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3694
mul.w r4, r4, r14
    //// bounds:  -0x35fb21a (-2^25.7544) <= r4  <= 0x035fb21a (+2^25.7544)
mla.w r4, r7, r7, r4
    //// bounds:  -0xd3acbb3 (-2^27.7257) <= r4  <= 0x0d3acbb3 (+2^27.7257)
MONTRED r4, r3
    //// bounds:  -0x0003f3a (-2^13.9825) <= r4  <= 0x00003f3b (+2^13.9825)
str.w r4, [r0, #1572]
/* computing z1 = 2x0x1 + zeta^131 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1847
mul.w r4, r4, r14
    //// bounds:  -0x1afd90d (-2^24.7544) <= r4  <= 0x01afd90d (+2^24.7544)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x15660c3f (-2^28.4194) <= r4  <= 0x15660c3f (+2^28.4194)
MONTRED r4, r3
    //// bounds:  -0x0004766 (-2^14.1578) <= r4  <= 0x00004766 (+2^14.1578)
str.w r4, [r0, #1576]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1580]
ldr.w r10, [r1, #1584]
ldr.w r9, [r1, #1588]
ldr.w r8, [r1, #1592]
ldr.w r7, [r1, #1596]
ldr.w r6, [r1, #1600]
ldr.w r5, [r1, #1604]
/*** basesqr 132 ***/
/* computing z0 = x0^2 + 2*zeta^132*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3256
mul.w r4, r4, r14
    //// bounds:  -0x2f94968 (-2^25.5723) <= r4  <= 0x02f94968 (+2^25.5723)
mla.w r4, r10, r10, r4
    //// bounds:  -0xcd46301 (-2^27.6814) <= r4  <= 0x0cd46301 (+2^27.6814)
MONTRED r4, r3
    //// bounds:  -0x0003ed4 (-2^13.9733) <= r4  <= 0x00003ed4 (+2^13.9733)
str.w r4, [r0, #1584]
/* computing z1 = 2x0x1 + zeta^132 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1628
mul.w r4, r4, r14
    //// bounds:  -0x17ca4b4 (-2^24.5723) <= r4  <= 0x017ca4b4 (+2^24.5723)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1532d7e6 (-2^28.4059) <= r4  <= 0x1532d7e6 (+2^28.4059)
MONTRED r4, r3
    //// bounds:  -0x0004732 (-2^14.1537) <= r4  <= 0x00004733 (+2^14.1538)
str.w r4, [r0, #1588]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1592]
/*** basesqr 133 ***/
/* computing z0 = x0^2 + 2*zeta^133*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3256
mul.w r4, r4, r14
    //// bounds:  -0x2f94968 (-2^25.5723) <= r4  <= 0x02f94968 (+2^25.5723)
mla.w r4, r7, r7, r4
    //// bounds:  -0xcd46301 (-2^27.6814) <= r4  <= 0x0cd46301 (+2^27.6814)
MONTRED r4, r3
    //// bounds:  -0x0003ed4 (-2^13.9733) <= r4  <= 0x00003ed4 (+2^13.9733)
str.w r4, [r0, #1596]
/* computing z1 = 2x0x1 + zeta^133 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1628
mul.w r4, r4, r14
    //// bounds:  -0x17ca4b4 (-2^24.5723) <= r4  <= 0x017ca4b4 (+2^24.5723)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1532d7e6 (-2^28.4059) <= r4  <= 0x1532d7e6 (+2^28.4059)
MONTRED r4, r3
    //// bounds:  -0x0004732 (-2^14.1537) <= r4  <= 0x00004733 (+2^14.1538)
str.w r4, [r0, #1600]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1604]
ldr.w r10, [r1, #1608]
ldr.w r9, [r1, #1612]
ldr.w r8, [r1, #1616]
ldr.w r7, [r1, #1620]
ldr.w r6, [r1, #1624]
ldr.w r5, [r1, #1628]
/*** basesqr 134 ***/
/* computing z0 = x0^2 + 2*zeta^134*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8940
mul.w r4, r4, r14
    //// bounds:  -0x82a43e4 (-2^27.0295) <= r4  <= 0x082a43e4 (+2^27.0295)
mla.w r4, r10, r10, r4
    //// bounds:  -0x12055d7d (-2^28.1716) <= r4  <= 0x12055d7d (+2^28.1716)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0004405 (-2^14.0879) <= r4  <= 0x00004405 (+2^14.0879)
str.w r4, [r0, #1608]
/* computing z1 = 2x0x1 + zeta^134 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4470
mul.w r4, r4, r14
    //// bounds:  -0x41521f2 (-2^26.0295) <= r4  <= 0x041521f2 (+2^26.0295)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17cb5524 (-2^28.5725) <= r4  <= 0x17cb5524 (+2^28.5725)
MONTRED r4, r3
    //// bounds:  -0x00049cb (-2^14.2054) <= r4  <= 0x000049cb (+2^14.2054)
str.w r4, [r0, #1612]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1616]
/*** basesqr 135 ***/
/* computing z0 = x0^2 + 2*zeta^135*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8940
mul.w r4, r4, r14
    //// bounds:  -0x82a43e4 (-2^27.0295) <= r4  <= 0x082a43e4 (+2^27.0295)
mla.w r4, r7, r7, r4
    //// bounds:  -0x12055d7d (-2^28.1716) <= r4  <= 0x12055d7d (+2^28.1716)
MONTRED r4, r3
    //// bounds:  -0x0004405 (-2^14.0879) <= r4  <= 0x00004405 (+2^14.0879)
str.w r4, [r0, #1620]
/* computing z1 = 2x0x1 + zeta^135 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4470
mul.w r4, r4, r14
    //// bounds:  -0x41521f2 (-2^26.0295) <= r4  <= 0x041521f2 (+2^26.0295)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17cb5524 (-2^28.5725) <= r4  <= 0x17cb5524 (+2^28.5725)
MONTRED r4, r3
    //// bounds:  -0x00049cb (-2^14.2054) <= r4  <= 0x000049cb (+2^14.2054)
str.w r4, [r0, #1624]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1628]
ldr.w r10, [r1, #1632]
ldr.w r9, [r1, #1636]
ldr.w r8, [r1, #1640]
ldr.w r7, [r1, #1644]
ldr.w r6, [r1, #1648]
ldr.w r5, [r1, #1652]
/*** basesqr 136 ***/
/* computing z0 = x0^2 + 2*zeta^136*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6809
mul.w r4, r4, r14
    //// bounds:  -0x63803e3 (-2^26.6366) <= r4  <= 0x063803e3 (+2^26.6366)
mla.w r4, r10, r10, r4
    //// bounds:  -0x10131d7c (-2^28.0067) <= r4  <= 0x10131d7c (+2^28.0067)
MONTRED r4, r3
    //// bounds:  -0x0004213 (-2^14.0460) <= r4  <= 0x00004213 (+2^14.0460)
str.w r4, [r0, #1632]
/* computing z1 = 2x0x1 + zeta^136 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9396
mul.w r4, r4, r14
    //// bounds:  -0x894e1fc (-2^27.1012) <= r4  <= 0x0894e1fc (+2^27.1012)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c4b152e (-2^28.8224) <= r4  <= 0x1c4b152e (+2^28.8224)
MONTRED r4, r3
    //// bounds:  -0x0004e4b (-2^14.2908) <= r4  <= 0x00004e4b (+2^14.2908)
str.w r4, [r0, #1636]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1640]
/*** basesqr 137 ***/
/* computing z0 = x0^2 + 2*zeta^137*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6809
mul.w r4, r4, r14
    //// bounds:  -0x63803e3 (-2^26.6366) <= r4  <= 0x063803e3 (+2^26.6366)
mla.w r4, r7, r7, r4
    //// bounds:  -0x10131d7c (-2^28.0067) <= r4  <= 0x10131d7c (+2^28.0067)
MONTRED r4, r3
    //// bounds:  -0x0004213 (-2^14.0460) <= r4  <= 0x00004213 (+2^14.0460)
str.w r4, [r0, #1644]
/* computing z1 = 2x0x1 + zeta^137 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9396
mul.w r4, r4, r14
    //// bounds:  -0x894e1fc (-2^27.1012) <= r4  <= 0x0894e1fc (+2^27.1012)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c4b152e (-2^28.8224) <= r4  <= 0x1c4b152e (+2^28.8224)
MONTRED r4, r3
    //// bounds:  -0x0004e4b (-2^14.2908) <= r4  <= 0x00004e4b (+2^14.2908)
str.w r4, [r0, #1648]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1652]
ldr.w r10, [r1, #1656]
ldr.w r9, [r1, #1660]
ldr.w r8, [r1, #1664]
ldr.w r7, [r1, #1668]
ldr.w r6, [r1, #1672]
ldr.w r5, [r1, #1676]
/*** basesqr 138 ***/
/* computing z0 = x0^2 + 2*zeta^138*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11403
mul.w r4, r4, r14
    //// bounds:  -0xa6a23e9 (-2^27.3805) <= r4  <= 0x0a6a23e9 (+2^27.3805)
mla.w r4, r10, r10, r4
    //// bounds:  -0x14453d82 (-2^28.3413) <= r4  <= 0x14453d82 (+2^28.3413)
MONTRED r4, r3
    //// bounds:  -0x0004645 (-2^14.1348) <= r4  <= 0x00004645 (+2^14.1348)
str.w r4, [r0, #1656]
/* computing z1 = 2x0x1 + zeta^138 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7099
mul.w r4, r4, r14
    //// bounds:  -0x67bd1f9 (-2^26.6968) <= r4  <= 0x067bd1f9 (+2^26.6968)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a32052b (-2^28.7112) <= r4  <= 0x1a32052b (+2^28.7112)
MONTRED r4, r3
    //// bounds:  -0x0004c32 (-2^14.2516) <= r4  <= 0x00004c32 (+2^14.2516)
str.w r4, [r0, #1660]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1664]
/*** basesqr 139 ***/
/* computing z0 = x0^2 + 2*zeta^139*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11403
mul.w r4, r4, r14
    //// bounds:  -0xa6a23e9 (-2^27.3805) <= r4  <= 0x0a6a23e9 (+2^27.3805)
mla.w r4, r7, r7, r4
    //// bounds:  -0x14453d82 (-2^28.3413) <= r4  <= 0x14453d82 (+2^28.3413)
MONTRED r4, r3
    //// bounds:  -0x0004645 (-2^14.1348) <= r4  <= 0x00004645 (+2^14.1348)
str.w r4, [r0, #1668]
/* computing z1 = 2x0x1 + zeta^139 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7099
mul.w r4, r4, r14
    //// bounds:  -0x67bd1f9 (-2^26.6968) <= r4  <= 0x067bd1f9 (+2^26.6968)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a32052b (-2^28.7112) <= r4  <= 0x1a32052b (+2^28.7112)
MONTRED r4, r3
    //// bounds:  -0x0004c32 (-2^14.2516) <= r4  <= 0x00004c32 (+2^14.2516)
str.w r4, [r0, #1672]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1676]
ldr.w r10, [r1, #1680]
ldr.w r9, [r1, #1684]
ldr.w r8, [r1, #1688]
ldr.w r7, [r1, #1692]
ldr.w r6, [r1, #1696]
ldr.w r5, [r1, #1700]
/*** basesqr 140 ***/
/* computing z0 = x0^2 + 2*zeta^140*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9746
mul.w r4, r4, r14
    //// bounds:  -0x8e6b766 (-2^27.1540) <= r4  <= 0x08e6b766 (+2^27.1540)
mla.w r4, r10, r10, r4
    //// bounds:  -0x12c1d0ff (-2^28.2294) <= r4  <= 0x12c1d0ff (+2^28.2294)
MONTRED r4, r3
    //// bounds:  -0x00044c1 (-2^14.1034) <= r4  <= 0x000044c2 (+2^14.1035)
str.w r4, [r0, #1680]
/* computing z1 = 2x0x1 + zeta^140 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4873
mul.w r4, r4, r14
    //// bounds:  -0x4735bb3 (-2^26.1540) <= r4  <= 0x04735bb3 (+2^26.1540)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x18298ee5 (-2^28.5947) <= r4  <= 0x18298ee5 (+2^28.5947)
MONTRED r4, r3
    //// bounds:  -0x0004a29 (-2^14.2126) <= r4  <= 0x00004a2a (+2^14.2126)
str.w r4, [r0, #1684]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1688]
/*** basesqr 141 ***/
/* computing z0 = x0^2 + 2*zeta^141*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9746
mul.w r4, r4, r14
    //// bounds:  -0x8e6b766 (-2^27.1540) <= r4  <= 0x08e6b766 (+2^27.1540)
mla.w r4, r7, r7, r4
    //// bounds:  -0x12c1d0ff (-2^28.2294) <= r4  <= 0x12c1d0ff (+2^28.2294)
MONTRED r4, r3
    //// bounds:  -0x00044c1 (-2^14.1034) <= r4  <= 0x000044c2 (+2^14.1035)
str.w r4, [r0, #1692]
/* computing z1 = 2x0x1 + zeta^141 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4873
mul.w r4, r4, r14
    //// bounds:  -0x4735bb3 (-2^26.1540) <= r4  <= 0x04735bb3 (+2^26.1540)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x18298ee5 (-2^28.5947) <= r4  <= 0x18298ee5 (+2^28.5947)
MONTRED r4, r3
    //// bounds:  -0x0004a29 (-2^14.2126) <= r4  <= 0x00004a2a (+2^14.2126)
str.w r4, [r0, #1696]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1700]
ldr.w r10, [r1, #1704]
ldr.w r9, [r1, #1708]
ldr.w r8, [r1, #1712]
ldr.w r7, [r1, #1716]
ldr.w r6, [r1, #1720]
ldr.w r5, [r1, #1724]
/*** basesqr 142 ***/
/* computing z0 = x0^2 + 2*zeta^142*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2301
mul.w r4, r4, r14
    //// bounds:  -0x219ff6f (-2^25.0715) <= r4  <= 0x0219ff6f (+2^25.0715)
mla.w r4, r10, r10, r4
    //// bounds:  -0xbf51908 (-2^27.5798) <= r4  <= 0x0bf51908 (+2^27.5798)
MONTRED r4, r3
    //// bounds:  -0x0003df5 (-2^13.9532) <= r4  <= 0x00003df5 (+2^13.9532)
str.w r4, [r0, #1704]
/* computing z1 = 2x0x1 + zeta^142 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11650
mul.w r4, r4, r14
    //// bounds:  -0xaa3e436 (-2^27.4115) <= r4  <= 0x0aa3e436 (+2^27.4115)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e5a1768 (-2^28.9237) <= r4  <= 0x1e5a1768 (+2^28.9237)
MONTRED r4, r3
    //// bounds:  -0x000505a (-2^14.3283) <= r4  <= 0x0000505a (+2^14.3283)
str.w r4, [r0, #1708]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1712]
/*** basesqr 143 ***/
/* computing z0 = x0^2 + 2*zeta^143*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2301
mul.w r4, r4, r14
    //// bounds:  -0x219ff6f (-2^25.0715) <= r4  <= 0x0219ff6f (+2^25.0715)
mla.w r4, r7, r7, r4
    //// bounds:  -0xbf51908 (-2^27.5798) <= r4  <= 0x0bf51908 (+2^27.5798)
MONTRED r4, r3
    //// bounds:  -0x0003df5 (-2^13.9532) <= r4  <= 0x00003df5 (+2^13.9532)
str.w r4, [r0, #1716]
/* computing z1 = 2x0x1 + zeta^143 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11650
mul.w r4, r4, r14
    //// bounds:  -0xaa3e436 (-2^27.4115) <= r4  <= 0x0aa3e436 (+2^27.4115)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e5a1768 (-2^28.9237) <= r4  <= 0x1e5a1768 (+2^28.9237)
MONTRED r4, r3
    //// bounds:  -0x000505a (-2^14.3283) <= r4  <= 0x0000505a (+2^14.3283)
str.w r4, [r0, #1720]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1724]
ldr.w r10, [r1, #1728]
ldr.w r9, [r1, #1732]
ldr.w r8, [r1, #1736]
ldr.w r7, [r1, #1740]
ldr.w r6, [r1, #1744]
ldr.w r5, [r1, #1748]
/*** basesqr 144 ***/
/* computing z0 = x0^2 + 2*zeta^144*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7265
mul.w r4, r4, r14
    //// bounds:  -0x6a2a1fb (-2^26.7302) <= r4  <= 0x06a2a1fb (+2^26.7302)
mla.w r4, r10, r10, r4
    //// bounds:  -0x107dbb94 (-2^28.0436) <= r4  <= 0x107dbb94 (+2^28.0436)
MONTRED r4, r3
    //// bounds:  -0x000427d (-2^14.0550) <= r4  <= 0x0000427e (+2^14.0551)
str.w r4, [r0, #1728]
/* computing z1 = 2x0x1 + zeta^144 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9168
mul.w r4, r4, r14
    //// bounds:  -0x85f92f0 (-2^27.0658) <= r4  <= 0x085f92f0 (+2^27.0658)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c15c622 (-2^28.8117) <= r4  <= 0x1c15c622 (+2^28.8117)
MONTRED r4, r3
    //// bounds:  -0x0004e15 (-2^14.2869) <= r4  <= 0x00004e16 (+2^14.2870)
str.w r4, [r0, #1732]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1736]
/*** basesqr 145 ***/
/* computing z0 = x0^2 + 2*zeta^145*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7265
mul.w r4, r4, r14
    //// bounds:  -0x6a2a1fb (-2^26.7302) <= r4  <= 0x06a2a1fb (+2^26.7302)
mla.w r4, r7, r7, r4
    //// bounds:  -0x107dbb94 (-2^28.0436) <= r4  <= 0x107dbb94 (+2^28.0436)
MONTRED r4, r3
    //// bounds:  -0x000427d (-2^14.0550) <= r4  <= 0x0000427e (+2^14.0551)
str.w r4, [r0, #1740]
/* computing z1 = 2x0x1 + zeta^145 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9168
mul.w r4, r4, r14
    //// bounds:  -0x85f92f0 (-2^27.0658) <= r4  <= 0x085f92f0 (+2^27.0658)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c15c622 (-2^28.8117) <= r4  <= 0x1c15c622 (+2^28.8117)
MONTRED r4, r3
    //// bounds:  -0x0004e15 (-2^14.2869) <= r4  <= 0x00004e16 (+2^14.2870)
str.w r4, [r0, #1744]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1748]
ldr.w r10, [r1, #1752]
ldr.w r9, [r1, #1756]
ldr.w r8, [r1, #1760]
ldr.w r7, [r1, #1764]
ldr.w r6, [r1, #1768]
ldr.w r5, [r1, #1772]
/*** basesqr 146 ***/
/* computing z0 = x0^2 + 2*zeta^146*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10355
mul.w r4, r4, r14
    //// bounds:  -0x9751b61 (-2^27.2415) <= r4  <= 0x09751b61 (+2^27.2415)
mla.w r4, r10, r10, r4
    //// bounds:  -0x135034fa (-2^28.2715) <= r4  <= 0x135034fa (+2^28.2715)
MONTRED r4, r3
    //// bounds:  -0x0004550 (-2^14.1150) <= r4  <= 0x00004550 (+2^14.1150)
str.w r4, [r0, #1752]
/* computing z1 = 2x0x1 + zeta^146 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7623
mul.w r4, r4, r14
    //// bounds:  -0x6f6563d (-2^26.7996) <= r4  <= 0x06f6563d (+2^26.7996)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1aac896f (-2^28.7374) <= r4  <= 0x1aac896f (+2^28.7374)
MONTRED r4, r3
    //// bounds:  -0x0004cac (-2^14.2606) <= r4  <= 0x00004cad (+2^14.2607)
str.w r4, [r0, #1756]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1760]
/*** basesqr 147 ***/
/* computing z0 = x0^2 + 2*zeta^147*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10355
mul.w r4, r4, r14
    //// bounds:  -0x9751b61 (-2^27.2415) <= r4  <= 0x09751b61 (+2^27.2415)
mla.w r4, r7, r7, r4
    //// bounds:  -0x135034fa (-2^28.2715) <= r4  <= 0x135034fa (+2^28.2715)
MONTRED r4, r3
    //// bounds:  -0x0004550 (-2^14.1150) <= r4  <= 0x00004550 (+2^14.1150)
str.w r4, [r0, #1764]
/* computing z1 = 2x0x1 + zeta^147 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7623
mul.w r4, r4, r14
    //// bounds:  -0x6f6563d (-2^26.7996) <= r4  <= 0x06f6563d (+2^26.7996)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1aac896f (-2^28.7374) <= r4  <= 0x1aac896f (+2^28.7374)
MONTRED r4, r3
    //// bounds:  -0x0004cac (-2^14.2606) <= r4  <= 0x00004cad (+2^14.2607)
str.w r4, [r0, #1768]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1772]
ldr.w r10, [r1, #1776]
ldr.w r9, [r1, #1780]
ldr.w r8, [r1, #1784]
ldr.w r7, [r1, #1788]
ldr.w r6, [r1, #1792]
ldr.w r5, [r1, #1796]
/*** basesqr 148 ***/
/* computing z0 = x0^2 + 2*zeta^148*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7090
mul.w r4, r4, r14
    //// bounds:  -0x679b746 (-2^26.6950) <= r4  <= 0x0679b746 (+2^26.6950)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1054d0df (-2^28.0296) <= r4  <= 0x1054d0df (+2^28.0296)
MONTRED r4, r3
    //// bounds:  -0x0004254 (-2^14.0515) <= r4  <= 0x00004255 (+2^14.0516)
str.w r4, [r0, #1776]
/* computing z1 = 2x0x1 + zeta^148 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3545
mul.w r4, r4, r14
    //// bounds:  -0x33cdba3 (-2^25.6950) <= r4  <= 0x033cdba3 (+2^25.6950)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x16f30ed5 (-2^28.5204) <= r4  <= 0x16f30ed5 (+2^28.5204)
MONTRED r4, r3
    //// bounds:  -0x00048f3 (-2^14.1888) <= r4  <= 0x000048f3 (+2^14.1888)
str.w r4, [r0, #1780]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1784]
/*** basesqr 149 ***/
/* computing z0 = x0^2 + 2*zeta^149*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7090
mul.w r4, r4, r14
    //// bounds:  -0x679b746 (-2^26.6950) <= r4  <= 0x0679b746 (+2^26.6950)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1054d0df (-2^28.0296) <= r4  <= 0x1054d0df (+2^28.0296)
MONTRED r4, r3
    //// bounds:  -0x0004254 (-2^14.0515) <= r4  <= 0x00004255 (+2^14.0516)
str.w r4, [r0, #1788]
/* computing z1 = 2x0x1 + zeta^149 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3545
mul.w r4, r4, r14
    //// bounds:  -0x33cdba3 (-2^25.6950) <= r4  <= 0x033cdba3 (+2^25.6950)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x16f30ed5 (-2^28.5204) <= r4  <= 0x16f30ed5 (+2^28.5204)
MONTRED r4, r3
    //// bounds:  -0x00048f3 (-2^14.1888) <= r4  <= 0x000048f3 (+2^14.1888)
str.w r4, [r0, #1792]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1796]
ldr.w r10, [r1, #1800]
ldr.w r9, [r1, #1804]
ldr.w r8, [r1, #1808]
ldr.w r7, [r1, #1812]
ldr.w r6, [r1, #1816]
ldr.w r5, [r1, #1820]
/*** basesqr 150 ***/
/* computing z0 = x0^2 + 2*zeta^150*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7956
mul.w r4, r4, r14
    //// bounds:  -0x744321c (-2^26.8612) <= r4  <= 0x0744321c (+2^26.8612)
mla.w r4, r10, r10, r4
    //// bounds:  -0x111f4bb5 (-2^28.0978) <= r4  <= 0x111f4bb5 (+2^28.0978)
MONTRED r4, r3
    //// bounds:  -0x000431f (-2^14.0687) <= r4  <= 0x0000431f (+2^14.0687)
str.w r4, [r0, #1800]
/* computing z1 = 2x0x1 + zeta^150 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3978
mul.w r4, r4, r14
    //// bounds:  -0x3a2190e (-2^25.8612) <= r4  <= 0x03a2190e (+2^25.8612)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17584c40 (-2^28.5450) <= r4  <= 0x17584c40 (+2^28.5450)
MONTRED r4, r3
    //// bounds:  -0x0004958 (-2^14.1966) <= r4  <= 0x00004958 (+2^14.1966)
str.w r4, [r0, #1804]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1808]
/*** basesqr 151 ***/
/* computing z0 = x0^2 + 2*zeta^151*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7956
mul.w r4, r4, r14
    //// bounds:  -0x744321c (-2^26.8612) <= r4  <= 0x0744321c (+2^26.8612)
mla.w r4, r7, r7, r4
    //// bounds:  -0x111f4bb5 (-2^28.0978) <= r4  <= 0x111f4bb5 (+2^28.0978)
MONTRED r4, r3
    //// bounds:  -0x000431f (-2^14.0687) <= r4  <= 0x0000431f (+2^14.0687)
str.w r4, [r0, #1812]
/* computing z1 = 2x0x1 + zeta^151 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3978
mul.w r4, r4, r14
    //// bounds:  -0x3a2190e (-2^25.8612) <= r4  <= 0x03a2190e (+2^25.8612)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17584c40 (-2^28.5450) <= r4  <= 0x17584c40 (+2^28.5450)
MONTRED r4, r3
    //// bounds:  -0x0004958 (-2^14.1966) <= r4  <= 0x00004958 (+2^14.1966)
str.w r4, [r0, #1816]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1820]
ldr.w r10, [r1, #1824]
ldr.w r9, [r1, #1828]
ldr.w r8, [r1, #1832]
ldr.w r7, [r1, #1836]
ldr.w r6, [r1, #1840]
ldr.w r5, [r1, #1844]
/*** basesqr 152 ***/
/* computing z0 = x0^2 + 2*zeta^152*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3929
mul.w r4, r4, r14
    //// bounds:  -0x396a423 (-2^25.8434) <= r4  <= 0x0396a423 (+2^25.8434)
mla.w r4, r10, r10, r4
    //// bounds:  -0xd71bdbc (-2^27.7489) <= r4  <= 0x0d71bdbc (+2^27.7489)
MONTRED r4, r3
    //// bounds:  -0x0003f71 (-2^13.9874) <= r4  <= 0x00003f72 (+2^13.9874)
str.w r4, [r0, #1824]
/* computing z1 = 2x0x1 + zeta^152 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10836
mul.w r4, r4, r14
    //// bounds:  -0x9e591dc (-2^27.3070) <= r4  <= 0x09e591dc (+2^27.3070)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d9bc50e (-2^28.8879) <= r4  <= 0x1d9bc50e (+2^28.8879)
MONTRED r4, r3
    //// bounds:  -0x0004f9b (-2^14.3148) <= r4  <= 0x00004f9c (+2^14.3149)
str.w r4, [r0, #1828]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1832]
/*** basesqr 153 ***/
/* computing z0 = x0^2 + 2*zeta^153*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3929
mul.w r4, r4, r14
    //// bounds:  -0x396a423 (-2^25.8434) <= r4  <= 0x0396a423 (+2^25.8434)
mla.w r4, r7, r7, r4
    //// bounds:  -0xd71bdbc (-2^27.7489) <= r4  <= 0x0d71bdbc (+2^27.7489)
MONTRED r4, r3
    //// bounds:  -0x0003f71 (-2^13.9874) <= r4  <= 0x00003f72 (+2^13.9874)
str.w r4, [r0, #1836]
/* computing z1 = 2x0x1 + zeta^153 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10836
mul.w r4, r4, r14
    //// bounds:  -0x9e591dc (-2^27.3070) <= r4  <= 0x09e591dc (+2^27.3070)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d9bc50e (-2^28.8879) <= r4  <= 0x1d9bc50e (+2^28.8879)
MONTRED r4, r3
    //// bounds:  -0x0004f9b (-2^14.3148) <= r4  <= 0x00004f9c (+2^14.3149)
str.w r4, [r0, #1840]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1844]
ldr.w r10, [r1, #1848]
ldr.w r9, [r1, #1852]
ldr.w r8, [r1, #1856]
ldr.w r7, [r1, #1860]
ldr.w r6, [r1, #1864]
ldr.w r5, [r1, #1868]
/*** basesqr 154 ***/
/* computing z0 = x0^2 + 2*zeta^154*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11385
mul.w r4, r4, r14
    //// bounds:  -0xa65ee83 (-2^27.3783) <= r4  <= 0x0a65ee83 (+2^27.3783)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1441081c (-2^28.3401) <= r4  <= 0x1441081c (+2^28.3401)
MONTRED r4, r3
    //// bounds:  -0x0004641 (-2^14.1345) <= r4  <= 0x00004641 (+2^14.1345)
str.w r4, [r0, #1848]
/* computing z1 = 2x0x1 + zeta^154 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7108
mul.w r4, r4, r14
    //// bounds:  -0x67decac (-2^26.6986) <= r4  <= 0x067decac (+2^26.6986)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a341fde (-2^28.7117) <= r4  <= 0x1a341fde (+2^28.7117)
MONTRED r4, r3
    //// bounds:  -0x0004c34 (-2^14.2518) <= r4  <= 0x00004c34 (+2^14.2518)
str.w r4, [r0, #1852]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1856]
/*** basesqr 155 ***/
/* computing z0 = x0^2 + 2*zeta^155*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11385
mul.w r4, r4, r14
    //// bounds:  -0xa65ee83 (-2^27.3783) <= r4  <= 0x0a65ee83 (+2^27.3783)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1441081c (-2^28.3401) <= r4  <= 0x1441081c (+2^28.3401)
MONTRED r4, r3
    //// bounds:  -0x0004641 (-2^14.1345) <= r4  <= 0x00004641 (+2^14.1345)
str.w r4, [r0, #1860]
/* computing z1 = 2x0x1 + zeta^155 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7108
mul.w r4, r4, r14
    //// bounds:  -0x67decac (-2^26.6986) <= r4  <= 0x067decac (+2^26.6986)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a341fde (-2^28.7117) <= r4  <= 0x1a341fde (+2^28.7117)
MONTRED r4, r3
    //// bounds:  -0x0004c34 (-2^14.2518) <= r4  <= 0x00004c34 (+2^14.2518)
str.w r4, [r0, #1864]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1868]
ldr.w r10, [r1, #1872]
ldr.w r9, [r1, #1876]
ldr.w r8, [r1, #1880]
ldr.w r7, [r1, #1884]
ldr.w r6, [r1, #1888]
ldr.w r5, [r1, #1892]
/*** basesqr 156 ***/
/* computing z0 = x0^2 + 2*zeta^156*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4962
mul.w r4, r4, r14
    //// bounds:  -0x4882ad6 (-2^26.1801) <= r4  <= 0x04882ad6 (+2^26.1801)
mla.w r4, r10, r10, r4
    //// bounds:  -0xe63446f (-2^27.8468) <= r4  <= 0x0e63446f (+2^27.8468)
MONTRED r4, r3
    //// bounds:  -0x0004063 (-2^14.0087) <= r4  <= 0x00004063 (+2^14.0087)
str.w r4, [r0, #1872]
/* computing z1 = 2x0x1 + zeta^156 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2481
mul.w r4, r4, r14
    //// bounds:  -0x244156b (-2^25.1801) <= r4  <= 0x0244156b (+2^25.1801)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x15fa489d (-2^28.4580) <= r4  <= 0x15fa489d (+2^28.4580)
MONTRED r4, r3
    //// bounds:  -0x00047fa (-2^14.1695) <= r4  <= 0x000047fa (+2^14.1695)
str.w r4, [r0, #1876]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1880]
/*** basesqr 157 ***/
/* computing z0 = x0^2 + 2*zeta^157*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4962
mul.w r4, r4, r14
    //// bounds:  -0x4882ad6 (-2^26.1801) <= r4  <= 0x04882ad6 (+2^26.1801)
mla.w r4, r7, r7, r4
    //// bounds:  -0xe63446f (-2^27.8468) <= r4  <= 0x0e63446f (+2^27.8468)
MONTRED r4, r3
    //// bounds:  -0x0004063 (-2^14.0087) <= r4  <= 0x00004063 (+2^14.0087)
str.w r4, [r0, #1884]
/* computing z1 = 2x0x1 + zeta^157 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2481
mul.w r4, r4, r14
    //// bounds:  -0x244156b (-2^25.1801) <= r4  <= 0x0244156b (+2^25.1801)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x15fa489d (-2^28.4580) <= r4  <= 0x15fa489d (+2^28.4580)
MONTRED r4, r3
    //// bounds:  -0x00047fa (-2^14.1695) <= r4  <= 0x000047fa (+2^14.1695)
str.w r4, [r0, #1888]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1892]
ldr.w r10, [r1, #1896]
ldr.w r9, [r1, #1900]
ldr.w r8, [r1, #1904]
ldr.w r7, [r1, #1908]
ldr.w r6, [r1, #1912]
ldr.w r5, [r1, #1916]
/*** basesqr 158 ***/
/* computing z0 = x0^2 + 2*zeta^158*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =289
mul.w r4, r4, r14
    //// bounds:  -0x043923b (-2^22.0783) <= r4  <= 0x0043923b (+2^22.0783)
mla.w r4, r10, r10, r4
    //// bounds:  -0xa1eabd4 (-2^27.3391) <= r4  <= 0x0a1eabd4 (+2^27.3391)
MONTRED r4, r3
    //// bounds:  -0x0003c1e (-2^13.9097) <= r4  <= 0x00003c1f (+2^13.9098)
str.w r4, [r0, #1896]
/* computing z1 = 2x0x1 + zeta^158 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12656
mul.w r4, r4, r14
    //// bounds:  -0xb8f1ad0 (-2^27.5309) <= r4  <= 0x0b8f1ad0 (+2^27.5309)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1f454e02 (-2^28.9667) <= r4  <= 0x1f454e02 (+2^28.9667)
MONTRED r4, r3
    //// bounds:  -0x0005145 (-2^14.3446) <= r4  <= 0x00005145 (+2^14.3446)
str.w r4, [r0, #1900]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1904]
/*** basesqr 159 ***/
/* computing z0 = x0^2 + 2*zeta^159*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-289
mul.w r4, r4, r14
    //// bounds:  -0x043923b (-2^22.0783) <= r4  <= 0x0043923b (+2^22.0783)
mla.w r4, r7, r7, r4
    //// bounds:  -0xa1eabd4 (-2^27.3391) <= r4  <= 0x0a1eabd4 (+2^27.3391)
MONTRED r4, r3
    //// bounds:  -0x0003c1e (-2^13.9097) <= r4  <= 0x00003c1f (+2^13.9098)
str.w r4, [r0, #1908]
/* computing z1 = 2x0x1 + zeta^159 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12656
mul.w r4, r4, r14
    //// bounds:  -0xb8f1ad0 (-2^27.5309) <= r4  <= 0x0b8f1ad0 (+2^27.5309)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1f454e02 (-2^28.9667) <= r4  <= 0x1f454e02 (+2^28.9667)
MONTRED r4, r3
    //// bounds:  -0x0005145 (-2^14.3446) <= r4  <= 0x00005145 (+2^14.3446)
str.w r4, [r0, #1912]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1916]
ldr.w r10, [r1, #1920]
ldr.w r9, [r1, #1924]
ldr.w r8, [r1, #1928]
ldr.w r7, [r1, #1932]
ldr.w r6, [r1, #1936]
ldr.w r5, [r1, #1940]
/*** basesqr 160 ***/
/* computing z0 = x0^2 + 2*zeta^160*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8430
mul.w r4, r4, r14
    //// bounds:  -0x7b3059a (-2^26.9447) <= r4  <= 0x07b3059a (+2^26.9447)
mla.w r4, r10, r10, r4
    //// bounds:  -0x118e1f33 (-2^28.1338) <= r4  <= 0x118e1f33 (+2^28.1338)
MONTRED r4, r3
    //// bounds:  -0x000438e (-2^14.0780) <= r4  <= 0x0000438e (+2^14.0780)
str.w r4, [r0, #1920]
/* computing z1 = 2x0x1 + zeta^160 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4215
mul.w r4, r4, r14
    //// bounds:  -0x3d982cd (-2^25.9447) <= r4  <= 0x03d982cd (+2^25.9447)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x178fb5ff (-2^28.5584) <= r4  <= 0x178fb5ff (+2^28.5584)
MONTRED r4, r3
    //// bounds:  -0x000498f (-2^14.2008) <= r4  <= 0x00004990 (+2^14.2009)
str.w r4, [r0, #1924]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1928]
/*** basesqr 161 ***/
/* computing z0 = x0^2 + 2*zeta^161*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8430
mul.w r4, r4, r14
    //// bounds:  -0x7b3059a (-2^26.9447) <= r4  <= 0x07b3059a (+2^26.9447)
mla.w r4, r7, r7, r4
    //// bounds:  -0x118e1f33 (-2^28.1338) <= r4  <= 0x118e1f33 (+2^28.1338)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x000438e (-2^14.0780) <= r4  <= 0x0000438e (+2^14.0780)
str.w r4, [r0, #1932]
/* computing z1 = 2x0x1 + zeta^161 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4215
mul.w r4, r4, r14
    //// bounds:  -0x3d982cd (-2^25.9447) <= r4  <= 0x03d982cd (+2^25.9447)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x178fb5ff (-2^28.5584) <= r4  <= 0x178fb5ff (+2^28.5584)
MONTRED r4, r3
    //// bounds:  -0x000498f (-2^14.2008) <= r4  <= 0x00004990 (+2^14.2009)
str.w r4, [r0, #1936]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1940]
ldr.w r10, [r1, #1944]
ldr.w r9, [r1, #1948]
ldr.w r8, [r1, #1952]
ldr.w r7, [r1, #1956]
ldr.w r6, [r1, #1960]
ldr.w r5, [r1, #1964]
/*** basesqr 162 ***/
/* computing z0 = x0^2 + 2*zeta^162*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8053
mul.w r4, r4, r14
    //// bounds:  -0x75ae017 (-2^26.8787) <= r4  <= 0x075ae017 (+2^26.8787)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1135f9b0 (-2^28.1052) <= r4  <= 0x1135f9b0 (+2^28.1052)
MONTRED r4, r3
    //// bounds:  -0x0004336 (-2^14.0706) <= r4  <= 0x00004336 (+2^14.0706)
str.w r4, [r0, #1944]
/* computing z1 = 2x0x1 + zeta^162 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8774
mul.w r4, r4, r14
    //// bounds:  -0x80373e2 (-2^27.0024) <= r4  <= 0x080373e2 (+2^27.0024)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1bb9a714 (-2^28.7931) <= r4  <= 0x1bb9a714 (+2^28.7931)
MONTRED r4, r3
    //// bounds:  -0x0004db9 (-2^14.2803) <= r4  <= 0x00004dba (+2^14.2803)
str.w r4, [r0, #1948]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1952]
/*** basesqr 163 ***/
/* computing z0 = x0^2 + 2*zeta^163*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8053
mul.w r4, r4, r14
    //// bounds:  -0x75ae017 (-2^26.8787) <= r4  <= 0x075ae017 (+2^26.8787)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1135f9b0 (-2^28.1052) <= r4  <= 0x1135f9b0 (+2^28.1052)
MONTRED r4, r3
    //// bounds:  -0x0004336 (-2^14.0706) <= r4  <= 0x00004336 (+2^14.0706)
str.w r4, [r0, #1956]
/* computing z1 = 2x0x1 + zeta^163 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8774
mul.w r4, r4, r14
    //// bounds:  -0x80373e2 (-2^27.0024) <= r4  <= 0x080373e2 (+2^27.0024)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1bb9a714 (-2^28.7931) <= r4  <= 0x1bb9a714 (+2^28.7931)
MONTRED r4, r3
    //// bounds:  -0x0004db9 (-2^14.2803) <= r4  <= 0x00004dba (+2^14.2803)
str.w r4, [r0, #1960]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1964]
ldr.w r10, [r1, #1968]
ldr.w r9, [r1, #1972]
ldr.w r8, [r1, #1976]
ldr.w r7, [r1, #1980]
ldr.w r6, [r1, #1984]
ldr.w r5, [r1, #1988]
/*** basesqr 164 ***/
/* computing z0 = x0^2 + 2*zeta^164*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7331
mul.w r4, r4, r14
    //// bounds:  -0x6b21071 (-2^26.7432) <= r4  <= 0x06b21071 (+2^26.7432)
mla.w r4, r10, r10, r4
    //// bounds:  -0x108d2a0a (-2^28.0489) <= r4  <= 0x108d2a0a (+2^28.0489)
MONTRED r4, r3
    //// bounds:  -0x000428d (-2^14.0564) <= r4  <= 0x0000428d (+2^14.0564)
str.w r4, [r0, #1968]
/* computing z1 = 2x0x1 + zeta^164 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9135
mul.w r4, r4, r14
    //// bounds:  -0x857dbb5 (-2^27.0606) <= r4  <= 0x0857dbb5 (+2^27.0606)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c0e0ee7 (-2^28.8102) <= r4  <= 0x1c0e0ee7 (+2^28.8102)
MONTRED r4, r3
    //// bounds:  -0x0004e0e (-2^14.2864) <= r4  <= 0x00004e0e (+2^14.2864)
str.w r4, [r0, #1972]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1976]
/*** basesqr 165 ***/
/* computing z0 = x0^2 + 2*zeta^165*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7331
mul.w r4, r4, r14
    //// bounds:  -0x6b21071 (-2^26.7432) <= r4  <= 0x06b21071 (+2^26.7432)
mla.w r4, r7, r7, r4
    //// bounds:  -0x108d2a0a (-2^28.0489) <= r4  <= 0x108d2a0a (+2^28.0489)
MONTRED r4, r3
    //// bounds:  -0x000428d (-2^14.0564) <= r4  <= 0x0000428d (+2^14.0564)
str.w r4, [r0, #1980]
/* computing z1 = 2x0x1 + zeta^165 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9135
mul.w r4, r4, r14
    //// bounds:  -0x857dbb5 (-2^27.0606) <= r4  <= 0x0857dbb5 (+2^27.0606)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1c0e0ee7 (-2^28.8102) <= r4  <= 0x1c0e0ee7 (+2^28.8102)
MONTRED r4, r3
    //// bounds:  -0x0004e0e (-2^14.2864) <= r4  <= 0x00004e0e (+2^14.2864)
str.w r4, [r0, #1984]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1988]
ldr.w r10, [r1, #1992]
ldr.w r9, [r1, #1996]
ldr.w r8, [r1, #2000]
ldr.w r7, [r1, #2004]
ldr.w r6, [r1, #2008]
ldr.w r5, [r1, #2012]
/*** basesqr 166 ***/
/* computing z0 = x0^2 + 2*zeta^166*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4686
mul.w r4, r4, r14
    //// bounds:  -0x447a2ba (-2^26.0976) <= r4  <= 0x0447a2ba (+2^26.0976)
mla.w r4, r10, r10, r4
    //// bounds:  -0xe22bc53 (-2^27.8213) <= r4  <= 0x0e22bc53 (+2^27.8213)
MONTRED r4, r3
    //// bounds:  -0x0004022 (-2^14.0030) <= r4  <= 0x00004023 (+2^14.0031)
str.w r4, [r0, #1992]
/* computing z1 = 2x0x1 + zeta^166 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2343
mul.w r4, r4, r14
    //// bounds:  -0x223d15d (-2^25.0976) <= r4  <= 0x0223d15d (+2^25.0976)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x15da048f (-2^28.4497) <= r4  <= 0x15da048f (+2^28.4497)
MONTRED r4, r3
    //// bounds:  -0x00047da (-2^14.1669) <= r4  <= 0x000047da (+2^14.1669)
str.w r4, [r0, #1996]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2000]
/*** basesqr 167 ***/
/* computing z0 = x0^2 + 2*zeta^167*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4686
mul.w r4, r4, r14
    //// bounds:  -0x447a2ba (-2^26.0976) <= r4  <= 0x0447a2ba (+2^26.0976)
mla.w r4, r7, r7, r4
    //// bounds:  -0xe22bc53 (-2^27.8213) <= r4  <= 0x0e22bc53 (+2^27.8213)
MONTRED r4, r3
    //// bounds:  -0x0004022 (-2^14.0030) <= r4  <= 0x00004023 (+2^14.0031)
str.w r4, [r0, #2004]
/* computing z1 = 2x0x1 + zeta^167 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2343
mul.w r4, r4, r14
    //// bounds:  -0x223d15d (-2^25.0976) <= r4  <= 0x0223d15d (+2^25.0976)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x15da048f (-2^28.4497) <= r4  <= 0x15da048f (+2^28.4497)
MONTRED r4, r3
    //// bounds:  -0x00047da (-2^14.1669) <= r4  <= 0x000047da (+2^14.1669)
str.w r4, [r0, #2008]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2012]
ldr.w r10, [r1, #2016]
ldr.w r9, [r1, #2020]
ldr.w r8, [r1, #2024]
ldr.w r7, [r1, #2028]
ldr.w r6, [r1, #2032]
ldr.w r5, [r1, #2036]
/*** basesqr 168 ***/
/* computing z0 = x0^2 + 2*zeta^168*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =22
mul.w r4, r4, r14
    //// bounds:  -0x00524d2 (-2^18.3628) <= r4  <= 0x000524d2 (+2^18.3628)
mla.w r4, r10, r10, r4
    //// bounds:  -0x9e03e6b (-2^27.3039) <= r4  <= 0x09e03e6b (+2^27.3039)
MONTRED r4, r3
    //// bounds:  -0x0003be0 (-2^13.9039) <= r4  <= 0x00003be0 (+2^13.9039)
str.w r4, [r0, #2016]
/* computing z1 = 2x0x1 + zeta^168 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11
mul.w r4, r4, r14
    //// bounds:  -0x0029269 (-2^17.3628) <= r4  <= 0x00029269 (+2^17.3628)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13b8c59b (-2^28.3017) <= r4  <= 0x13b8c59b (+2^28.3017)
MONTRED r4, r3
    //// bounds:  -0x00045b8 (-2^14.1235) <= r4  <= 0x000045b9 (+2^14.1236)
str.w r4, [r0, #2020]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2024]
/*** basesqr 169 ***/
/* computing z0 = x0^2 + 2*zeta^169*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-22
mul.w r4, r4, r14
    //// bounds:  -0x00524d2 (-2^18.3628) <= r4  <= 0x000524d2 (+2^18.3628)
mla.w r4, r7, r7, r4
    //// bounds:  -0x9e03e6b (-2^27.3039) <= r4  <= 0x09e03e6b (+2^27.3039)
MONTRED r4, r3
    //// bounds:  -0x0003be0 (-2^13.9039) <= r4  <= 0x00003be0 (+2^13.9039)
str.w r4, [r0, #2028]
/* computing z1 = 2x0x1 + zeta^169 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11
mul.w r4, r4, r14
    //// bounds:  -0x0029269 (-2^17.3628) <= r4  <= 0x00029269 (+2^17.3628)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13b8c59b (-2^28.3017) <= r4  <= 0x13b8c59b (+2^28.3017)
MONTRED r4, r3
    //// bounds:  -0x00045b8 (-2^14.1235) <= r4  <= 0x000045b9 (+2^14.1236)
str.w r4, [r0, #2032]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2036]
ldr.w r10, [r1, #2040]
ldr.w r9, [r1, #2044]
ldr.w r8, [r1, #2048]
ldr.w r7, [r1, #2052]
ldr.w r6, [r1, #2056]
ldr.w r5, [r1, #2060]
/*** basesqr 170 ***/
/* computing z0 = x0^2 + 2*zeta^170*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3520
mul.w r4, r4, r14
    //// bounds:  -0x3370340 (-2^25.6848) <= r4  <= 0x03370340 (+2^25.6848)
mla.w r4, r10, r10, r4
    //// bounds:  -0xd121cd9 (-2^27.7083) <= r4  <= 0x0d121cd9 (+2^27.7083)
MONTRED r4, r3
    //// bounds:  -0x0003f12 (-2^13.9789) <= r4  <= 0x00003f12 (+2^13.9789)
str.w r4, [r0, #2040]
/* computing z1 = 2x0x1 + zeta^170 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1760
mul.w r4, r4, r14
    //// bounds:  -0x19b81a0 (-2^24.6848) <= r4  <= 0x019b81a0 (+2^24.6848)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1551b4d2 (-2^28.4141) <= r4  <= 0x1551b4d2 (+2^28.4141)
MONTRED r4, r3
    //// bounds:  -0x0004751 (-2^14.1562) <= r4  <= 0x00004752 (+2^14.1562)
str.w r4, [r0, #2044]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2048]
/*** basesqr 171 ***/
/* computing z0 = x0^2 + 2*zeta^171*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3520
mul.w r4, r4, r14
    //// bounds:  -0x3370340 (-2^25.6848) <= r4  <= 0x03370340 (+2^25.6848)
mla.w r4, r7, r7, r4
    //// bounds:  -0xd121cd9 (-2^27.7083) <= r4  <= 0x0d121cd9 (+2^27.7083)
MONTRED r4, r3
    //// bounds:  -0x0003f12 (-2^13.9789) <= r4  <= 0x00003f12 (+2^13.9789)
str.w r4, [r0, #2052]
/* computing z1 = 2x0x1 + zeta^171 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1760
mul.w r4, r4, r14
    //// bounds:  -0x19b81a0 (-2^24.6848) <= r4  <= 0x019b81a0 (+2^24.6848)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1551b4d2 (-2^28.4141) <= r4  <= 0x1551b4d2 (+2^28.4141)
MONTRED r4, r3
    //// bounds:  -0x0004751 (-2^14.1562) <= r4  <= 0x00004752 (+2^14.1562)
str.w r4, [r0, #2056]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2060]
ldr.w r10, [r1, #2064]
ldr.w r9, [r1, #2068]
ldr.w r8, [r1, #2072]
ldr.w r7, [r1, #2076]
ldr.w r6, [r1, #2080]
ldr.w r5, [r1, #2084]
/*** basesqr 172 ***/
/* computing z0 = x0^2 + 2*zeta^172*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =321
mul.w r4, r4, r14
    //// bounds:  -0x04b0d9b (-2^22.2298) <= r4  <= 0x004b0d9b (+2^22.2298)
mla.w r4, r10, r10, r4
    //// bounds:  -0xa262734 (-2^27.3433) <= r4  <= 0x0a262734 (+2^27.3433)
MONTRED r4, r3
    //// bounds:  -0x0003c26 (-2^13.9105) <= r4  <= 0x00003c26 (+2^13.9105)
str.w r4, [r0, #2064]
/* computing z1 = 2x0x1 + zeta^172 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12640
mul.w r4, r4, r14
    //// bounds:  -0xb8b5d20 (-2^27.5291) <= r4  <= 0x0b8b5d20 (+2^27.5291)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1f419052 (-2^28.9661) <= r4  <= 0x1f419052 (+2^28.9661)
MONTRED r4, r3
    //// bounds:  -0x0005141 (-2^14.3444) <= r4  <= 0x00005142 (+2^14.3444)
str.w r4, [r0, #2068]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2072]
/*** basesqr 173 ***/
/* computing z0 = x0^2 + 2*zeta^173*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-321
mul.w r4, r4, r14
    //// bounds:  -0x04b0d9b (-2^22.2298) <= r4  <= 0x004b0d9b (+2^22.2298)
mla.w r4, r7, r7, r4
    //// bounds:  -0xa262734 (-2^27.3433) <= r4  <= 0x0a262734 (+2^27.3433)
MONTRED r4, r3
    //// bounds:  -0x0003c26 (-2^13.9105) <= r4  <= 0x00003c26 (+2^13.9105)
str.w r4, [r0, #2076]
/* computing z1 = 2x0x1 + zeta^173 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12640
mul.w r4, r4, r14
    //// bounds:  -0xb8b5d20 (-2^27.5291) <= r4  <= 0x0b8b5d20 (+2^27.5291)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1f419052 (-2^28.9661) <= r4  <= 0x1f419052 (+2^28.9661)
MONTRED r4, r3
    //// bounds:  -0x0005141 (-2^14.3444) <= r4  <= 0x00005142 (+2^14.3444)
str.w r4, [r0, #2080]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2084]
ldr.w r10, [r1, #2088]
ldr.w r9, [r1, #2092]
ldr.w r8, [r1, #2096]
ldr.w r7, [r1, #2100]
ldr.w r6, [r1, #2104]
ldr.w r5, [r1, #2108]
/*** basesqr 174 ***/
/* computing z0 = x0^2 + 2*zeta^174*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =158
mul.w r4, r4, r14
    //// bounds:  -0x024f12a (-2^21.2072) <= r4  <= 0x0024f12a (+2^21.2072)
mla.w r4, r10, r10, r4
    //// bounds:  -0xa000ac3 (-2^27.3220) <= r4  <= 0x0a000ac3 (+2^27.3220)
MONTRED r4, r3
    //// bounds:  -0x0003c00 (-2^13.9069) <= r4  <= 0x00003c00 (+2^13.9069)
str.w r4, [r0, #2088]
/* computing z1 = 2x0x1 + zeta^174 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =79
mul.w r4, r4, r14
    //// bounds:  -0x0127895 (-2^20.2072) <= r4  <= 0x00127895 (+2^20.2072)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13c8abc7 (-2^28.3063) <= r4  <= 0x13c8abc7 (+2^28.3063)
MONTRED r4, r3
    //// bounds:  -0x00045c8 (-2^14.1248) <= r4  <= 0x000045c9 (+2^14.1248)
str.w r4, [r0, #2092]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2096]
/*** basesqr 175 ***/
/* computing z0 = x0^2 + 2*zeta^175*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-158
mul.w r4, r4, r14
    //// bounds:  -0x024f12a (-2^21.2072) <= r4  <= 0x0024f12a (+2^21.2072)
mla.w r4, r7, r7, r4
    //// bounds:  -0xa000ac3 (-2^27.3220) <= r4  <= 0x0a000ac3 (+2^27.3220)
MONTRED r4, r3
    //// bounds:  -0x0003c00 (-2^13.9069) <= r4  <= 0x00003c00 (+2^13.9069)
str.w r4, [r0, #2100]
/* computing z1 = 2x0x1 + zeta^175 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-79
mul.w r4, r4, r14
    //// bounds:  -0x0127895 (-2^20.2072) <= r4  <= 0x00127895 (+2^20.2072)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13c8abc7 (-2^28.3063) <= r4  <= 0x13c8abc7 (+2^28.3063)
MONTRED r4, r3
    //// bounds:  -0x00045c8 (-2^14.1248) <= r4  <= 0x000045c9 (+2^14.1248)
str.w r4, [r0, #2104]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2108]
ldr.w r10, [r1, #2112]
ldr.w r9, [r1, #2116]
ldr.w r8, [r1, #2120]
ldr.w r7, [r1, #2124]
ldr.w r6, [r1, #2128]
ldr.w r5, [r1, #2132]
/*** basesqr 176 ***/
/* computing z0 = x0^2 + 2*zeta^176*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4697
mul.w r4, r4, r14
    //// bounds:  -0x44a3523 (-2^26.1009) <= r4  <= 0x044a3523 (+2^26.1009)
mla.w r4, r10, r10, r4
    //// bounds:  -0xe254ebc (-2^27.8223) <= r4  <= 0x0e254ebc (+2^27.8223)
MONTRED r4, r3
    //// bounds:  -0x0004025 (-2^14.0033) <= r4  <= 0x00004025 (+2^14.0033)
str.w r4, [r0, #2112]
/* computing z1 = 2x0x1 + zeta^176 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10452
mul.w r4, r4, r14
    //// bounds:  -0x98bc95c (-2^27.2549) <= r4  <= 0x098bc95c (+2^27.2549)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d41fc8e (-2^28.8707) <= r4  <= 0x1d41fc8e (+2^28.8707)
MONTRED r4, r3
    //// bounds:  -0x0004f42 (-2^14.3085) <= r4  <= 0x00004f42 (+2^14.3085)
str.w r4, [r0, #2116]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2120]
/*** basesqr 177 ***/
/* computing z0 = x0^2 + 2*zeta^177*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4697
mul.w r4, r4, r14
    //// bounds:  -0x44a3523 (-2^26.1009) <= r4  <= 0x044a3523 (+2^26.1009)
mla.w r4, r7, r7, r4
    //// bounds:  -0xe254ebc (-2^27.8223) <= r4  <= 0x0e254ebc (+2^27.8223)
MONTRED r4, r3
    //// bounds:  -0x0004025 (-2^14.0033) <= r4  <= 0x00004025 (+2^14.0033)
str.w r4, [r0, #2124]
/* computing z1 = 2x0x1 + zeta^177 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10452
mul.w r4, r4, r14
    //// bounds:  -0x98bc95c (-2^27.2549) <= r4  <= 0x098bc95c (+2^27.2549)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d41fc8e (-2^28.8707) <= r4  <= 0x1d41fc8e (+2^28.8707)
MONTRED r4, r3
    //// bounds:  -0x0004f42 (-2^14.3085) <= r4  <= 0x00004f42 (+2^14.3085)
str.w r4, [r0, #2128]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2132]
ldr.w r10, [r1, #2136]
ldr.w r9, [r1, #2140]
ldr.w r8, [r1, #2144]
ldr.w r7, [r1, #2148]
ldr.w r6, [r1, #2152]
ldr.w r5, [r1, #2156]
/*** basesqr 178 ***/
/* computing z0 = x0^2 + 2*zeta^178*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9091
mul.w r4, r4, r14
    //// bounds:  -0x84d9211 (-2^27.0536) <= r4  <= 0x084d9211 (+2^27.0536)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1228abaa (-2^28.1826) <= r4  <= 0x1228abaa (+2^28.1826)
MONTRED r4, r3
    //// bounds:  -0x0004428 (-2^14.0908) <= r4  <= 0x00004429 (+2^14.0909)
str.w r4, [r0, #2136]
/* computing z1 = 2x0x1 + zeta^178 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8255
mul.w r4, r4, r14
    //// bounds:  -0x78a1ae5 (-2^26.9145) <= r4  <= 0x078a1ae5 (+2^26.9145)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b404e17 (-2^28.7682) <= r4  <= 0x1b404e17 (+2^28.7682)
MONTRED r4, r3
    //// bounds:  -0x0004d40 (-2^14.2715) <= r4  <= 0x00004d40 (+2^14.2715)
str.w r4, [r0, #2140]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2144]
/*** basesqr 179 ***/
/* computing z0 = x0^2 + 2*zeta^179*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9091
mul.w r4, r4, r14
    //// bounds:  -0x84d9211 (-2^27.0536) <= r4  <= 0x084d9211 (+2^27.0536)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1228abaa (-2^28.1826) <= r4  <= 0x1228abaa (+2^28.1826)
MONTRED r4, r3
    //// bounds:  -0x0004428 (-2^14.0908) <= r4  <= 0x00004429 (+2^14.0909)
str.w r4, [r0, #2148]
/* computing z1 = 2x0x1 + zeta^179 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8255
mul.w r4, r4, r14
    //// bounds:  -0x78a1ae5 (-2^26.9145) <= r4  <= 0x078a1ae5 (+2^26.9145)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b404e17 (-2^28.7682) <= r4  <= 0x1b404e17 (+2^28.7682)
MONTRED r4, r3
    //// bounds:  -0x0004d40 (-2^14.2715) <= r4  <= 0x00004d40 (+2^14.2715)
str.w r4, [r0, #2152]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2156]
ldr.w r10, [r1, #2160]
ldr.w r9, [r1, #2164]
ldr.w r8, [r1, #2168]
ldr.w r7, [r1, #2172]
ldr.w r6, [r1, #2176]
ldr.w r5, [r1, #2180]
/*** basesqr 180 ***/
/* computing z0 = x0^2 + 2*zeta^180*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4531
mul.w r4, r4, r14
    //// bounds:  -0x4236521 (-2^26.0490) <= r4  <= 0x04236521 (+2^26.0490)
mla.w r4, r10, r10, r4
    //// bounds:  -0xdfe7eba (-2^27.8067) <= r4  <= 0x0dfe7eba (+2^27.8067)
MONTRED r4, r3
    //// bounds:  -0x0003ffe (-2^13.9998) <= r4  <= 0x00003ffe (+2^13.9998)
str.w r4, [r0, #2160]
/* computing z1 = 2x0x1 + zeta^180 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10535
mul.w r4, r4, r14
    //// bounds:  -0x99f315d (-2^27.2663) <= r4  <= 0x099f315d (+2^27.2663)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d55648f (-2^28.8745) <= r4  <= 0x1d55648f (+2^28.8745)
MONTRED r4, r3
    //// bounds:  -0x0004f55 (-2^14.3098) <= r4  <= 0x00004f55 (+2^14.3098)
str.w r4, [r0, #2164]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2168]
/*** basesqr 181 ***/
/* computing z0 = x0^2 + 2*zeta^181*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4531
mul.w r4, r4, r14
    //// bounds:  -0x4236521 (-2^26.0490) <= r4  <= 0x04236521 (+2^26.0490)
mla.w r4, r7, r7, r4
    //// bounds:  -0xdfe7eba (-2^27.8067) <= r4  <= 0x0dfe7eba (+2^27.8067)
MONTRED r4, r3
    //// bounds:  -0x0003ffe (-2^13.9998) <= r4  <= 0x00003ffe (+2^13.9998)
str.w r4, [r0, #2172]
/* computing z1 = 2x0x1 + zeta^181 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10535
mul.w r4, r4, r14
    //// bounds:  -0x99f315d (-2^27.2663) <= r4  <= 0x099f315d (+2^27.2663)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d55648f (-2^28.8745) <= r4  <= 0x1d55648f (+2^28.8745)
MONTRED r4, r3
    //// bounds:  -0x0004f55 (-2^14.3098) <= r4  <= 0x00004f55 (+2^14.3098)
str.w r4, [r0, #2176]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2180]
ldr.w r10, [r1, #2184]
ldr.w r9, [r1, #2188]
ldr.w r8, [r1, #2192]
ldr.w r7, [r1, #2196]
ldr.w r6, [r1, #2200]
ldr.w r5, [r1, #2204]
/*** basesqr 182 ***/
/* computing z0 = x0^2 + 2*zeta^182*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8132
mul.w r4, r4, r14
    //// bounds:  -0x76d58ac (-2^26.8928) <= r4  <= 0x076d58ac (+2^26.8928)
mla.w r4, r10, r10, r4
    //// bounds:  -0x11487245 (-2^28.1113) <= r4  <= 0x11487245 (+2^28.1113)
MONTRED r4, r3
    //// bounds:  -0x0004348 (-2^14.0721) <= r4  <= 0x00004348 (+2^14.0721)
str.w r4, [r0, #2184]
/* computing z1 = 2x0x1 + zeta^182 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4066
mul.w r4, r4, r14
    //// bounds:  -0x3b6ac56 (-2^25.8928) <= r4  <= 0x03b6ac56 (+2^25.8928)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x176cdf88 (-2^28.5500) <= r4  <= 0x176cdf88 (+2^28.5500)
MONTRED r4, r3
    //// bounds:  -0x000496c (-2^14.1981) <= r4  <= 0x0000496d (+2^14.1982)
str.w r4, [r0, #2188]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2192]
/*** basesqr 183 ***/
/* computing z0 = x0^2 + 2*zeta^183*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8132
mul.w r4, r4, r14
    //// bounds:  -0x76d58ac (-2^26.8928) <= r4  <= 0x076d58ac (+2^26.8928)
mla.w r4, r7, r7, r4
    //// bounds:  -0x11487245 (-2^28.1113) <= r4  <= 0x11487245 (+2^28.1113)
MONTRED r4, r3
    //// bounds:  -0x0004348 (-2^14.0721) <= r4  <= 0x00004348 (+2^14.0721)
str.w r4, [r0, #2196]
/* computing z1 = 2x0x1 + zeta^183 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4066
mul.w r4, r4, r14
    //// bounds:  -0x3b6ac56 (-2^25.8928) <= r4  <= 0x03b6ac56 (+2^25.8928)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x176cdf88 (-2^28.5500) <= r4  <= 0x176cdf88 (+2^28.5500)
MONTRED r4, r3
    //// bounds:  -0x000496c (-2^14.1981) <= r4  <= 0x0000496d (+2^14.1982)
str.w r4, [r0, #2200]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2204]
ldr.w r10, [r1, #2208]
ldr.w r9, [r1, #2212]
ldr.w r8, [r1, #2216]
ldr.w r7, [r1, #2220]
ldr.w r6, [r1, #2224]
ldr.w r5, [r1, #2228]
/*** basesqr 184 ***/
/* computing z0 = x0^2 + 2*zeta^184*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9293
mul.w r4, r4, r14
    //// bounds:  -0x87cccdf (-2^27.0853) <= r4  <= 0x087cccdf (+2^27.0853)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1257e678 (-2^28.1972) <= r4  <= 0x1257e678 (+2^28.1972)
MONTRED r4, r3
    //// bounds:  -0x0004458 (-2^14.0947) <= r4  <= 0x00004458 (+2^14.0947)
str.w r4, [r0, #2208]
/* computing z1 = 2x0x1 + zeta^184 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8154
mul.w r4, r4, r14
    //// bounds:  -0x7727d7e (-2^26.8967) <= r4  <= 0x07727d7e (+2^26.8967)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b28b0b0 (-2^28.7634) <= r4  <= 0x1b28b0b0 (+2^28.7634)
MONTRED r4, r3
    //// bounds:  -0x0004d28 (-2^14.2697) <= r4  <= 0x00004d29 (+2^14.2698)
str.w r4, [r0, #2212]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2216]
/*** basesqr 185 ***/
/* computing z0 = x0^2 + 2*zeta^185*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9293
mul.w r4, r4, r14
    //// bounds:  -0x87cccdf (-2^27.0853) <= r4  <= 0x087cccdf (+2^27.0853)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1257e678 (-2^28.1972) <= r4  <= 0x1257e678 (+2^28.1972)
MONTRED r4, r3
    //// bounds:  -0x0004458 (-2^14.0947) <= r4  <= 0x00004458 (+2^14.0947)
str.w r4, [r0, #2220]
/* computing z1 = 2x0x1 + zeta^185 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8154
mul.w r4, r4, r14
    //// bounds:  -0x7727d7e (-2^26.8967) <= r4  <= 0x07727d7e (+2^26.8967)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b28b0b0 (-2^28.7634) <= r4  <= 0x1b28b0b0 (+2^28.7634)
MONTRED r4, r3
    //// bounds:  -0x0004d28 (-2^14.2697) <= r4  <= 0x00004d29 (+2^14.2698)
str.w r4, [r0, #2224]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2228]
ldr.w r10, [r1, #2232]
ldr.w r9, [r1, #2236]
ldr.w r8, [r1, #2240]
ldr.w r7, [r1, #2244]
ldr.w r6, [r1, #2248]
ldr.w r5, [r1, #2252]
/*** basesqr 186 ***/
/* computing z0 = x0^2 + 2*zeta^186*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2022
mul.w r4, r4, r14
    //// bounds:  -0x1d8c3c2 (-2^24.8850) <= r4  <= 0x01d8c3c2 (+2^24.8850)
mla.w r4, r10, r10, r4
    //// bounds:  -0xbb3dd5b (-2^27.5488) <= r4  <= 0x0bb3dd5b (+2^27.5488)
MONTRED r4, r3
    //// bounds:  -0x0003db3 (-2^13.9472) <= r4  <= 0x00003db4 (+2^13.9473)
str.w r4, [r0, #2232]
/* computing z1 = 2x0x1 + zeta^186 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1011
mul.w r4, r4, r14
    //// bounds:  -0x0ec61e1 (-2^23.8850) <= r4  <= 0x00ec61e1 (+2^23.8850)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x14a29513 (-2^28.3670) <= r4  <= 0x14a29513 (+2^28.3670)
MONTRED r4, r3
    //// bounds:  -0x00046a2 (-2^14.1423) <= r4  <= 0x000046a3 (+2^14.1423)
str.w r4, [r0, #2236]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2240]
/*** basesqr 187 ***/
/* computing z0 = x0^2 + 2*zeta^187*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2022
mul.w r4, r4, r14
    //// bounds:  -0x1d8c3c2 (-2^24.8850) <= r4  <= 0x01d8c3c2 (+2^24.8850)
mla.w r4, r7, r7, r4
    //// bounds:  -0xbb3dd5b (-2^27.5488) <= r4  <= 0x0bb3dd5b (+2^27.5488)
MONTRED r4, r3
    //// bounds:  -0x0003db3 (-2^13.9472) <= r4  <= 0x00003db4 (+2^13.9473)
str.w r4, [r0, #2244]
/* computing z1 = 2x0x1 + zeta^187 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1011
mul.w r4, r4, r14
    //// bounds:  -0x0ec61e1 (-2^23.8850) <= r4  <= 0x00ec61e1 (+2^23.8850)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x14a29513 (-2^28.3670) <= r4  <= 0x14a29513 (+2^28.3670)
MONTRED r4, r3
    //// bounds:  -0x00046a2 (-2^14.1423) <= r4  <= 0x000046a3 (+2^14.1423)
str.w r4, [r0, #2248]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2252]
ldr.w r10, [r1, #2256]
ldr.w r9, [r1, #2260]
ldr.w r8, [r1, #2264]
ldr.w r7, [r1, #2268]
ldr.w r6, [r1, #2272]
ldr.w r5, [r1, #2276]
/*** basesqr 188 ***/
/* computing z0 = x0^2 + 2*zeta^188*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8752
mul.w r4, r4, r14
    //// bounds:  -0x7fe4f10 (-2^26.9988) <= r4  <= 0x07fe4f10 (+2^26.9988)
mla.w r4, r10, r10, r4
    //// bounds:  -0x11d968a9 (-2^28.1578) <= r4  <= 0x11d968a9 (+2^28.1578)
MONTRED r4, r3
    //// bounds:  -0x00043d9 (-2^14.0842) <= r4  <= 0x000043d9 (+2^14.0842)
str.w r4, [r0, #2256]
/* computing z1 = 2x0x1 + zeta^188 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4376
mul.w r4, r4, r14
    //// bounds:  -0x3ff2788 (-2^25.9988) <= r4  <= 0x03ff2788 (+2^25.9988)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17b55aba (-2^28.5673) <= r4  <= 0x17b55aba (+2^28.5673)
MONTRED r4, r3
    //// bounds:  -0x00049b5 (-2^14.2037) <= r4  <= 0x000049b5 (+2^14.2037)
str.w r4, [r0, #2260]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2264]
/*** basesqr 189 ***/
/* computing z0 = x0^2 + 2*zeta^189*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8752
mul.w r4, r4, r14
    //// bounds:  -0x7fe4f10 (-2^26.9988) <= r4  <= 0x07fe4f10 (+2^26.9988)
mla.w r4, r7, r7, r4
    //// bounds:  -0x11d968a9 (-2^28.1578) <= r4  <= 0x11d968a9 (+2^28.1578)
MONTRED r4, r3
    //// bounds:  -0x00043d9 (-2^14.0842) <= r4  <= 0x000043d9 (+2^14.0842)
str.w r4, [r0, #2268]
/* computing z1 = 2x0x1 + zeta^189 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4376
mul.w r4, r4, r14
    //// bounds:  -0x3ff2788 (-2^25.9988) <= r4  <= 0x03ff2788 (+2^25.9988)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17b55aba (-2^28.5673) <= r4  <= 0x17b55aba (+2^28.5673)
MONTRED r4, r3
    //// bounds:  -0x00049b5 (-2^14.2037) <= r4  <= 0x000049b5 (+2^14.2037)
str.w r4, [r0, #2272]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2276]
ldr.w r10, [r1, #2280]
ldr.w r9, [r1, #2284]
ldr.w r8, [r1, #2288]
ldr.w r7, [r1, #2292]
ldr.w r6, [r1, #2296]
ldr.w r5, [r1, #2300]
/*** basesqr 190 ***/
/* computing z0 = x0^2 + 2*zeta^190*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7735
mul.w r4, r4, r14
    //// bounds:  -0x710860d (-2^26.8206) <= r4  <= 0x0710860d (+2^26.8206)
mla.w r4, r10, r10, r4
    //// bounds:  -0x10eb9fa6 (-2^28.0807) <= r4  <= 0x10eb9fa6 (+2^28.0807)
MONTRED r4, r3
    //// bounds:  -0x00042eb (-2^14.0643) <= r4  <= 0x000042ec (+2^14.0644)
str.w r4, [r0, #2280]
/* computing z1 = 2x0x1 + zeta^190 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8933
mul.w r4, r4, r14
    //// bounds:  -0x828a0e7 (-2^27.0283) <= r4  <= 0x0828a0e7 (+2^27.0283)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1bded419 (-2^28.8007) <= r4  <= 0x1bded419 (+2^28.8007)
MONTRED r4, r3
    //// bounds:  -0x0004dde (-2^14.2829) <= r4  <= 0x00004ddf (+2^14.2830)
str.w r4, [r0, #2284]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2288]
/*** basesqr 191 ***/
/* computing z0 = x0^2 + 2*zeta^191*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7735
mul.w r4, r4, r14
    //// bounds:  -0x710860d (-2^26.8206) <= r4  <= 0x0710860d (+2^26.8206)
mla.w r4, r7, r7, r4
    //// bounds:  -0x10eb9fa6 (-2^28.0807) <= r4  <= 0x10eb9fa6 (+2^28.0807)
MONTRED r4, r3
    //// bounds:  -0x00042eb (-2^14.0643) <= r4  <= 0x000042ec (+2^14.0644)
str.w r4, [r0, #2292]
/* computing z1 = 2x0x1 + zeta^191 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8933
mul.w r4, r4, r14
    //// bounds:  -0x828a0e7 (-2^27.0283) <= r4  <= 0x0828a0e7 (+2^27.0283)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1bded419 (-2^28.8007) <= r4  <= 0x1bded419 (+2^28.8007)
MONTRED r4, r3
    //// bounds:  -0x0004dde (-2^14.2829) <= r4  <= 0x00004ddf (+2^14.2830)
str.w r4, [r0, #2296]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2300]
ldr.w r10, [r1, #2304]
ldr.w r9, [r1, #2308]
ldr.w r8, [r1, #2312]
ldr.w r7, [r1, #2316]
ldr.w r6, [r1, #2320]
ldr.w r5, [r1, #2324]
/*** basesqr 192 ***/
/* computing z0 = x0^2 + 2*zeta^192*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8412
mul.w r4, r4, r14
    //// bounds:  -0x7aed034 (-2^26.9416) <= r4  <= 0x07aed034 (+2^26.9416)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1189e9cd (-2^28.1325) <= r4  <= 0x1189e9cd (+2^28.1325)
MONTRED r4, r3
    //// bounds:  -0x000438a (-2^14.0777) <= r4  <= 0x0000438a (+2^14.0777)
str.w r4, [r0, #2304]
/* computing z1 = 2x0x1 + zeta^192 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4206
mul.w r4, r4, r14
    //// bounds:  -0x3d7681a (-2^25.9416) <= r4  <= 0x03d7681a (+2^25.9416)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x178d9b4c (-2^28.5578) <= r4  <= 0x178d9b4c (+2^28.5578)
MONTRED r4, r3
    //// bounds:  -0x000498d (-2^14.2007) <= r4  <= 0x0000498e (+2^14.2007)
str.w r4, [r0, #2308]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2312]
/*** basesqr 193 ***/
/* computing z0 = x0^2 + 2*zeta^193*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8412
mul.w r4, r4, r14
    //// bounds:  -0x7aed034 (-2^26.9416) <= r4  <= 0x07aed034 (+2^26.9416)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1189e9cd (-2^28.1325) <= r4  <= 0x1189e9cd (+2^28.1325)
MONTRED r4, r3
    //// bounds:  -0x000438a (-2^14.0777) <= r4  <= 0x0000438a (+2^14.0777)
str.w r4, [r0, #2316]
/* computing z1 = 2x0x1 + zeta^193 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4206
mul.w r4, r4, r14
    //// bounds:  -0x3d7681a (-2^25.9416) <= r4  <= 0x03d7681a (+2^25.9416)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x178d9b4c (-2^28.5578) <= r4  <= 0x178d9b4c (+2^28.5578)
MONTRED r4, r3
    //// bounds:  -0x000498d (-2^14.2007) <= r4  <= 0x0000498e (+2^14.2007)
str.w r4, [r0, #2320]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2324]
ldr.w r10, [r1, #2328]
ldr.w r9, [r1, #2332]
ldr.w r8, [r1, #2336]
ldr.w r7, [r1, #2340]
ldr.w r6, [r1, #2344]
ldr.w r5, [r1, #2348]
/*** basesqr 194 ***/
/* computing z0 = x0^2 + 2*zeta^194*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10933
mul.w r4, r4, r14
    //// bounds:  -0x9fc3fd7 (-2^27.3198) <= r4  <= 0x09fc3fd7 (+2^27.3198)
mla.w r4, r10, r10, r4
    //// bounds:  -0x13d75970 (-2^28.3104) <= r4  <= 0x13d75970 (+2^28.3104)
MONTRED r4, r3
    //// bounds:  -0x00045d7 (-2^14.1260) <= r4  <= 0x000045d7 (+2^14.1260)
str.w r4, [r0, #2328]
/* computing z1 = 2x0x1 + zeta^194 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7334
mul.w r4, r4, r14
    //// bounds:  -0x6b2c402 (-2^26.7438) <= r4  <= 0x06b2c402 (+2^26.7438)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a68f734 (-2^28.7230) <= r4  <= 0x1a68f734 (+2^28.7230)
MONTRED r4, r3
    //// bounds:  -0x0004c69 (-2^14.2557) <= r4  <= 0x00004c69 (+2^14.2557)
str.w r4, [r0, #2332]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2336]
/*** basesqr 195 ***/
/* computing z0 = x0^2 + 2*zeta^195*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10933
mul.w r4, r4, r14
    //// bounds:  -0x9fc3fd7 (-2^27.3198) <= r4  <= 0x09fc3fd7 (+2^27.3198)
mla.w r4, r7, r7, r4
    //// bounds:  -0x13d75970 (-2^28.3104) <= r4  <= 0x13d75970 (+2^28.3104)
MONTRED r4, r3
    //// bounds:  -0x00045d7 (-2^14.1260) <= r4  <= 0x000045d7 (+2^14.1260)
str.w r4, [r0, #2340]
/* computing z1 = 2x0x1 + zeta^195 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7334
mul.w r4, r4, r14
    //// bounds:  -0x6b2c402 (-2^26.7438) <= r4  <= 0x06b2c402 (+2^26.7438)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a68f734 (-2^28.7230) <= r4  <= 0x1a68f734 (+2^28.7230)
MONTRED r4, r3
    //// bounds:  -0x0004c69 (-2^14.2557) <= r4  <= 0x00004c69 (+2^14.2557)
str.w r4, [r0, #2344]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2348]
ldr.w r10, [r1, #2352]
ldr.w r9, [r1, #2356]
ldr.w r8, [r1, #2360]
ldr.w r7, [r1, #2364]
ldr.w r6, [r1, #2368]
ldr.w r5, [r1, #2372]
/*** basesqr 196 ***/
/* computing z0 = x0^2 + 2*zeta^196*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9921
mul.w r4, r4, r14
    //// bounds:  -0x90fa21b (-2^27.1797) <= r4  <= 0x090fa21b (+2^27.1797)
mla.w r4, r10, r10, r4
    //// bounds:  -0x12eabbb4 (-2^28.2416) <= r4  <= 0x12eabbb4 (+2^28.2416)
MONTRED r4, r3
    //// bounds:  -0x00044ea (-2^14.1067) <= r4  <= 0x000044eb (+2^14.1068)
str.w r4, [r0, #2352]
/* computing z1 = 2x0x1 + zeta^196 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7840
mul.w r4, r4, r14
    //// bounds:  -0x72912e0 (-2^26.8400) <= r4  <= 0x072912e0 (+2^26.8400)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1adf4612 (-2^28.7480) <= r4  <= 0x1adf4612 (+2^28.7480)
MONTRED r4, r3
    //// bounds:  -0x0004cdf (-2^14.2644) <= r4  <= 0x00004cdf (+2^14.2644)
str.w r4, [r0, #2356]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2360]
/*** basesqr 197 ***/
/* computing z0 = x0^2 + 2*zeta^197*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9921
mul.w r4, r4, r14
    //// bounds:  -0x90fa21b (-2^27.1797) <= r4  <= 0x090fa21b (+2^27.1797)
mla.w r4, r7, r7, r4
    //// bounds:  -0x12eabbb4 (-2^28.2416) <= r4  <= 0x12eabbb4 (+2^28.2416)
MONTRED r4, r3
    //// bounds:  -0x00044ea (-2^14.1067) <= r4  <= 0x000044eb (+2^14.1068)
str.w r4, [r0, #2364]
/* computing z1 = 2x0x1 + zeta^197 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7840
mul.w r4, r4, r14
    //// bounds:  -0x72912e0 (-2^26.8400) <= r4  <= 0x072912e0 (+2^26.8400)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1adf4612 (-2^28.7480) <= r4  <= 0x1adf4612 (+2^28.7480)
MONTRED r4, r3
    //// bounds:  -0x0004cdf (-2^14.2644) <= r4  <= 0x00004cdf (+2^14.2644)
str.w r4, [r0, #2368]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2372]
ldr.w r10, [r1, #2376]
ldr.w r9, [r1, #2380]
ldr.w r8, [r1, #2384]
ldr.w r7, [r1, #2388]
ldr.w r6, [r1, #2392]
ldr.w r5, [r1, #2396]
/*** basesqr 198 ***/
/* computing z0 = x0^2 + 2*zeta^198*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =98
mul.w r4, r4, r14
    //// bounds:  -0x016e9d6 (-2^20.5181) <= r4  <= 0x0016e9d6 (+2^20.5181)
mla.w r4, r10, r10, r4
    //// bounds:  -0x9f2036f (-2^27.3140) <= r4  <= 0x09f2036f (+2^27.3140)
MONTRED r4, r3
    //// bounds:  -0x0003bf2 (-2^13.9056) <= r4  <= 0x00003bf2 (+2^13.9056)
str.w r4, [r0, #2376]
/* computing z1 = 2x0x1 + zeta^198 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =49
mul.w r4, r4, r14
    //// bounds:  -0x00b74eb (-2^19.5181) <= r4  <= 0x000b74eb (+2^19.5181)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13c1a81d (-2^28.3043) <= r4  <= 0x13c1a81d (+2^28.3043)
MONTRED r4, r3
    //// bounds:  -0x00045c1 (-2^14.1242) <= r4  <= 0x000045c2 (+2^14.1243)
str.w r4, [r0, #2380]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2384]
/*** basesqr 199 ***/
/* computing z0 = x0^2 + 2*zeta^199*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-98
mul.w r4, r4, r14
    //// bounds:  -0x016e9d6 (-2^20.5181) <= r4  <= 0x0016e9d6 (+2^20.5181)
mla.w r4, r7, r7, r4
    //// bounds:  -0x9f2036f (-2^27.3140) <= r4  <= 0x09f2036f (+2^27.3140)
MONTRED r4, r3
    //// bounds:  -0x0003bf2 (-2^13.9056) <= r4  <= 0x00003bf2 (+2^13.9056)
str.w r4, [r0, #2388]
/* computing z1 = 2x0x1 + zeta^199 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-49
mul.w r4, r4, r14
    //// bounds:  -0x00b74eb (-2^19.5181) <= r4  <= 0x000b74eb (+2^19.5181)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13c1a81d (-2^28.3043) <= r4  <= 0x13c1a81d (+2^28.3043)
MONTRED r4, r3
    //// bounds:  -0x00045c1 (-2^14.1242) <= r4  <= 0x000045c2 (+2^14.1243)
str.w r4, [r0, #2392]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2396]
ldr.w r10, [r1, #2400]
ldr.w r9, [r1, #2404]
ldr.w r8, [r1, #2408]
ldr.w r7, [r1, #2412]
ldr.w r6, [r1, #2416]
ldr.w r5, [r1, #2420]
/*** basesqr 200 ***/
/* computing z0 = x0^2 + 2*zeta^200*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-962
mul.w r4, r4, r14
    //// bounds:  -0x0e0ecf6 (-2^23.8133) <= r4  <= 0x00e0ecf6 (+2^23.8133)
mla.w r4, r10, r10, r4
    //// bounds:  -0xabc068f (-2^27.4242) <= r4  <= 0x0abc068f (+2^27.4242)
MONTRED r4, r3
    //// bounds:  -0x0003cbc (-2^13.9244) <= r4  <= 0x00003cbc (+2^13.9244)
str.w r4, [r0, #2400]
/* computing z1 = 2x0x1 + zeta^200 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-481
mul.w r4, r4, r14
    //// bounds:  -0x070767b (-2^22.8133) <= r4  <= 0x0070767b (+2^22.8133)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1426a9ad (-2^28.3328) <= r4  <= 0x1426a9ad (+2^28.3328)
MONTRED r4, r3
    //// bounds:  -0x0004626 (-2^14.1323) <= r4  <= 0x00004627 (+2^14.1324)
str.w r4, [r0, #2404]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2408]
/*** basesqr 201 ***/
/* computing z0 = x0^2 + 2*zeta^201*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =962
mul.w r4, r4, r14
    //// bounds:  -0x0e0ecf6 (-2^23.8133) <= r4  <= 0x00e0ecf6 (+2^23.8133)
mla.w r4, r7, r7, r4
    //// bounds:  -0xabc068f (-2^27.4242) <= r4  <= 0x0abc068f (+2^27.4242)
MONTRED r4, r3
    //// bounds:  -0x0003cbc (-2^13.9244) <= r4  <= 0x00003cbc (+2^13.9244)
str.w r4, [r0, #2412]
/* computing z1 = 2x0x1 + zeta^201 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =481
mul.w r4, r4, r14
    //// bounds:  -0x070767b (-2^22.8133) <= r4  <= 0x0070767b (+2^22.8133)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1426a9ad (-2^28.3328) <= r4  <= 0x1426a9ad (+2^28.3328)
MONTRED r4, r3
    //// bounds:  -0x0004626 (-2^14.1323) <= r4  <= 0x00004627 (+2^14.1324)
str.w r4, [r0, #2416]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2420]
ldr.w r10, [r1, #2424]
ldr.w r9, [r1, #2428]
ldr.w r8, [r1, #2432]
ldr.w r7, [r1, #2436]
ldr.w r6, [r1, #2440]
ldr.w r5, [r1, #2444]
/*** basesqr 202 ***/
/* computing z0 = x0^2 + 2*zeta^202*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-314
mul.w r4, r4, r14
    //// bounds:  -0x0496a9e (-2^22.1980) <= r4  <= 0x00496a9e (+2^22.1980)
mla.w r4, r10, r10, r4
    //// bounds:  -0xa248437 (-2^27.3424) <= r4  <= 0x0a248437 (+2^27.3424)
MONTRED r4, r3
    //// bounds:  -0x0003c24 (-2^13.9103) <= r4  <= 0x00003c25 (+2^13.9104)
str.w r4, [r0, #2424]
/* computing z1 = 2x0x1 + zeta^202 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-157
mul.w r4, r4, r14
    //// bounds:  -0x024b54f (-2^21.1980) <= r4  <= 0x0024b54f (+2^21.1980)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13dae881 (-2^28.3114) <= r4  <= 0x13dae881 (+2^28.3114)
MONTRED r4, r3
    //// bounds:  -0x00045db (-2^14.1263) <= r4  <= 0x000045db (+2^14.1263)
str.w r4, [r0, #2428]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2432]
/*** basesqr 203 ***/
/* computing z0 = x0^2 + 2*zeta^203*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =314
mul.w r4, r4, r14
    //// bounds:  -0x0496a9e (-2^22.1980) <= r4  <= 0x00496a9e (+2^22.1980)
mla.w r4, r7, r7, r4
    //// bounds:  -0xa248437 (-2^27.3424) <= r4  <= 0x0a248437 (+2^27.3424)
MONTRED r4, r3
    //// bounds:  -0x0003c24 (-2^13.9103) <= r4  <= 0x00003c25 (+2^13.9104)
str.w r4, [r0, #2436]
/* computing z1 = 2x0x1 + zeta^203 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =157
mul.w r4, r4, r14
    //// bounds:  -0x024b54f (-2^21.1980) <= r4  <= 0x0024b54f (+2^21.1980)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x13dae881 (-2^28.3114) <= r4  <= 0x13dae881 (+2^28.3114)
MONTRED r4, r3
    //// bounds:  -0x00045db (-2^14.1263) <= r4  <= 0x000045db (+2^14.1263)
str.w r4, [r0, #2440]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2444]
ldr.w r10, [r1, #2448]
ldr.w r9, [r1, #2452]
ldr.w r8, [r1, #2456]
ldr.w r7, [r1, #2460]
ldr.w r6, [r1, #2464]
ldr.w r5, [r1, #2468]
/*** basesqr 204 ***/
/* computing z0 = x0^2 + 2*zeta^204*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4727
mul.w r4, r4, r14
    //// bounds:  -0x45138cd (-2^26.1101) <= r4  <= 0x045138cd (+2^26.1101)
mla.w r4, r10, r10, r4
    //// bounds:  -0xe2c5266 (-2^27.8251) <= r4  <= 0x0e2c5266 (+2^27.8251)
MONTRED r4, r3
    //// bounds:  -0x000402c (-2^14.0039) <= r4  <= 0x0000402c (+2^14.0039)
str.w r4, [r0, #2448]
/* computing z1 = 2x0x1 + zeta^204 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10437
mul.w r4, r4, r14
    //// bounds:  -0x9884787 (-2^27.2528) <= r4  <= 0x09884787 (+2^27.2528)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d3e7ab9 (-2^28.8701) <= r4  <= 0x1d3e7ab9 (+2^28.8701)
MONTRED r4, r3
    //// bounds:  -0x0004f3e (-2^14.3082) <= r4  <= 0x00004f3e (+2^14.3082)
str.w r4, [r0, #2452]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2456]
/*** basesqr 205 ***/
/* computing z0 = x0^2 + 2*zeta^205*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4727
mul.w r4, r4, r14
    //// bounds:  -0x45138cd (-2^26.1101) <= r4  <= 0x045138cd (+2^26.1101)
mla.w r4, r7, r7, r4
    //// bounds:  -0xe2c5266 (-2^27.8251) <= r4  <= 0x0e2c5266 (+2^27.8251)
MONTRED r4, r3
    //// bounds:  -0x000402c (-2^14.0039) <= r4  <= 0x0000402c (+2^14.0039)
str.w r4, [r0, #2460]
/* computing z1 = 2x0x1 + zeta^205 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10437
mul.w r4, r4, r14
    //// bounds:  -0x9884787 (-2^27.2528) <= r4  <= 0x09884787 (+2^27.2528)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d3e7ab9 (-2^28.8701) <= r4  <= 0x1d3e7ab9 (+2^28.8701)
MONTRED r4, r3
    //// bounds:  -0x0004f3e (-2^14.3082) <= r4  <= 0x00004f3e (+2^14.3082)
str.w r4, [r0, #2464]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2468]
ldr.w r10, [r1, #2472]
ldr.w r9, [r1, #2476]
ldr.w r8, [r1, #2480]
ldr.w r7, [r1, #2484]
ldr.w r6, [r1, #2488]
ldr.w r5, [r1, #2492]
/*** basesqr 206 ***/
/* computing z0 = x0^2 + 2*zeta^206*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11710
mul.w r4, r4, r14
    //// bounds:  -0xab1eb8a (-2^27.4189) <= r4  <= 0x0ab1eb8a (+2^27.4189)
mla.w r4, r10, r10, r4
    //// bounds:  -0x148d0523 (-2^28.3611) <= r4  <= 0x148d0523 (+2^28.3611)
MONTRED r4, r3
    //// bounds:  -0x000468d (-2^14.1406) <= r4  <= 0x0000468d (+2^14.1406)
str.w r4, [r0, #2472]
/* computing z1 = 2x0x1 + zeta^206 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5855
mul.w r4, r4, r14
    //// bounds:  -0x558f5c5 (-2^26.4189) <= r4  <= 0x0558f5c5 (+2^26.4189)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x190f28f7 (-2^28.6473) <= r4  <= 0x190f28f7 (+2^28.6473)
MONTRED r4, r3
    //// bounds:  -0x0004b0f (-2^14.2299) <= r4  <= 0x00004b0f (+2^14.2299)
str.w r4, [r0, #2476]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2480]
/*** basesqr 207 ***/
/* computing z0 = x0^2 + 2*zeta^207*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11710
mul.w r4, r4, r14
    //// bounds:  -0xab1eb8a (-2^27.4189) <= r4  <= 0x0ab1eb8a (+2^27.4189)
mla.w r4, r7, r7, r4
    //// bounds:  -0x148d0523 (-2^28.3611) <= r4  <= 0x148d0523 (+2^28.3611)
MONTRED r4, r3
    //// bounds:  -0x000468d (-2^14.1406) <= r4  <= 0x0000468d (+2^14.1406)
str.w r4, [r0, #2484]
/* computing z1 = 2x0x1 + zeta^207 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5855
mul.w r4, r4, r14
    //// bounds:  -0x558f5c5 (-2^26.4189) <= r4  <= 0x0558f5c5 (+2^26.4189)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x190f28f7 (-2^28.6473) <= r4  <= 0x190f28f7 (+2^28.6473)
MONTRED r4, r3
    //// bounds:  -0x0004b0f (-2^14.2299) <= r4  <= 0x00004b0f (+2^14.2299)
str.w r4, [r0, #2488]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2492]
ldr.w r10, [r1, #2496]
ldr.w r9, [r1, #2500]
ldr.w r8, [r1, #2504]
ldr.w r7, [r1, #2508]
ldr.w r6, [r1, #2512]
ldr.w r5, [r1, #2516]
/*** basesqr 208 ***/
/* computing z0 = x0^2 + 2*zeta^208*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =579
mul.w r4, r4, r14
    //// bounds:  -0x0876051 (-2^23.0808) <= r4  <= 0x00876051 (+2^23.0808)
mla.w r4, r10, r10, r4
    //// bounds:  -0xa6279ea (-2^27.3764) <= r4  <= 0x0a6279ea (+2^27.3764)
MONTRED r4, r3
    //// bounds:  -0x0003c62 (-2^13.9161) <= r4  <= 0x00003c62 (+2^13.9161)
str.w r4, [r0, #2496]
/* computing z1 = 2x0x1 + zeta^208 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12511
mul.w r4, r4, r14
    //// bounds:  -0xb6d33c5 (-2^27.5143) <= r4  <= 0x0b6d33c5 (+2^27.5143)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1f2366f7 (-2^28.9606) <= r4  <= 0x1f2366f7 (+2^28.9606)
MONTRED r4, r3
    //// bounds:  -0x0005123 (-2^14.3423) <= r4  <= 0x00005123 (+2^14.3423)
str.w r4, [r0, #2500]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2504]
/*** basesqr 209 ***/
/* computing z0 = x0^2 + 2*zeta^209*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-579
mul.w r4, r4, r14
    //// bounds:  -0x0876051 (-2^23.0808) <= r4  <= 0x00876051 (+2^23.0808)
mla.w r4, r7, r7, r4
    //// bounds:  -0xa6279ea (-2^27.3764) <= r4  <= 0x0a6279ea (+2^27.3764)
MONTRED r4, r3
    //// bounds:  -0x0003c62 (-2^13.9161) <= r4  <= 0x00003c62 (+2^13.9161)
str.w r4, [r0, #2508]
/* computing z1 = 2x0x1 + zeta^209 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12511
mul.w r4, r4, r14
    //// bounds:  -0xb6d33c5 (-2^27.5143) <= r4  <= 0x0b6d33c5 (+2^27.5143)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1f2366f7 (-2^28.9606) <= r4  <= 0x1f2366f7 (+2^28.9606)
MONTRED r4, r3
    //// bounds:  -0x0005123 (-2^14.3423) <= r4  <= 0x00005123 (+2^14.3423)
str.w r4, [r0, #2512]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2516]
ldr.w r10, [r1, #2520]
ldr.w r9, [r1, #2524]
ldr.w r8, [r1, #2528]
ldr.w r7, [r1, #2532]
ldr.w r6, [r1, #2536]
ldr.w r5, [r1, #2540]
/*** basesqr 210 ***/
/* computing z0 = x0^2 + 2*zeta^210*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9764
mul.w r4, r4, r14
    //// bounds:  -0x8eaeccc (-2^27.1567) <= r4  <= 0x08eaeccc (+2^27.1567)
mla.w r4, r10, r10, r4
    //// bounds:  -0x12c60665 (-2^28.2306) <= r4  <= 0x12c60665 (+2^28.2306)
MONTRED r4, r3
    //// bounds:  -0x00044c6 (-2^14.1038) <= r4  <= 0x000044c6 (+2^14.1038)
str.w r4, [r0, #2520]
/* computing z1 = 2x0x1 + zeta^210 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4882
mul.w r4, r4, r14
    //// bounds:  -0x4757666 (-2^26.1567) <= r4  <= 0x04757666 (+2^26.1567)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x182ba998 (-2^28.5952) <= r4  <= 0x182ba998 (+2^28.5952)
MONTRED r4, r3
    //// bounds:  -0x0004a2b (-2^14.2127) <= r4  <= 0x00004a2c (+2^14.2128)
str.w r4, [r0, #2524]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2528]
/*** basesqr 211 ***/
/* computing z0 = x0^2 + 2*zeta^211*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9764
mul.w r4, r4, r14
    //// bounds:  -0x8eaeccc (-2^27.1567) <= r4  <= 0x08eaeccc (+2^27.1567)
mla.w r4, r7, r7, r4
    //// bounds:  -0x12c60665 (-2^28.2306) <= r4  <= 0x12c60665 (+2^28.2306)
MONTRED r4, r3
    //// bounds:  -0x00044c6 (-2^14.1038) <= r4  <= 0x000044c6 (+2^14.1038)
str.w r4, [r0, #2532]
/* computing z1 = 2x0x1 + zeta^211 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4882
mul.w r4, r4, r14
    //// bounds:  -0x4757666 (-2^26.1567) <= r4  <= 0x04757666 (+2^26.1567)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x182ba998 (-2^28.5952) <= r4  <= 0x182ba998 (+2^28.5952)
MONTRED r4, r3
    //// bounds:  -0x0004a2b (-2^14.2127) <= r4  <= 0x00004a2c (+2^14.2128)
str.w r4, [r0, #2536]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2540]
ldr.w r10, [r1, #2544]
ldr.w r9, [r1, #2548]
ldr.w r8, [r1, #2552]
ldr.w r7, [r1, #2556]
ldr.w r6, [r1, #2560]
ldr.w r5, [r1, #2564]
/*** basesqr 212 ***/
/* computing z0 = x0^2 + 2*zeta^212*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2025
mul.w r4, r4, r14
    //// bounds:  -0x1d97753 (-2^24.8871) <= r4  <= 0x01d97753 (+2^24.8871)
mla.w r4, r10, r10, r4
    //// bounds:  -0xbb490ec (-2^27.5491) <= r4  <= 0x0bb490ec (+2^27.5491)
MONTRED r4, r3
    //// bounds:  -0x0003db4 (-2^13.9473) <= r4  <= 0x00003db5 (+2^13.9474)
str.w r4, [r0, #2544]
/* computing z1 = 2x0x1 + zeta^212 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11788
mul.w r4, r4, r14
    //// bounds:  -0xac42844 (-2^27.4284) <= r4  <= 0x0ac42844 (+2^27.4284)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e7a5b76 (-2^28.9297) <= r4  <= 0x1e7a5b76 (+2^28.9297)
MONTRED r4, r3
    //// bounds:  -0x000507a (-2^14.3305) <= r4  <= 0x0000507a (+2^14.3305)
str.w r4, [r0, #2548]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2552]
/*** basesqr 213 ***/
/* computing z0 = x0^2 + 2*zeta^213*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2025
mul.w r4, r4, r14
    //// bounds:  -0x1d97753 (-2^24.8871) <= r4  <= 0x01d97753 (+2^24.8871)
mla.w r4, r7, r7, r4
    //// bounds:  -0xbb490ec (-2^27.5491) <= r4  <= 0x0bb490ec (+2^27.5491)
MONTRED r4, r3
    //// bounds:  -0x0003db4 (-2^13.9473) <= r4  <= 0x00003db5 (+2^13.9474)
str.w r4, [r0, #2556]
/* computing z1 = 2x0x1 + zeta^213 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11788
mul.w r4, r4, r14
    //// bounds:  -0xac42844 (-2^27.4284) <= r4  <= 0x0ac42844 (+2^27.4284)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1e7a5b76 (-2^28.9297) <= r4  <= 0x1e7a5b76 (+2^28.9297)
MONTRED r4, r3
    //// bounds:  -0x000507a (-2^14.3305) <= r4  <= 0x0000507a (+2^14.3305)
str.w r4, [r0, #2560]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2564]
ldr.w r10, [r1, #2568]
ldr.w r9, [r1, #2572]
ldr.w r8, [r1, #2576]
ldr.w r7, [r1, #2580]
ldr.w r6, [r1, #2584]
ldr.w r5, [r1, #2588]
/*** basesqr 214 ***/
/* computing z0 = x0^2 + 2*zeta^214*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8813
mul.w r4, r4, r14
    //// bounds:  -0x80c923f (-2^27.0088) <= r4  <= 0x080c923f (+2^27.0088)
mla.w r4, r10, r10, r4
    //// bounds:  -0x11e7abd8 (-2^28.1623) <= r4  <= 0x11e7abd8 (+2^28.1623)
MONTRED r4, r3
    //// bounds:  -0x00043e7 (-2^14.0854) <= r4  <= 0x000043e8 (+2^14.0855)
str.w r4, [r0, #2568]
/* computing z1 = 2x0x1 + zeta^214 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8394
mul.w r4, r4, r14
    //// bounds:  -0x7aa9ace (-2^26.9386) <= r4  <= 0x07aa9ace (+2^26.9386)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b60ce00 (-2^28.7750) <= r4  <= 0x1b60ce00 (+2^28.7750)
MONTRED r4, r3
    //// bounds:  -0x0004d60 (-2^14.2738) <= r4  <= 0x00004d61 (+2^14.2739)
str.w r4, [r0, #2572]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2576]
/*** basesqr 215 ***/
/* computing z0 = x0^2 + 2*zeta^215*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8813
mul.w r4, r4, r14
    //// bounds:  -0x80c923f (-2^27.0088) <= r4  <= 0x080c923f (+2^27.0088)
mla.w r4, r7, r7, r4
    //// bounds:  -0x11e7abd8 (-2^28.1623) <= r4  <= 0x11e7abd8 (+2^28.1623)
MONTRED r4, r3
    //// bounds:  -0x00043e7 (-2^14.0854) <= r4  <= 0x000043e8 (+2^14.0855)
str.w r4, [r0, #2580]
/* computing z1 = 2x0x1 + zeta^215 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8394
mul.w r4, r4, r14
    //// bounds:  -0x7aa9ace (-2^26.9386) <= r4  <= 0x07aa9ace (+2^26.9386)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b60ce00 (-2^28.7750) <= r4  <= 0x1b60ce00 (+2^28.7750)
MONTRED r4, r3
    //// bounds:  -0x0004d60 (-2^14.2738) <= r4  <= 0x00004d61 (+2^14.2739)
str.w r4, [r0, #2584]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2588]
ldr.w r10, [r1, #2592]
ldr.w r9, [r1, #2596]
ldr.w r8, [r1, #2600]
ldr.w r7, [r1, #2604]
ldr.w r6, [r1, #2608]
ldr.w r5, [r1, #2612]
/*** basesqr 216 ***/
/* computing z0 = x0^2 + 2*zeta^216*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6051
mul.w r4, r4, r14
    //// bounds:  -0x586c971 (-2^26.4664) <= r4  <= 0x0586c971 (+2^26.4664)
mla.w r4, r10, r10, r4
    //// bounds:  -0xf61e30a (-2^27.9432) <= r4  <= 0x0f61e30a (+2^27.9432)
MONTRED r4, r3
    //// bounds:  -0x0004161 (-2^14.0308) <= r4  <= 0x00004162 (+2^14.0308)
str.w r4, [r0, #2592]
/* computing z1 = 2x0x1 + zeta^216 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9775
mul.w r4, r4, r14
    //// bounds:  -0x8ed7f35 (-2^27.1583) <= r4  <= 0x08ed7f35 (+2^27.1583)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ca3b267 (-2^28.8399) <= r4  <= 0x1ca3b267 (+2^28.8399)
MONTRED r4, r3
    //// bounds:  -0x0004ea3 (-2^14.2971) <= r4  <= 0x00004ea4 (+2^14.2972)
str.w r4, [r0, #2596]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2600]
/*** basesqr 217 ***/
/* computing z0 = x0^2 + 2*zeta^217*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6051
mul.w r4, r4, r14
    //// bounds:  -0x586c971 (-2^26.4664) <= r4  <= 0x0586c971 (+2^26.4664)
mla.w r4, r7, r7, r4
    //// bounds:  -0xf61e30a (-2^27.9432) <= r4  <= 0x0f61e30a (+2^27.9432)
MONTRED r4, r3
    //// bounds:  -0x0004161 (-2^14.0308) <= r4  <= 0x00004162 (+2^14.0308)
str.w r4, [r0, #2604]
/* computing z1 = 2x0x1 + zeta^217 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9775
mul.w r4, r4, r14
    //// bounds:  -0x8ed7f35 (-2^27.1583) <= r4  <= 0x08ed7f35 (+2^27.1583)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ca3b267 (-2^28.8399) <= r4  <= 0x1ca3b267 (+2^28.8399)
MONTRED r4, r3
    //// bounds:  -0x0004ea3 (-2^14.2971) <= r4  <= 0x00004ea4 (+2^14.2972)
str.w r4, [r0, #2608]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2612]
ldr.w r10, [r1, #2616]
ldr.w r9, [r1, #2620]
ldr.w r8, [r1, #2624]
ldr.w r7, [r1, #2628]
ldr.w r6, [r1, #2632]
ldr.w r5, [r1, #2636]
/*** basesqr 218 ***/
/* computing z0 = x0^2 + 2*zeta^218*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4678
mul.w r4, r4, r14
    //// bounds:  -0x445c3e2 (-2^26.0951) <= r4  <= 0x0445c3e2 (+2^26.0951)
mla.w r4, r10, r10, r4
    //// bounds:  -0xe20dd7b (-2^27.8205) <= r4  <= 0x0e20dd7b (+2^27.8205)
MONTRED r4, r3
    //// bounds:  -0x0004020 (-2^14.0028) <= r4  <= 0x00004021 (+2^14.0029)
str.w r4, [r0, #2616]
/* computing z1 = 2x0x1 + zeta^218 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2339
mul.w r4, r4, r14
    //// bounds:  -0x222e1f1 (-2^25.0951) <= r4  <= 0x0222e1f1 (+2^25.0951)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x15d91523 (-2^28.4494) <= r4  <= 0x15d91523 (+2^28.4494)
MONTRED r4, r3
    //// bounds:  -0x00047d9 (-2^14.1669) <= r4  <= 0x000047d9 (+2^14.1669)
str.w r4, [r0, #2620]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2624]
/*** basesqr 219 ***/
/* computing z0 = x0^2 + 2*zeta^219*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4678
mul.w r4, r4, r14
    //// bounds:  -0x445c3e2 (-2^26.0951) <= r4  <= 0x0445c3e2 (+2^26.0951)
mla.w r4, r7, r7, r4
    //// bounds:  -0xe20dd7b (-2^27.8205) <= r4  <= 0x0e20dd7b (+2^27.8205)
MONTRED r4, r3
    //// bounds:  -0x0004020 (-2^14.0028) <= r4  <= 0x00004021 (+2^14.0029)
str.w r4, [r0, #2628]
/* computing z1 = 2x0x1 + zeta^219 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2339
mul.w r4, r4, r14
    //// bounds:  -0x222e1f1 (-2^25.0951) <= r4  <= 0x0222e1f1 (+2^25.0951)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x15d91523 (-2^28.4494) <= r4  <= 0x15d91523 (+2^28.4494)
MONTRED r4, r3
    //// bounds:  -0x00047d9 (-2^14.1669) <= r4  <= 0x000047d9 (+2^14.1669)
str.w r4, [r0, #2632]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2636]
ldr.w r10, [r1, #2640]
ldr.w r9, [r1, #2644]
ldr.w r8, [r1, #2648]
ldr.w r7, [r1, #2652]
ldr.w r6, [r1, #2656]
ldr.w r5, [r1, #2660]
/*** basesqr 220 ***/
/* computing z0 = x0^2 + 2*zeta^220*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8296
mul.w r4, r4, r14
    //// bounds:  -0x793b0f8 (-2^26.9216) <= r4  <= 0x0793b0f8 (+2^26.9216)
mla.w r4, r10, r10, r4
    //// bounds:  -0x116eca91 (-2^28.1237) <= r4  <= 0x116eca91 (+2^28.1237)
MONTRED r4, r3
    //// bounds:  -0x000436e (-2^14.0753) <= r4  <= 0x0000436f (+2^14.0754)
str.w r4, [r0, #2640]
/* computing z1 = 2x0x1 + zeta^220 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4148
mul.w r4, r4, r14
    //// bounds:  -0x3c9d87c (-2^25.9216) <= r4  <= 0x03c9d87c (+2^25.9216)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17800bae (-2^28.5546) <= r4  <= 0x17800bae (+2^28.5546)
MONTRED r4, r3
    //// bounds:  -0x0004980 (-2^14.1997) <= r4  <= 0x00004980 (+2^14.1997)
str.w r4, [r0, #2644]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2648]
/*** basesqr 221 ***/
/* computing z0 = x0^2 + 2*zeta^221*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8296
mul.w r4, r4, r14
    //// bounds:  -0x793b0f8 (-2^26.9216) <= r4  <= 0x0793b0f8 (+2^26.9216)
mla.w r4, r7, r7, r4
    //// bounds:  -0x116eca91 (-2^28.1237) <= r4  <= 0x116eca91 (+2^28.1237)
MONTRED r4, r3
    //// bounds:  -0x000436e (-2^14.0753) <= r4  <= 0x0000436f (+2^14.0754)
str.w r4, [r0, #2652]
/* computing z1 = 2x0x1 + zeta^221 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4148
mul.w r4, r4, r14
    //// bounds:  -0x3c9d87c (-2^25.9216) <= r4  <= 0x03c9d87c (+2^25.9216)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17800bae (-2^28.5546) <= r4  <= 0x17800bae (+2^28.5546)
MONTRED r4, r3
    //// bounds:  -0x0004980 (-2^14.1997) <= r4  <= 0x00004980 (+2^14.1997)
str.w r4, [r0, #2656]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2660]
ldr.w r10, [r1, #2664]
ldr.w r9, [r1, #2668]
ldr.w r8, [r1, #2672]
ldr.w r7, [r1, #2676]
ldr.w r6, [r1, #2680]
ldr.w r5, [r1, #2684]
/*** basesqr 222 ***/
/* computing z0 = x0^2 + 2*zeta^222*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3892
mul.w r4, r4, r14
    //// bounds:  -0x38dfd7c (-2^25.8297) <= r4  <= 0x038dfd7c (+2^25.8297)
mla.w r4, r10, r10, r4
    //// bounds:  -0xd691715 (-2^27.7453) <= r4  <= 0x0d691715 (+2^27.7453)
MONTRED r4, r3
    //// bounds:  -0x0003f69 (-2^13.9866) <= r4  <= 0x00003f69 (+2^13.9866)
str.w r4, [r0, #2664]
/* computing z1 = 2x0x1 + zeta^222 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1946
mul.w r4, r4, r14
    //// bounds:  -0x1c6febe (-2^24.8297) <= r4  <= 0x01c6febe (+2^24.8297)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x157d31f0 (-2^28.4255) <= r4  <= 0x157d31f0 (+2^28.4255)
MONTRED r4, r3
    //// bounds:  -0x000477d (-2^14.1596) <= r4  <= 0x0000477d (+2^14.1596)
str.w r4, [r0, #2668]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2672]
/*** basesqr 223 ***/
/* computing z0 = x0^2 + 2*zeta^223*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3892
mul.w r4, r4, r14
    //// bounds:  -0x38dfd7c (-2^25.8297) <= r4  <= 0x038dfd7c (+2^25.8297)
mla.w r4, r7, r7, r4
    //// bounds:  -0xd691715 (-2^27.7453) <= r4  <= 0x0d691715 (+2^27.7453)
MONTRED r4, r3
    //// bounds:  -0x0003f69 (-2^13.9866) <= r4  <= 0x00003f69 (+2^13.9866)
str.w r4, [r0, #2676]
/* computing z1 = 2x0x1 + zeta^223 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1946
mul.w r4, r4, r14
    //// bounds:  -0x1c6febe (-2^24.8297) <= r4  <= 0x01c6febe (+2^24.8297)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x157d31f0 (-2^28.4255) <= r4  <= 0x157d31f0 (+2^28.4255)
MONTRED r4, r3
    //// bounds:  -0x000477d (-2^14.1596) <= r4  <= 0x0000477d (+2^14.1596)
str.w r4, [r0, #2680]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2684]
ldr.w r10, [r1, #2688]
ldr.w r9, [r1, #2692]
ldr.w r8, [r1, #2696]
ldr.w r7, [r1, #2700]
ldr.w r6, [r1, #2704]
ldr.w r5, [r1, #2708]
/*** basesqr 224 ***/
/* computing z0 = x0^2 + 2*zeta^224*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12794
mul.w r4, r4, r14
    //// bounds:  -0xbaf5ede (-2^27.5466) <= r4  <= 0x0baf5ede (+2^27.5466)
mla.w r4, r10, r10, r4
    //// bounds:  -0x158a7877 (-2^28.4290) <= r4  <= 0x158a7877 (+2^28.4290)
MONTRED r4, r3
    //// bounds:  -0x000478a (-2^14.1607) <= r4  <= 0x0000478a (+2^14.1607)
str.w r4, [r0, #2688]
/* computing z1 = 2x0x1 + zeta^224 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-6397
mul.w r4, r4, r14
    //// bounds:  -0x5d7af6f (-2^26.5466) <= r4  <= 0x05d7af6f (+2^26.5466)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x198de2a1 (-2^28.6755) <= r4  <= 0x198de2a1 (+2^28.6755)
MONTRED r4, r3
    //// bounds:  -0x0004b8d (-2^14.2394) <= r4  <= 0x00004b8e (+2^14.2394)
str.w r4, [r0, #2692]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2696]
/*** basesqr 225 ***/
/* computing z0 = x0^2 + 2*zeta^225*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12794
mul.w r4, r4, r14
    //// bounds:  -0xbaf5ede (-2^27.5466) <= r4  <= 0x0baf5ede (+2^27.5466)
mla.w r4, r7, r7, r4
    //// bounds:  -0x158a7877 (-2^28.4290) <= r4  <= 0x158a7877 (+2^28.4290)
MONTRED r4, r3
    //// bounds:  -0x000478a (-2^14.1607) <= r4  <= 0x0000478a (+2^14.1607)
str.w r4, [r0, #2700]
/* computing z1 = 2x0x1 + zeta^225 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =6397
mul.w r4, r4, r14
    //// bounds:  -0x5d7af6f (-2^26.5466) <= r4  <= 0x05d7af6f (+2^26.5466)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x198de2a1 (-2^28.6755) <= r4  <= 0x198de2a1 (+2^28.6755)
MONTRED r4, r3
    //// bounds:  -0x0004b8d (-2^14.2394) <= r4  <= 0x00004b8e (+2^14.2394)
str.w r4, [r0, #2704]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2708]
ldr.w r10, [r1, #2712]
ldr.w r9, [r1, #2716]
ldr.w r8, [r1, #2720]
ldr.w r7, [r1, #2724]
ldr.w r6, [r1, #2728]
ldr.w r5, [r1, #2732]
/*** basesqr 226 ***/
/* computing z0 = x0^2 + 2*zeta^226*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1040
mul.w r4, r4, r14
    //// bounds:  -0x0f329b0 (-2^23.9258) <= r4  <= 0x00f329b0 (+2^23.9258)
mla.w r4, r10, r10, r4
    //// bounds:  -0xace4349 (-2^27.4337) <= r4  <= 0x0ace4349 (+2^27.4337)
MONTRED r4, r3
    //// bounds:  -0x0003cce (-2^13.9261) <= r4  <= 0x00003cce (+2^13.9261)
str.w r4, [r0, #2712]
/* computing z1 = 2x0x1 + zeta^226 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =520
mul.w r4, r4, r14
    //// bounds:  -0x07994d8 (-2^22.9258) <= r4  <= 0x007994d8 (+2^22.9258)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x142fc80a (-2^28.3353) <= r4  <= 0x142fc80a (+2^28.3353)
MONTRED r4, r3
    //// bounds:  -0x000462f (-2^14.1331) <= r4  <= 0x00004630 (+2^14.1331)
str.w r4, [r0, #2716]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2720]
/*** basesqr 227 ***/
/* computing z0 = x0^2 + 2*zeta^227*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1040
mul.w r4, r4, r14
    //// bounds:  -0x0f329b0 (-2^23.9258) <= r4  <= 0x00f329b0 (+2^23.9258)
mla.w r4, r7, r7, r4
    //// bounds:  -0xace4349 (-2^27.4337) <= r4  <= 0x0ace4349 (+2^27.4337)
MONTRED r4, r3
    //// bounds:  -0x0003cce (-2^13.9261) <= r4  <= 0x00003cce (+2^13.9261)
str.w r4, [r0, #2724]
/* computing z1 = 2x0x1 + zeta^227 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-520
mul.w r4, r4, r14
    //// bounds:  -0x07994d8 (-2^22.9258) <= r4  <= 0x007994d8 (+2^22.9258)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x142fc80a (-2^28.3353) <= r4  <= 0x142fc80a (+2^28.3353)
MONTRED r4, r3
    //// bounds:  -0x000462f (-2^14.1331) <= r4  <= 0x00004630 (+2^14.1331)
str.w r4, [r0, #2728]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2732]
ldr.w r10, [r1, #2736]
ldr.w r9, [r1, #2740]
ldr.w r8, [r1, #2744]
ldr.w r7, [r1, #2748]
ldr.w r6, [r1, #2752]
ldr.w r5, [r1, #2756]
/*** basesqr 228 ***/
/* computing z0 = x0^2 + 2*zeta^228*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-487
mul.w r4, r4, r14
    //// bounds:  -0x071dd9d (-2^22.8312) <= r4  <= 0x0071dd9d (+2^22.8312)
mla.w r4, r10, r10, r4
    //// bounds:  -0xa4cf736 (-2^27.3647) <= r4  <= 0x0a4cf736 (+2^27.3647)
MONTRED r4, r3
    //// bounds:  -0x0003c4d (-2^13.9141) <= r4  <= 0x00003c4d (+2^13.9141)
str.w r4, [r0, #2736]
/* computing z1 = 2x0x1 + zeta^228 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12557
mul.w r4, r4, r14
    //// bounds:  -0xb77f51f (-2^27.5196) <= r4  <= 0x0b77f51f (+2^27.5196)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1f2e2851 (-2^28.9626) <= r4  <= 0x1f2e2851 (+2^28.9626)
MONTRED r4, r3
    //// bounds:  -0x000512e (-2^14.3430) <= r4  <= 0x0000512e (+2^14.3430)
str.w r4, [r0, #2740]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2744]
/*** basesqr 229 ***/
/* computing z0 = x0^2 + 2*zeta^229*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =487
mul.w r4, r4, r14
    //// bounds:  -0x071dd9d (-2^22.8312) <= r4  <= 0x0071dd9d (+2^22.8312)
mla.w r4, r7, r7, r4
    //// bounds:  -0xa4cf736 (-2^27.3647) <= r4  <= 0x0a4cf736 (+2^27.3647)
MONTRED r4, r3
    //// bounds:  -0x0003c4d (-2^13.9141) <= r4  <= 0x00003c4d (+2^13.9141)
str.w r4, [r0, #2748]
/* computing z1 = 2x0x1 + zeta^229 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12557
mul.w r4, r4, r14
    //// bounds:  -0xb77f51f (-2^27.5196) <= r4  <= 0x0b77f51f (+2^27.5196)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1f2e2851 (-2^28.9626) <= r4  <= 0x1f2e2851 (+2^28.9626)
MONTRED r4, r3
    //// bounds:  -0x000512e (-2^14.3430) <= r4  <= 0x0000512e (+2^14.3430)
str.w r4, [r0, #2752]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2756]
ldr.w r10, [r1, #2760]
ldr.w r9, [r1, #2764]
ldr.w r8, [r1, #2768]
ldr.w r7, [r1, #2772]
ldr.w r6, [r1, #2776]
ldr.w r5, [r1, #2780]
/*** basesqr 230 ***/
/* computing z0 = x0^2 + 2*zeta^230*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1117
mul.w r4, r4, r14
    //// bounds:  -0x1052a8f (-2^24.0288) <= r4  <= 0x01052a8f (+2^24.0288)
mla.w r4, r10, r10, r4
    //// bounds:  -0xae04428 (-2^27.4431) <= r4  <= 0x0ae04428 (+2^27.4431)
MONTRED r4, r3
    //// bounds:  -0x0003ce0 (-2^13.9278) <= r4  <= 0x00003ce0 (+2^13.9278)
str.w r4, [r0, #2760]
/* computing z1 = 2x0x1 + zeta^230 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12242
mul.w r4, r4, r14
    //// bounds:  -0xb2e4ea6 (-2^27.4830) <= r4  <= 0x0b2e4ea6 (+2^27.4830)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ee481d8 (-2^28.9492) <= r4  <= 0x1ee481d8 (+2^28.9492)
MONTRED r4, r3
    //// bounds:  -0x00050e4 (-2^14.3379) <= r4  <= 0x000050e5 (+2^14.3380)
str.w r4, [r0, #2764]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2768]
/*** basesqr 231 ***/
/* computing z0 = x0^2 + 2*zeta^231*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1117
mul.w r4, r4, r14
    //// bounds:  -0x1052a8f (-2^24.0288) <= r4  <= 0x01052a8f (+2^24.0288)
mla.w r4, r7, r7, r4
    //// bounds:  -0xae04428 (-2^27.4431) <= r4  <= 0x0ae04428 (+2^27.4431)
MONTRED r4, r3
    //// bounds:  -0x0003ce0 (-2^13.9278) <= r4  <= 0x00003ce0 (+2^13.9278)
str.w r4, [r0, #2772]
/* computing z1 = 2x0x1 + zeta^231 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12242
mul.w r4, r4, r14
    //// bounds:  -0xb2e4ea6 (-2^27.4830) <= r4  <= 0x0b2e4ea6 (+2^27.4830)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ee481d8 (-2^28.9492) <= r4  <= 0x1ee481d8 (+2^28.9492)
MONTRED r4, r3
    //// bounds:  -0x00050e4 (-2^14.3379) <= r4  <= 0x000050e5 (+2^14.3380)
str.w r4, [r0, #2776]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2780]
ldr.w r10, [r1, #2784]
ldr.w r9, [r1, #2788]
ldr.w r8, [r1, #2792]
ldr.w r7, [r1, #2796]
ldr.w r6, [r1, #2800]
ldr.w r5, [r1, #2804]
/*** basesqr 232 ***/
/* computing z0 = x0^2 + 2*zeta^232*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8889
mul.w r4, r4, r14
    //// bounds:  -0x81e5743 (-2^27.0212) <= r4  <= 0x081e5743 (+2^27.0212)
mla.w r4, r10, r10, r4
    //// bounds:  -0x11f970dc (-2^28.1679) <= r4  <= 0x11f970dc (+2^28.1679)
MONTRED r4, r3
    //// bounds:  -0x00043f9 (-2^14.0869) <= r4  <= 0x000043f9 (+2^14.0869)
str.w r4, [r0, #2784]
/* computing z1 = 2x0x1 + zeta^232 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8356
mul.w r4, r4, r14
    //// bounds:  -0x7a1b84c (-2^26.9320) <= r4  <= 0x07a1b84c (+2^26.9320)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b57eb7e (-2^28.7731) <= r4  <= 0x1b57eb7e (+2^28.7731)
MONTRED r4, r3
    //// bounds:  -0x0004d58 (-2^14.2732) <= r4  <= 0x00004d58 (+2^14.2732)
str.w r4, [r0, #2788]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2792]
/*** basesqr 233 ***/
/* computing z0 = x0^2 + 2*zeta^233*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8889
mul.w r4, r4, r14
    //// bounds:  -0x81e5743 (-2^27.0212) <= r4  <= 0x081e5743 (+2^27.0212)
mla.w r4, r7, r7, r4
    //// bounds:  -0x11f970dc (-2^28.1679) <= r4  <= 0x11f970dc (+2^28.1679)
MONTRED r4, r3
    //// bounds:  -0x00043f9 (-2^14.0869) <= r4  <= 0x000043f9 (+2^14.0869)
str.w r4, [r0, #2796]
/* computing z1 = 2x0x1 + zeta^233 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8356
mul.w r4, r4, r14
    //// bounds:  -0x7a1b84c (-2^26.9320) <= r4  <= 0x07a1b84c (+2^26.9320)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b57eb7e (-2^28.7731) <= r4  <= 0x1b57eb7e (+2^28.7731)
MONTRED r4, r3
    //// bounds:  -0x0004d58 (-2^14.2732) <= r4  <= 0x00004d58 (+2^14.2732)
str.w r4, [r0, #2800]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2804]
ldr.w r10, [r1, #2808]
ldr.w r9, [r1, #2812]
ldr.w r8, [r1, #2816]
ldr.w r7, [r1, #2820]
ldr.w r6, [r1, #2824]
ldr.w r5, [r1, #2828]
/*** basesqr 234 ***/
/* computing z0 = x0^2 + 2*zeta^234*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11416
mul.w r4, r4, r14
    //// bounds:  -0xa6d2e08 (-2^27.3822) <= r4  <= 0x0a6d2e08 (+2^27.3822)
mla.w r4, r10, r10, r4
    //// bounds:  -0x144847a1 (-2^28.3422) <= r4  <= 0x144847a1 (+2^28.3422)
MONTRED r4, r3
    //// bounds:  -0x0004648 (-2^14.1351) <= r4  <= 0x00004648 (+2^14.1351)
str.w r4, [r0, #2808]
/* computing z1 = 2x0x1 + zeta^234 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5708
mul.w r4, r4, r14
    //// bounds:  -0x5369704 (-2^26.3822) <= r4  <= 0x05369704 (+2^26.3822)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x18ecca36 (-2^28.6395) <= r4  <= 0x18ecca36 (+2^28.6395)
MONTRED r4, r3
    //// bounds:  -0x0004aec (-2^14.2273) <= r4  <= 0x00004aed (+2^14.2274)
str.w r4, [r0, #2812]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2816]
/*** basesqr 235 ***/
/* computing z0 = x0^2 + 2*zeta^235*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11416
mul.w r4, r4, r14
    //// bounds:  -0xa6d2e08 (-2^27.3822) <= r4  <= 0x0a6d2e08 (+2^27.3822)
mla.w r4, r7, r7, r4
    //// bounds:  -0x144847a1 (-2^28.3422) <= r4  <= 0x144847a1 (+2^28.3422)
MONTRED r4, r3
    //// bounds:  -0x0004648 (-2^14.1351) <= r4  <= 0x00004648 (+2^14.1351)
str.w r4, [r0, #2820]
/* computing z1 = 2x0x1 + zeta^235 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5708
mul.w r4, r4, r14
    //// bounds:  -0x5369704 (-2^26.3822) <= r4  <= 0x05369704 (+2^26.3822)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x18ecca36 (-2^28.6395) <= r4  <= 0x18ecca36 (+2^28.6395)
MONTRED r4, r3
    //// bounds:  -0x0004aec (-2^14.2273) <= r4  <= 0x00004aed (+2^14.2274)
str.w r4, [r0, #2824]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2828]
ldr.w r10, [r1, #2832]
ldr.w r9, [r1, #2836]
ldr.w r8, [r1, #2840]
ldr.w r7, [r1, #2844]
ldr.w r6, [r1, #2848]
ldr.w r5, [r1, #2852]
/*** basesqr 236 ***/
/* computing z0 = x0^2 + 2*zeta^236*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7512
mul.w r4, r4, r14
    //// bounds:  -0x6dc6248 (-2^26.7784) <= r4  <= 0x06dc6248 (+2^26.7784)
mla.w r4, r10, r10, r4
    //// bounds:  -0x10b77be1 (-2^28.0632) <= r4  <= 0x10b77be1 (+2^28.0632)
MONTRED r4, r3
    //// bounds:  -0x00042b7 (-2^14.0599) <= r4  <= 0x000042b7 (+2^14.0599)
str.w r4, [r0, #2832]
/* computing z1 = 2x0x1 + zeta^236 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3756
mul.w r4, r4, r14
    //// bounds:  -0x36e3124 (-2^25.7784) <= r4  <= 0x036e3124 (+2^25.7784)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17246456 (-2^28.5325) <= r4  <= 0x17246456 (+2^28.5325)
MONTRED r4, r3
    //// bounds:  -0x0004924 (-2^14.1926) <= r4  <= 0x00004924 (+2^14.1926)
str.w r4, [r0, #2836]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2840]
/*** basesqr 237 ***/
/* computing z0 = x0^2 + 2*zeta^237*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7512
mul.w r4, r4, r14
    //// bounds:  -0x6dc6248 (-2^26.7784) <= r4  <= 0x06dc6248 (+2^26.7784)
mla.w r4, r7, r7, r4
    //// bounds:  -0x10b77be1 (-2^28.0632) <= r4  <= 0x10b77be1 (+2^28.0632)
MONTRED r4, r3
    //// bounds:  -0x00042b7 (-2^14.0599) <= r4  <= 0x000042b7 (+2^14.0599)
str.w r4, [r0, #2844]
/* computing z1 = 2x0x1 + zeta^237 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3756
mul.w r4, r4, r14
    //// bounds:  -0x36e3124 (-2^25.7784) <= r4  <= 0x036e3124 (+2^25.7784)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x17246456 (-2^28.5325) <= r4  <= 0x17246456 (+2^28.5325)
MONTRED r4, r3
    //// bounds:  -0x0004924 (-2^14.1926) <= r4  <= 0x00004924 (+2^14.1926)
str.w r4, [r0, #2848]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2852]
ldr.w r10, [r1, #2856]
ldr.w r9, [r1, #2860]
ldr.w r8, [r1, #2864]
ldr.w r7, [r1, #2868]
ldr.w r6, [r1, #2872]
ldr.w r5, [r1, #2876]
/*** basesqr 238 ***/
/* computing z0 = x0^2 + 2*zeta^238*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =1327
mul.w r4, r4, r14
    //// bounds:  -0x1364435 (-2^24.2774) <= r4  <= 0x01364435 (+2^24.2774)
mla.w r4, r10, r10, r4
    //// bounds:  -0xb115dce (-2^27.4683) <= r4  <= 0x0b115dce (+2^27.4683)
MONTRED r4, r3
    //// bounds:  -0x0003d11 (-2^13.9323) <= r4  <= 0x00003d11 (+2^13.9323)
str.w r4, [r0, #2856]
/* computing z1 = 2x0x1 + zeta^238 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-12137
mul.w r4, r4, r14
    //// bounds:  -0xb15c1d3 (-2^27.4705) <= r4  <= 0x0b15c1d3 (+2^27.4705)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ecbf505 (-2^28.9447) <= r4  <= 0x1ecbf505 (+2^28.9447)
MONTRED r4, r3
    //// bounds:  -0x00050cc (-2^14.3362) <= r4  <= 0x000050cc (+2^14.3362)
str.w r4, [r0, #2860]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2864]
/*** basesqr 239 ***/
/* computing z0 = x0^2 + 2*zeta^239*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-1327
mul.w r4, r4, r14
    //// bounds:  -0x1364435 (-2^24.2774) <= r4  <= 0x01364435 (+2^24.2774)
mla.w r4, r7, r7, r4
    //// bounds:  -0xb115dce (-2^27.4683) <= r4  <= 0x0b115dce (+2^27.4683)
MONTRED r4, r3
    //// bounds:  -0x0003d11 (-2^13.9323) <= r4  <= 0x00003d11 (+2^13.9323)
str.w r4, [r0, #2868]
/* computing z1 = 2x0x1 + zeta^239 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =12137
mul.w r4, r4, r14
    //// bounds:  -0xb15c1d3 (-2^27.4705) <= r4  <= 0x0b15c1d3 (+2^27.4705)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1ecbf505 (-2^28.9447) <= r4  <= 0x1ecbf505 (+2^28.9447)
MONTRED r4, r3
    //// bounds:  -0x00050cc (-2^14.3362) <= r4  <= 0x000050cc (+2^14.3362)
str.w r4, [r0, #2872]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2876]
ldr.w r10, [r1, #2880]
ldr.w r9, [r1, #2884]
ldr.w r8, [r1, #2888]
ldr.w r7, [r1, #2892]
ldr.w r6, [r1, #2896]
ldr.w r5, [r1, #2900]
/*** basesqr 240 ***/
/* computing z0 = x0^2 + 2*zeta^240*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9473
mul.w r4, r4, r14
    //// bounds:  -0x8a6e2db (-2^27.1130) <= r4  <= 0x08a6e2db (+2^27.1130)
mla.w r4, r10, r10, r4
    //// bounds:  -0x1281fc74 (-2^28.2101) <= r4  <= 0x1281fc74 (+2^28.2101)
MONTRED r4, r3
    //// bounds:  -0x0004482 (-2^14.0982) <= r4  <= 0x00004482 (+2^14.0982)
str.w r4, [r0, #2880]
/* computing z1 = 2x0x1 + zeta^240 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8064
mul.w r4, r4, r14
    //// bounds:  -0x75d7280 (-2^26.8807) <= r4  <= 0x075d7280 (+2^26.8807)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b13a5b2 (-2^28.7590) <= r4  <= 0x1b13a5b2 (+2^28.7590)
MONTRED r4, r3
    //// bounds:  -0x0004d13 (-2^14.2682) <= r4  <= 0x00004d14 (+2^14.2682)
str.w r4, [r0, #2884]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2888]
/*** basesqr 241 ***/
/* computing z0 = x0^2 + 2*zeta^241*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9473
mul.w r4, r4, r14
    //// bounds:  -0x8a6e2db (-2^27.1130) <= r4  <= 0x08a6e2db (+2^27.1130)
mla.w r4, r7, r7, r4
    //// bounds:  -0x1281fc74 (-2^28.2101) <= r4  <= 0x1281fc74 (+2^28.2101)
MONTRED r4, r3
    //// bounds:  -0x0004482 (-2^14.0982) <= r4  <= 0x00004482 (+2^14.0982)
str.w r4, [r0, #2892]
/* computing z1 = 2x0x1 + zeta^241 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8064
mul.w r4, r4, r14
    //// bounds:  -0x75d7280 (-2^26.8807) <= r4  <= 0x075d7280 (+2^26.8807)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b13a5b2 (-2^28.7590) <= r4  <= 0x1b13a5b2 (+2^28.7590)
MONTRED r4, r3
    //// bounds:  -0x0004d13 (-2^14.2682) <= r4  <= 0x00004d14 (+2^14.2682)
str.w r4, [r0, #2896]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2900]
ldr.w r10, [r1, #2904]
ldr.w r9, [r1, #2908]
b.w 1f
.ltorg /* constant pool */
1:
ldr.w r8, [r1, #2912]
ldr.w r7, [r1, #2916]
ldr.w r6, [r1, #2920]
ldr.w r5, [r1, #2924]
/*** basesqr 242 ***/
/* computing z0 = x0^2 + 2*zeta^242*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5221
mul.w r4, r4, r14
    //// bounds:  -0x4c4b967 (-2^26.2535) <= r4  <= 0x04c4b967 (+2^26.2535)
mla.w r4, r10, r10, r4
    //// bounds:  -0xe9fd300 (-2^27.8703) <= r4  <= 0x0e9fd300 (+2^27.8703)
MONTRED r4, r3
    //// bounds:  -0x000409f (-2^14.0139) <= r4  <= 0x000040a0 (+2^14.0140)
str.w r4, [r0, #2904]
/* computing z1 = 2x0x1 + zeta^242 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =10190
mul.w r4, r4, r14
    //// bounds:  -0x94e873a (-2^27.2183) <= r4  <= 0x094e873a (+2^27.2183)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d04ba6c (-2^28.8589) <= r4  <= 0x1d04ba6c (+2^28.8589)
MONTRED r4, r3
    //// bounds:  -0x0004f04 (-2^14.3041) <= r4  <= 0x00004f05 (+2^14.3041)
str.w r4, [r0, #2908]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2912]
/*** basesqr 243 ***/
/* computing z0 = x0^2 + 2*zeta^243*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5221
mul.w r4, r4, r14
    //// bounds:  -0x4c4b967 (-2^26.2535) <= r4  <= 0x04c4b967 (+2^26.2535)
mla.w r4, r7, r7, r4
    //// bounds:  -0xe9fd300 (-2^27.8703) <= r4  <= 0x0e9fd300 (+2^27.8703)
MONTRED r4, r3
    //// bounds:  -0x000409f (-2^14.0139) <= r4  <= 0x000040a0 (+2^14.0140)
str.w r4, [r0, #2916]
/* computing z1 = 2x0x1 + zeta^243 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-10190
mul.w r4, r4, r14
    //// bounds:  -0x94e873a (-2^27.2183) <= r4  <= 0x094e873a (+2^27.2183)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d04ba6c (-2^28.8589) <= r4  <= 0x1d04ba6c (+2^28.8589)
MONTRED r4, r3
    //// bounds:  -0x0004f04 (-2^14.3041) <= r4  <= 0x00004f05 (+2^14.3041)
str.w r4, [r0, #2920]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2924]
ldr.w r10, [r1, #2928]
ldr.w r9, [r1, #2932]
ldr.w r8, [r1, #2936]
ldr.w r7, [r1, #2940]
ldr.w r6, [r1, #2944]
ldr.w r5, [r1, #2948]
/*** basesqr 244 ***/
/* computing z0 = x0^2 + 2*zeta^244*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-9051
mul.w r4, r4, r14
    //// bounds:  -0x84437d9 (-2^27.0473) <= r4  <= 0x084437d9 (+2^27.0473)
mla.w r4, r10, r10, r4
    //// bounds:  -0x121f5172 (-2^28.1797) <= r4  <= 0x121f5172 (+2^28.1797)
MONTRED r4, r3
    //// bounds:  -0x000441f (-2^14.0900) <= r4  <= 0x0000441f (+2^14.0900)
str.w r4, [r0, #2928]
/* computing z1 = 2x0x1 + zeta^244 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8275
mul.w r4, r4, r14
    //// bounds:  -0x78ec801 (-2^26.9180) <= r4  <= 0x078ec801 (+2^26.9180)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b44fb33 (-2^28.7692) <= r4  <= 0x1b44fb33 (+2^28.7692)
MONTRED r4, r3
    //// bounds:  -0x0004d45 (-2^14.2718) <= r4  <= 0x00004d45 (+2^14.2718)
str.w r4, [r0, #2932]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2936]
/*** basesqr 245 ***/
/* computing z0 = x0^2 + 2*zeta^245*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =9051
mul.w r4, r4, r14
    //// bounds:  -0x84437d9 (-2^27.0473) <= r4  <= 0x084437d9 (+2^27.0473)
mla.w r4, r7, r7, r4
    //// bounds:  -0x121f5172 (-2^28.1797) <= r4  <= 0x121f5172 (+2^28.1797)
MONTRED r4, r3
    //// bounds:  -0x000441f (-2^14.0900) <= r4  <= 0x0000441f (+2^14.0900)
str.w r4, [r0, #2940]
/* computing z1 = 2x0x1 + zeta^245 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8275
mul.w r4, r4, r14
    //// bounds:  -0x78ec801 (-2^26.9180) <= r4  <= 0x078ec801 (+2^26.9180)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b44fb33 (-2^28.7692) <= r4  <= 0x1b44fb33 (+2^28.7692)
MONTRED r4, r3
    //// bounds:  -0x0004d45 (-2^14.2718) <= r4  <= 0x00004d45 (+2^14.2718)
str.w r4, [r0, #2944]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2948]
ldr.w r10, [r1, #2952]
ldr.w r9, [r1, #2956]
ldr.w r8, [r1, #2960]
ldr.w r7, [r1, #2964]
ldr.w r6, [r1, #2968]
ldr.w r5, [r1, #2972]
/*** basesqr 246 ***/
/* computing z0 = x0^2 + 2*zeta^246*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11097
mul.w r4, r4, r14
    //// bounds:  -0xa229823 (-2^27.3413) <= r4  <= 0x0a229823 (+2^27.3413)
mla.w r4, r10, r10, r4
    //// bounds:  -0x13fdb1bc (-2^28.3213) <= r4  <= 0x13fdb1bc (+2^28.3213)
MONTRED r4, r3
    //// bounds:  -0x00045fd (-2^14.1290) <= r4  <= 0x000045fe (+2^14.1291)
str.w r4, [r0, #2952]
/* computing z1 = 2x0x1 + zeta^246 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7252
mul.w r4, r4, r14
    //// bounds:  -0x69f97dc (-2^26.7276) <= r4  <= 0x069f97dc (+2^26.7276)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a55cb0e (-2^28.7189) <= r4  <= 0x1a55cb0e (+2^28.7189)
MONTRED r4, r3
    //// bounds:  -0x0004c55 (-2^14.2542) <= r4  <= 0x00004c56 (+2^14.2543)
str.w r4, [r0, #2956]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2960]
/*** basesqr 247 ***/
/* computing z0 = x0^2 + 2*zeta^247*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11097
mul.w r4, r4, r14
    //// bounds:  -0xa229823 (-2^27.3413) <= r4  <= 0x0a229823 (+2^27.3413)
mla.w r4, r7, r7, r4
    //// bounds:  -0x13fdb1bc (-2^28.3213) <= r4  <= 0x13fdb1bc (+2^28.3213)
MONTRED r4, r3
    //// bounds:  -0x00045fd (-2^14.1290) <= r4  <= 0x000045fe (+2^14.1291)
str.w r4, [r0, #2964]
/* computing z1 = 2x0x1 + zeta^247 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7252
mul.w r4, r4, r14
    //// bounds:  -0x69f97dc (-2^26.7276) <= r4  <= 0x069f97dc (+2^26.7276)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1a55cb0e (-2^28.7189) <= r4  <= 0x1a55cb0e (+2^28.7189)
MONTRED r4, r3
    //// bounds:  -0x0004c55 (-2^14.2542) <= r4  <= 0x00004c56 (+2^14.2543)
str.w r4, [r0, #2968]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2972]
ldr.w r10, [r1, #2976]
ldr.w r9, [r1, #2980]
ldr.w r8, [r1, #2984]
ldr.w r7, [r1, #2988]
ldr.w r6, [r1, #2992]
ldr.w r5, [r1, #2996]
/*** basesqr 248 ***/
/* computing z0 = x0^2 + 2*zeta^248*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-11230
mul.w r4, r4, r14
    //// bounds:  -0xa41b0ea (-2^27.3585) <= r4  <= 0x0a41b0ea (+2^27.3585)
mla.w r4, r10, r10, r4
    //// bounds:  -0x141cca83 (-2^28.3300) <= r4  <= 0x141cca83 (+2^28.3300)
MONTRED r4, r3
    //// bounds:  -0x000461c (-2^14.1315) <= r4  <= 0x0000461d (+2^14.1316)
str.w r4, [r0, #2976]
/* computing z1 = 2x0x1 + zeta^248 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-5615
mul.w r4, r4, r14
    //// bounds:  -0x520d875 (-2^26.3585) <= r4  <= 0x0520d875 (+2^26.3585)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x18d70ba7 (-2^28.6346) <= r4  <= 0x18d70ba7 (+2^28.6346)
MONTRED r4, r3
    //// bounds:  -0x0004ad7 (-2^14.2257) <= r4  <= 0x00004ad7 (+2^14.2257)
str.w r4, [r0, #2980]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2984]
/*** basesqr 249 ***/
/* computing z0 = x0^2 + 2*zeta^249*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =11230
mul.w r4, r4, r14
    //// bounds:  -0xa41b0ea (-2^27.3585) <= r4  <= 0x0a41b0ea (+2^27.3585)
mla.w r4, r7, r7, r4
    //// bounds:  -0x141cca83 (-2^28.3300) <= r4  <= 0x141cca83 (+2^28.3300)
MONTRED r4, r3
    //// bounds:  -0x000461c (-2^14.1315) <= r4  <= 0x0000461d (+2^14.1316)
str.w r4, [r0, #2988]
/* computing z1 = 2x0x1 + zeta^249 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =5615
mul.w r4, r4, r14
    //// bounds:  -0x520d875 (-2^26.3585) <= r4  <= 0x0520d875 (+2^26.3585)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x18d70ba7 (-2^28.6346) <= r4  <= 0x18d70ba7 (+2^28.6346)
MONTRED r4, r3
    //// bounds:  -0x0004ad7 (-2^14.2257) <= r4  <= 0x00004ad7 (+2^14.2257)
str.w r4, [r0, #2992]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2996]
ldr.w r10, [r1, #3000]
ldr.w r9, [r1, #3004]
ldr.w r8, [r1, #3008]
ldr.w r7, [r1, #3012]
ldr.w r6, [r1, #3016]
ldr.w r5, [r1, #3020]
/*** basesqr 250 ***/
/* computing z0 = x0^2 + 2*zeta^250*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-4730
mul.w r4, r4, r14
    //// bounds:  -0x451ec5e (-2^26.1110) <= r4  <= 0x0451ec5e (+2^26.1110)
mla.w r4, r10, r10, r4
    //// bounds:  -0xe2d05f7 (-2^27.8254) <= r4  <= 0x0e2d05f7 (+2^27.8254)
MONTRED r4, r3
    //// bounds:  -0x000402d (-2^14.0040) <= r4  <= 0x0000402d (+2^14.0040)
str.w r4, [r0, #3000]
/* computing z1 = 2x0x1 + zeta^250 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-2365
mul.w r4, r4, r14
    //// bounds:  -0x228f62f (-2^25.1110) <= r4  <= 0x0228f62f (+2^25.1110)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x15df2961 (-2^28.4510) <= r4  <= 0x15df2961 (+2^28.4510)
MONTRED r4, r3
    //// bounds:  -0x00047df (-2^14.1673) <= r4  <= 0x000047df (+2^14.1673)
str.w r4, [r0, #3004]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3008]
/*** basesqr 251 ***/
/* computing z0 = x0^2 + 2*zeta^251*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =4730
mul.w r4, r4, r14
    //// bounds:  -0x451ec5e (-2^26.1110) <= r4  <= 0x0451ec5e (+2^26.1110)
mla.w r4, r7, r7, r4
    //// bounds:  -0xe2d05f7 (-2^27.8254) <= r4  <= 0x0e2d05f7 (+2^27.8254)
MONTRED r4, r3
    //// bounds:  -0x000402d (-2^14.0040) <= r4  <= 0x0000402d (+2^14.0040)
str.w r4, [r0, #3012]
/* computing z1 = 2x0x1 + zeta^251 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =2365
mul.w r4, r4, r14
    //// bounds:  -0x228f62f (-2^25.1110) <= r4  <= 0x0228f62f (+2^25.1110)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x15df2961 (-2^28.4510) <= r4  <= 0x15df2961 (+2^28.4510)
MONTRED r4, r3
    //// bounds:  -0x00047df (-2^14.1673) <= r4  <= 0x000047df (+2^14.1673)
str.w r4, [r0, #3016]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3020]
ldr.w r10, [r1, #3024]
ldr.w r9, [r1, #3028]
ldr.w r8, [r1, #3032]
ldr.w r7, [r1, #3036]
ldr.w r6, [r1, #3040]
ldr.w r5, [r1, #3044]
/*** basesqr 252 ***/
/* computing z0 = x0^2 + 2*zeta^252*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8369
mul.w r4, r4, r14
    //// bounds:  -0x7a4c26b (-2^26.9343) <= r4  <= 0x07a4c26b (+2^26.9343)
mla.w r4, r10, r10, r4
    //// bounds:  -0x117fdc04 (-2^28.1292) <= r4  <= 0x117fdc04 (+2^28.1292)
MONTRED r4, r3
    //// bounds:  -0x000437f (-2^14.0767) <= r4  <= 0x00004380 (+2^14.0768)
str.w r4, [r0, #3024]
/* computing z1 = 2x0x1 + zeta^252 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8616
mul.w r4, r4, r14
    //// bounds:  -0x7de82b8 (-2^26.9762) <= r4  <= 0x07de82b8 (+2^26.9762)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b94b5ea (-2^28.7856) <= r4  <= 0x1b94b5ea (+2^28.7856)
MONTRED r4, r3
    //// bounds:  -0x0004d94 (-2^14.2776) <= r4  <= 0x00004d95 (+2^14.2777)
str.w r4, [r0, #3028]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3032]
/*** basesqr 253 ***/
/* computing z0 = x0^2 + 2*zeta^253*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-8369
mul.w r4, r4, r14
    //// bounds:  -0x7a4c26b (-2^26.9343) <= r4  <= 0x07a4c26b (+2^26.9343)
mla.w r4, r7, r7, r4
    //// bounds:  -0x117fdc04 (-2^28.1292) <= r4  <= 0x117fdc04 (+2^28.1292)
MONTRED r4, r3
    //// bounds:  -0x000437f (-2^14.0767) <= r4  <= 0x00004380 (+2^14.0768)
str.w r4, [r0, #3036]
/* computing z1 = 2x0x1 + zeta^253 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =8616
mul.w r4, r4, r14
    //// bounds:  -0x7de82b8 (-2^26.9762) <= r4  <= 0x07de82b8 (+2^26.9762)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1b94b5ea (-2^28.7856) <= r4  <= 0x1b94b5ea (+2^28.7856)
MONTRED r4, r3
    //// bounds:  -0x0004d94 (-2^14.2776) <= r4  <= 0x00004d95 (+2^14.2777)
str.w r4, [r0, #3040]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3044]
ldr.w r10, [r1, #3048]
ldr.w r9, [r1, #3052]
ldr.w r8, [r1, #3056]
ldr.w r7, [r1, #3060]
ldr.w r6, [r1, #3064]
ldr.w r5, [r1, #3068]
/*** basesqr 254 ***/
/* computing z0 = x0^2 + 2*zeta^254*x1x2 */
mul.w r4, r9, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =7788
mul.w r4, r4, r14
    //// bounds:  -0x71cea64 (-2^26.8304) <= r4  <= 0x071cea64 (+2^26.8304)
mla.w r4, r10, r10, r4
    //// bounds:  -0x10f803fd (-2^28.0848) <= r4  <= 0x10f803fd (+2^28.0848)
MONTRED r4, r3
    //// bounds:  -0x00042f8 (-2^14.0654) <= r4  <= 0x000042f8 (+2^14.0654)
str.w r4, [r0, #3048]
/* computing z1 = 2x0x1 + zeta^254 * x2^2 */
mul.w r4, r8, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =3894
mul.w r4, r4, r14
    //// bounds:  -0x38e7532 (-2^25.8304) <= r4  <= 0x038e7532 (+2^25.8304)
mul.w r3, r10, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1744a864 (-2^28.5403) <= r4  <= 0x1744a864 (+2^28.5403)
MONTRED r4, r3
    //// bounds:  -0x0004944 (-2^14.1951) <= r4  <= 0x00004945 (+2^14.1951)
str.w r4, [r0, #3052]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r9, r9
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r10, r8
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3056]
/*** basesqr 255 ***/
/* computing z0 = x0^2 + 2*zeta^255*x1x2 */
mul.w r4, r6, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-7788
mul.w r4, r4, r14
    //// bounds:  -0x71cea64 (-2^26.8304) <= r4  <= 0x071cea64 (+2^26.8304)
mla.w r4, r7, r7, r4
    //// bounds:  -0x10f803fd (-2^28.0848) <= r4  <= 0x10f803fd (+2^28.0848)
MONTRED r4, r3
    //// bounds:  -0x00042f8 (-2^14.0654) <= r4  <= 0x000042f8 (+2^14.0654)
str.w r4, [r0, #3060]
/* computing z1 = 2x0x1 + zeta^255 * x2^2 */
mul.w r4, r5, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
ldr.w r14, =-3894
mul.w r4, r4, r14
    //// bounds:  -0x38e7532 (-2^25.8304) <= r4  <= 0x038e7532 (+2^25.8304)
mul.w r3, r7, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1744a864 (-2^28.5403) <= r4  <= 0x1744a864 (+2^28.5403)
MONTRED r4, r3
    //// bounds:  -0x0004944 (-2^14.1951) <= r4  <= 0x00004945 (+2^14.1951)
str.w r4, [r0, #3064]
/* computing z2 = x1^2 + 2x0x2 */
mul.w r4, r6, r6
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mul.w r3, r7, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r3  <= 0x09db1999 (+2^27.3010)
add.w r4, r4, r3, lsl #1
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3068]
    pop {r4-r11, pc}
    .ltorg
    
/* minimum available registers: 1 */
