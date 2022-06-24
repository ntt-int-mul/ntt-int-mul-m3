    .syntax unified
    .cpu cortex-m3
    .section .text

    .align 2
    .global basemul_25601
    .type basemul_25601, %function
    basemul_25601:
    push {r4-r11, lr}
    
ldr.w r10, [r1, #0]
ldr.w r9, [r1, #4]
ldr.w r8, [r1, #8]
ldr.w r7, [r2, #0]
ldr.w r6, [r2, #4]
ldr.w r5, [r2, #8]
/*** basemul 0 ***/
/* computing z0 = x0y0 + zeta^0 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
        .macro MONTRED z, tmp
            mul.w \tmp, \z, r11
            sbfx.w \tmp, \tmp, #0, #16
            mls.w \z, \tmp, r12, \z
            asr.w \z, #16
        .endm
        
ldr.w r11, =39937
ldr.w r12, =25601
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-11267
mul.w r4, r4, r14
    //// bounds:  -0xbfc1922 (-2^27.5831) <= r4  <= 0x0bfc1922 (+2^27.5831)
mla.w r4, r10, r7, r4
    //// bounds:  -0x15d732bb (-2^28.4489) <= r4  <= 0x15d732bb (+2^28.4489)
MONTRED r4, r3
    //// bounds:  -0x00047d7 (-2^14.1667) <= r4  <= 0x000047d7 (+2^14.1667)
str.w r4, [r0, #0]
/* computing z1 = x1y0 + x0y1 + zeta^0 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xa4a5791 (-2^27.3632) <= r4  <= 0x0a4a5791 (+2^27.3632)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1425712a (-2^28.3324) <= r4  <= 0x1425712a (+2^28.3324)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e008ac3 (-2^28.9070) <= r4  <= 0x1e008ac3 (+2^28.9070)
MONTRED r4, r3
    //// bounds:  -0x0005000 (-2^14.3219) <= r4  <= 0x00005001 (+2^14.3220)
str.w r4, [r0, #4]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #8]
ldr.w r10, [r1, #12]
ldr.w r9, [r1, #16]
ldr.w r8, [r1, #20]
ldr.w r7, [r2, #12]
ldr.w r6, [r2, #16]
ldr.w r5, [r2, #20]
/*** basemul 1 ***/
/* computing z0 = x0y0 + zeta^1 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =11267
mul.w r4, r4, r14
    //// bounds:  -0xbfc1922 (-2^27.5831) <= r4  <= 0x0bfc1922 (+2^27.5831)
mla.w r4, r10, r7, r4
    //// bounds:  -0x15d732bb (-2^28.4489) <= r4  <= 0x15d732bb (+2^28.4489)
MONTRED r4, r3
    //// bounds:  -0x00047d7 (-2^14.1667) <= r4  <= 0x000047d7 (+2^14.1667)
str.w r4, [r0, #12]
/* computing z1 = x1y0 + x0y1 + zeta^1 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xa4a5791 (-2^27.3632) <= r4  <= 0x0a4a5791 (+2^27.3632)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1425712a (-2^28.3324) <= r4  <= 0x1425712a (+2^28.3324)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e008ac3 (-2^28.9070) <= r4  <= 0x1e008ac3 (+2^28.9070)
MONTRED r4, r3
    //// bounds:  -0x0005000 (-2^14.3219) <= r4  <= 0x00005001 (+2^14.3220)
str.w r4, [r0, #16]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #20]
ldr.w r10, [r1, #24]
ldr.w r9, [r1, #28]
ldr.w r8, [r1, #32]
ldr.w r7, [r2, #24]
ldr.w r6, [r2, #28]
ldr.w r5, [r2, #32]
/*** basemul 2 ***/
/* computing z0 = x0y0 + zeta^2 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10650
mul.w r4, r4, r14
    //// bounds:  -0xb54157c (-2^27.5019) <= r4  <= 0x0b54157c (+2^27.5019)
mla.w r4, r10, r7, r4
    //// bounds:  -0x152f2f15 (-2^28.4049) <= r4  <= 0x152f2f15 (+2^28.4049)
MONTRED r4, r3
    //// bounds:  -0x000472f (-2^14.1535) <= r4  <= 0x0000472f (+2^14.1535)
str.w r4, [r0, #24]
/* computing z1 = x1y0 + x0y1 + zeta^2 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x9ba14be (-2^27.2820) <= r4  <= 0x09ba14be (+2^27.2820)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13952e57 (-2^28.2915) <= r4  <= 0x13952e57 (+2^28.2915)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d7047f0 (-2^28.8796) <= r4  <= 0x1d7047f0 (+2^28.8796)
MONTRED r4, r3
    //// bounds:  -0x0004f70 (-2^14.3117) <= r4  <= 0x00004f70 (+2^14.3117)
str.w r4, [r0, #28]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #32]
ldr.w r10, [r1, #36]
ldr.w r9, [r1, #40]
ldr.w r8, [r1, #44]
ldr.w r7, [r2, #36]
ldr.w r6, [r2, #40]
ldr.w r5, [r2, #44]
/*** basemul 3 ***/
/* computing z0 = x0y0 + zeta^3 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10650
mul.w r4, r4, r14
    //// bounds:  -0xb54157c (-2^27.5019) <= r4  <= 0x0b54157c (+2^27.5019)
mla.w r4, r10, r7, r4
    //// bounds:  -0x152f2f15 (-2^28.4049) <= r4  <= 0x152f2f15 (+2^28.4049)
MONTRED r4, r3
    //// bounds:  -0x000472f (-2^14.1535) <= r4  <= 0x0000472f (+2^14.1535)
str.w r4, [r0, #36]
/* computing z1 = x1y0 + x0y1 + zeta^3 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x9ba14be (-2^27.2820) <= r4  <= 0x09ba14be (+2^27.2820)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13952e57 (-2^28.2915) <= r4  <= 0x13952e57 (+2^28.2915)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d7047f0 (-2^28.8796) <= r4  <= 0x1d7047f0 (+2^28.8796)
MONTRED r4, r3
    //// bounds:  -0x0004f70 (-2^14.3117) <= r4  <= 0x00004f70 (+2^14.3117)
str.w r4, [r0, #40]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #44]
ldr.w r10, [r1, #48]
ldr.w r9, [r1, #52]
ldr.w r8, [r1, #56]
ldr.w r7, [r2, #48]
ldr.w r6, [r2, #52]
ldr.w r5, [r2, #56]
/*** basemul 4 ***/
/* computing z0 = x0y0 + zeta^4 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-2644
mul.w r4, r4, r14
    //// bounds:  -0x2cffbb8 (-2^25.4918) <= r4  <= 0x02cffbb8 (+2^25.4918)
mla.w r4, r10, r7, r4
    //// bounds:  -0xcab1551 (-2^27.6632) <= r4  <= 0x0cab1551 (+2^27.6632)
MONTRED r4, r3
    //// bounds:  -0x0003eab (-2^13.9697) <= r4  <= 0x00003eab (+2^13.9697)
str.w r4, [r0, #48]
/* computing z1 = x1y0 + x0y1 + zeta^4 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x26a31dc (-2^25.2719) <= r4  <= 0x026a31dc (+2^25.2719)
mla.w r4, r9, r7, r4
    //// bounds:  -0xc454b75 (-2^27.6171) <= r4  <= 0x0c454b75 (+2^27.6171)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1620650e (-2^28.4677) <= r4  <= 0x1620650e (+2^28.4677)
MONTRED r4, r3
    //// bounds:  -0x0004820 (-2^14.1724) <= r4  <= 0x00004820 (+2^14.1724)
str.w r4, [r0, #52]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #56]
ldr.w r10, [r1, #60]
ldr.w r9, [r1, #64]
ldr.w r8, [r1, #68]
ldr.w r7, [r2, #60]
ldr.w r6, [r2, #64]
ldr.w r5, [r2, #68]
/*** basemul 5 ***/
/* computing z0 = x0y0 + zeta^5 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =2644
mul.w r4, r4, r14
    //// bounds:  -0x2cffbb8 (-2^25.4918) <= r4  <= 0x02cffbb8 (+2^25.4918)
mla.w r4, r10, r7, r4
    //// bounds:  -0xcab1551 (-2^27.6632) <= r4  <= 0x0cab1551 (+2^27.6632)
MONTRED r4, r3
    //// bounds:  -0x0003eab (-2^13.9697) <= r4  <= 0x00003eab (+2^13.9697)
str.w r4, [r0, #60]
/* computing z1 = x1y0 + x0y1 + zeta^5 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x26a31dc (-2^25.2719) <= r4  <= 0x026a31dc (+2^25.2719)
mla.w r4, r9, r7, r4
    //// bounds:  -0xc454b75 (-2^27.6171) <= r4  <= 0x0c454b75 (+2^27.6171)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1620650e (-2^28.4677) <= r4  <= 0x1620650e (+2^28.4677)
MONTRED r4, r3
    //// bounds:  -0x0004820 (-2^14.1724) <= r4  <= 0x00004820 (+2^14.1724)
str.w r4, [r0, #64]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #68]
ldr.w r10, [r1, #72]
ldr.w r9, [r1, #76]
ldr.w r8, [r1, #80]
ldr.w r7, [r2, #72]
ldr.w r6, [r2, #76]
ldr.w r5, [r2, #80]
/*** basemul 6 ***/
/* computing z0 = x0y0 + zeta^6 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =12177
mul.w r4, r4, r14
    //// bounds:  -0xcf3e616 (-2^27.6952) <= r4  <= 0x0cf3e616 (+2^27.6952)
mla.w r4, r10, r7, r4
    //// bounds:  -0x16ceffaf (-2^28.5115) <= r4  <= 0x16ceffaf (+2^28.5115)
MONTRED r4, r3
    //// bounds:  -0x00048cf (-2^14.1860) <= r4  <= 0x000048cf (+2^14.1860)
str.w r4, [r0, #72]
/* computing z1 = x1y0 + x0y1 + zeta^6 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb1f1c0b (-2^27.4753) <= r4  <= 0x0b1f1c0b (+2^27.4753)
mla.w r4, r9, r7, r4
    //// bounds:  -0x14fa35a4 (-2^28.3908) <= r4  <= 0x14fa35a4 (+2^28.3908)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ed54f3d (-2^28.9464) <= r4  <= 0x1ed54f3d (+2^28.9464)
MONTRED r4, r3
    //// bounds:  -0x00050d5 (-2^14.3369) <= r4  <= 0x000050d5 (+2^14.3369)
str.w r4, [r0, #76]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #80]
ldr.w r10, [r1, #84]
ldr.w r9, [r1, #88]
ldr.w r8, [r1, #92]
ldr.w r7, [r2, #84]
ldr.w r6, [r2, #88]
ldr.w r5, [r2, #92]
/*** basemul 7 ***/
/* computing z0 = x0y0 + zeta^7 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-12177
mul.w r4, r4, r14
    //// bounds:  -0xcf3e616 (-2^27.6952) <= r4  <= 0x0cf3e616 (+2^27.6952)
mla.w r4, r10, r7, r4
    //// bounds:  -0x16ceffaf (-2^28.5115) <= r4  <= 0x16ceffaf (+2^28.5115)
MONTRED r4, r3
    //// bounds:  -0x00048cf (-2^14.1860) <= r4  <= 0x000048cf (+2^14.1860)
str.w r4, [r0, #84]
/* computing z1 = x1y0 + x0y1 + zeta^7 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb1f1c0b (-2^27.4753) <= r4  <= 0x0b1f1c0b (+2^27.4753)
mla.w r4, r9, r7, r4
    //// bounds:  -0x14fa35a4 (-2^28.3908) <= r4  <= 0x14fa35a4 (+2^28.3908)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ed54f3d (-2^28.9464) <= r4  <= 0x1ed54f3d (+2^28.9464)
MONTRED r4, r3
    //// bounds:  -0x00050d5 (-2^14.3369) <= r4  <= 0x000050d5 (+2^14.3369)
str.w r4, [r0, #88]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #92]
ldr.w r10, [r1, #96]
ldr.w r9, [r1, #100]
ldr.w r8, [r1, #104]
ldr.w r7, [r2, #96]
ldr.w r6, [r2, #100]
ldr.w r5, [r2, #104]
/*** basemul 8 ***/
/* computing z0 = x0y0 + zeta^8 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10039
mul.w r4, r4, r14
    //// bounds:  -0xaadb41a (-2^27.4166) <= r4  <= 0x0aadb41a (+2^27.4166)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1488cdb3 (-2^28.3600) <= r4  <= 0x1488cdb3 (+2^28.3600)
MONTRED r4, r3
    //// bounds:  -0x0004688 (-2^14.1402) <= r4  <= 0x00004689 (+2^14.1403)
str.w r4, [r0, #96]
/* computing z1 = x1y0 + x0y1 + zeta^8 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x92b390d (-2^27.1967) <= r4  <= 0x092b390d (+2^27.1967)
mla.w r4, r9, r7, r4
    //// bounds:  -0x130652a6 (-2^28.2498) <= r4  <= 0x130652a6 (+2^28.2498)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ce16c3f (-2^28.8520) <= r4  <= 0x1ce16c3f (+2^28.8520)
MONTRED r4, r3
    //// bounds:  -0x0004ee1 (-2^14.3016) <= r4  <= 0x00004ee1 (+2^14.3016)
str.w r4, [r0, #100]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #104]
ldr.w r10, [r1, #108]
ldr.w r9, [r1, #112]
ldr.w r8, [r1, #116]
ldr.w r7, [r2, #108]
ldr.w r6, [r2, #112]
ldr.w r5, [r2, #116]
/*** basemul 9 ***/
/* computing z0 = x0y0 + zeta^9 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10039
mul.w r4, r4, r14
    //// bounds:  -0xaadb41a (-2^27.4166) <= r4  <= 0x0aadb41a (+2^27.4166)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1488cdb3 (-2^28.3600) <= r4  <= 0x1488cdb3 (+2^28.3600)
MONTRED r4, r3
    //// bounds:  -0x0004688 (-2^14.1402) <= r4  <= 0x00004689 (+2^14.1403)
str.w r4, [r0, #108]
/* computing z1 = x1y0 + x0y1 + zeta^9 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x92b390d (-2^27.1967) <= r4  <= 0x092b390d (+2^27.1967)
mla.w r4, r9, r7, r4
    //// bounds:  -0x130652a6 (-2^28.2498) <= r4  <= 0x130652a6 (+2^28.2498)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ce16c3f (-2^28.8520) <= r4  <= 0x1ce16c3f (+2^28.8520)
MONTRED r4, r3
    //// bounds:  -0x0004ee1 (-2^14.3016) <= r4  <= 0x00004ee1 (+2^14.3016)
str.w r4, [r0, #112]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #116]
ldr.w r10, [r1, #120]
ldr.w r9, [r1, #124]
ldr.w r8, [r1, #128]
ldr.w r7, [r2, #120]
ldr.w r6, [r2, #124]
ldr.w r5, [r2, #128]
/*** basemul 10 ***/
/* computing z0 = x0y0 + zeta^10 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-6623
mul.w r4, r4, r14
    //// bounds:  -0x70b7f8a (-2^26.8166) <= r4  <= 0x070b7f8a (+2^26.8166)
mla.w r4, r10, r7, r4
    //// bounds:  -0x10e69923 (-2^28.0790) <= r4  <= 0x10e69923 (+2^28.0790)
MONTRED r4, r3
    //// bounds:  -0x00042e6 (-2^14.0639) <= r4  <= 0x000042e7 (+2^14.0640)
str.w r4, [r0, #120]
/* computing z1 = x1y0 + x0y1 + zeta^10 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x60c86c5 (-2^26.5967) <= r4  <= 0x060c86c5 (+2^26.5967)
mla.w r4, r9, r7, r4
    //// bounds:  -0xfe7a05e (-2^27.9914) <= r4  <= 0x0fe7a05e (+2^27.9914)
mla.w r4, r10, r6, r4
    //// bounds:  -0x19c2b9f7 (-2^28.6871) <= r4  <= 0x19c2b9f7 (+2^28.6871)
MONTRED r4, r3
    //// bounds:  -0x0004bc2 (-2^14.2433) <= r4  <= 0x00004bc3 (+2^14.2434)
str.w r4, [r0, #124]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #128]
ldr.w r10, [r1, #132]
ldr.w r9, [r1, #136]
ldr.w r8, [r1, #140]
ldr.w r7, [r2, #132]
ldr.w r6, [r2, #136]
ldr.w r5, [r2, #140]
/*** basemul 11 ***/
/* computing z0 = x0y0 + zeta^11 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =6623
mul.w r4, r4, r14
    //// bounds:  -0x70b7f8a (-2^26.8166) <= r4  <= 0x070b7f8a (+2^26.8166)
mla.w r4, r10, r7, r4
    //// bounds:  -0x10e69923 (-2^28.0790) <= r4  <= 0x10e69923 (+2^28.0790)
MONTRED r4, r3
    //// bounds:  -0x00042e6 (-2^14.0639) <= r4  <= 0x000042e7 (+2^14.0640)
str.w r4, [r0, #132]
/* computing z1 = x1y0 + x0y1 + zeta^11 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x60c86c5 (-2^26.5967) <= r4  <= 0x060c86c5 (+2^26.5967)
mla.w r4, r9, r7, r4
    //// bounds:  -0xfe7a05e (-2^27.9914) <= r4  <= 0x0fe7a05e (+2^27.9914)
mla.w r4, r10, r6, r4
    //// bounds:  -0x19c2b9f7 (-2^28.6871) <= r4  <= 0x19c2b9f7 (+2^28.6871)
MONTRED r4, r3
    //// bounds:  -0x0004bc2 (-2^14.2433) <= r4  <= 0x00004bc3 (+2^14.2434)
str.w r4, [r0, #136]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #140]
ldr.w r10, [r1, #144]
ldr.w r9, [r1, #148]
ldr.w r8, [r1, #152]
ldr.w r7, [r2, #144]
ldr.w r6, [r2, #148]
ldr.w r5, [r2, #152]
/*** basemul 12 ***/
/* computing z0 = x0y0 + zeta^12 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8000
mul.w r4, r4, r14
    //// bounds:  -0x8827780 (-2^27.0891) <= r4  <= 0x08827780 (+2^27.0891)
mla.w r4, r10, r7, r4
    //// bounds:  -0x125d9119 (-2^28.1989) <= r4  <= 0x125d9119 (+2^28.1989)
MONTRED r4, r3
    //// bounds:  -0x000445d (-2^14.0951) <= r4  <= 0x0000445e (+2^14.0952)
str.w r4, [r0, #144]
/* computing z1 = x1y0 + x0y1 + zeta^12 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x74e7bc0 (-2^26.8692) <= r4  <= 0x074e7bc0 (+2^26.8692)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11299559 (-2^28.1012) <= r4  <= 0x11299559 (+2^28.1012)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b04aef2 (-2^28.7559) <= r4  <= 0x1b04aef2 (+2^28.7559)
MONTRED r4, r3
    //// bounds:  -0x0004d04 (-2^14.2671) <= r4  <= 0x00004d05 (+2^14.2672)
str.w r4, [r0, #148]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #152]
ldr.w r10, [r1, #156]
ldr.w r9, [r1, #160]
ldr.w r8, [r1, #164]
ldr.w r7, [r2, #156]
ldr.w r6, [r2, #160]
ldr.w r5, [r2, #164]
/*** basemul 13 ***/
/* computing z0 = x0y0 + zeta^13 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8000
mul.w r4, r4, r14
    //// bounds:  -0x8827780 (-2^27.0891) <= r4  <= 0x08827780 (+2^27.0891)
mla.w r4, r10, r7, r4
    //// bounds:  -0x125d9119 (-2^28.1989) <= r4  <= 0x125d9119 (+2^28.1989)
MONTRED r4, r3
    //// bounds:  -0x000445d (-2^14.0951) <= r4  <= 0x0000445e (+2^14.0952)
str.w r4, [r0, #156]
/* computing z1 = x1y0 + x0y1 + zeta^13 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x74e7bc0 (-2^26.8692) <= r4  <= 0x074e7bc0 (+2^26.8692)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11299559 (-2^28.1012) <= r4  <= 0x11299559 (+2^28.1012)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b04aef2 (-2^28.7559) <= r4  <= 0x1b04aef2 (+2^28.7559)
MONTRED r4, r3
    //// bounds:  -0x0004d04 (-2^14.2671) <= r4  <= 0x00004d05 (+2^14.2672)
str.w r4, [r0, #160]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #164]
ldr.w r10, [r1, #168]
ldr.w r9, [r1, #172]
ldr.w r8, [r1, #176]
ldr.w r7, [r2, #168]
ldr.w r6, [r2, #172]
ldr.w r5, [r2, #176]
/*** basemul 14 ***/
/* computing z0 = x0y0 + zeta^14 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-50
mul.w r4, r4, r14
    //// bounds:  -0x00d9d8c (-2^19.7672) <= r4  <= 0x000d9d8c (+2^19.7672)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9e8b725 (-2^27.3087) <= r4  <= 0x09e8b725 (+2^27.3087)
MONTRED r4, r3
    //// bounds:  -0x0003be8 (-2^13.9046) <= r4  <= 0x00003be9 (+2^13.9047)
str.w r4, [r0, #168]
/* computing z1 = x1y0 + x0y1 + zeta^14 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x00bb0c6 (-2^19.5473) <= r4  <= 0x000bb0c6 (+2^19.5473)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9e6ca5f (-2^27.3077) <= r4  <= 0x09e6ca5f (+2^27.3077)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13c1e3f8 (-2^28.3043) <= r4  <= 0x13c1e3f8 (+2^28.3043)
MONTRED r4, r3
    //// bounds:  -0x00045c1 (-2^14.1242) <= r4  <= 0x000045c2 (+2^14.1243)
str.w r4, [r0, #172]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #176]
ldr.w r10, [r1, #180]
ldr.w r9, [r1, #184]
ldr.w r8, [r1, #188]
ldr.w r7, [r2, #180]
ldr.w r6, [r2, #184]
ldr.w r5, [r2, #188]
/*** basemul 15 ***/
/* computing z0 = x0y0 + zeta^15 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =50
mul.w r4, r4, r14
    //// bounds:  -0x00d9d8c (-2^19.7672) <= r4  <= 0x000d9d8c (+2^19.7672)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9e8b725 (-2^27.3087) <= r4  <= 0x09e8b725 (+2^27.3087)
MONTRED r4, r3
    //// bounds:  -0x0003be8 (-2^13.9046) <= r4  <= 0x00003be9 (+2^13.9047)
str.w r4, [r0, #180]
/* computing z1 = x1y0 + x0y1 + zeta^15 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x00bb0c6 (-2^19.5473) <= r4  <= 0x000bb0c6 (+2^19.5473)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9e6ca5f (-2^27.3077) <= r4  <= 0x09e6ca5f (+2^27.3077)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13c1e3f8 (-2^28.3043) <= r4  <= 0x13c1e3f8 (+2^28.3043)
MONTRED r4, r3
    //// bounds:  -0x00045c1 (-2^14.1242) <= r4  <= 0x000045c2 (+2^14.1243)
str.w r4, [r0, #184]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #188]
ldr.w r10, [r1, #192]
ldr.w r9, [r1, #196]
ldr.w r8, [r1, #200]
ldr.w r7, [r2, #192]
ldr.w r6, [r2, #196]
ldr.w r5, [r2, #200]
/*** basemul 16 ***/
/* computing z0 = x0y0 + zeta^16 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-5643
mul.w r4, r4, r14
    //// bounds:  -0x600a2d2 (-2^26.5856) <= r4  <= 0x0600a2d2 (+2^26.5856)
mla.w r4, r10, r7, r4
    //// bounds:  -0xfdbbc6b (-2^27.9872) <= r4  <= 0x0fdbbc6b (+2^27.9872)
MONTRED r4, r3
    //// bounds:  -0x00041db (-2^14.0412) <= r4  <= 0x000041dc (+2^14.0413)
str.w r4, [r0, #192]
/* computing z1 = x1y0 + x0y1 + zeta^16 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x5276469 (-2^26.3657) <= r4  <= 0x05276469 (+2^26.3657)
mla.w r4, r9, r7, r4
    //// bounds:  -0xf027e02 (-2^27.9078) <= r4  <= 0x0f027e02 (+2^27.9078)
mla.w r4, r10, r6, r4
    //// bounds:  -0x18dd979b (-2^28.6361) <= r4  <= 0x18dd979b (+2^28.6361)
MONTRED r4, r3
    //// bounds:  -0x0004add (-2^14.2262) <= r4  <= 0x00004ade (+2^14.2263)
str.w r4, [r0, #196]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #200]
ldr.w r10, [r1, #204]
ldr.w r9, [r1, #208]
ldr.w r8, [r1, #212]
ldr.w r7, [r2, #204]
ldr.w r6, [r2, #208]
ldr.w r5, [r2, #212]
/*** basemul 17 ***/
/* computing z0 = x0y0 + zeta^17 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =5643
mul.w r4, r4, r14
    //// bounds:  -0x600a2d2 (-2^26.5856) <= r4  <= 0x0600a2d2 (+2^26.5856)
mla.w r4, r10, r7, r4
    //// bounds:  -0xfdbbc6b (-2^27.9872) <= r4  <= 0x0fdbbc6b (+2^27.9872)
MONTRED r4, r3
    //// bounds:  -0x00041db (-2^14.0412) <= r4  <= 0x000041dc (+2^14.0413)
str.w r4, [r0, #204]
/* computing z1 = x1y0 + x0y1 + zeta^17 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x5276469 (-2^26.3657) <= r4  <= 0x05276469 (+2^26.3657)
mla.w r4, r9, r7, r4
    //// bounds:  -0xf027e02 (-2^27.9078) <= r4  <= 0x0f027e02 (+2^27.9078)
mla.w r4, r10, r6, r4
    //// bounds:  -0x18dd979b (-2^28.6361) <= r4  <= 0x18dd979b (+2^28.6361)
MONTRED r4, r3
    //// bounds:  -0x0004add (-2^14.2262) <= r4  <= 0x00004ade (+2^14.2263)
str.w r4, [r0, #208]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #212]
ldr.w r10, [r1, #216]
ldr.w r9, [r1, #220]
ldr.w r8, [r1, #224]
ldr.w r7, [r2, #216]
ldr.w r6, [r2, #220]
ldr.w r5, [r2, #224]
/*** basemul 18 ***/
/* computing z0 = x0y0 + zeta^18 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-6845
mul.w r4, r4, r14
    //// bounds:  -0x747f35e (-2^26.8641) <= r4  <= 0x0747f35e (+2^26.8641)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11230cf7 (-2^28.0990) <= r4  <= 0x11230cf7 (+2^28.0990)
MONTRED r4, r3
    //// bounds:  -0x0004323 (-2^14.0690) <= r4  <= 0x00004323 (+2^14.0690)
str.w r4, [r0, #216]
/* computing z1 = x1y0 + x0y1 + zeta^18 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6406eaf (-2^26.6442) <= r4  <= 0x06406eaf (+2^26.6442)
mla.w r4, r9, r7, r4
    //// bounds:  -0x101b8848 (-2^28.0097) <= r4  <= 0x101b8848 (+2^28.0097)
mla.w r4, r10, r6, r4
    //// bounds:  -0x19f6a1e1 (-2^28.6984) <= r4  <= 0x19f6a1e1 (+2^28.6984)
MONTRED r4, r3
    //// bounds:  -0x0004bf6 (-2^14.2472) <= r4  <= 0x00004bf7 (+2^14.2473)
str.w r4, [r0, #220]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #224]
ldr.w r10, [r1, #228]
ldr.w r9, [r1, #232]
ldr.w r8, [r1, #236]
ldr.w r7, [r2, #228]
ldr.w r6, [r2, #232]
ldr.w r5, [r2, #236]
/*** basemul 19 ***/
/* computing z0 = x0y0 + zeta^19 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =6845
mul.w r4, r4, r14
    //// bounds:  -0x747f35e (-2^26.8641) <= r4  <= 0x0747f35e (+2^26.8641)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11230cf7 (-2^28.0990) <= r4  <= 0x11230cf7 (+2^28.0990)
MONTRED r4, r3
    //// bounds:  -0x0004323 (-2^14.0690) <= r4  <= 0x00004323 (+2^14.0690)
str.w r4, [r0, #228]
/* computing z1 = x1y0 + x0y1 + zeta^19 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6406eaf (-2^26.6442) <= r4  <= 0x06406eaf (+2^26.6442)
mla.w r4, r9, r7, r4
    //// bounds:  -0x101b8848 (-2^28.0097) <= r4  <= 0x101b8848 (+2^28.0097)
mla.w r4, r10, r6, r4
    //// bounds:  -0x19f6a1e1 (-2^28.6984) <= r4  <= 0x19f6a1e1 (+2^28.6984)
MONTRED r4, r3
    //// bounds:  -0x0004bf6 (-2^14.2472) <= r4  <= 0x00004bf7 (+2^14.2473)
str.w r4, [r0, #232]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #236]
ldr.w r10, [r1, #240]
ldr.w r9, [r1, #244]
ldr.w r8, [r1, #248]
ldr.w r7, [r2, #240]
ldr.w r6, [r2, #244]
ldr.w r5, [r2, #248]
/*** basemul 20 ***/
/* computing z0 = x0y0 + zeta^20 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7267
mul.w r4, r4, r14
    //// bounds:  -0x7badd62 (-2^26.9505) <= r4  <= 0x07badd62 (+2^26.9505)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1195f6fb (-2^28.1363) <= r4  <= 0x1195f6fb (+2^28.1363)
MONTRED r4, r3
    //// bounds:  -0x0004396 (-2^14.0787) <= r4  <= 0x00004396 (+2^14.0787)
str.w r4, [r0, #240]
/* computing z1 = x1y0 + x0y1 + zeta^20 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6a319b1 (-2^26.7306) <= r4  <= 0x06a319b1 (+2^26.7306)
mla.w r4, r9, r7, r4
    //// bounds:  -0x107e334a (-2^28.0438) <= r4  <= 0x107e334a (+2^28.0438)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a594ce3 (-2^28.7197) <= r4  <= 0x1a594ce3 (+2^28.7197)
MONTRED r4, r3
    //// bounds:  -0x0004c59 (-2^14.2545) <= r4  <= 0x00004c59 (+2^14.2545)
str.w r4, [r0, #244]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #248]
ldr.w r10, [r1, #252]
ldr.w r9, [r1, #256]
ldr.w r8, [r1, #260]
ldr.w r7, [r2, #252]
ldr.w r6, [r2, #256]
ldr.w r5, [r2, #260]
/*** basemul 21 ***/
/* computing z0 = x0y0 + zeta^21 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7267
mul.w r4, r4, r14
    //// bounds:  -0x7badd62 (-2^26.9505) <= r4  <= 0x07badd62 (+2^26.9505)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1195f6fb (-2^28.1363) <= r4  <= 0x1195f6fb (+2^28.1363)
MONTRED r4, r3
    //// bounds:  -0x0004396 (-2^14.0787) <= r4  <= 0x00004396 (+2^14.0787)
str.w r4, [r0, #252]
/* computing z1 = x1y0 + x0y1 + zeta^21 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6a319b1 (-2^26.7306) <= r4  <= 0x06a319b1 (+2^26.7306)
mla.w r4, r9, r7, r4
    //// bounds:  -0x107e334a (-2^28.0438) <= r4  <= 0x107e334a (+2^28.0438)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a594ce3 (-2^28.7197) <= r4  <= 0x1a594ce3 (+2^28.7197)
MONTRED r4, r3
    //// bounds:  -0x0004c59 (-2^14.2545) <= r4  <= 0x00004c59 (+2^14.2545)
str.w r4, [r0, #256]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #260]
ldr.w r10, [r1, #264]
ldr.w r9, [r1, #268]
ldr.w r8, [r1, #272]
ldr.w r7, [r2, #264]
ldr.w r6, [r2, #268]
ldr.w r5, [r2, #272]
/*** basemul 22 ***/
/* computing z0 = x0y0 + zeta^22 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10675
mul.w r4, r4, r14
    //// bounds:  -0xb5ae442 (-2^27.5053) <= r4  <= 0x0b5ae442 (+2^27.5053)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1535fddb (-2^28.4067) <= r4  <= 0x1535fddb (+2^28.4067)
MONTRED r4, r3
    //// bounds:  -0x0004736 (-2^14.1540) <= r4  <= 0x00004736 (+2^14.1540)
str.w r4, [r0, #264]
/* computing z1 = x1y0 + x0y1 + zeta^22 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x9bfed21 (-2^27.2854) <= r4  <= 0x09bfed21 (+2^27.2854)
mla.w r4, r9, r7, r4
    //// bounds:  -0x139b06ba (-2^28.2932) <= r4  <= 0x139b06ba (+2^28.2932)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d762053 (-2^28.8808) <= r4  <= 0x1d762053 (+2^28.8808)
MONTRED r4, r3
    //// bounds:  -0x0004f76 (-2^14.3122) <= r4  <= 0x00004f76 (+2^14.3122)
str.w r4, [r0, #268]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #272]
ldr.w r10, [r1, #276]
ldr.w r9, [r1, #280]
ldr.w r8, [r1, #284]
ldr.w r7, [r2, #276]
ldr.w r6, [r2, #280]
ldr.w r5, [r2, #284]
/*** basemul 23 ***/
/* computing z0 = x0y0 + zeta^23 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10675
mul.w r4, r4, r14
    //// bounds:  -0xb5ae442 (-2^27.5053) <= r4  <= 0x0b5ae442 (+2^27.5053)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1535fddb (-2^28.4067) <= r4  <= 0x1535fddb (+2^28.4067)
MONTRED r4, r3
    //// bounds:  -0x0004736 (-2^14.1540) <= r4  <= 0x00004736 (+2^14.1540)
str.w r4, [r0, #276]
/* computing z1 = x1y0 + x0y1 + zeta^23 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x9bfed21 (-2^27.2854) <= r4  <= 0x09bfed21 (+2^27.2854)
mla.w r4, r9, r7, r4
    //// bounds:  -0x139b06ba (-2^28.2932) <= r4  <= 0x139b06ba (+2^28.2932)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d762053 (-2^28.8808) <= r4  <= 0x1d762053 (+2^28.8808)
MONTRED r4, r3
    //// bounds:  -0x0004f76 (-2^14.3122) <= r4  <= 0x00004f76 (+2^14.3122)
str.w r4, [r0, #280]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #284]
ldr.w r10, [r1, #288]
ldr.w r9, [r1, #292]
ldr.w r8, [r1, #296]
ldr.w r7, [r2, #288]
ldr.w r6, [r2, #292]
ldr.w r5, [r2, #296]
/*** basemul 24 ***/
/* computing z0 = x0y0 + zeta^24 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =1272
mul.w r4, r4, r14
    //// bounds:  -0x15a6050 (-2^24.4362) <= r4  <= 0x015a6050 (+2^24.4362)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb3579e9 (-2^27.4866) <= r4  <= 0x0b3579e9 (+2^27.4866)
MONTRED r4, r3
    //// bounds:  -0x0003d35 (-2^13.9356) <= r4  <= 0x00003d35 (+2^13.9356)
str.w r4, [r0, #288]
/* computing z1 = x1y0 + x0y1 + zeta^24 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x1296828 (-2^24.2163) <= r4  <= 0x01296828 (+2^24.2163)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb0481c1 (-2^27.4617) <= r4  <= 0x0b0481c1 (+2^27.4617)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14df9b5a (-2^28.3836) <= r4  <= 0x14df9b5a (+2^28.3836)
MONTRED r4, r3
    //// bounds:  -0x00046df (-2^14.1471) <= r4  <= 0x000046e0 (+2^14.1472)
str.w r4, [r0, #292]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #296]
ldr.w r10, [r1, #300]
ldr.w r9, [r1, #304]
ldr.w r8, [r1, #308]
ldr.w r7, [r2, #300]
ldr.w r6, [r2, #304]
ldr.w r5, [r2, #308]
/*** basemul 25 ***/
/* computing z0 = x0y0 + zeta^25 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-1272
mul.w r4, r4, r14
    //// bounds:  -0x15a6050 (-2^24.4362) <= r4  <= 0x015a6050 (+2^24.4362)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb3579e9 (-2^27.4866) <= r4  <= 0x0b3579e9 (+2^27.4866)
MONTRED r4, r3
    //// bounds:  -0x0003d35 (-2^13.9356) <= r4  <= 0x00003d35 (+2^13.9356)
str.w r4, [r0, #300]
/* computing z1 = x1y0 + x0y1 + zeta^25 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x1296828 (-2^24.2163) <= r4  <= 0x01296828 (+2^24.2163)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb0481c1 (-2^27.4617) <= r4  <= 0x0b0481c1 (+2^27.4617)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14df9b5a (-2^28.3836) <= r4  <= 0x14df9b5a (+2^28.3836)
MONTRED r4, r3
    //// bounds:  -0x00046df (-2^14.1471) <= r4  <= 0x000046e0 (+2^14.1472)
str.w r4, [r0, #304]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #308]
ldr.w r10, [r1, #312]
ldr.w r9, [r1, #316]
ldr.w r8, [r1, #320]
ldr.w r7, [r2, #312]
ldr.w r6, [r2, #316]
ldr.w r5, [r2, #320]
/*** basemul 26 ***/
/* computing z0 = x0y0 + zeta^26 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-1288
mul.w r4, r4, r14
    //// bounds:  -0x15ebbb0 (-2^24.4542) <= r4  <= 0x015ebbb0 (+2^24.4542)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb39d549 (-2^27.4888) <= r4  <= 0x0b39d549 (+2^27.4888)
MONTRED r4, r3
    //// bounds:  -0x0003d39 (-2^13.9360) <= r4  <= 0x00003d3a (+2^13.9361)
str.w r4, [r0, #312]
/* computing z1 = x1y0 + x0y1 + zeta^26 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x12d25d8 (-2^24.2343) <= r4  <= 0x012d25d8 (+2^24.2343)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb083f71 (-2^27.4637) <= r4  <= 0x0b083f71 (+2^27.4637)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14e3590a (-2^28.3846) <= r4  <= 0x14e3590a (+2^28.3846)
MONTRED r4, r3
    //// bounds:  -0x00046e3 (-2^14.1474) <= r4  <= 0x000046e3 (+2^14.1474)
str.w r4, [r0, #316]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #320]
ldr.w r10, [r1, #324]
ldr.w r9, [r1, #328]
ldr.w r8, [r1, #332]
ldr.w r7, [r2, #324]
ldr.w r6, [r2, #328]
ldr.w r5, [r2, #332]
/*** basemul 27 ***/
/* computing z0 = x0y0 + zeta^27 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =1288
mul.w r4, r4, r14
    //// bounds:  -0x15ebbb0 (-2^24.4542) <= r4  <= 0x015ebbb0 (+2^24.4542)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb39d549 (-2^27.4888) <= r4  <= 0x0b39d549 (+2^27.4888)
MONTRED r4, r3
    //// bounds:  -0x0003d39 (-2^13.9360) <= r4  <= 0x00003d3a (+2^13.9361)
str.w r4, [r0, #324]
/* computing z1 = x1y0 + x0y1 + zeta^27 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x12d25d8 (-2^24.2343) <= r4  <= 0x012d25d8 (+2^24.2343)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb083f71 (-2^27.4637) <= r4  <= 0x0b083f71 (+2^27.4637)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14e3590a (-2^28.3846) <= r4  <= 0x14e3590a (+2^28.3846)
MONTRED r4, r3
    //// bounds:  -0x00046e3 (-2^14.1474) <= r4  <= 0x000046e3 (+2^14.1474)
str.w r4, [r0, #328]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #332]
ldr.w r10, [r1, #336]
ldr.w r9, [r1, #340]
ldr.w r8, [r1, #344]
ldr.w r7, [r2, #336]
ldr.w r6, [r2, #340]
ldr.w r5, [r2, #344]
/*** basemul 28 ***/
/* computing z0 = x0y0 + zeta^28 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4714
mul.w r4, r4, r14
    //// bounds:  -0x503a95c (-2^26.3260) <= r4  <= 0x0503a95c (+2^26.3260)
mla.w r4, r10, r7, r4
    //// bounds:  -0xedec2f5 (-2^27.8943) <= r4  <= 0x0edec2f5 (+2^27.8943)
MONTRED r4, r3
    //// bounds:  -0x00040de (-2^14.0194) <= r4  <= 0x000040df (+2^14.0195)
str.w r4, [r0, #336]
/* computing z1 = x1y0 + x0y1 + zeta^28 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x44e2eae (-2^26.1061) <= r4  <= 0x044e2eae (+2^26.1061)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe294847 (-2^27.8239) <= r4  <= 0x0e294847 (+2^27.8239)
mla.w r4, r10, r6, r4
    //// bounds:  -0x180461e0 (-2^28.5860) <= r4  <= 0x180461e0 (+2^28.5860)
MONTRED r4, r3
    //// bounds:  -0x0004a04 (-2^14.2098) <= r4  <= 0x00004a04 (+2^14.2098)
str.w r4, [r0, #340]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #344]
ldr.w r10, [r1, #348]
ldr.w r9, [r1, #352]
ldr.w r8, [r1, #356]
ldr.w r7, [r2, #348]
ldr.w r6, [r2, #352]
ldr.w r5, [r2, #356]
/*** basemul 29 ***/
/* computing z0 = x0y0 + zeta^29 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4714
mul.w r4, r4, r14
    //// bounds:  -0x503a95c (-2^26.3260) <= r4  <= 0x0503a95c (+2^26.3260)
mla.w r4, r10, r7, r4
    //// bounds:  -0xedec2f5 (-2^27.8943) <= r4  <= 0x0edec2f5 (+2^27.8943)
MONTRED r4, r3
    //// bounds:  -0x00040de (-2^14.0194) <= r4  <= 0x000040df (+2^14.0195)
str.w r4, [r0, #348]
/* computing z1 = x1y0 + x0y1 + zeta^29 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x44e2eae (-2^26.1061) <= r4  <= 0x044e2eae (+2^26.1061)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe294847 (-2^27.8239) <= r4  <= 0x0e294847 (+2^27.8239)
mla.w r4, r10, r6, r4
    //// bounds:  -0x180461e0 (-2^28.5860) <= r4  <= 0x180461e0 (+2^28.5860)
MONTRED r4, r3
    //// bounds:  -0x0004a04 (-2^14.2098) <= r4  <= 0x00004a04 (+2^14.2098)
str.w r4, [r0, #352]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #356]
ldr.w r10, [r1, #360]
ldr.w r9, [r1, #364]
ldr.w r8, [r1, #368]
ldr.w r7, [r2, #360]
ldr.w r6, [r2, #364]
ldr.w r5, [r2, #368]
/*** basemul 30 ***/
/* computing z0 = x0y0 + zeta^30 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-11811
mul.w r4, r4, r14
    //// bounds:  -0xc903be2 (-2^27.6512) <= r4  <= 0x0c903be2 (+2^27.6512)
mla.w r4, r10, r7, r4
    //// bounds:  -0x166b557b (-2^28.4867) <= r4  <= 0x166b557b (+2^28.4867)
MONTRED r4, r3
    //// bounds:  -0x000486b (-2^14.1783) <= r4  <= 0x0000486b (+2^14.1783)
str.w r4, [r0, #360]
/* computing z1 = x1y0 + x0y1 + zeta^30 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xac988f1 (-2^27.4313) <= r4  <= 0x0ac988f1 (+2^27.4313)
mla.w r4, r9, r7, r4
    //// bounds:  -0x14a4a28a (-2^28.3676) <= r4  <= 0x14a4a28a (+2^28.3676)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e7fbc23 (-2^28.9307) <= r4  <= 0x1e7fbc23 (+2^28.9307)
MONTRED r4, r3
    //// bounds:  -0x000507f (-2^14.3308) <= r4  <= 0x00005080 (+2^14.3309)
str.w r4, [r0, #364]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #368]
ldr.w r10, [r1, #372]
ldr.w r9, [r1, #376]
ldr.w r8, [r1, #380]
ldr.w r7, [r2, #372]
ldr.w r6, [r2, #376]
ldr.w r5, [r2, #380]
/*** basemul 31 ***/
/* computing z0 = x0y0 + zeta^31 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =11811
mul.w r4, r4, r14
    //// bounds:  -0xc903be2 (-2^27.6512) <= r4  <= 0x0c903be2 (+2^27.6512)
mla.w r4, r10, r7, r4
    //// bounds:  -0x166b557b (-2^28.4867) <= r4  <= 0x166b557b (+2^28.4867)
MONTRED r4, r3
    //// bounds:  -0x000486b (-2^14.1783) <= r4  <= 0x0000486b (+2^14.1783)
str.w r4, [r0, #372]
/* computing z1 = x1y0 + x0y1 + zeta^31 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xac988f1 (-2^27.4313) <= r4  <= 0x0ac988f1 (+2^27.4313)
mla.w r4, r9, r7, r4
    //// bounds:  -0x14a4a28a (-2^28.3676) <= r4  <= 0x14a4a28a (+2^28.3676)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e7fbc23 (-2^28.9307) <= r4  <= 0x1e7fbc23 (+2^28.9307)
MONTRED r4, r3
    //// bounds:  -0x000507f (-2^14.3308) <= r4  <= 0x00005080 (+2^14.3309)
str.w r4, [r0, #376]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #380]
ldr.w r10, [r1, #384]
ldr.w r9, [r1, #388]
ldr.w r8, [r1, #392]
ldr.w r7, [r2, #384]
ldr.w r6, [r2, #388]
ldr.w r5, [r2, #392]
/*** basemul 32 ***/
/* computing z0 = x0y0 + zeta^32 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7160
mul.w r4, r4, r14
    //// bounds:  -0x79dba50 (-2^26.9291) <= r4  <= 0x079dba50 (+2^26.9291)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1178d3e9 (-2^28.1270) <= r4  <= 0x1178d3e9 (+2^28.1270)
MONTRED r4, r3
    //// bounds:  -0x0004378 (-2^14.0761) <= r4  <= 0x00004379 (+2^14.0762)
str.w r4, [r0, #384]
/* computing z1 = x1y0 + x0y1 + zeta^32 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x68a1528 (-2^26.7092) <= r4  <= 0x068a1528 (+2^26.7092)
mla.w r4, r9, r7, r4
    //// bounds:  -0x10652ec1 (-2^28.0352) <= r4  <= 0x10652ec1 (+2^28.0352)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a40485a (-2^28.7143) <= r4  <= 0x1a40485a (+2^28.7143)
MONTRED r4, r3
    //// bounds:  -0x0004c40 (-2^14.2527) <= r4  <= 0x00004c40 (+2^14.2527)
str.w r4, [r0, #388]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #392]
ldr.w r10, [r1, #396]
ldr.w r9, [r1, #400]
ldr.w r8, [r1, #404]
ldr.w r7, [r2, #396]
ldr.w r6, [r2, #400]
ldr.w r5, [r2, #404]
/*** basemul 33 ***/
/* computing z0 = x0y0 + zeta^33 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7160
mul.w r4, r4, r14
    //// bounds:  -0x79dba50 (-2^26.9291) <= r4  <= 0x079dba50 (+2^26.9291)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1178d3e9 (-2^28.1270) <= r4  <= 0x1178d3e9 (+2^28.1270)
MONTRED r4, r3
    //// bounds:  -0x0004378 (-2^14.0761) <= r4  <= 0x00004379 (+2^14.0762)
str.w r4, [r0, #396]
/* computing z1 = x1y0 + x0y1 + zeta^33 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x68a1528 (-2^26.7092) <= r4  <= 0x068a1528 (+2^26.7092)
mla.w r4, r9, r7, r4
    //// bounds:  -0x10652ec1 (-2^28.0352) <= r4  <= 0x10652ec1 (+2^28.0352)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a40485a (-2^28.7143) <= r4  <= 0x1a40485a (+2^28.7143)
MONTRED r4, r3
    //// bounds:  -0x0004c40 (-2^14.2527) <= r4  <= 0x00004c40 (+2^14.2527)
str.w r4, [r0, #400]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #404]
ldr.w r10, [r1, #408]
ldr.w r9, [r1, #412]
ldr.w r8, [r1, #416]
ldr.w r7, [r2, #408]
ldr.w r6, [r2, #412]
ldr.w r5, [r2, #416]
/*** basemul 34 ***/
/* computing z0 = x0y0 + zeta^34 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =6445
mul.w r4, r4, r14
    //// bounds:  -0x6db06fe (-2^26.7773) <= r4  <= 0x06db06fe (+2^26.7773)
mla.w r4, r10, r7, r4
    //// bounds:  -0x10b62097 (-2^28.0628) <= r4  <= 0x10b62097 (+2^28.0628)
MONTRED r4, r3
    //// bounds:  -0x00042b6 (-2^14.0599) <= r4  <= 0x000042b6 (+2^14.0599)
str.w r4, [r0, #408]
/* computing z1 = x1y0 + x0y1 + zeta^34 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x5e2e87f (-2^26.5574) <= r4  <= 0x05e2e87f (+2^26.5574)
mla.w r4, r9, r7, r4
    //// bounds:  -0xfbe0218 (-2^27.9766) <= r4  <= 0x0fbe0218 (+2^27.9766)
mla.w r4, r10, r6, r4
    //// bounds:  -0x19991bb1 (-2^28.6780) <= r4  <= 0x19991bb1 (+2^28.6780)
MONTRED r4, r3
    //// bounds:  -0x0004b99 (-2^14.2403) <= r4  <= 0x00004b99 (+2^14.2403)
str.w r4, [r0, #412]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #416]
ldr.w r10, [r1, #420]
ldr.w r9, [r1, #424]
ldr.w r8, [r1, #428]
ldr.w r7, [r2, #420]
ldr.w r6, [r2, #424]
ldr.w r5, [r2, #428]
/*** basemul 35 ***/
/* computing z0 = x0y0 + zeta^35 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-6445
mul.w r4, r4, r14
    //// bounds:  -0x6db06fe (-2^26.7773) <= r4  <= 0x06db06fe (+2^26.7773)
mla.w r4, r10, r7, r4
    //// bounds:  -0x10b62097 (-2^28.0628) <= r4  <= 0x10b62097 (+2^28.0628)
MONTRED r4, r3
    //// bounds:  -0x00042b6 (-2^14.0599) <= r4  <= 0x000042b6 (+2^14.0599)
str.w r4, [r0, #420]
/* computing z1 = x1y0 + x0y1 + zeta^35 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x5e2e87f (-2^26.5574) <= r4  <= 0x05e2e87f (+2^26.5574)
mla.w r4, r9, r7, r4
    //// bounds:  -0xfbe0218 (-2^27.9766) <= r4  <= 0x0fbe0218 (+2^27.9766)
mla.w r4, r10, r6, r4
    //// bounds:  -0x19991bb1 (-2^28.6780) <= r4  <= 0x19991bb1 (+2^28.6780)
MONTRED r4, r3
    //// bounds:  -0x0004b99 (-2^14.2403) <= r4  <= 0x00004b99 (+2^14.2403)
str.w r4, [r0, #424]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #428]
ldr.w r10, [r1, #432]
ldr.w r9, [r1, #436]
ldr.w r8, [r1, #440]
ldr.w r7, [r2, #432]
ldr.w r6, [r2, #436]
ldr.w r5, [r2, #440]
/*** basemul 36 ***/
/* computing z0 = x0y0 + zeta^36 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-9049
mul.w r4, r4, r14
    //// bounds:  -0x9a01e46 (-2^27.2669) <= r4  <= 0x09a01e46 (+2^27.2669)
mla.w r4, r10, r7, r4
    //// bounds:  -0x137b37df (-2^28.2840) <= r4  <= 0x137b37df (+2^28.2840)
MONTRED r4, r3
    //// bounds:  -0x000457b (-2^14.1185) <= r4  <= 0x0000457b (+2^14.1185)
str.w r4, [r0, #432]
/* computing z1 = x1y0 + x0y1 + zeta^36 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x843c023 (-2^27.0470) <= r4  <= 0x0843c023 (+2^27.0470)
mla.w r4, r9, r7, r4
    //// bounds:  -0x121ed9bc (-2^28.1796) <= r4  <= 0x121ed9bc (+2^28.1796)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1bf9f355 (-2^28.8061) <= r4  <= 0x1bf9f355 (+2^28.8061)
MONTRED r4, r3
    //// bounds:  -0x0004dfa (-2^14.2850) <= r4  <= 0x00004dfa (+2^14.2850)
str.w r4, [r0, #436]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #440]
ldr.w r10, [r1, #444]
ldr.w r9, [r1, #448]
ldr.w r8, [r1, #452]
ldr.w r7, [r2, #444]
ldr.w r6, [r2, #448]
ldr.w r5, [r2, #452]
/*** basemul 37 ***/
/* computing z0 = x0y0 + zeta^37 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =9049
mul.w r4, r4, r14
    //// bounds:  -0x9a01e46 (-2^27.2669) <= r4  <= 0x09a01e46 (+2^27.2669)
mla.w r4, r10, r7, r4
    //// bounds:  -0x137b37df (-2^28.2840) <= r4  <= 0x137b37df (+2^28.2840)
MONTRED r4, r3
    //// bounds:  -0x000457b (-2^14.1185) <= r4  <= 0x0000457b (+2^14.1185)
str.w r4, [r0, #444]
/* computing z1 = x1y0 + x0y1 + zeta^37 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x843c023 (-2^27.0470) <= r4  <= 0x0843c023 (+2^27.0470)
mla.w r4, r9, r7, r4
    //// bounds:  -0x121ed9bc (-2^28.1796) <= r4  <= 0x121ed9bc (+2^28.1796)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1bf9f355 (-2^28.8061) <= r4  <= 0x1bf9f355 (+2^28.8061)
MONTRED r4, r3
    //// bounds:  -0x0004dfa (-2^14.2850) <= r4  <= 0x00004dfa (+2^14.2850)
str.w r4, [r0, #448]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #452]
ldr.w r10, [r1, #456]
ldr.w r9, [r1, #460]
ldr.w r8, [r1, #464]
ldr.w r7, [r2, #456]
ldr.w r6, [r2, #460]
ldr.w r5, [r2, #464]
/*** basemul 38 ***/
/* computing z0 = x0y0 + zeta^38 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =11417
mul.w r4, r4, r14
    //// bounds:  -0xc24f1c6 (-2^27.6022) <= r4  <= 0x0c24f1c6 (+2^27.6022)
mla.w r4, r10, r7, r4
    //// bounds:  -0x16000b5f (-2^28.4594) <= r4  <= 0x16000b5f (+2^28.4594)
MONTRED r4, r3
    //// bounds:  -0x0004800 (-2^14.1699) <= r4  <= 0x00004800 (+2^14.1699)
str.w r4, [r0, #456]
/* computing z1 = x1y0 + x0y1 + zeta^38 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xa6d69e3 (-2^27.3823) <= r4  <= 0x0a6d69e3 (+2^27.3823)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1448837c (-2^28.3422) <= r4  <= 0x1448837c (+2^28.3422)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e239d15 (-2^28.9136) <= r4  <= 0x1e239d15 (+2^28.9136)
MONTRED r4, r3
    //// bounds:  -0x0005023 (-2^14.3244) <= r4  <= 0x00005024 (+2^14.3245)
str.w r4, [r0, #460]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #464]
ldr.w r10, [r1, #468]
ldr.w r9, [r1, #472]
ldr.w r8, [r1, #476]
ldr.w r7, [r2, #468]
ldr.w r6, [r2, #472]
ldr.w r5, [r2, #476]
/*** basemul 39 ***/
/* computing z0 = x0y0 + zeta^39 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-11417
mul.w r4, r4, r14
    //// bounds:  -0xc24f1c6 (-2^27.6022) <= r4  <= 0x0c24f1c6 (+2^27.6022)
mla.w r4, r10, r7, r4
    //// bounds:  -0x16000b5f (-2^28.4594) <= r4  <= 0x16000b5f (+2^28.4594)
MONTRED r4, r3
    //// bounds:  -0x0004800 (-2^14.1699) <= r4  <= 0x00004800 (+2^14.1699)
str.w r4, [r0, #468]
/* computing z1 = x1y0 + x0y1 + zeta^39 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xa6d69e3 (-2^27.3823) <= r4  <= 0x0a6d69e3 (+2^27.3823)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1448837c (-2^28.3422) <= r4  <= 0x1448837c (+2^28.3422)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e239d15 (-2^28.9136) <= r4  <= 0x1e239d15 (+2^28.9136)
MONTRED r4, r3
    //// bounds:  -0x0005023 (-2^14.3244) <= r4  <= 0x00005024 (+2^14.3245)
str.w r4, [r0, #472]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #476]
ldr.w r10, [r1, #480]
ldr.w r9, [r1, #484]
ldr.w r8, [r1, #488]
ldr.w r7, [r2, #480]
ldr.w r6, [r2, #484]
ldr.w r5, [r2, #488]
/*** basemul 40 ***/
/* computing z0 = x0y0 + zeta^40 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-9669
mul.w r4, r4, r14
    //// bounds:  -0xa48f30e (-2^27.3625) <= r4  <= 0x0a48f30e (+2^27.3625)
mla.w r4, r10, r7, r4
    //// bounds:  -0x14240ca7 (-2^28.3321) <= r4  <= 0x14240ca7 (+2^28.3321)
MONTRED r4, r3
    //// bounds:  -0x0004624 (-2^14.1322) <= r4  <= 0x00004624 (+2^14.1322)
str.w r4, [r0, #480]
/* computing z1 = x1y0 + x0y1 + zeta^40 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8d4b687 (-2^27.1426) <= r4  <= 0x08d4b687 (+2^27.1426)
mla.w r4, r9, r7, r4
    //// bounds:  -0x12afd020 (-2^28.2239) <= r4  <= 0x12afd020 (+2^28.2239)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c8ae9b9 (-2^28.8350) <= r4  <= 0x1c8ae9b9 (+2^28.8350)
MONTRED r4, r3
    //// bounds:  -0x0004e8b (-2^14.2954) <= r4  <= 0x00004e8b (+2^14.2954)
str.w r4, [r0, #484]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #488]
ldr.w r10, [r1, #492]
ldr.w r9, [r1, #496]
ldr.w r8, [r1, #500]
ldr.w r7, [r2, #492]
ldr.w r6, [r2, #496]
ldr.w r5, [r2, #500]
/*** basemul 41 ***/
/* computing z0 = x0y0 + zeta^41 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =9669
mul.w r4, r4, r14
    //// bounds:  -0xa48f30e (-2^27.3625) <= r4  <= 0x0a48f30e (+2^27.3625)
mla.w r4, r10, r7, r4
    //// bounds:  -0x14240ca7 (-2^28.3321) <= r4  <= 0x14240ca7 (+2^28.3321)
MONTRED r4, r3
    //// bounds:  -0x0004624 (-2^14.1322) <= r4  <= 0x00004624 (+2^14.1322)
str.w r4, [r0, #492]
/* computing z1 = x1y0 + x0y1 + zeta^41 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8d4b687 (-2^27.1426) <= r4  <= 0x08d4b687 (+2^27.1426)
mla.w r4, r9, r7, r4
    //// bounds:  -0x12afd020 (-2^28.2239) <= r4  <= 0x12afd020 (+2^28.2239)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c8ae9b9 (-2^28.8350) <= r4  <= 0x1c8ae9b9 (+2^28.8350)
MONTRED r4, r3
    //// bounds:  -0x0004e8b (-2^14.2954) <= r4  <= 0x00004e8b (+2^14.2954)
str.w r4, [r0, #496]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #500]
ldr.w r10, [r1, #504]
ldr.w r9, [r1, #508]
ldr.w r8, [r1, #512]
ldr.w r7, [r2, #504]
ldr.w r6, [r2, #508]
ldr.w r5, [r2, #512]
/*** basemul 42 ***/
/* computing z0 = x0y0 + zeta^42 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10980
mul.w r4, r4, r14
    //// bounds:  -0xbadf218 (-2^27.5459) <= r4  <= 0x0badf218 (+2^27.5459)
mla.w r4, r10, r7, r4
    //// bounds:  -0x15890bb1 (-2^28.4286) <= r4  <= 0x15890bb1 (+2^28.4286)
MONTRED r4, r3
    //// bounds:  -0x0004789 (-2^14.1606) <= r4  <= 0x00004789 (+2^14.1606)
str.w r4, [r0, #504]
/* computing z1 = x1y0 + x0y1 + zeta^42 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xa073d0c (-2^27.3260) <= r4  <= 0x0a073d0c (+2^27.3260)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13e256a5 (-2^28.3135) <= r4  <= 0x13e256a5 (+2^28.3135)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1dbd703e (-2^28.8943) <= r4  <= 0x1dbd703e (+2^28.8943)
MONTRED r4, r3
    //// bounds:  -0x0004fbd (-2^14.3172) <= r4  <= 0x00004fbd (+2^14.3172)
str.w r4, [r0, #508]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #512]
ldr.w r10, [r1, #516]
ldr.w r9, [r1, #520]
ldr.w r8, [r1, #524]
ldr.w r7, [r2, #516]
ldr.w r6, [r2, #520]
ldr.w r5, [r2, #524]
/*** basemul 43 ***/
/* computing z0 = x0y0 + zeta^43 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10980
mul.w r4, r4, r14
    //// bounds:  -0xbadf218 (-2^27.5459) <= r4  <= 0x0badf218 (+2^27.5459)
mla.w r4, r10, r7, r4
    //// bounds:  -0x15890bb1 (-2^28.4286) <= r4  <= 0x15890bb1 (+2^28.4286)
MONTRED r4, r3
    //// bounds:  -0x0004789 (-2^14.1606) <= r4  <= 0x00004789 (+2^14.1606)
str.w r4, [r0, #516]
/* computing z1 = x1y0 + x0y1 + zeta^43 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xa073d0c (-2^27.3260) <= r4  <= 0x0a073d0c (+2^27.3260)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13e256a5 (-2^28.3135) <= r4  <= 0x13e256a5 (+2^28.3135)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1dbd703e (-2^28.8943) <= r4  <= 0x1dbd703e (+2^28.8943)
MONTRED r4, r3
    //// bounds:  -0x0004fbd (-2^14.3172) <= r4  <= 0x00004fbd (+2^14.3172)
str.w r4, [r0, #520]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #524]
ldr.w r10, [r1, #528]
ldr.w r9, [r1, #532]
ldr.w r8, [r1, #536]
ldr.w r7, [r2, #528]
ldr.w r6, [r2, #532]
ldr.w r5, [r2, #536]
/*** basemul 44 ***/
/* computing z0 = x0y0 + zeta^44 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-274
mul.w r4, r4, r14
    //// bounds:  -0x04a9ccc (-2^22.2213) <= r4  <= 0x004a9ccc (+2^22.2213)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa25b665 (-2^27.3430) <= r4  <= 0x0a25b665 (+2^27.3430)
MONTRED r4, r3
    //// bounds:  -0x0003c25 (-2^13.9104) <= r4  <= 0x00003c26 (+2^13.9105)
str.w r4, [r0, #528]
/* computing z1 = x1y0 + x0y1 + zeta^44 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0401066 (-2^22.0014) <= r4  <= 0x00401066 (+2^22.0014)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa1b29ff (-2^27.3372) <= r4  <= 0x0a1b29ff (+2^27.3372)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13f64398 (-2^28.3192) <= r4  <= 0x13f64398 (+2^28.3192)
MONTRED r4, r3
    //// bounds:  -0x00045f6 (-2^14.1285) <= r4  <= 0x000045f6 (+2^14.1285)
str.w r4, [r0, #532]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #536]
ldr.w r10, [r1, #540]
ldr.w r9, [r1, #544]
ldr.w r8, [r1, #548]
ldr.w r7, [r2, #540]
ldr.w r6, [r2, #544]
ldr.w r5, [r2, #548]
/*** basemul 45 ***/
/* computing z0 = x0y0 + zeta^45 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =274
mul.w r4, r4, r14
    //// bounds:  -0x04a9ccc (-2^22.2213) <= r4  <= 0x004a9ccc (+2^22.2213)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa25b665 (-2^27.3430) <= r4  <= 0x0a25b665 (+2^27.3430)
MONTRED r4, r3
    //// bounds:  -0x0003c25 (-2^13.9104) <= r4  <= 0x00003c26 (+2^13.9105)
str.w r4, [r0, #540]
/* computing z1 = x1y0 + x0y1 + zeta^45 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0401066 (-2^22.0014) <= r4  <= 0x00401066 (+2^22.0014)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa1b29ff (-2^27.3372) <= r4  <= 0x0a1b29ff (+2^27.3372)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13f64398 (-2^28.3192) <= r4  <= 0x13f64398 (+2^28.3192)
MONTRED r4, r3
    //// bounds:  -0x00045f6 (-2^14.1285) <= r4  <= 0x000045f6 (+2^14.1285)
str.w r4, [r0, #544]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #548]
ldr.w r10, [r1, #552]
ldr.w r9, [r1, #556]
ldr.w r8, [r1, #560]
ldr.w r7, [r2, #552]
ldr.w r6, [r2, #556]
ldr.w r5, [r2, #560]
/*** basemul 46 ***/
/* computing z0 = x0y0 + zeta^46 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7362
mul.w r4, r4, r14
    //// bounds:  -0x7d4bbec (-2^26.9692) <= r4  <= 0x07d4bbec (+2^26.9692)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11afd585 (-2^28.1446) <= r4  <= 0x11afd585 (+2^28.1446)
MONTRED r4, r3
    //// bounds:  -0x00043af (-2^14.0807) <= r4  <= 0x000043b0 (+2^14.0808)
str.w r4, [r0, #552]
/* computing z1 = x1y0 + x0y1 + zeta^46 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6b94ff6 (-2^26.7493) <= r4  <= 0x06b94ff6 (+2^26.7493)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1094698f (-2^28.0513) <= r4  <= 0x1094698f (+2^28.0513)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a6f8328 (-2^28.7244) <= r4  <= 0x1a6f8328 (+2^28.7244)
MONTRED r4, r3
    //// bounds:  -0x0004c6f (-2^14.2561) <= r4  <= 0x00004c70 (+2^14.2562)
str.w r4, [r0, #556]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #560]
ldr.w r10, [r1, #564]
ldr.w r9, [r1, #568]
ldr.w r8, [r1, #572]
ldr.w r7, [r2, #564]
ldr.w r6, [r2, #568]
ldr.w r5, [r2, #572]
/*** basemul 47 ***/
/* computing z0 = x0y0 + zeta^47 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7362
mul.w r4, r4, r14
    //// bounds:  -0x7d4bbec (-2^26.9692) <= r4  <= 0x07d4bbec (+2^26.9692)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11afd585 (-2^28.1446) <= r4  <= 0x11afd585 (+2^28.1446)
MONTRED r4, r3
    //// bounds:  -0x00043af (-2^14.0807) <= r4  <= 0x000043b0 (+2^14.0808)
str.w r4, [r0, #564]
/* computing z1 = x1y0 + x0y1 + zeta^47 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6b94ff6 (-2^26.7493) <= r4  <= 0x06b94ff6 (+2^26.7493)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1094698f (-2^28.0513) <= r4  <= 0x1094698f (+2^28.0513)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a6f8328 (-2^28.7244) <= r4  <= 0x1a6f8328 (+2^28.7244)
MONTRED r4, r3
    //// bounds:  -0x0004c6f (-2^14.2561) <= r4  <= 0x00004c70 (+2^14.2562)
str.w r4, [r0, #568]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #572]
ldr.w r10, [r1, #576]
ldr.w r9, [r1, #580]
ldr.w r8, [r1, #584]
ldr.w r7, [r2, #576]
ldr.w r6, [r2, #580]
ldr.w r5, [r2, #584]
/*** basemul 48 ***/
/* computing z0 = x0y0 + zeta^48 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =3451
mul.w r4, r4, r14
    //// bounds:  -0x3abbc72 (-2^25.8761) <= r4  <= 0x03abbc72 (+2^25.8761)
mla.w r4, r10, r7, r4
    //// bounds:  -0xd86d60b (-2^27.7577) <= r4  <= 0x0d86d60b (+2^27.7577)
MONTRED r4, r3
    //// bounds:  -0x0003f86 (-2^13.9892) <= r4  <= 0x00003f87 (+2^13.9893)
str.w r4, [r0, #576]
/* computing z1 = x1y0 + x0y1 + zeta^48 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x326e139 (-2^25.6562) <= r4  <= 0x0326e139 (+2^25.6562)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd01fad2 (-2^27.7013) <= r4  <= 0x0d01fad2 (+2^27.7013)
mla.w r4, r10, r6, r4
    //// bounds:  -0x16dd146b (-2^28.5150) <= r4  <= 0x16dd146b (+2^28.5150)
MONTRED r4, r3
    //// bounds:  -0x00048dd (-2^14.1871) <= r4  <= 0x000048dd (+2^14.1871)
str.w r4, [r0, #580]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #584]
ldr.w r10, [r1, #588]
ldr.w r9, [r1, #592]
ldr.w r8, [r1, #596]
ldr.w r7, [r2, #588]
ldr.w r6, [r2, #592]
ldr.w r5, [r2, #596]
/*** basemul 49 ***/
/* computing z0 = x0y0 + zeta^49 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-3451
mul.w r4, r4, r14
    //// bounds:  -0x3abbc72 (-2^25.8761) <= r4  <= 0x03abbc72 (+2^25.8761)
mla.w r4, r10, r7, r4
    //// bounds:  -0xd86d60b (-2^27.7577) <= r4  <= 0x0d86d60b (+2^27.7577)
MONTRED r4, r3
    //// bounds:  -0x0003f86 (-2^13.9892) <= r4  <= 0x00003f87 (+2^13.9893)
str.w r4, [r0, #588]
/* computing z1 = x1y0 + x0y1 + zeta^49 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x326e139 (-2^25.6562) <= r4  <= 0x0326e139 (+2^25.6562)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd01fad2 (-2^27.7013) <= r4  <= 0x0d01fad2 (+2^27.7013)
mla.w r4, r10, r6, r4
    //// bounds:  -0x16dd146b (-2^28.5150) <= r4  <= 0x16dd146b (+2^28.5150)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x00048dd (-2^14.1871) <= r4  <= 0x000048dd (+2^14.1871)
str.w r4, [r0, #592]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #596]
ldr.w r10, [r1, #600]
ldr.w r9, [r1, #604]
ldr.w r8, [r1, #608]
ldr.w r7, [r2, #600]
ldr.w r6, [r2, #604]
ldr.w r5, [r2, #608]
/*** basemul 50 ***/
/* computing z0 = x0y0 + zeta^50 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-11062
mul.w r4, r4, r14
    //// bounds:  -0xbc44664 (-2^27.5566) <= r4  <= 0x0bc44664 (+2^27.5566)
mla.w r4, r10, r7, r4
    //// bounds:  -0x159f5ffd (-2^28.4345) <= r4  <= 0x159f5ffd (+2^28.4345)
MONTRED r4, r3
    //// bounds:  -0x000479f (-2^14.1623) <= r4  <= 0x0000479f (+2^14.1623)
str.w r4, [r0, #600]
/* computing z1 = x1y0 + x0y1 + zeta^50 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xa1a6932 (-2^27.3367) <= r4  <= 0x0a1a6932 (+2^27.3367)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13f582cb (-2^28.3190) <= r4  <= 0x13f582cb (+2^28.3190)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1dd09c64 (-2^28.8980) <= r4  <= 0x1dd09c64 (+2^28.8980)
MONTRED r4, r3
    //// bounds:  -0x0004fd0 (-2^14.3185) <= r4  <= 0x00004fd1 (+2^14.3186)
str.w r4, [r0, #604]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #608]
ldr.w r10, [r1, #612]
ldr.w r9, [r1, #616]
ldr.w r8, [r1, #620]
ldr.w r7, [r2, #612]
ldr.w r6, [r2, #616]
ldr.w r5, [r2, #620]
/*** basemul 51 ***/
/* computing z0 = x0y0 + zeta^51 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =11062
mul.w r4, r4, r14
    //// bounds:  -0xbc44664 (-2^27.5566) <= r4  <= 0x0bc44664 (+2^27.5566)
mla.w r4, r10, r7, r4
    //// bounds:  -0x159f5ffd (-2^28.4345) <= r4  <= 0x159f5ffd (+2^28.4345)
MONTRED r4, r3
    //// bounds:  -0x000479f (-2^14.1623) <= r4  <= 0x0000479f (+2^14.1623)
str.w r4, [r0, #612]
/* computing z1 = x1y0 + x0y1 + zeta^51 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xa1a6932 (-2^27.3367) <= r4  <= 0x0a1a6932 (+2^27.3367)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13f582cb (-2^28.3190) <= r4  <= 0x13f582cb (+2^28.3190)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1dd09c64 (-2^28.8980) <= r4  <= 0x1dd09c64 (+2^28.8980)
MONTRED r4, r3
    //// bounds:  -0x0004fd0 (-2^14.3185) <= r4  <= 0x00004fd1 (+2^14.3186)
str.w r4, [r0, #616]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #620]
ldr.w r10, [r1, #624]
ldr.w r9, [r1, #628]
ldr.w r8, [r1, #632]
ldr.w r7, [r2, #624]
ldr.w r6, [r2, #628]
ldr.w r5, [r2, #632]
/*** basemul 52 ***/
/* computing z0 = x0y0 + zeta^52 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7297
mul.w r4, r4, r14
    //// bounds:  -0x7c308b6 (-2^26.9564) <= r4  <= 0x07c308b6 (+2^26.9564)
mla.w r4, r10, r7, r4
    //// bounds:  -0x119e224f (-2^28.1390) <= r4  <= 0x119e224f (+2^28.1390)
MONTRED r4, r3
    //// bounds:  -0x000439e (-2^14.0793) <= r4  <= 0x0000439e (+2^14.0793)
str.w r4, [r0, #624]
/* computing z1 = x1y0 + x0y1 + zeta^52 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6aa1d5b (-2^26.7365) <= r4  <= 0x06aa1d5b (+2^26.7365)
mla.w r4, r9, r7, r4
    //// bounds:  -0x108536f4 (-2^28.0462) <= r4  <= 0x108536f4 (+2^28.0462)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a60508d (-2^28.7212) <= r4  <= 0x1a60508d (+2^28.7212)
MONTRED r4, r3
    //// bounds:  -0x0004c60 (-2^14.2550) <= r4  <= 0x00004c60 (+2^14.2550)
str.w r4, [r0, #628]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #632]
ldr.w r10, [r1, #636]
ldr.w r9, [r1, #640]
ldr.w r8, [r1, #644]
ldr.w r7, [r2, #636]
ldr.w r6, [r2, #640]
ldr.w r5, [r2, #644]
/*** basemul 53 ***/
/* computing z0 = x0y0 + zeta^53 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7297
mul.w r4, r4, r14
    //// bounds:  -0x7c308b6 (-2^26.9564) <= r4  <= 0x07c308b6 (+2^26.9564)
mla.w r4, r10, r7, r4
    //// bounds:  -0x119e224f (-2^28.1390) <= r4  <= 0x119e224f (+2^28.1390)
MONTRED r4, r3
    //// bounds:  -0x000439e (-2^14.0793) <= r4  <= 0x0000439e (+2^14.0793)
str.w r4, [r0, #636]
/* computing z1 = x1y0 + x0y1 + zeta^53 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6aa1d5b (-2^26.7365) <= r4  <= 0x06aa1d5b (+2^26.7365)
mla.w r4, r9, r7, r4
    //// bounds:  -0x108536f4 (-2^28.0462) <= r4  <= 0x108536f4 (+2^28.0462)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a60508d (-2^28.7212) <= r4  <= 0x1a60508d (+2^28.7212)
MONTRED r4, r3
    //// bounds:  -0x0004c60 (-2^14.2550) <= r4  <= 0x00004c60 (+2^14.2550)
str.w r4, [r0, #640]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #644]
ldr.w r10, [r1, #648]
ldr.w r9, [r1, #652]
ldr.w r8, [r1, #656]
ldr.w r7, [r2, #648]
ldr.w r6, [r2, #652]
ldr.w r5, [r2, #656]
/*** basemul 54 ***/
/* computing z0 = x0y0 + zeta^54 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10126
mul.w r4, r4, r14
    //// bounds:  -0xac564f4 (-2^27.4291) <= r4  <= 0x0ac564f4 (+2^27.4291)
mla.w r4, r10, r7, r4
    //// bounds:  -0x14a07e8d (-2^28.3665) <= r4  <= 0x14a07e8d (+2^28.3665)
MONTRED r4, r3
    //// bounds:  -0x00046a0 (-2^14.1421) <= r4  <= 0x000046a0 (+2^14.1421)
str.w r4, [r0, #648]
/* computing z1 = x1y0 + x0y1 + zeta^54 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x93f907a (-2^27.2092) <= r4  <= 0x093f907a (+2^27.2092)
mla.w r4, r9, r7, r4
    //// bounds:  -0x131aaa13 (-2^28.2558) <= r4  <= 0x131aaa13 (+2^28.2558)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1cf5c3ac (-2^28.8560) <= r4  <= 0x1cf5c3ac (+2^28.8560)
MONTRED r4, r3
    //// bounds:  -0x0004ef5 (-2^14.3030) <= r4  <= 0x00004ef6 (+2^14.3031)
str.w r4, [r0, #652]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #656]
ldr.w r10, [r1, #660]
ldr.w r9, [r1, #664]
ldr.w r8, [r1, #668]
ldr.w r7, [r2, #660]
ldr.w r6, [r2, #664]
ldr.w r5, [r2, #668]
/*** basemul 55 ***/
/* computing z0 = x0y0 + zeta^55 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10126
mul.w r4, r4, r14
    //// bounds:  -0xac564f4 (-2^27.4291) <= r4  <= 0x0ac564f4 (+2^27.4291)
mla.w r4, r10, r7, r4
    //// bounds:  -0x14a07e8d (-2^28.3665) <= r4  <= 0x14a07e8d (+2^28.3665)
MONTRED r4, r3
    //// bounds:  -0x00046a0 (-2^14.1421) <= r4  <= 0x000046a0 (+2^14.1421)
str.w r4, [r0, #660]
/* computing z1 = x1y0 + x0y1 + zeta^55 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x93f907a (-2^27.2092) <= r4  <= 0x093f907a (+2^27.2092)
mla.w r4, r9, r7, r4
    //// bounds:  -0x131aaa13 (-2^28.2558) <= r4  <= 0x131aaa13 (+2^28.2558)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1cf5c3ac (-2^28.8560) <= r4  <= 0x1cf5c3ac (+2^28.8560)
MONTRED r4, r3
    //// bounds:  -0x0004ef5 (-2^14.3030) <= r4  <= 0x00004ef6 (+2^14.3031)
str.w r4, [r0, #664]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #668]
ldr.w r10, [r1, #672]
ldr.w r9, [r1, #676]
ldr.w r8, [r1, #680]
ldr.w r7, [r2, #672]
ldr.w r6, [r2, #676]
ldr.w r5, [r2, #680]
/*** basemul 56 ***/
/* computing z0 = x0y0 + zeta^56 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-914
mul.w r4, r4, r14
    //// bounds:  -0x0f8e3cc (-2^23.9594) <= r4  <= 0x00f8e3cc (+2^23.9594)
mla.w r4, r10, r7, r4
    //// bounds:  -0xad3fd65 (-2^27.4367) <= r4  <= 0x0ad3fd65 (+2^27.4367)
MONTRED r4, r3
    //// bounds:  -0x0003cd4 (-2^13.9267) <= r4  <= 0x00003cd4 (+2^13.9267)
str.w r4, [r0, #672]
/* computing z1 = x1y0 + x0y1 + zeta^56 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0d5b3e6 (-2^23.7395) <= r4  <= 0x00d5b3e6 (+2^23.7395)
mla.w r4, r9, r7, r4
    //// bounds:  -0xab0cd7f (-2^27.4183) <= r4  <= 0x0ab0cd7f (+2^27.4183)
mla.w r4, r10, r6, r4
    //// bounds:  -0x148be718 (-2^28.3608) <= r4  <= 0x148be718 (+2^28.3608)
MONTRED r4, r3
    //// bounds:  -0x000468c (-2^14.1405) <= r4  <= 0x0000468c (+2^14.1405)
str.w r4, [r0, #676]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #680]
ldr.w r10, [r1, #684]
ldr.w r9, [r1, #688]
ldr.w r8, [r1, #692]
ldr.w r7, [r2, #684]
ldr.w r6, [r2, #688]
ldr.w r5, [r2, #692]
/*** basemul 57 ***/
/* computing z0 = x0y0 + zeta^57 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =914
mul.w r4, r4, r14
    //// bounds:  -0x0f8e3cc (-2^23.9594) <= r4  <= 0x00f8e3cc (+2^23.9594)
mla.w r4, r10, r7, r4
    //// bounds:  -0xad3fd65 (-2^27.4367) <= r4  <= 0x0ad3fd65 (+2^27.4367)
MONTRED r4, r3
    //// bounds:  -0x0003cd4 (-2^13.9267) <= r4  <= 0x00003cd4 (+2^13.9267)
str.w r4, [r0, #684]
/* computing z1 = x1y0 + x0y1 + zeta^57 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0d5b3e6 (-2^23.7395) <= r4  <= 0x00d5b3e6 (+2^23.7395)
mla.w r4, r9, r7, r4
    //// bounds:  -0xab0cd7f (-2^27.4183) <= r4  <= 0x0ab0cd7f (+2^27.4183)
mla.w r4, r10, r6, r4
    //// bounds:  -0x148be718 (-2^28.3608) <= r4  <= 0x148be718 (+2^28.3608)
MONTRED r4, r3
    //// bounds:  -0x000468c (-2^14.1405) <= r4  <= 0x0000468c (+2^14.1405)
str.w r4, [r0, #688]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #692]
ldr.w r10, [r1, #696]
ldr.w r9, [r1, #700]
ldr.w r8, [r1, #704]
ldr.w r7, [r2, #696]
ldr.w r6, [r2, #700]
ldr.w r5, [r2, #704]
/*** basemul 58 ***/
/* computing z0 = x0y0 + zeta^58 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7366
mul.w r4, r4, r14
    //// bounds:  -0x7d5d2c4 (-2^26.9700) <= r4  <= 0x07d5d2c4 (+2^26.9700)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11b0ec5d (-2^28.1450) <= r4  <= 0x11b0ec5d (+2^28.1450)
MONTRED r4, r3
    //// bounds:  -0x00043b1 (-2^14.0809) <= r4  <= 0x000043b1 (+2^14.0809)
str.w r4, [r0, #696]
/* computing z1 = x1y0 + x0y1 + zeta^58 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6ba3f62 (-2^26.7501) <= r4  <= 0x06ba3f62 (+2^26.7501)
mla.w r4, r9, r7, r4
    //// bounds:  -0x109558fb (-2^28.0517) <= r4  <= 0x109558fb (+2^28.0517)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a707294 (-2^28.7246) <= r4  <= 0x1a707294 (+2^28.7246)
MONTRED r4, r3
    //// bounds:  -0x0004c70 (-2^14.2562) <= r4  <= 0x00004c70 (+2^14.2562)
str.w r4, [r0, #700]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #704]
ldr.w r10, [r1, #708]
ldr.w r9, [r1, #712]
ldr.w r8, [r1, #716]
ldr.w r7, [r2, #708]
ldr.w r6, [r2, #712]
ldr.w r5, [r2, #716]
/*** basemul 59 ***/
/* computing z0 = x0y0 + zeta^59 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7366
mul.w r4, r4, r14
    //// bounds:  -0x7d5d2c4 (-2^26.9700) <= r4  <= 0x07d5d2c4 (+2^26.9700)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11b0ec5d (-2^28.1450) <= r4  <= 0x11b0ec5d (+2^28.1450)
MONTRED r4, r3
    //// bounds:  -0x00043b1 (-2^14.0809) <= r4  <= 0x000043b1 (+2^14.0809)
str.w r4, [r0, #708]
/* computing z1 = x1y0 + x0y1 + zeta^59 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6ba3f62 (-2^26.7501) <= r4  <= 0x06ba3f62 (+2^26.7501)
mla.w r4, r9, r7, r4
    //// bounds:  -0x109558fb (-2^28.0517) <= r4  <= 0x109558fb (+2^28.0517)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a707294 (-2^28.7246) <= r4  <= 0x1a707294 (+2^28.7246)
MONTRED r4, r3
    //// bounds:  -0x0004c70 (-2^14.2562) <= r4  <= 0x00004c70 (+2^14.2562)
str.w r4, [r0, #712]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #716]
ldr.w r10, [r1, #720]
ldr.w r9, [r1, #724]
ldr.w r8, [r1, #728]
ldr.w r7, [r2, #720]
ldr.w r6, [r2, #724]
ldr.w r5, [r2, #728]
/*** basemul 60 ***/
/* computing z0 = x0y0 + zeta^60 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-6354
mul.w r4, r4, r14
    //// bounds:  -0x6c23f4c (-2^26.7568) <= r4  <= 0x06c23f4c (+2^26.7568)
mla.w r4, r10, r7, r4
    //// bounds:  -0x109d58e5 (-2^28.0544) <= r4  <= 0x109d58e5 (+2^28.0544)
MONTRED r4, r3
    //// bounds:  -0x000429d (-2^14.0577) <= r4  <= 0x0000429d (+2^14.0577)
str.w r4, [r0, #720]
/* computing z1 = x1y0 + x0y1 + zeta^60 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x5cda1a6 (-2^26.5369) <= r4  <= 0x05cda1a6 (+2^26.5369)
mla.w r4, r9, r7, r4
    //// bounds:  -0xfa8bb3f (-2^27.9689) <= r4  <= 0x0fa8bb3f (+2^27.9689)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1983d4d8 (-2^28.6733) <= r4  <= 0x1983d4d8 (+2^28.6733)
MONTRED r4, r3
    //// bounds:  -0x0004b83 (-2^14.2386) <= r4  <= 0x00004b84 (+2^14.2387)
str.w r4, [r0, #724]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #728]
ldr.w r10, [r1, #732]
ldr.w r9, [r1, #736]
ldr.w r8, [r1, #740]
ldr.w r7, [r2, #732]
ldr.w r6, [r2, #736]
ldr.w r5, [r2, #740]
/*** basemul 61 ***/
/* computing z0 = x0y0 + zeta^61 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =6354
mul.w r4, r4, r14
    //// bounds:  -0x6c23f4c (-2^26.7568) <= r4  <= 0x06c23f4c (+2^26.7568)
mla.w r4, r10, r7, r4
    //// bounds:  -0x109d58e5 (-2^28.0544) <= r4  <= 0x109d58e5 (+2^28.0544)
MONTRED r4, r3
    //// bounds:  -0x000429d (-2^14.0577) <= r4  <= 0x0000429d (+2^14.0577)
str.w r4, [r0, #732]
/* computing z1 = x1y0 + x0y1 + zeta^61 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x5cda1a6 (-2^26.5369) <= r4  <= 0x05cda1a6 (+2^26.5369)
mla.w r4, r9, r7, r4
    //// bounds:  -0xfa8bb3f (-2^27.9689) <= r4  <= 0x0fa8bb3f (+2^27.9689)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1983d4d8 (-2^28.6733) <= r4  <= 0x1983d4d8 (+2^28.6733)
MONTRED r4, r3
    //// bounds:  -0x0004b83 (-2^14.2386) <= r4  <= 0x00004b84 (+2^14.2387)
str.w r4, [r0, #736]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #740]
ldr.w r10, [r1, #744]
ldr.w r9, [r1, #748]
ldr.w r8, [r1, #752]
ldr.w r7, [r2, #744]
ldr.w r6, [r2, #748]
ldr.w r5, [r2, #752]
/*** basemul 62 ***/
/* computing z0 = x0y0 + zeta^62 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7400
mul.w r4, r4, r14
    //// bounds:  -0x7df14f0 (-2^26.9766) <= r4  <= 0x07df14f0 (+2^26.9766)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11ba2e89 (-2^28.1479) <= r4  <= 0x11ba2e89 (+2^28.1479)
MONTRED r4, r3
    //// bounds:  -0x00043ba (-2^14.0816) <= r4  <= 0x000043ba (+2^14.0816)
str.w r4, [r0, #744]
/* computing z1 = x1y0 + x0y1 + zeta^62 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6c23278 (-2^26.7567) <= r4  <= 0x06c23278 (+2^26.7567)
mla.w r4, r9, r7, r4
    //// bounds:  -0x109d4c11 (-2^28.0544) <= r4  <= 0x109d4c11 (+2^28.0544)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a7865aa (-2^28.7263) <= r4  <= 0x1a7865aa (+2^28.7263)
MONTRED r4, r3
    //// bounds:  -0x0004c78 (-2^14.2568) <= r4  <= 0x00004c78 (+2^14.2568)
str.w r4, [r0, #748]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #752]
ldr.w r10, [r1, #756]
ldr.w r9, [r1, #760]
ldr.w r8, [r1, #764]
ldr.w r7, [r2, #756]
ldr.w r6, [r2, #760]
ldr.w r5, [r2, #764]
/*** basemul 63 ***/
/* computing z0 = x0y0 + zeta^63 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7400
mul.w r4, r4, r14
    //// bounds:  -0x7df14f0 (-2^26.9766) <= r4  <= 0x07df14f0 (+2^26.9766)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11ba2e89 (-2^28.1479) <= r4  <= 0x11ba2e89 (+2^28.1479)
MONTRED r4, r3
    //// bounds:  -0x00043ba (-2^14.0816) <= r4  <= 0x000043ba (+2^14.0816)
str.w r4, [r0, #756]
/* computing z1 = x1y0 + x0y1 + zeta^63 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6c23278 (-2^26.7567) <= r4  <= 0x06c23278 (+2^26.7567)
mla.w r4, r9, r7, r4
    //// bounds:  -0x109d4c11 (-2^28.0544) <= r4  <= 0x109d4c11 (+2^28.0544)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a7865aa (-2^28.7263) <= r4  <= 0x1a7865aa (+2^28.7263)
MONTRED r4, r3
    //// bounds:  -0x0004c78 (-2^14.2568) <= r4  <= 0x00004c78 (+2^14.2568)
str.w r4, [r0, #760]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #764]
ldr.w r10, [r1, #768]
ldr.w r9, [r1, #772]
ldr.w r8, [r1, #776]
ldr.w r7, [r2, #768]
ldr.w r6, [r2, #772]
ldr.w r5, [r2, #776]
/*** basemul 64 ***/
/* computing z0 = x0y0 + zeta^64 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10530
mul.w r4, r4, r14
    //// bounds:  -0xb33682c (-2^27.4855) <= r4  <= 0x0b33682c (+2^27.4855)
mla.w r4, r10, r7, r4
    //// bounds:  -0x150e81c5 (-2^28.3962) <= r4  <= 0x150e81c5 (+2^28.3962)
MONTRED r4, r3
    //// bounds:  -0x000470e (-2^14.1509) <= r4  <= 0x0000470f (+2^14.1509)
str.w r4, [r0, #768]
/* computing z1 = x1y0 + x0y1 + zeta^64 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x99e0616 (-2^27.2656) <= r4  <= 0x099e0616 (+2^27.2656)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13791faf (-2^28.2834) <= r4  <= 0x13791faf (+2^28.2834)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d543948 (-2^28.8743) <= r4  <= 0x1d543948 (+2^28.8743)
MONTRED r4, r3
    //// bounds:  -0x0004f54 (-2^14.3098) <= r4  <= 0x00004f54 (+2^14.3098)
str.w r4, [r0, #772]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #776]
ldr.w r10, [r1, #780]
ldr.w r9, [r1, #784]
ldr.w r8, [r1, #788]
ldr.w r7, [r2, #780]
ldr.w r6, [r2, #784]
ldr.w r5, [r2, #788]
/*** basemul 65 ***/
/* computing z0 = x0y0 + zeta^65 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10530
mul.w r4, r4, r14
    //// bounds:  -0xb33682c (-2^27.4855) <= r4  <= 0x0b33682c (+2^27.4855)
mla.w r4, r10, r7, r4
    //// bounds:  -0x150e81c5 (-2^28.3962) <= r4  <= 0x150e81c5 (+2^28.3962)
MONTRED r4, r3
    //// bounds:  -0x000470e (-2^14.1509) <= r4  <= 0x0000470f (+2^14.1509)
str.w r4, [r0, #780]
/* computing z1 = x1y0 + x0y1 + zeta^65 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x99e0616 (-2^27.2656) <= r4  <= 0x099e0616 (+2^27.2656)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13791faf (-2^28.2834) <= r4  <= 0x13791faf (+2^28.2834)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d543948 (-2^28.8743) <= r4  <= 0x1d543948 (+2^28.8743)
MONTRED r4, r3
    //// bounds:  -0x0004f54 (-2^14.3098) <= r4  <= 0x00004f54 (+2^14.3098)
str.w r4, [r0, #784]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #788]
ldr.w r10, [r1, #792]
ldr.w r9, [r1, #796]
ldr.w r8, [r1, #800]
ldr.w r7, [r2, #792]
ldr.w r6, [r2, #796]
ldr.w r5, [r2, #800]
/*** basemul 66 ***/
/* computing z0 = x0y0 + zeta^66 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4866
mul.w r4, r4, r14
    //// bounds:  -0x52d0d6c (-2^26.3718) <= r4  <= 0x052d0d6c (+2^26.3718)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf082705 (-2^27.9100) <= r4  <= 0x0f082705 (+2^27.9100)
MONTRED r4, r3
    //// bounds:  -0x0004108 (-2^14.0231) <= r4  <= 0x00004108 (+2^14.0231)
str.w r4, [r0, #792]
/* computing z1 = x1y0 + x0y1 + zeta^66 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x471b8b6 (-2^26.1519) <= r4  <= 0x0471b8b6 (+2^26.1519)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe4cd24f (-2^27.8380) <= r4  <= 0x0e4cd24f (+2^27.8380)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1827ebe8 (-2^28.5943) <= r4  <= 0x1827ebe8 (+2^28.5943)
MONTRED r4, r3
    //// bounds:  -0x0004a28 (-2^14.2125) <= r4  <= 0x00004a28 (+2^14.2125)
str.w r4, [r0, #796]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #800]
ldr.w r10, [r1, #804]
ldr.w r9, [r1, #808]
ldr.w r8, [r1, #812]
ldr.w r7, [r2, #804]
ldr.w r6, [r2, #808]
ldr.w r5, [r2, #812]
/*** basemul 67 ***/
/* computing z0 = x0y0 + zeta^67 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4866
mul.w r4, r4, r14
    //// bounds:  -0x52d0d6c (-2^26.3718) <= r4  <= 0x052d0d6c (+2^26.3718)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf082705 (-2^27.9100) <= r4  <= 0x0f082705 (+2^27.9100)
MONTRED r4, r3
    //// bounds:  -0x0004108 (-2^14.0231) <= r4  <= 0x00004108 (+2^14.0231)
str.w r4, [r0, #804]
/* computing z1 = x1y0 + x0y1 + zeta^67 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x471b8b6 (-2^26.1519) <= r4  <= 0x0471b8b6 (+2^26.1519)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe4cd24f (-2^27.8380) <= r4  <= 0x0e4cd24f (+2^27.8380)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1827ebe8 (-2^28.5943) <= r4  <= 0x1827ebe8 (+2^28.5943)
MONTRED r4, r3
    //// bounds:  -0x0004a28 (-2^14.2125) <= r4  <= 0x00004a28 (+2^14.2125)
str.w r4, [r0, #808]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #812]
ldr.w r10, [r1, #816]
ldr.w r9, [r1, #820]
ldr.w r8, [r1, #824]
ldr.w r7, [r2, #816]
ldr.w r6, [r2, #820]
ldr.w r5, [r2, #824]
/*** basemul 68 ***/
/* computing z0 = x0y0 + zeta^68 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4691
mul.w r4, r4, r14
    //// bounds:  -0x4fd6602 (-2^26.3190) <= r4  <= 0x04fd6602 (+2^26.3190)
mla.w r4, r10, r7, r4
    //// bounds:  -0xed87f9b (-2^27.8920) <= r4  <= 0x0ed87f9b (+2^27.8920)
MONTRED r4, r3
    //// bounds:  -0x00040d8 (-2^14.0189) <= r4  <= 0x000040d8 (+2^14.0189)
str.w r4, [r0, #816]
/* computing z1 = x1y0 + x0y1 + zeta^68 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x448ce01 (-2^26.0991) <= r4  <= 0x0448ce01 (+2^26.0991)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe23e79a (-2^27.8217) <= r4  <= 0x0e23e79a (+2^27.8217)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17ff0133 (-2^28.5847) <= r4  <= 0x17ff0133 (+2^28.5847)
MONTRED r4, r3
    //// bounds:  -0x00049ff (-2^14.2094) <= r4  <= 0x000049ff (+2^14.2094)
str.w r4, [r0, #820]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #824]
ldr.w r10, [r1, #828]
ldr.w r9, [r1, #832]
ldr.w r8, [r1, #836]
ldr.w r7, [r2, #828]
ldr.w r6, [r2, #832]
ldr.w r5, [r2, #836]
/*** basemul 69 ***/
/* computing z0 = x0y0 + zeta^69 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4691
mul.w r4, r4, r14
    //// bounds:  -0x4fd6602 (-2^26.3190) <= r4  <= 0x04fd6602 (+2^26.3190)
mla.w r4, r10, r7, r4
    //// bounds:  -0xed87f9b (-2^27.8920) <= r4  <= 0x0ed87f9b (+2^27.8920)
MONTRED r4, r3
    //// bounds:  -0x00040d8 (-2^14.0189) <= r4  <= 0x000040d8 (+2^14.0189)
str.w r4, [r0, #828]
/* computing z1 = x1y0 + x0y1 + zeta^69 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x448ce01 (-2^26.0991) <= r4  <= 0x0448ce01 (+2^26.0991)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe23e79a (-2^27.8217) <= r4  <= 0x0e23e79a (+2^27.8217)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17ff0133 (-2^28.5847) <= r4  <= 0x17ff0133 (+2^28.5847)
MONTRED r4, r3
    //// bounds:  -0x00049ff (-2^14.2094) <= r4  <= 0x000049ff (+2^14.2094)
str.w r4, [r0, #832]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #836]
ldr.w r10, [r1, #840]
ldr.w r9, [r1, #844]
ldr.w r8, [r1, #848]
ldr.w r7, [r2, #840]
ldr.w r6, [r2, #844]
ldr.w r5, [r2, #848]
/*** basemul 70 ***/
/* computing z0 = x0y0 + zeta^70 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8131
mul.w r4, r4, r14
    //// bounds:  -0x8a623a2 (-2^27.1125) <= r4  <= 0x08a623a2 (+2^27.1125)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12813d3b (-2^28.2098) <= r4  <= 0x12813d3b (+2^28.2098)
MONTRED r4, r3
    //// bounds:  -0x0004481 (-2^14.0981) <= r4  <= 0x00004481 (+2^14.0981)
str.w r4, [r0, #840]
/* computing z1 = x1y0 + x0y1 + zeta^70 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x76d1cd1 (-2^26.8926) <= r4  <= 0x076d1cd1 (+2^26.8926)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1148366a (-2^28.1112) <= r4  <= 0x1148366a (+2^28.1112)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b235003 (-2^28.7622) <= r4  <= 0x1b235003 (+2^28.7622)
MONTRED r4, r3
    //// bounds:  -0x0004d23 (-2^14.2693) <= r4  <= 0x00004d23 (+2^14.2693)
str.w r4, [r0, #844]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #848]
ldr.w r10, [r1, #852]
ldr.w r9, [r1, #856]
ldr.w r8, [r1, #860]
ldr.w r7, [r2, #852]
ldr.w r6, [r2, #856]
ldr.w r5, [r2, #860]
/*** basemul 71 ***/
/* computing z0 = x0y0 + zeta^71 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8131
mul.w r4, r4, r14
    //// bounds:  -0x8a623a2 (-2^27.1125) <= r4  <= 0x08a623a2 (+2^27.1125)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12813d3b (-2^28.2098) <= r4  <= 0x12813d3b (+2^28.2098)
MONTRED r4, r3
    //// bounds:  -0x0004481 (-2^14.0981) <= r4  <= 0x00004481 (+2^14.0981)
str.w r4, [r0, #852]
/* computing z1 = x1y0 + x0y1 + zeta^71 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x76d1cd1 (-2^26.8926) <= r4  <= 0x076d1cd1 (+2^26.8926)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1148366a (-2^28.1112) <= r4  <= 0x1148366a (+2^28.1112)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b235003 (-2^28.7622) <= r4  <= 0x1b235003 (+2^28.7622)
MONTRED r4, r3
    //// bounds:  -0x0004d23 (-2^14.2693) <= r4  <= 0x00004d23 (+2^14.2693)
str.w r4, [r0, #856]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #860]
ldr.w r10, [r1, #864]
ldr.w r9, [r1, #868]
ldr.w r8, [r1, #872]
ldr.w r7, [r2, #864]
ldr.w r6, [r2, #868]
ldr.w r5, [r2, #872]
/*** basemul 72 ***/
/* computing z0 = x0y0 + zeta^72 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-12418
mul.w r4, r4, r14
    //// bounds:  -0xd35866c (-2^27.7235) <= r4  <= 0x0d35866c (+2^27.7235)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1710a005 (-2^28.5276) <= r4  <= 0x1710a005 (+2^28.5276)
MONTRED r4, r3
    //// bounds:  -0x0004910 (-2^14.1911) <= r4  <= 0x00004911 (+2^14.1911)
str.w r4, [r0, #864]
/* computing z1 = x1y0 + x0y1 + zeta^72 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb577536 (-2^27.5036) <= r4  <= 0x0b577536 (+2^27.5036)
mla.w r4, r9, r7, r4
    //// bounds:  -0x15328ecf (-2^28.4058) <= r4  <= 0x15328ecf (+2^28.4058)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1f0da868 (-2^28.9567) <= r4  <= 0x1f0da868 (+2^28.9567)
MONTRED r4, r3
    //// bounds:  -0x000510d (-2^14.3408) <= r4  <= 0x0000510e (+2^14.3408)
str.w r4, [r0, #868]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #872]
ldr.w r10, [r1, #876]
ldr.w r9, [r1, #880]
ldr.w r8, [r1, #884]
ldr.w r7, [r2, #876]
ldr.w r6, [r2, #880]
ldr.w r5, [r2, #884]
/*** basemul 73 ***/
/* computing z0 = x0y0 + zeta^73 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =12418
mul.w r4, r4, r14
    //// bounds:  -0xd35866c (-2^27.7235) <= r4  <= 0x0d35866c (+2^27.7235)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1710a005 (-2^28.5276) <= r4  <= 0x1710a005 (+2^28.5276)
MONTRED r4, r3
    //// bounds:  -0x0004910 (-2^14.1911) <= r4  <= 0x00004911 (+2^14.1911)
str.w r4, [r0, #876]
/* computing z1 = x1y0 + x0y1 + zeta^73 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb577536 (-2^27.5036) <= r4  <= 0x0b577536 (+2^27.5036)
mla.w r4, r9, r7, r4
    //// bounds:  -0x15328ecf (-2^28.4058) <= r4  <= 0x15328ecf (+2^28.4058)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1f0da868 (-2^28.9567) <= r4  <= 0x1f0da868 (+2^28.9567)
MONTRED r4, r3
    //// bounds:  -0x000510d (-2^14.3408) <= r4  <= 0x0000510e (+2^14.3408)
str.w r4, [r0, #880]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #884]
ldr.w r10, [r1, #888]
ldr.w r9, [r1, #892]
ldr.w r8, [r1, #896]
ldr.w r7, [r2, #888]
ldr.w r6, [r2, #892]
ldr.w r5, [r2, #896]
/*** basemul 74 ***/
/* computing z0 = x0y0 + zeta^74 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =9998
mul.w r4, r4, r14
    //// bounds:  -0xaa289f4 (-2^27.4107) <= r4  <= 0x0aa289f4 (+2^27.4107)
mla.w r4, r10, r7, r4
    //// bounds:  -0x147da38d (-2^28.3569) <= r4  <= 0x147da38d (+2^28.3569)
MONTRED r4, r3
    //// bounds:  -0x000467d (-2^14.1393) <= r4  <= 0x0000467e (+2^14.1394)
str.w r4, [r0, #888]
/* computing z1 = x1y0 + x0y1 + zeta^74 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x921a2fa (-2^27.1908) <= r4  <= 0x0921a2fa (+2^27.1908)
mla.w r4, r9, r7, r4
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x12fcbc93 (-2^28.2470) <= r4  <= 0x12fcbc93 (+2^28.2470)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1cd7d62c (-2^28.8502) <= r4  <= 0x1cd7d62c (+2^28.8502)
MONTRED r4, r3
    //// bounds:  -0x0004ed7 (-2^14.3009) <= r4  <= 0x00004ed8 (+2^14.3009)
str.w r4, [r0, #892]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #896]
ldr.w r10, [r1, #900]
ldr.w r9, [r1, #904]
ldr.w r8, [r1, #908]
ldr.w r7, [r2, #900]
ldr.w r6, [r2, #904]
ldr.w r5, [r2, #908]
/*** basemul 75 ***/
/* computing z0 = x0y0 + zeta^75 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-9998
mul.w r4, r4, r14
    //// bounds:  -0xaa289f4 (-2^27.4107) <= r4  <= 0x0aa289f4 (+2^27.4107)
mla.w r4, r10, r7, r4
    //// bounds:  -0x147da38d (-2^28.3569) <= r4  <= 0x147da38d (+2^28.3569)
MONTRED r4, r3
    //// bounds:  -0x000467d (-2^14.1393) <= r4  <= 0x0000467e (+2^14.1394)
str.w r4, [r0, #900]
/* computing z1 = x1y0 + x0y1 + zeta^75 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x921a2fa (-2^27.1908) <= r4  <= 0x0921a2fa (+2^27.1908)
mla.w r4, r9, r7, r4
    //// bounds:  -0x12fcbc93 (-2^28.2470) <= r4  <= 0x12fcbc93 (+2^28.2470)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1cd7d62c (-2^28.8502) <= r4  <= 0x1cd7d62c (+2^28.8502)
MONTRED r4, r3
    //// bounds:  -0x0004ed7 (-2^14.3009) <= r4  <= 0x00004ed8 (+2^14.3009)
str.w r4, [r0, #904]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #908]
ldr.w r10, [r1, #912]
ldr.w r9, [r1, #916]
ldr.w r8, [r1, #920]
ldr.w r7, [r2, #912]
ldr.w r6, [r2, #916]
ldr.w r5, [r2, #920]
/*** basemul 76 ***/
/* computing z0 = x0y0 + zeta^76 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8965
mul.w r4, r4, r14
    //// bounds:  -0x9893e8e (-2^27.2534) <= r4  <= 0x09893e8e (+2^27.2534)
mla.w r4, r10, r7, r4
    //// bounds:  -0x13645827 (-2^28.2774) <= r4  <= 0x13645827 (+2^28.2774)
MONTRED r4, r3
    //// bounds:  -0x0004564 (-2^14.1167) <= r4  <= 0x00004564 (+2^14.1167)
str.w r4, [r0, #912]
/* computing z1 = x1y0 + x0y1 + zeta^76 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8301c47 (-2^27.0335) <= r4  <= 0x08301c47 (+2^27.0335)
mla.w r4, r9, r7, r4
    //// bounds:  -0x120b35e0 (-2^28.1734) <= r4  <= 0x120b35e0 (+2^28.1734)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1be64f79 (-2^28.8022) <= r4  <= 0x1be64f79 (+2^28.8022)
MONTRED r4, r3
    //// bounds:  -0x0004de6 (-2^14.2835) <= r4  <= 0x00004de6 (+2^14.2835)
str.w r4, [r0, #916]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #920]
ldr.w r10, [r1, #924]
ldr.w r9, [r1, #928]
ldr.w r8, [r1, #932]
ldr.w r7, [r2, #924]
ldr.w r6, [r2, #928]
ldr.w r5, [r2, #932]
/*** basemul 77 ***/
/* computing z0 = x0y0 + zeta^77 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8965
mul.w r4, r4, r14
    //// bounds:  -0x9893e8e (-2^27.2534) <= r4  <= 0x09893e8e (+2^27.2534)
mla.w r4, r10, r7, r4
    //// bounds:  -0x13645827 (-2^28.2774) <= r4  <= 0x13645827 (+2^28.2774)
MONTRED r4, r3
    //// bounds:  -0x0004564 (-2^14.1167) <= r4  <= 0x00004564 (+2^14.1167)
str.w r4, [r0, #924]
/* computing z1 = x1y0 + x0y1 + zeta^77 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8301c47 (-2^27.0335) <= r4  <= 0x08301c47 (+2^27.0335)
mla.w r4, r9, r7, r4
    //// bounds:  -0x120b35e0 (-2^28.1734) <= r4  <= 0x120b35e0 (+2^28.1734)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1be64f79 (-2^28.8022) <= r4  <= 0x1be64f79 (+2^28.8022)
MONTRED r4, r3
    //// bounds:  -0x0004de6 (-2^14.2835) <= r4  <= 0x00004de6 (+2^14.2835)
str.w r4, [r0, #928]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #932]
ldr.w r10, [r1, #936]
ldr.w r9, [r1, #940]
ldr.w r8, [r1, #944]
ldr.w r7, [r2, #936]
ldr.w r6, [r2, #940]
ldr.w r5, [r2, #944]
/*** basemul 78 ***/
/* computing z0 = x0y0 + zeta^78 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-744
mul.w r4, r4, r14
    //// bounds:  -0x0ca98f0 (-2^23.6625) <= r4  <= 0x00ca98f0 (+2^23.6625)
mla.w r4, r10, r7, r4
    //// bounds:  -0xaa5b289 (-2^27.4124) <= r4  <= 0x0aa5b289 (+2^27.4124)
MONTRED r4, r3
    //// bounds:  -0x0003ca5 (-2^13.9223) <= r4  <= 0x00003ca6 (+2^13.9224)
str.w r4, [r0, #936]
/* computing z1 = x1y0 + x0y1 + zeta^78 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0adf478 (-2^23.4426) <= r4  <= 0x00adf478 (+2^23.4426)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa890e11 (-2^27.3972) <= r4  <= 0x0a890e11 (+2^27.3972)
mla.w r4, r10, r6, r4
    //// bounds:  -0x146427aa (-2^28.3499) <= r4  <= 0x146427aa (+2^28.3499)
MONTRED r4, r3
    //// bounds:  -0x0004664 (-2^14.1373) <= r4  <= 0x00004664 (+2^14.1373)
str.w r4, [r0, #940]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #944]
ldr.w r10, [r1, #948]
ldr.w r9, [r1, #952]
ldr.w r8, [r1, #956]
ldr.w r7, [r2, #948]
ldr.w r6, [r2, #952]
ldr.w r5, [r2, #956]
/*** basemul 79 ***/
/* computing z0 = x0y0 + zeta^79 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =744
mul.w r4, r4, r14
    //// bounds:  -0x0ca98f0 (-2^23.6625) <= r4  <= 0x00ca98f0 (+2^23.6625)
mla.w r4, r10, r7, r4
    //// bounds:  -0xaa5b289 (-2^27.4124) <= r4  <= 0x0aa5b289 (+2^27.4124)
MONTRED r4, r3
    //// bounds:  -0x0003ca5 (-2^13.9223) <= r4  <= 0x00003ca6 (+2^13.9224)
str.w r4, [r0, #948]
/* computing z1 = x1y0 + x0y1 + zeta^79 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0adf478 (-2^23.4426) <= r4  <= 0x00adf478 (+2^23.4426)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa890e11 (-2^27.3972) <= r4  <= 0x0a890e11 (+2^27.3972)
mla.w r4, r10, r6, r4
    //// bounds:  -0x146427aa (-2^28.3499) <= r4  <= 0x146427aa (+2^28.3499)
MONTRED r4, r3
    //// bounds:  -0x0004664 (-2^14.1373) <= r4  <= 0x00004664 (+2^14.1373)
str.w r4, [r0, #952]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #956]
ldr.w r10, [r1, #960]
ldr.w r9, [r1, #964]
ldr.w r8, [r1, #968]
ldr.w r7, [r2, #960]
ldr.w r6, [r2, #964]
ldr.w r5, [r2, #968]
/*** basemul 80 ***/
/* computing z0 = x0y0 + zeta^80 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-11261
mul.w r4, r4, r14
    //// bounds:  -0xbfa76de (-2^27.5824) <= r4  <= 0x0bfa76de (+2^27.5824)
mla.w r4, r10, r7, r4
    //// bounds:  -0x15d59077 (-2^28.4485) <= r4  <= 0x15d59077 (+2^28.4485)
MONTRED r4, r3
    //// bounds:  -0x00047d5 (-2^14.1666) <= r4  <= 0x000047d6 (+2^14.1666)
str.w r4, [r0, #960]
/* computing z1 = x1y0 + x0y1 + zeta^80 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xa48f06f (-2^27.3625) <= r4  <= 0x0a48f06f (+2^27.3625)
mla.w r4, r9, r7, r4
    //// bounds:  -0x14240a08 (-2^28.3320) <= r4  <= 0x14240a08 (+2^28.3320)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1dff23a1 (-2^28.9067) <= r4  <= 0x1dff23a1 (+2^28.9067)
MONTRED r4, r3
    //// bounds:  -0x0004fff (-2^14.3219) <= r4  <= 0x00004fff (+2^14.3219)
str.w r4, [r0, #964]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #968]
ldr.w r10, [r1, #972]
ldr.w r9, [r1, #976]
ldr.w r8, [r1, #980]
ldr.w r7, [r2, #972]
ldr.w r6, [r2, #976]
ldr.w r5, [r2, #980]
/*** basemul 81 ***/
/* computing z0 = x0y0 + zeta^81 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =11261
mul.w r4, r4, r14
    //// bounds:  -0xbfa76de (-2^27.5824) <= r4  <= 0x0bfa76de (+2^27.5824)
mla.w r4, r10, r7, r4
    //// bounds:  -0x15d59077 (-2^28.4485) <= r4  <= 0x15d59077 (+2^28.4485)
MONTRED r4, r3
    //// bounds:  -0x00047d5 (-2^14.1666) <= r4  <= 0x000047d6 (+2^14.1666)
str.w r4, [r0, #972]
/* computing z1 = x1y0 + x0y1 + zeta^81 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xa48f06f (-2^27.3625) <= r4  <= 0x0a48f06f (+2^27.3625)
mla.w r4, r9, r7, r4
    //// bounds:  -0x14240a08 (-2^28.3320) <= r4  <= 0x14240a08 (+2^28.3320)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1dff23a1 (-2^28.9067) <= r4  <= 0x1dff23a1 (+2^28.9067)
MONTRED r4, r3
    //// bounds:  -0x0004fff (-2^14.3219) <= r4  <= 0x00004fff (+2^14.3219)
str.w r4, [r0, #976]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #980]
ldr.w r10, [r1, #984]
ldr.w r9, [r1, #988]
ldr.w r8, [r1, #992]
ldr.w r7, [r2, #984]
ldr.w r6, [r2, #988]
ldr.w r5, [r2, #992]
/*** basemul 82 ***/
/* computing z0 = x0y0 + zeta^82 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-9690
mul.w r4, r4, r14
    //// bounds:  -0xa4eaafc (-2^27.3656) <= r4  <= 0x0a4eaafc (+2^27.3656)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1429c495 (-2^28.3336) <= r4  <= 0x1429c495 (+2^28.3336)
MONTRED r4, r3
    //// bounds:  -0x0004629 (-2^14.1326) <= r4  <= 0x0000462a (+2^14.1327)
str.w r4, [r0, #984]
/* computing z1 = x1y0 + x0y1 + zeta^82 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8d99f7e (-2^27.1457) <= r4  <= 0x08d99f7e (+2^27.1457)
mla.w r4, r9, r7, r4
    //// bounds:  -0x12b4b917 (-2^28.2254) <= r4  <= 0x12b4b917 (+2^28.2254)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c8fd2b0 (-2^28.8360) <= r4  <= 0x1c8fd2b0 (+2^28.8360)
MONTRED r4, r3
    //// bounds:  -0x0004e8f (-2^14.2957) <= r4  <= 0x00004e90 (+2^14.2958)
str.w r4, [r0, #988]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #992]
ldr.w r10, [r1, #996]
ldr.w r9, [r1, #1000]
ldr.w r8, [r1, #1004]
ldr.w r7, [r2, #996]
ldr.w r6, [r2, #1000]
ldr.w r5, [r2, #1004]
/*** basemul 83 ***/
/* computing z0 = x0y0 + zeta^83 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =9690
mul.w r4, r4, r14
    //// bounds:  -0xa4eaafc (-2^27.3656) <= r4  <= 0x0a4eaafc (+2^27.3656)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1429c495 (-2^28.3336) <= r4  <= 0x1429c495 (+2^28.3336)
MONTRED r4, r3
    //// bounds:  -0x0004629 (-2^14.1326) <= r4  <= 0x0000462a (+2^14.1327)
str.w r4, [r0, #996]
/* computing z1 = x1y0 + x0y1 + zeta^83 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8d99f7e (-2^27.1457) <= r4  <= 0x08d99f7e (+2^27.1457)
mla.w r4, r9, r7, r4
    //// bounds:  -0x12b4b917 (-2^28.2254) <= r4  <= 0x12b4b917 (+2^28.2254)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c8fd2b0 (-2^28.8360) <= r4  <= 0x1c8fd2b0 (+2^28.8360)
MONTRED r4, r3
    //// bounds:  -0x0004e8f (-2^14.2957) <= r4  <= 0x00004e90 (+2^14.2958)
str.w r4, [r0, #1000]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1004]
ldr.w r10, [r1, #1008]
ldr.w r9, [r1, #1012]
ldr.w r8, [r1, #1016]
ldr.w r7, [r2, #1008]
ldr.w r6, [r2, #1012]
ldr.w r5, [r2, #1016]
/*** basemul 84 ***/
/* computing z0 = x0y0 + zeta^84 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =6753
mul.w r4, r4, r14
    //// bounds:  -0x72ee5f6 (-2^26.8446) <= r4  <= 0x072ee5f6 (+2^26.8446)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1109ff8f (-2^28.0908) <= r4  <= 0x1109ff8f (+2^28.0908)
MONTRED r4, r3
    //// bounds:  -0x000430a (-2^14.0669) <= r4  <= 0x0000430a (+2^14.0669)
str.w r4, [r0, #1008]
/* computing z1 = x1y0 + x0y1 + zeta^84 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x62aebfb (-2^26.6247) <= r4  <= 0x062aebfb (+2^26.6247)
mla.w r4, r9, r7, r4
    //// bounds:  -0x10060594 (-2^28.0021) <= r4  <= 0x10060594 (+2^28.0021)
mla.w r4, r10, r6, r4
    //// bounds:  -0x19e11f2d (-2^28.6937) <= r4  <= 0x19e11f2d (+2^28.6937)
MONTRED r4, r3
    //// bounds:  -0x0004be1 (-2^14.2456) <= r4  <= 0x00004be1 (+2^14.2456)
str.w r4, [r0, #1012]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1016]
ldr.w r10, [r1, #1020]
ldr.w r9, [r1, #1024]
ldr.w r8, [r1, #1028]
ldr.w r7, [r2, #1020]
ldr.w r6, [r2, #1024]
ldr.w r5, [r2, #1028]
/*** basemul 85 ***/
/* computing z0 = x0y0 + zeta^85 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-6753
mul.w r4, r4, r14
    //// bounds:  -0x72ee5f6 (-2^26.8446) <= r4  <= 0x072ee5f6 (+2^26.8446)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1109ff8f (-2^28.0908) <= r4  <= 0x1109ff8f (+2^28.0908)
MONTRED r4, r3
    //// bounds:  -0x000430a (-2^14.0669) <= r4  <= 0x0000430a (+2^14.0669)
str.w r4, [r0, #1020]
/* computing z1 = x1y0 + x0y1 + zeta^85 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x62aebfb (-2^26.6247) <= r4  <= 0x062aebfb (+2^26.6247)
mla.w r4, r9, r7, r4
    //// bounds:  -0x10060594 (-2^28.0021) <= r4  <= 0x10060594 (+2^28.0021)
mla.w r4, r10, r6, r4
    //// bounds:  -0x19e11f2d (-2^28.6937) <= r4  <= 0x19e11f2d (+2^28.6937)
MONTRED r4, r3
    //// bounds:  -0x0004be1 (-2^14.2456) <= r4  <= 0x00004be1 (+2^14.2456)
str.w r4, [r0, #1024]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1028]
ldr.w r10, [r1, #1032]
ldr.w r9, [r1, #1036]
ldr.w r8, [r1, #1040]
ldr.w r7, [r2, #1032]
ldr.w r6, [r2, #1036]
ldr.w r5, [r2, #1040]
/*** basemul 86 ***/
/* computing z0 = x0y0 + zeta^86 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =5238
mul.w r4, r4, r14
    //// bounds:  -0x59259e4 (-2^26.4781) <= r4  <= 0x059259e4 (+2^26.4781)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf6d737d (-2^27.9474) <= r4  <= 0x0f6d737d (+2^27.9474)
MONTRED r4, r3
    //// bounds:  -0x000416d (-2^14.0318) <= r4  <= 0x0000416d (+2^14.0318)
str.w r4, [r0, #1032]
/* computing z1 = x1y0 + x0y1 + zeta^86 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4c8b2f2 (-2^26.2582) <= r4  <= 0x04c8b2f2 (+2^26.2582)
mla.w r4, r9, r7, r4
    //// bounds:  -0xea3cc8b (-2^27.8718) <= r4  <= 0x0ea3cc8b (+2^27.8718)
mla.w r4, r10, r6, r4
    //// bounds:  -0x187ee624 (-2^28.6145) <= r4  <= 0x187ee624 (+2^28.6145)
MONTRED r4, r3
    //// bounds:  -0x0004a7f (-2^14.2191) <= r4  <= 0x00004a7f (+2^14.2191)
str.w r4, [r0, #1036]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1040]
ldr.w r10, [r1, #1044]
ldr.w r9, [r1, #1048]
ldr.w r8, [r1, #1052]
ldr.w r7, [r2, #1044]
ldr.w r6, [r2, #1048]
ldr.w r5, [r2, #1052]
/*** basemul 87 ***/
/* computing z0 = x0y0 + zeta^87 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-5238
mul.w r4, r4, r14
    //// bounds:  -0x59259e4 (-2^26.4781) <= r4  <= 0x059259e4 (+2^26.4781)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf6d737d (-2^27.9474) <= r4  <= 0x0f6d737d (+2^27.9474)
MONTRED r4, r3
    //// bounds:  -0x000416d (-2^14.0318) <= r4  <= 0x0000416d (+2^14.0318)
str.w r4, [r0, #1044]
/* computing z1 = x1y0 + x0y1 + zeta^87 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4c8b2f2 (-2^26.2582) <= r4  <= 0x04c8b2f2 (+2^26.2582)
mla.w r4, r9, r7, r4
    //// bounds:  -0xea3cc8b (-2^27.8718) <= r4  <= 0x0ea3cc8b (+2^27.8718)
mla.w r4, r10, r6, r4
    //// bounds:  -0x187ee624 (-2^28.6145) <= r4  <= 0x187ee624 (+2^28.6145)
MONTRED r4, r3
    //// bounds:  -0x0004a7f (-2^14.2191) <= r4  <= 0x00004a7f (+2^14.2191)
str.w r4, [r0, #1048]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1052]
ldr.w r10, [r1, #1056]
ldr.w r9, [r1, #1060]
ldr.w r8, [r1, #1064]
ldr.w r7, [r2, #1056]
ldr.w r6, [r2, #1060]
ldr.w r5, [r2, #1064]
/*** basemul 88 ***/
/* computing z0 = x0y0 + zeta^88 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =9711
mul.w r4, r4, r14
    //// bounds:  -0xa5462ea (-2^27.3687) <= r4  <= 0x0a5462ea (+2^27.3687)
mla.w r4, r10, r7, r4
    //// bounds:  -0x142f7c83 (-2^28.3352) <= r4  <= 0x142f7c83 (+2^28.3352)
MONTRED r4, r3
    //// bounds:  -0x000462f (-2^14.1331) <= r4  <= 0x0000462f (+2^14.1331)
str.w r4, [r0, #1056]
/* computing z1 = x1y0 + x0y1 + zeta^88 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8de8875 (-2^27.1488) <= r4  <= 0x08de8875 (+2^27.1488)
mla.w r4, r9, r7, r4
    //// bounds:  -0x12b9a20e (-2^28.2269) <= r4  <= 0x12b9a20e (+2^28.2269)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c94bba7 (-2^28.8370) <= r4  <= 0x1c94bba7 (+2^28.8370)
MONTRED r4, r3
    //// bounds:  -0x0004e94 (-2^14.2961) <= r4  <= 0x00004e95 (+2^14.2961)
str.w r4, [r0, #1060]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1064]
ldr.w r10, [r1, #1068]
ldr.w r9, [r1, #1072]
ldr.w r8, [r1, #1076]
ldr.w r7, [r2, #1068]
ldr.w r6, [r2, #1072]
ldr.w r5, [r2, #1076]
/*** basemul 89 ***/
/* computing z0 = x0y0 + zeta^89 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-9711
mul.w r4, r4, r14
    //// bounds:  -0xa5462ea (-2^27.3687) <= r4  <= 0x0a5462ea (+2^27.3687)
mla.w r4, r10, r7, r4
    //// bounds:  -0x142f7c83 (-2^28.3352) <= r4  <= 0x142f7c83 (+2^28.3352)
MONTRED r4, r3
    //// bounds:  -0x000462f (-2^14.1331) <= r4  <= 0x0000462f (+2^14.1331)
str.w r4, [r0, #1068]
/* computing z1 = x1y0 + x0y1 + zeta^89 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8de8875 (-2^27.1488) <= r4  <= 0x08de8875 (+2^27.1488)
mla.w r4, r9, r7, r4
    //// bounds:  -0x12b9a20e (-2^28.2269) <= r4  <= 0x12b9a20e (+2^28.2269)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c94bba7 (-2^28.8370) <= r4  <= 0x1c94bba7 (+2^28.8370)
MONTRED r4, r3
    //// bounds:  -0x0004e94 (-2^14.2961) <= r4  <= 0x00004e95 (+2^14.2961)
str.w r4, [r0, #1072]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1076]
ldr.w r10, [r1, #1080]
ldr.w r9, [r1, #1084]
ldr.w r8, [r1, #1088]
ldr.w r7, [r2, #1080]
ldr.w r6, [r2, #1084]
ldr.w r5, [r2, #1088]
/*** basemul 90 ***/
/* computing z0 = x0y0 + zeta^90 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7901
mul.w r4, r4, r14
    //// bounds:  -0x867821e (-2^27.0711) <= r4  <= 0x0867821e (+2^27.0711)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12429bb7 (-2^28.1906) <= r4  <= 0x12429bb7 (+2^28.1906)
MONTRED r4, r3
    //// bounds:  -0x0004442 (-2^14.0929) <= r4  <= 0x00004443 (+2^14.0930)
str.w r4, [r0, #1080]
/* computing z1 = x1y0 + x0y1 + zeta^90 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x737560f (-2^26.8512) <= r4  <= 0x0737560f (+2^26.8512)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11126fa8 (-2^28.0936) <= r4  <= 0x11126fa8 (+2^28.0936)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1aed8941 (-2^28.7510) <= r4  <= 0x1aed8941 (+2^28.7510)
MONTRED r4, r3
    //// bounds:  -0x0004ced (-2^14.2654) <= r4  <= 0x00004cee (+2^14.2655)
str.w r4, [r0, #1084]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1088]
ldr.w r10, [r1, #1092]
ldr.w r9, [r1, #1096]
ldr.w r8, [r1, #1100]
ldr.w r7, [r2, #1092]
ldr.w r6, [r2, #1096]
ldr.w r5, [r2, #1100]
/*** basemul 91 ***/
/* computing z0 = x0y0 + zeta^91 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7901
mul.w r4, r4, r14
    //// bounds:  -0x867821e (-2^27.0711) <= r4  <= 0x0867821e (+2^27.0711)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12429bb7 (-2^28.1906) <= r4  <= 0x12429bb7 (+2^28.1906)
MONTRED r4, r3
    //// bounds:  -0x0004442 (-2^14.0929) <= r4  <= 0x00004443 (+2^14.0930)
str.w r4, [r0, #1092]
/* computing z1 = x1y0 + x0y1 + zeta^91 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x737560f (-2^26.8512) <= r4  <= 0x0737560f (+2^26.8512)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11126fa8 (-2^28.0936) <= r4  <= 0x11126fa8 (+2^28.0936)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1aed8941 (-2^28.7510) <= r4  <= 0x1aed8941 (+2^28.7510)
MONTRED r4, r3
    //// bounds:  -0x0004ced (-2^14.2654) <= r4  <= 0x00004cee (+2^14.2655)
str.w r4, [r0, #1096]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1100]
ldr.w r10, [r1, #1104]
ldr.w r9, [r1, #1108]
ldr.w r8, [r1, #1112]
ldr.w r7, [r2, #1104]
ldr.w r6, [r2, #1108]
ldr.w r5, [r2, #1112]
/*** basemul 92 ***/
/* computing z0 = x0y0 + zeta^92 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10750
mul.w r4, r4, r14
    //// bounds:  -0xb6f5094 (-2^27.5154) <= r4  <= 0x0b6f5094 (+2^27.5154)
mla.w r4, r10, r7, r4
    //// bounds:  -0x154a6a2d (-2^28.4122) <= r4  <= 0x154a6a2d (+2^28.4122)
MONTRED r4, r3
    //// bounds:  -0x000474a (-2^14.1556) <= r4  <= 0x0000474a (+2^14.1556)
str.w r4, [r0, #1104]
/* computing z1 = x1y0 + x0y1 + zeta^92 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x9d1764a (-2^27.2955) <= r4  <= 0x09d1764a (+2^27.2955)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13ac8fe3 (-2^28.2982) <= r4  <= 0x13ac8fe3 (+2^28.2982)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d87a97c (-2^28.8841) <= r4  <= 0x1d87a97c (+2^28.8841)
MONTRED r4, r3
    //// bounds:  -0x0004f87 (-2^14.3134) <= r4  <= 0x00004f88 (+2^14.3134)
str.w r4, [r0, #1108]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1112]
ldr.w r10, [r1, #1116]
ldr.w r9, [r1, #1120]
ldr.w r8, [r1, #1124]
ldr.w r7, [r2, #1116]
ldr.w r6, [r2, #1120]
ldr.w r5, [r2, #1124]
/*** basemul 93 ***/
/* computing z0 = x0y0 + zeta^93 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10750
mul.w r4, r4, r14
    //// bounds:  -0xb6f5094 (-2^27.5154) <= r4  <= 0x0b6f5094 (+2^27.5154)
mla.w r4, r10, r7, r4
    //// bounds:  -0x154a6a2d (-2^28.4122) <= r4  <= 0x154a6a2d (+2^28.4122)
MONTRED r4, r3
    //// bounds:  -0x000474a (-2^14.1556) <= r4  <= 0x0000474a (+2^14.1556)
str.w r4, [r0, #1116]
/* computing z1 = x1y0 + x0y1 + zeta^93 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x9d1764a (-2^27.2955) <= r4  <= 0x09d1764a (+2^27.2955)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13ac8fe3 (-2^28.2982) <= r4  <= 0x13ac8fe3 (+2^28.2982)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d87a97c (-2^28.8841) <= r4  <= 0x1d87a97c (+2^28.8841)
MONTRED r4, r3
    //// bounds:  -0x0004f87 (-2^14.3134) <= r4  <= 0x00004f88 (+2^14.3134)
str.w r4, [r0, #1120]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1124]
ldr.w r10, [r1, #1128]
ldr.w r9, [r1, #1132]
ldr.w r8, [r1, #1136]
ldr.w r7, [r2, #1128]
ldr.w r6, [r2, #1132]
ldr.w r5, [r2, #1136]
/*** basemul 94 ***/
/* computing z0 = x0y0 + zeta^94 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4733
mul.w r4, r4, r14
    //// bounds:  -0x508d5de (-2^26.3319) <= r4  <= 0x0508d5de (+2^26.3319)
mla.w r4, r10, r7, r4
    //// bounds:  -0xee3ef77 (-2^27.8963) <= r4  <= 0x0ee3ef77 (+2^27.8963)
MONTRED r4, r3
    //// bounds:  -0x00040e4 (-2^14.0199) <= r4  <= 0x000040e4 (+2^14.0199)
str.w r4, [r0, #1128]
/* computing z1 = x1y0 + x0y1 + zeta^94 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4529fef (-2^26.1120) <= r4  <= 0x04529fef (+2^26.1120)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe2db988 (-2^27.8256) <= r4  <= 0x0e2db988 (+2^27.8256)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1808d321 (-2^28.5870) <= r4  <= 0x1808d321 (+2^28.5870)
MONTRED r4, r3
    //// bounds:  -0x0004a08 (-2^14.2101) <= r4  <= 0x00004a09 (+2^14.2101)
str.w r4, [r0, #1132]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1136]
ldr.w r10, [r1, #1140]
ldr.w r9, [r1, #1144]
ldr.w r8, [r1, #1148]
ldr.w r7, [r2, #1140]
ldr.w r6, [r2, #1144]
ldr.w r5, [r2, #1148]
/*** basemul 95 ***/
/* computing z0 = x0y0 + zeta^95 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4733
mul.w r4, r4, r14
    //// bounds:  -0x508d5de (-2^26.3319) <= r4  <= 0x0508d5de (+2^26.3319)
mla.w r4, r10, r7, r4
    //// bounds:  -0xee3ef77 (-2^27.8963) <= r4  <= 0x0ee3ef77 (+2^27.8963)
MONTRED r4, r3
    //// bounds:  -0x00040e4 (-2^14.0199) <= r4  <= 0x000040e4 (+2^14.0199)
str.w r4, [r0, #1140]
/* computing z1 = x1y0 + x0y1 + zeta^95 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4529fef (-2^26.1120) <= r4  <= 0x04529fef (+2^26.1120)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe2db988 (-2^27.8256) <= r4  <= 0x0e2db988 (+2^27.8256)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1808d321 (-2^28.5870) <= r4  <= 0x1808d321 (+2^28.5870)
MONTRED r4, r3
    //// bounds:  -0x0004a08 (-2^14.2101) <= r4  <= 0x00004a09 (+2^14.2101)
str.w r4, [r0, #1144]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1148]
ldr.w r10, [r1, #1152]
ldr.w r9, [r1, #1156]
ldr.w r8, [r1, #1160]
ldr.w r7, [r2, #1152]
ldr.w r6, [r2, #1156]
ldr.w r5, [r2, #1160]
/*** basemul 96 ***/
/* computing z0 = x0y0 + zeta^96 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-9257
mul.w r4, r4, r14
    //// bounds:  -0x9d8c226 (-2^27.2996) <= r4  <= 0x09d8c226 (+2^27.2996)
mla.w r4, r10, r7, r4
    //// bounds:  -0x13b3dbbf (-2^28.3003) <= r4  <= 0x13b3dbbf (+2^28.3003)
MONTRED r4, r3
    //// bounds:  -0x00045b3 (-2^14.1231) <= r4  <= 0x000045b4 (+2^14.1232)
str.w r4, [r0, #1152]
/* computing z1 = x1y0 + x0y1 + zeta^96 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8746213 (-2^27.0797) <= r4  <= 0x08746213 (+2^27.0797)
mla.w r4, r9, r7, r4
    //// bounds:  -0x124f7bac (-2^28.1946) <= r4  <= 0x124f7bac (+2^28.1946)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c2a9545 (-2^28.8159) <= r4  <= 0x1c2a9545 (+2^28.8159)
MONTRED r4, r3
    //// bounds:  -0x0004e2a (-2^14.2884) <= r4  <= 0x00004e2b (+2^14.2885)
str.w r4, [r0, #1156]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1160]
ldr.w r10, [r1, #1164]
ldr.w r9, [r1, #1168]
ldr.w r8, [r1, #1172]
ldr.w r7, [r2, #1164]
ldr.w r6, [r2, #1168]
ldr.w r5, [r2, #1172]
/*** basemul 97 ***/
/* computing z0 = x0y0 + zeta^97 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =9257
mul.w r4, r4, r14
    //// bounds:  -0x9d8c226 (-2^27.2996) <= r4  <= 0x09d8c226 (+2^27.2996)
mla.w r4, r10, r7, r4
    //// bounds:  -0x13b3dbbf (-2^28.3003) <= r4  <= 0x13b3dbbf (+2^28.3003)
MONTRED r4, r3
    //// bounds:  -0x00045b3 (-2^14.1231) <= r4  <= 0x000045b4 (+2^14.1232)
str.w r4, [r0, #1164]
/* computing z1 = x1y0 + x0y1 + zeta^97 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8746213 (-2^27.0797) <= r4  <= 0x08746213 (+2^27.0797)
mla.w r4, r9, r7, r4
    //// bounds:  -0x124f7bac (-2^28.1946) <= r4  <= 0x124f7bac (+2^28.1946)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c2a9545 (-2^28.8159) <= r4  <= 0x1c2a9545 (+2^28.8159)
MONTRED r4, r3
    //// bounds:  -0x0004e2a (-2^14.2884) <= r4  <= 0x00004e2b (+2^14.2885)
str.w r4, [r0, #1168]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1172]
ldr.w r10, [r1, #1176]
ldr.w r9, [r1, #1180]
ldr.w r8, [r1, #1184]
ldr.w r7, [r2, #1176]
ldr.w r6, [r2, #1180]
ldr.w r5, [r2, #1184]
/*** basemul 98 ***/
/* computing z0 = x0y0 + zeta^98 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =3738
mul.w r4, r4, r14
    //// bounds:  -0x3f9e37c (-2^25.9914) <= r4  <= 0x03f9e37c (+2^25.9914)
mla.w r4, r10, r7, r4
    //// bounds:  -0xdd4fd15 (-2^27.7899) <= r4  <= 0x0dd4fd15 (+2^27.7899)
MONTRED r4, r3
    //// bounds:  -0x0003fd5 (-2^13.9962) <= r4  <= 0x00003fd5 (+2^13.9962)
str.w r4, [r0, #1176]
/* computing z1 = x1y0 + x0y1 + zeta^98 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x369fbbe (-2^25.7715) <= r4  <= 0x0369fbbe (+2^25.7715)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd451557 (-2^27.7301) <= r4  <= 0x0d451557 (+2^27.7301)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17202ef0 (-2^28.5314) <= r4  <= 0x17202ef0 (+2^28.5314)
MONTRED r4, r3
    //// bounds:  -0x0004920 (-2^14.1923) <= r4  <= 0x00004920 (+2^14.1923)
str.w r4, [r0, #1180]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1184]
ldr.w r10, [r1, #1188]
ldr.w r9, [r1, #1192]
ldr.w r8, [r1, #1196]
ldr.w r7, [r2, #1188]
ldr.w r6, [r2, #1192]
ldr.w r5, [r2, #1196]
/*** basemul 99 ***/
/* computing z0 = x0y0 + zeta^99 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-3738
mul.w r4, r4, r14
    //// bounds:  -0x3f9e37c (-2^25.9914) <= r4  <= 0x03f9e37c (+2^25.9914)
mla.w r4, r10, r7, r4
    //// bounds:  -0xdd4fd15 (-2^27.7899) <= r4  <= 0x0dd4fd15 (+2^27.7899)
MONTRED r4, r3
    //// bounds:  -0x0003fd5 (-2^13.9962) <= r4  <= 0x00003fd5 (+2^13.9962)
str.w r4, [r0, #1188]
/* computing z1 = x1y0 + x0y1 + zeta^99 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x369fbbe (-2^25.7715) <= r4  <= 0x0369fbbe (+2^25.7715)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd451557 (-2^27.7301) <= r4  <= 0x0d451557 (+2^27.7301)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17202ef0 (-2^28.5314) <= r4  <= 0x17202ef0 (+2^28.5314)
MONTRED r4, r3
    //// bounds:  -0x0004920 (-2^14.1923) <= r4  <= 0x00004920 (+2^14.1923)
str.w r4, [r0, #1192]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1196]
ldr.w r10, [r1, #1200]
ldr.w r9, [r1, #1204]
ldr.w r8, [r1, #1208]
ldr.w r7, [r2, #1200]
ldr.w r6, [r2, #1204]
ldr.w r5, [r2, #1208]
/*** basemul 100 ***/
/* computing z0 = x0y0 + zeta^100 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-3572
mul.w r4, r4, r14
    //// bounds:  -0x3ccaf78 (-2^25.9258) <= r4  <= 0x03ccaf78 (+2^25.9258)
mla.w r4, r10, r7, r4
    //// bounds:  -0xda7c911 (-2^27.7714) <= r4  <= 0x0da7c911 (+2^27.7714)
MONTRED r4, r3
    //// bounds:  -0x0003fa7 (-2^13.9921) <= r4  <= 0x00003fa8 (+2^13.9922)
str.w r4, [r0, #1200]
/* computing z1 = x1y0 + x0y1 + zeta^100 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3432bbc (-2^25.7059) <= r4  <= 0x03432bbc (+2^25.7059)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd1e4555 (-2^27.7135) <= r4  <= 0x0d1e4555 (+2^27.7135)
mla.w r4, r10, r6, r4
    //// bounds:  -0x16f95eee (-2^28.5219) <= r4  <= 0x16f95eee (+2^28.5219)
MONTRED r4, r3
    //// bounds:  -0x00048f9 (-2^14.1893) <= r4  <= 0x000048f9 (+2^14.1893)
str.w r4, [r0, #1204]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1208]
ldr.w r10, [r1, #1212]
ldr.w r9, [r1, #1216]
ldr.w r8, [r1, #1220]
ldr.w r7, [r2, #1212]
ldr.w r6, [r2, #1216]
ldr.w r5, [r2, #1220]
/*** basemul 101 ***/
/* computing z0 = x0y0 + zeta^101 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =3572
mul.w r4, r4, r14
    //// bounds:  -0x3ccaf78 (-2^25.9258) <= r4  <= 0x03ccaf78 (+2^25.9258)
mla.w r4, r10, r7, r4
    //// bounds:  -0xda7c911 (-2^27.7714) <= r4  <= 0x0da7c911 (+2^27.7714)
MONTRED r4, r3
    //// bounds:  -0x0003fa7 (-2^13.9921) <= r4  <= 0x00003fa8 (+2^13.9922)
str.w r4, [r0, #1212]
/* computing z1 = x1y0 + x0y1 + zeta^101 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3432bbc (-2^25.7059) <= r4  <= 0x03432bbc (+2^25.7059)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd1e4555 (-2^27.7135) <= r4  <= 0x0d1e4555 (+2^27.7135)
mla.w r4, r10, r6, r4
    //// bounds:  -0x16f95eee (-2^28.5219) <= r4  <= 0x16f95eee (+2^28.5219)
MONTRED r4, r3
    //// bounds:  -0x00048f9 (-2^14.1893) <= r4  <= 0x000048f9 (+2^14.1893)
str.w r4, [r0, #1216]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1220]
ldr.w r10, [r1, #1224]
ldr.w r9, [r1, #1228]
ldr.w r8, [r1, #1232]
ldr.w r7, [r2, #1224]
ldr.w r6, [r2, #1228]
ldr.w r5, [r2, #1232]
/*** basemul 102 ***/
/* computing z0 = x0y0 + zeta^102 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8298
mul.w r4, r4, r14
    //// bounds:  -0x8d39d5c (-2^27.1419) <= r4  <= 0x08d39d5c (+2^27.1419)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12aeb6f5 (-2^28.2236) <= r4  <= 0x12aeb6f5 (+2^28.2236)
MONTRED r4, r3
    //// bounds:  -0x00044ae (-2^14.1018) <= r4  <= 0x000044af (+2^14.1019)
str.w r4, [r0, #1224]
/* computing z1 = x1y0 + x0y1 + zeta^102 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x79428ae (-2^26.9220) <= r4  <= 0x079428ae (+2^26.9220)
mla.w r4, r9, r7, r4
    //// bounds:  -0x116f4247 (-2^28.1239) <= r4  <= 0x116f4247 (+2^28.1239)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b4a5be0 (-2^28.7703) <= r4  <= 0x1b4a5be0 (+2^28.7703)
MONTRED r4, r3
    //// bounds:  -0x0004d4a (-2^14.2722) <= r4  <= 0x00004d4a (+2^14.2722)
str.w r4, [r0, #1228]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1232]
ldr.w r10, [r1, #1236]
ldr.w r9, [r1, #1240]
ldr.w r8, [r1, #1244]
ldr.w r7, [r2, #1236]
ldr.w r6, [r2, #1240]
ldr.w r5, [r2, #1244]
/*** basemul 103 ***/
/* computing z0 = x0y0 + zeta^103 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8298
mul.w r4, r4, r14
    //// bounds:  -0x8d39d5c (-2^27.1419) <= r4  <= 0x08d39d5c (+2^27.1419)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12aeb6f5 (-2^28.2236) <= r4  <= 0x12aeb6f5 (+2^28.2236)
MONTRED r4, r3
    //// bounds:  -0x00044ae (-2^14.1018) <= r4  <= 0x000044af (+2^14.1019)
str.w r4, [r0, #1236]
/* computing z1 = x1y0 + x0y1 + zeta^103 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x79428ae (-2^26.9220) <= r4  <= 0x079428ae (+2^26.9220)
mla.w r4, r9, r7, r4
    //// bounds:  -0x116f4247 (-2^28.1239) <= r4  <= 0x116f4247 (+2^28.1239)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b4a5be0 (-2^28.7703) <= r4  <= 0x1b4a5be0 (+2^28.7703)
MONTRED r4, r3
    //// bounds:  -0x0004d4a (-2^14.2722) <= r4  <= 0x00004d4a (+2^14.2722)
str.w r4, [r0, #1240]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1244]
ldr.w r10, [r1, #1248]
ldr.w r9, [r1, #1252]
ldr.w r8, [r1, #1256]
ldr.w r7, [r2, #1248]
ldr.w r6, [r2, #1252]
ldr.w r5, [r2, #1256]
/*** basemul 104 ***/
/* computing z0 = x0y0 + zeta^104 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =2563
mul.w r4, r4, r14
    //// bounds:  -0x2b9ed22 (-2^25.4469) <= r4  <= 0x02b9ed22 (+2^25.4469)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc9506bb (-2^27.6533) <= r4  <= 0x0c9506bb (+2^27.6533)
MONTRED r4, r3
    //// bounds:  -0x0003e95 (-2^13.9677) <= r4  <= 0x00003e95 (+2^13.9677)
str.w r4, [r0, #1248]
/* computing z1 = x1y0 + x0y1 + zeta^104 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x2574191 (-2^25.2270) <= r4  <= 0x02574191 (+2^25.2270)
mla.w r4, r9, r7, r4
    //// bounds:  -0xc325b2a (-2^27.6084) <= r4  <= 0x0c325b2a (+2^27.6084)
mla.w r4, r10, r6, r4
    //// bounds:  -0x160d74c3 (-2^28.4629) <= r4  <= 0x160d74c3 (+2^28.4629)
MONTRED r4, r3
    //// bounds:  -0x000480d (-2^14.1709) <= r4  <= 0x0000480d (+2^14.1709)
str.w r4, [r0, #1252]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1256]
ldr.w r10, [r1, #1260]
ldr.w r9, [r1, #1264]
ldr.w r8, [r1, #1268]
ldr.w r7, [r2, #1260]
ldr.w r6, [r2, #1264]
ldr.w r5, [r2, #1268]
/*** basemul 105 ***/
/* computing z0 = x0y0 + zeta^105 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-2563
mul.w r4, r4, r14
    //// bounds:  -0x2b9ed22 (-2^25.4469) <= r4  <= 0x02b9ed22 (+2^25.4469)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc9506bb (-2^27.6533) <= r4  <= 0x0c9506bb (+2^27.6533)
MONTRED r4, r3
    //// bounds:  -0x0003e95 (-2^13.9677) <= r4  <= 0x00003e95 (+2^13.9677)
str.w r4, [r0, #1260]
/* computing z1 = x1y0 + x0y1 + zeta^105 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x2574191 (-2^25.2270) <= r4  <= 0x02574191 (+2^25.2270)
mla.w r4, r9, r7, r4
    //// bounds:  -0xc325b2a (-2^27.6084) <= r4  <= 0x0c325b2a (+2^27.6084)
mla.w r4, r10, r6, r4
    //// bounds:  -0x160d74c3 (-2^28.4629) <= r4  <= 0x160d74c3 (+2^28.4629)
MONTRED r4, r3
    //// bounds:  -0x000480d (-2^14.1709) <= r4  <= 0x0000480d (+2^14.1709)
str.w r4, [r0, #1264]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1268]
ldr.w r10, [r1, #1272]
ldr.w r9, [r1, #1276]
ldr.w r8, [r1, #1280]
ldr.w r7, [r2, #1272]
ldr.w r6, [r2, #1276]
ldr.w r5, [r2, #1280]
/*** basemul 106 ***/
/* computing z0 = x0y0 + zeta^106 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =464
mul.w r4, r4, r14
    //// bounds:  -0x07e59e0 (-2^22.9813) <= r4  <= 0x007e59e0 (+2^22.9813)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa597379 (-2^27.3715) <= r4  <= 0x0a597379 (+2^27.3715)
MONTRED r4, r3
    //// bounds:  -0x0003c59 (-2^13.9152) <= r4  <= 0x00003c59 (+2^13.9152)
str.w r4, [r0, #1272]
/* computing z1 = x1y0 + x0y1 + zeta^106 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x06c7cf0 (-2^22.7614) <= r4  <= 0x006c7cf0 (+2^22.7614)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa479689 (-2^27.3617) <= r4  <= 0x0a479689 (+2^27.3617)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1422b022 (-2^28.3317) <= r4  <= 0x1422b022 (+2^28.3317)
MONTRED r4, r3
    //// bounds:  -0x0004622 (-2^14.1320) <= r4  <= 0x00004623 (+2^14.1321)
str.w r4, [r0, #1276]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1280]
ldr.w r10, [r1, #1284]
ldr.w r9, [r1, #1288]
ldr.w r8, [r1, #1292]
ldr.w r7, [r2, #1284]
ldr.w r6, [r2, #1288]
ldr.w r5, [r2, #1292]
/*** basemul 107 ***/
/* computing z0 = x0y0 + zeta^107 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-464
mul.w r4, r4, r14
    //// bounds:  -0x07e59e0 (-2^22.9813) <= r4  <= 0x007e59e0 (+2^22.9813)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa597379 (-2^27.3715) <= r4  <= 0x0a597379 (+2^27.3715)
MONTRED r4, r3
    //// bounds:  -0x0003c59 (-2^13.9152) <= r4  <= 0x00003c59 (+2^13.9152)
str.w r4, [r0, #1284]
/* computing z1 = x1y0 + x0y1 + zeta^107 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x06c7cf0 (-2^22.7614) <= r4  <= 0x006c7cf0 (+2^22.7614)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa479689 (-2^27.3617) <= r4  <= 0x0a479689 (+2^27.3617)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1422b022 (-2^28.3317) <= r4  <= 0x1422b022 (+2^28.3317)
MONTRED r4, r3
    //// bounds:  -0x0004622 (-2^14.1320) <= r4  <= 0x00004623 (+2^14.1321)
str.w r4, [r0, #1288]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1292]
ldr.w r10, [r1, #1296]
ldr.w r9, [r1, #1300]
ldr.w r8, [r1, #1304]
ldr.w r7, [r2, #1296]
ldr.w r6, [r2, #1300]
ldr.w r5, [r2, #1304]
/*** basemul 108 ***/
/* computing z0 = x0y0 + zeta^108 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-1005
mul.w r4, r4, r14
    //// bounds:  -0x111ab7e (-2^24.0963) <= r4  <= 0x0111ab7e (+2^24.0963)
mla.w r4, r10, r7, r4
    //// bounds:  -0xaecc517 (-2^27.4495) <= r4  <= 0x0aecc517 (+2^27.4495)
MONTRED r4, r3
    //// bounds:  -0x0003cec (-2^13.9289) <= r4  <= 0x00003ced (+2^13.9290)
str.w r4, [r0, #1296]
/* computing z1 = x1y0 + x0y1 + zeta^108 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0eafabf (-2^23.8764) <= r4  <= 0x00eafabf (+2^23.8764)
mla.w r4, r9, r7, r4
    //// bounds:  -0xac61458 (-2^27.4294) <= r4  <= 0x0ac61458 (+2^27.4294)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14a12df1 (-2^28.3666) <= r4  <= 0x14a12df1 (+2^28.3666)
MONTRED r4, r3
    //// bounds:  -0x00046a1 (-2^14.1422) <= r4  <= 0x000046a1 (+2^14.1422)
str.w r4, [r0, #1300]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1304]
ldr.w r10, [r1, #1308]
ldr.w r9, [r1, #1312]
ldr.w r8, [r1, #1316]
ldr.w r7, [r2, #1308]
ldr.w r6, [r2, #1312]
ldr.w r5, [r2, #1316]
/*** basemul 109 ***/
/* computing z0 = x0y0 + zeta^109 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =1005
mul.w r4, r4, r14
    //// bounds:  -0x111ab7e (-2^24.0963) <= r4  <= 0x0111ab7e (+2^24.0963)
mla.w r4, r10, r7, r4
    //// bounds:  -0xaecc517 (-2^27.4495) <= r4  <= 0x0aecc517 (+2^27.4495)
MONTRED r4, r3
    //// bounds:  -0x0003cec (-2^13.9289) <= r4  <= 0x00003ced (+2^13.9290)
str.w r4, [r0, #1308]
/* computing z1 = x1y0 + x0y1 + zeta^109 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0eafabf (-2^23.8764) <= r4  <= 0x00eafabf (+2^23.8764)
mla.w r4, r9, r7, r4
    //// bounds:  -0xac61458 (-2^27.4294) <= r4  <= 0x0ac61458 (+2^27.4294)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14a12df1 (-2^28.3666) <= r4  <= 0x14a12df1 (+2^28.3666)
MONTRED r4, r3
    //// bounds:  -0x00046a1 (-2^14.1422) <= r4  <= 0x000046a1 (+2^14.1422)
str.w r4, [r0, #1312]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1316]
ldr.w r10, [r1, #1320]
ldr.w r9, [r1, #1324]
ldr.w r8, [r1, #1328]
ldr.w r7, [r2, #1320]
ldr.w r6, [r2, #1324]
ldr.w r5, [r2, #1328]
/*** basemul 110 ***/
/* computing z0 = x0y0 + zeta^110 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7194
mul.w r4, r4, r14
    //// bounds:  -0x7a6fc7c (-2^26.9359) <= r4  <= 0x07a6fc7c (+2^26.9359)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11821615 (-2^28.1300) <= r4  <= 0x11821615 (+2^28.1300)
MONTRED r4, r3
    //// bounds:  -0x0004382 (-2^14.0770) <= r4  <= 0x00004382 (+2^14.0770)
str.w r4, [r0, #1320]
/* computing z1 = x1y0 + x0y1 + zeta^110 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x692083e (-2^26.7160) <= r4  <= 0x0692083e (+2^26.7160)
mla.w r4, r9, r7, r4
    //// bounds:  -0x106d21d7 (-2^28.0379) <= r4  <= 0x106d21d7 (+2^28.0379)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a483b70 (-2^28.7160) <= r4  <= 0x1a483b70 (+2^28.7160)
MONTRED r4, r3
    //// bounds:  -0x0004c48 (-2^14.2533) <= r4  <= 0x00004c48 (+2^14.2533)
str.w r4, [r0, #1324]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1328]
ldr.w r10, [r1, #1332]
ldr.w r9, [r1, #1336]
ldr.w r8, [r1, #1340]
ldr.w r7, [r2, #1332]
ldr.w r6, [r2, #1336]
ldr.w r5, [r2, #1340]
/*** basemul 111 ***/
/* computing z0 = x0y0 + zeta^111 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7194
mul.w r4, r4, r14
    //// bounds:  -0x7a6fc7c (-2^26.9359) <= r4  <= 0x07a6fc7c (+2^26.9359)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11821615 (-2^28.1300) <= r4  <= 0x11821615 (+2^28.1300)
MONTRED r4, r3
    //// bounds:  -0x0004382 (-2^14.0770) <= r4  <= 0x00004382 (+2^14.0770)
str.w r4, [r0, #1332]
/* computing z1 = x1y0 + x0y1 + zeta^111 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x692083e (-2^26.7160) <= r4  <= 0x0692083e (+2^26.7160)
mla.w r4, r9, r7, r4
    //// bounds:  -0x106d21d7 (-2^28.0379) <= r4  <= 0x106d21d7 (+2^28.0379)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a483b70 (-2^28.7160) <= r4  <= 0x1a483b70 (+2^28.7160)
MONTRED r4, r3
    //// bounds:  -0x0004c48 (-2^14.2533) <= r4  <= 0x00004c48 (+2^14.2533)
str.w r4, [r0, #1336]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1340]
ldr.w r10, [r1, #1344]
ldr.w r9, [r1, #1348]
ldr.w r8, [r1, #1352]
ldr.w r7, [r2, #1344]
ldr.w r6, [r2, #1348]
ldr.w r5, [r2, #1352]
/*** basemul 112 ***/
/* computing z0 = x0y0 + zeta^112 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =3221
mul.w r4, r4, r14
    //// bounds:  -0x36d1aee (-2^25.7766) <= r4  <= 0x036d1aee (+2^25.7766)
mla.w r4, r10, r7, r4
    //// bounds:  -0xd483487 (-2^27.7314) <= r4  <= 0x0d483487 (+2^27.7314)
MONTRED r4, r3
    //// bounds:  -0x0003f48 (-2^13.9837) <= r4  <= 0x00003f48 (+2^13.9837)
str.w r4, [r0, #1344]
/* computing z1 = x1y0 + x0y1 + zeta^112 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x2f11a77 (-2^25.5567) <= r4  <= 0x02f11a77 (+2^25.5567)
mla.w r4, r9, r7, r4
    //// bounds:  -0xccc3410 (-2^27.6778) <= r4  <= 0x0ccc3410 (+2^27.6778)
mla.w r4, r10, r6, r4
    //// bounds:  -0x16a74da9 (-2^28.5017) <= r4  <= 0x16a74da9 (+2^28.5017)
MONTRED r4, r3
    //// bounds:  -0x00048a7 (-2^14.1829) <= r4  <= 0x000048a7 (+2^14.1829)
str.w r4, [r0, #1348]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1352]
ldr.w r10, [r1, #1356]
ldr.w r9, [r1, #1360]
ldr.w r8, [r1, #1364]
ldr.w r7, [r2, #1356]
ldr.w r6, [r2, #1360]
ldr.w r5, [r2, #1364]
/*** basemul 113 ***/
/* computing z0 = x0y0 + zeta^113 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-3221
mul.w r4, r4, r14
    //// bounds:  -0x36d1aee (-2^25.7766) <= r4  <= 0x036d1aee (+2^25.7766)
mla.w r4, r10, r7, r4
    //// bounds:  -0xd483487 (-2^27.7314) <= r4  <= 0x0d483487 (+2^27.7314)
MONTRED r4, r3
    //// bounds:  -0x0003f48 (-2^13.9837) <= r4  <= 0x00003f48 (+2^13.9837)
str.w r4, [r0, #1356]
/* computing z1 = x1y0 + x0y1 + zeta^113 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x2f11a77 (-2^25.5567) <= r4  <= 0x02f11a77 (+2^25.5567)
mla.w r4, r9, r7, r4
    //// bounds:  -0xccc3410 (-2^27.6778) <= r4  <= 0x0ccc3410 (+2^27.6778)
mla.w r4, r10, r6, r4
    //// bounds:  -0x16a74da9 (-2^28.5017) <= r4  <= 0x16a74da9 (+2^28.5017)
MONTRED r4, r3
    //// bounds:  -0x00048a7 (-2^14.1829) <= r4  <= 0x000048a7 (+2^14.1829)
str.w r4, [r0, #1360]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1364]
ldr.w r10, [r1, #1368]
ldr.w r9, [r1, #1372]
ldr.w r8, [r1, #1376]
ldr.w r7, [r2, #1368]
ldr.w r6, [r2, #1372]
ldr.w r5, [r2, #1376]
/*** basemul 114 ***/
/* computing z0 = x0y0 + zeta^114 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =3340
mul.w r4, r4, r14
    //// bounds:  -0x38d8288 (-2^25.8289) <= r4  <= 0x038d8288 (+2^25.8289)
mla.w r4, r10, r7, r4
    //// bounds:  -0xd689c21 (-2^27.7451) <= r4  <= 0x0d689c21 (+2^27.7451)
MONTRED r4, r3
    //// bounds:  -0x0003f68 (-2^13.9866) <= r4  <= 0x00003f69 (+2^13.9866)
str.w r4, [r0, #1368]
/* computing z1 = x1y0 + x0y1 + zeta^114 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x30ced44 (-2^25.6090) <= r4  <= 0x030ced44 (+2^25.6090)
mla.w r4, r9, r7, r4
    //// bounds:  -0xce806dd (-2^27.6900) <= r4  <= 0x0ce806dd (+2^27.6900)
mla.w r4, r10, r6, r4
    //// bounds:  -0x16c32076 (-2^28.5086) <= r4  <= 0x16c32076 (+2^28.5086)
MONTRED r4, r3
    //// bounds:  -0x00048c3 (-2^14.1851) <= r4  <= 0x000048c3 (+2^14.1851)
str.w r4, [r0, #1372]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1376]
ldr.w r10, [r1, #1380]
ldr.w r9, [r1, #1384]
ldr.w r8, [r1, #1388]
ldr.w r7, [r2, #1380]
ldr.w r6, [r2, #1384]
ldr.w r5, [r2, #1388]
/*** basemul 115 ***/
/* computing z0 = x0y0 + zeta^115 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-3340
mul.w r4, r4, r14
    //// bounds:  -0x38d8288 (-2^25.8289) <= r4  <= 0x038d8288 (+2^25.8289)
mla.w r4, r10, r7, r4
    //// bounds:  -0xd689c21 (-2^27.7451) <= r4  <= 0x0d689c21 (+2^27.7451)
MONTRED r4, r3
    //// bounds:  -0x0003f68 (-2^13.9866) <= r4  <= 0x00003f69 (+2^13.9866)
str.w r4, [r0, #1380]
/* computing z1 = x1y0 + x0y1 + zeta^115 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x30ced44 (-2^25.6090) <= r4  <= 0x030ced44 (+2^25.6090)
mla.w r4, r9, r7, r4
    //// bounds:  -0xce806dd (-2^27.6900) <= r4  <= 0x0ce806dd (+2^27.6900)
mla.w r4, r10, r6, r4
    //// bounds:  -0x16c32076 (-2^28.5086) <= r4  <= 0x16c32076 (+2^28.5086)
MONTRED r4, r3
    //// bounds:  -0x00048c3 (-2^14.1851) <= r4  <= 0x000048c3 (+2^14.1851)
str.w r4, [r0, #1384]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1388]
ldr.w r10, [r1, #1392]
ldr.w r9, [r1, #1396]
ldr.w r8, [r1, #1400]
ldr.w r7, [r2, #1392]
ldr.w r6, [r2, #1396]
ldr.w r5, [r2, #1400]
/*** basemul 116 ***/
/* computing z0 = x0y0 + zeta^116 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-3041
mul.w r4, r4, r14
    //// bounds:  -0x33c16f6 (-2^25.6936) <= r4  <= 0x033c16f6 (+2^25.6936)
mla.w r4, r10, r7, r4
    //// bounds:  -0xd17308f (-2^27.7105) <= r4  <= 0x0d17308f (+2^27.7105)
MONTRED r4, r3
    //// bounds:  -0x0003f17 (-2^13.9793) <= r4  <= 0x00003f17 (+2^13.9793)
str.w r4, [r0, #1392]
/* computing z1 = x1y0 + x0y1 + zeta^116 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x2c7047b (-2^25.4737) <= r4  <= 0x02c7047b (+2^25.4737)
mla.w r4, r9, r7, r4
    //// bounds:  -0xca21e14 (-2^27.6592) <= r4  <= 0x0ca21e14 (+2^27.6592)
mla.w r4, r10, r6, r4
    //// bounds:  -0x167d37ad (-2^28.4912) <= r4  <= 0x167d37ad (+2^28.4912)
MONTRED r4, r3
    //// bounds:  -0x000487d (-2^14.1797) <= r4  <= 0x0000487d (+2^14.1797)
str.w r4, [r0, #1396]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1400]
ldr.w r10, [r1, #1404]
ldr.w r9, [r1, #1408]
ldr.w r8, [r1, #1412]
ldr.w r7, [r2, #1404]
ldr.w r6, [r2, #1408]
ldr.w r5, [r2, #1412]
/*** basemul 117 ***/
/* computing z0 = x0y0 + zeta^117 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =3041
mul.w r4, r4, r14
    //// bounds:  -0x33c16f6 (-2^25.6936) <= r4  <= 0x033c16f6 (+2^25.6936)
mla.w r4, r10, r7, r4
    //// bounds:  -0xd17308f (-2^27.7105) <= r4  <= 0x0d17308f (+2^27.7105)
MONTRED r4, r3
    //// bounds:  -0x0003f17 (-2^13.9793) <= r4  <= 0x00003f17 (+2^13.9793)
str.w r4, [r0, #1404]
/* computing z1 = x1y0 + x0y1 + zeta^117 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x2c7047b (-2^25.4737) <= r4  <= 0x02c7047b (+2^25.4737)
mla.w r4, r9, r7, r4
    //// bounds:  -0xca21e14 (-2^27.6592) <= r4  <= 0x0ca21e14 (+2^27.6592)
mla.w r4, r10, r6, r4
    //// bounds:  -0x167d37ad (-2^28.4912) <= r4  <= 0x167d37ad (+2^28.4912)
MONTRED r4, r3
    //// bounds:  -0x000487d (-2^14.1797) <= r4  <= 0x0000487d (+2^14.1797)
str.w r4, [r0, #1408]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1412]
ldr.w r10, [r1, #1416]
ldr.w r9, [r1, #1420]
ldr.w r8, [r1, #1424]
ldr.w r7, [r2, #1416]
ldr.w r6, [r2, #1420]
ldr.w r5, [r2, #1424]
/*** basemul 118 ***/
/* computing z0 = x0y0 + zeta^118 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-141
mul.w r4, r4, r14
    //// bounds:  -0x026653e (-2^21.2629) <= r4  <= 0x0026653e (+2^21.2629)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa017ed7 (-2^27.3228) <= r4  <= 0x0a017ed7 (+2^27.3228)
MONTRED r4, r3
    //// bounds:  -0x0003c01 (-2^13.9070) <= r4  <= 0x00003c01 (+2^13.9070)
str.w r4, [r0, #1416]
/* computing z1 = x1y0 + x0y1 + zeta^118 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x020f79f (-2^21.0430) <= r4  <= 0x0020f79f (+2^21.0430)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9fc1138 (-2^27.3197) <= r4  <= 0x09fc1138 (+2^27.3197)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13d72ad1 (-2^28.3104) <= r4  <= 0x13d72ad1 (+2^28.3104)
MONTRED r4, r3
    //// bounds:  -0x00045d7 (-2^14.1260) <= r4  <= 0x000045d7 (+2^14.1260)
str.w r4, [r0, #1420]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1424]
ldr.w r10, [r1, #1428]
ldr.w r9, [r1, #1432]
ldr.w r8, [r1, #1436]
ldr.w r7, [r2, #1428]
ldr.w r6, [r2, #1432]
ldr.w r5, [r2, #1436]
/*** basemul 119 ***/
/* computing z0 = x0y0 + zeta^119 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =141
mul.w r4, r4, r14
    //// bounds:  -0x026653e (-2^21.2629) <= r4  <= 0x0026653e (+2^21.2629)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa017ed7 (-2^27.3228) <= r4  <= 0x0a017ed7 (+2^27.3228)
MONTRED r4, r3
    //// bounds:  -0x0003c01 (-2^13.9070) <= r4  <= 0x00003c01 (+2^13.9070)
str.w r4, [r0, #1428]
/* computing z1 = x1y0 + x0y1 + zeta^119 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x020f79f (-2^21.0430) <= r4  <= 0x0020f79f (+2^21.0430)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9fc1138 (-2^27.3197) <= r4  <= 0x09fc1138 (+2^27.3197)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13d72ad1 (-2^28.3104) <= r4  <= 0x13d72ad1 (+2^28.3104)
MONTRED r4, r3
    //// bounds:  -0x00045d7 (-2^14.1260) <= r4  <= 0x000045d7 (+2^14.1260)
str.w r4, [r0, #1432]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1436]
ldr.w r10, [r1, #1440]
ldr.w r9, [r1, #1444]
ldr.w r8, [r1, #1448]
ldr.w r7, [r2, #1440]
ldr.w r6, [r2, #1444]
ldr.w r5, [r2, #1448]
/*** basemul 120 ***/
/* computing z0 = x0y0 + zeta^120 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-5408
mul.w r4, r4, r14
    //// bounds:  -0x5c0a4c0 (-2^26.5242) <= r4  <= 0x05c0a4c0 (+2^26.5242)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf9bbe59 (-2^27.9642) <= r4  <= 0x0f9bbe59 (+2^27.9642)
MONTRED r4, r3
    //// bounds:  -0x000419b (-2^14.0357) <= r4  <= 0x0000419c (+2^14.0358)
str.w r4, [r0, #1440]
/* computing z1 = x1y0 + x0y1 + zeta^120 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4f07260 (-2^26.3043) <= r4  <= 0x04f07260 (+2^26.3043)
mla.w r4, r9, r7, r4
    //// bounds:  -0xecb8bf9 (-2^27.8870) <= r4  <= 0x0ecb8bf9 (+2^27.8870)
mla.w r4, r10, r6, r4
    //// bounds:  -0x18a6a592 (-2^28.6236) <= r4  <= 0x18a6a592 (+2^28.6236)
MONTRED r4, r3
    //// bounds:  -0x0004aa6 (-2^14.2220) <= r4  <= 0x00004aa7 (+2^14.2221)
str.w r4, [r0, #1444]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1448]
ldr.w r10, [r1, #1452]
ldr.w r9, [r1, #1456]
ldr.w r8, [r1, #1460]
ldr.w r7, [r2, #1452]
ldr.w r6, [r2, #1456]
ldr.w r5, [r2, #1460]
/*** basemul 121 ***/
/* computing z0 = x0y0 + zeta^121 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =5408
mul.w r4, r4, r14
    //// bounds:  -0x5c0a4c0 (-2^26.5242) <= r4  <= 0x05c0a4c0 (+2^26.5242)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf9bbe59 (-2^27.9642) <= r4  <= 0x0f9bbe59 (+2^27.9642)
MONTRED r4, r3
    //// bounds:  -0x000419b (-2^14.0357) <= r4  <= 0x0000419c (+2^14.0358)
str.w r4, [r0, #1452]
/* computing z1 = x1y0 + x0y1 + zeta^121 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4f07260 (-2^26.3043) <= r4  <= 0x04f07260 (+2^26.3043)
mla.w r4, r9, r7, r4
    //// bounds:  -0xecb8bf9 (-2^27.8870) <= r4  <= 0x0ecb8bf9 (+2^27.8870)
mla.w r4, r10, r6, r4
    //// bounds:  -0x18a6a592 (-2^28.6236) <= r4  <= 0x18a6a592 (+2^28.6236)
MONTRED r4, r3
    //// bounds:  -0x0004aa6 (-2^14.2220) <= r4  <= 0x00004aa7 (+2^14.2221)
str.w r4, [r0, #1456]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1460]
ldr.w r10, [r1, #1464]
ldr.w r9, [r1, #1468]
ldr.w r8, [r1, #1472]
ldr.w r7, [r2, #1464]
ldr.w r6, [r2, #1468]
ldr.w r5, [r2, #1472]
/*** basemul 122 ***/
/* computing z0 = x0y0 + zeta^122 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =5154
mul.w r4, r4, r14
    //// bounds:  -0x57b7a2c (-2^26.4548) <= r4  <= 0x057b7a2c (+2^26.4548)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf5693c5 (-2^27.9391) <= r4  <= 0x0f5693c5 (+2^27.9391)
MONTRED r4, r3
    //// bounds:  -0x0004156 (-2^14.0298) <= r4  <= 0x00004157 (+2^14.0299)
str.w r4, [r0, #1464]
/* computing z1 = x1y0 + x0y1 + zeta^122 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4b50f16 (-2^26.2349) <= r4  <= 0x04b50f16 (+2^26.2349)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe9028af (-2^27.8642) <= r4  <= 0x0e9028af (+2^27.8642)
mla.w r4, r10, r6, r4
    //// bounds:  -0x186b4248 (-2^28.6099) <= r4  <= 0x186b4248 (+2^28.6099)
MONTRED r4, r3
    //// bounds:  -0x0004a6b (-2^14.2176) <= r4  <= 0x00004a6b (+2^14.2176)
str.w r4, [r0, #1468]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1472]
ldr.w r10, [r1, #1476]
ldr.w r9, [r1, #1480]
ldr.w r8, [r1, #1484]
ldr.w r7, [r2, #1476]
ldr.w r6, [r2, #1480]
ldr.w r5, [r2, #1484]
/*** basemul 123 ***/
/* computing z0 = x0y0 + zeta^123 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-5154
mul.w r4, r4, r14
    //// bounds:  -0x57b7a2c (-2^26.4548) <= r4  <= 0x057b7a2c (+2^26.4548)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf5693c5 (-2^27.9391) <= r4  <= 0x0f5693c5 (+2^27.9391)
MONTRED r4, r3
    //// bounds:  -0x0004156 (-2^14.0298) <= r4  <= 0x00004157 (+2^14.0299)
str.w r4, [r0, #1476]
/* computing z1 = x1y0 + x0y1 + zeta^123 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4b50f16 (-2^26.2349) <= r4  <= 0x04b50f16 (+2^26.2349)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe9028af (-2^27.8642) <= r4  <= 0x0e9028af (+2^27.8642)
mla.w r4, r10, r6, r4
    //// bounds:  -0x186b4248 (-2^28.6099) <= r4  <= 0x186b4248 (+2^28.6099)
MONTRED r4, r3
    //// bounds:  -0x0004a6b (-2^14.2176) <= r4  <= 0x00004a6b (+2^14.2176)
str.w r4, [r0, #1480]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1484]
ldr.w r10, [r1, #1488]
ldr.w r9, [r1, #1492]
ldr.w r8, [r1, #1496]
ldr.w r7, [r2, #1488]
ldr.w r6, [r2, #1492]
ldr.w r5, [r2, #1496]
/*** basemul 124 ***/
/* computing z0 = x0y0 + zeta^124 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4432
mul.w r4, r4, r14
    //// bounds:  -0x4b6dee0 (-2^26.2371) <= r4  <= 0x04b6dee0 (+2^26.2371)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe91f879 (-2^27.8649) <= r4  <= 0x0e91f879 (+2^27.8649)
MONTRED r4, r3
    //// bounds:  -0x0004092 (-2^14.0128) <= r4  <= 0x00004092 (+2^14.0128)
str.w r4, [r0, #1488]
b.w 1f
.ltorg /* constant pool */
1:
/* computing z1 = x1y0 + x0y1 + zeta^124 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x40c3f70 (-2^26.0172) <= r4  <= 0x040c3f70 (+2^26.0172)
mla.w r4, r9, r7, r4
    //// bounds:  -0xde75909 (-2^27.7974) <= r4  <= 0x0de75909 (+2^27.7974)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17c272a2 (-2^28.5704) <= r4  <= 0x17c272a2 (+2^28.5704)
MONTRED r4, r3
    //// bounds:  -0x00049c2 (-2^14.2047) <= r4  <= 0x000049c2 (+2^14.2047)
str.w r4, [r0, #1492]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1496]
ldr.w r10, [r1, #1500]
ldr.w r9, [r1, #1504]
ldr.w r8, [r1, #1508]
ldr.w r7, [r2, #1500]
ldr.w r6, [r2, #1504]
ldr.w r5, [r2, #1508]
/*** basemul 125 ***/
/* computing z0 = x0y0 + zeta^125 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4432
mul.w r4, r4, r14
    //// bounds:  -0x4b6dee0 (-2^26.2371) <= r4  <= 0x04b6dee0 (+2^26.2371)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe91f879 (-2^27.8649) <= r4  <= 0x0e91f879 (+2^27.8649)
MONTRED r4, r3
    //// bounds:  -0x0004092 (-2^14.0128) <= r4  <= 0x00004092 (+2^14.0128)
str.w r4, [r0, #1500]
/* computing z1 = x1y0 + x0y1 + zeta^125 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x40c3f70 (-2^26.0172) <= r4  <= 0x040c3f70 (+2^26.0172)
mla.w r4, r9, r7, r4
    //// bounds:  -0xde75909 (-2^27.7974) <= r4  <= 0x0de75909 (+2^27.7974)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17c272a2 (-2^28.5704) <= r4  <= 0x17c272a2 (+2^28.5704)
MONTRED r4, r3
    //// bounds:  -0x00049c2 (-2^14.2047) <= r4  <= 0x000049c2 (+2^14.2047)
str.w r4, [r0, #1504]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1508]
ldr.w r10, [r1, #1512]
ldr.w r9, [r1, #1516]
ldr.w r8, [r1, #1520]
ldr.w r7, [r2, #1512]
ldr.w r6, [r2, #1516]
ldr.w r5, [r2, #1520]
/*** basemul 126 ***/
/* computing z0 = x0y0 + zeta^126 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7708
mul.w r4, r4, r14
    //// bounds:  -0x832f3e8 (-2^27.0355) <= r4  <= 0x0832f3e8 (+2^27.0355)
mla.w r4, r10, r7, r4
    //// bounds:  -0x120e0d81 (-2^28.1743) <= r4  <= 0x120e0d81 (+2^28.1743)
MONTRED r4, r3
    //// bounds:  -0x000440e (-2^14.0886) <= r4  <= 0x0000440e (+2^14.0886)
str.w r4, [r0, #1512]
/* computing z1 = x1y0 + x0y1 + zeta^126 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x70a35f4 (-2^26.8156) <= r4  <= 0x070a35f4 (+2^26.8156)
mla.w r4, r9, r7, r4
    //// bounds:  -0x10e54f8d (-2^28.0786) <= r4  <= 0x10e54f8d (+2^28.0786)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ac06926 (-2^28.7416) <= r4  <= 0x1ac06926 (+2^28.7416)
MONTRED r4, r3
    //// bounds:  -0x0004cc0 (-2^14.2621) <= r4  <= 0x00004cc0 (+2^14.2621)
str.w r4, [r0, #1516]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1520]
ldr.w r10, [r1, #1524]
ldr.w r9, [r1, #1528]
ldr.w r8, [r1, #1532]
ldr.w r7, [r2, #1524]
ldr.w r6, [r2, #1528]
ldr.w r5, [r2, #1532]
/*** basemul 127 ***/
/* computing z0 = x0y0 + zeta^127 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7708
mul.w r4, r4, r14
    //// bounds:  -0x832f3e8 (-2^27.0355) <= r4  <= 0x0832f3e8 (+2^27.0355)
mla.w r4, r10, r7, r4
    //// bounds:  -0x120e0d81 (-2^28.1743) <= r4  <= 0x120e0d81 (+2^28.1743)
MONTRED r4, r3
    //// bounds:  -0x000440e (-2^14.0886) <= r4  <= 0x0000440e (+2^14.0886)
str.w r4, [r0, #1524]
/* computing z1 = x1y0 + x0y1 + zeta^127 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x70a35f4 (-2^26.8156) <= r4  <= 0x070a35f4 (+2^26.8156)
mla.w r4, r9, r7, r4
    //// bounds:  -0x10e54f8d (-2^28.0786) <= r4  <= 0x10e54f8d (+2^28.0786)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ac06926 (-2^28.7416) <= r4  <= 0x1ac06926 (+2^28.7416)
MONTRED r4, r3
    //// bounds:  -0x0004cc0 (-2^14.2621) <= r4  <= 0x00004cc0 (+2^14.2621)
str.w r4, [r0, #1528]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1532]
ldr.w r10, [r1, #1536]
ldr.w r9, [r1, #1540]
ldr.w r8, [r1, #1544]
ldr.w r7, [r2, #1536]
ldr.w r6, [r2, #1540]
ldr.w r5, [r2, #1544]
/*** basemul 128 ***/
/* computing z0 = x0y0 + zeta^128 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =11692
mul.w r4, r4, r14
    //// bounds:  -0xc6fd448 (-2^27.6365) <= r4  <= 0x0c6fd448 (+2^27.6365)
mla.w r4, r10, r7, r4
    //// bounds:  -0x164aede1 (-2^28.4785) <= r4  <= 0x164aede1 (+2^28.4785)
MONTRED r4, r3
    //// bounds:  -0x000484b (-2^14.1758) <= r4  <= 0x0000484b (+2^14.1758)
str.w r4, [r0, #1536]
/* computing z1 = x1y0 + x0y1 + zeta^128 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xaadb624 (-2^27.4166) <= r4  <= 0x0aadb624 (+2^27.4166)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1488cfbd (-2^28.3600) <= r4  <= 0x1488cfbd (+2^28.3600)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e63e956 (-2^28.9255) <= r4  <= 0x1e63e956 (+2^28.9255)
MONTRED r4, r3
    //// bounds:  -0x0005064 (-2^14.3290) <= r4  <= 0x00005064 (+2^14.3290)
str.w r4, [r0, #1540]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1544]
ldr.w r10, [r1, #1548]
ldr.w r9, [r1, #1552]
ldr.w r8, [r1, #1556]
ldr.w r7, [r2, #1548]
ldr.w r6, [r2, #1552]
ldr.w r5, [r2, #1556]
/*** basemul 129 ***/
/* computing z0 = x0y0 + zeta^129 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-11692
mul.w r4, r4, r14
    //// bounds:  -0xc6fd448 (-2^27.6365) <= r4  <= 0x0c6fd448 (+2^27.6365)
mla.w r4, r10, r7, r4
    //// bounds:  -0x164aede1 (-2^28.4785) <= r4  <= 0x164aede1 (+2^28.4785)
MONTRED r4, r3
    //// bounds:  -0x000484b (-2^14.1758) <= r4  <= 0x0000484b (+2^14.1758)
str.w r4, [r0, #1548]
/* computing z1 = x1y0 + x0y1 + zeta^129 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xaadb624 (-2^27.4166) <= r4  <= 0x0aadb624 (+2^27.4166)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1488cfbd (-2^28.3600) <= r4  <= 0x1488cfbd (+2^28.3600)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e63e956 (-2^28.9255) <= r4  <= 0x1e63e956 (+2^28.9255)
MONTRED r4, r3
    //// bounds:  -0x0005064 (-2^14.3290) <= r4  <= 0x00005064 (+2^14.3290)
str.w r4, [r0, #1552]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1556]
ldr.w r10, [r1, #1560]
ldr.w r9, [r1, #1564]
ldr.w r8, [r1, #1568]
ldr.w r7, [r2, #1560]
ldr.w r6, [r2, #1564]
ldr.w r5, [r2, #1568]
/*** basemul 130 ***/
/* computing z0 = x0y0 + zeta^130 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =1847
mul.w r4, r4, r14
    //// bounds:  -0x1f6f41a (-2^24.9743) <= r4  <= 0x01f6f41a (+2^24.9743)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbd20db3 (-2^27.5632) <= r4  <= 0x0bd20db3 (+2^27.5632)
MONTRED r4, r3
    //// bounds:  -0x0003dd2 (-2^13.9500) <= r4  <= 0x00003dd2 (+2^13.9500)
str.w r4, [r0, #1560]
/* computing z1 = x1y0 + x0y1 + zeta^130 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x1afd90d (-2^24.7544) <= r4  <= 0x01afd90d (+2^24.7544)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb8af2a6 (-2^27.5289) <= r4  <= 0x0b8af2a6 (+2^27.5289)
mla.w r4, r10, r6, r4
    //// bounds:  -0x15660c3f (-2^28.4194) <= r4  <= 0x15660c3f (+2^28.4194)
MONTRED r4, r3
    //// bounds:  -0x0004766 (-2^14.1578) <= r4  <= 0x00004766 (+2^14.1578)
str.w r4, [r0, #1564]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1568]
ldr.w r10, [r1, #1572]
ldr.w r9, [r1, #1576]
ldr.w r8, [r1, #1580]
ldr.w r7, [r2, #1572]
ldr.w r6, [r2, #1576]
ldr.w r5, [r2, #1580]
/*** basemul 131 ***/
/* computing z0 = x0y0 + zeta^131 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-1847
mul.w r4, r4, r14
    //// bounds:  -0x1f6f41a (-2^24.9743) <= r4  <= 0x01f6f41a (+2^24.9743)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbd20db3 (-2^27.5632) <= r4  <= 0x0bd20db3 (+2^27.5632)
MONTRED r4, r3
    //// bounds:  -0x0003dd2 (-2^13.9500) <= r4  <= 0x00003dd2 (+2^13.9500)
str.w r4, [r0, #1572]
/* computing z1 = x1y0 + x0y1 + zeta^131 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x1afd90d (-2^24.7544) <= r4  <= 0x01afd90d (+2^24.7544)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb8af2a6 (-2^27.5289) <= r4  <= 0x0b8af2a6 (+2^27.5289)
mla.w r4, r10, r6, r4
    //// bounds:  -0x15660c3f (-2^28.4194) <= r4  <= 0x15660c3f (+2^28.4194)
MONTRED r4, r3
    //// bounds:  -0x0004766 (-2^14.1578) <= r4  <= 0x00004766 (+2^14.1578)
str.w r4, [r0, #1576]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1580]
ldr.w r10, [r1, #1584]
ldr.w r9, [r1, #1588]
ldr.w r8, [r1, #1592]
ldr.w r7, [r2, #1584]
ldr.w r6, [r2, #1588]
ldr.w r5, [r2, #1592]
/*** basemul 132 ***/
/* computing z0 = x0y0 + zeta^132 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-1628
mul.w r4, r4, r14
    //// bounds:  -0x1bb5168 (-2^24.7922) <= r4  <= 0x01bb5168 (+2^24.7922)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb966b01 (-2^27.5345) <= r4  <= 0x0b966b01 (+2^27.5345)
MONTRED r4, r3
    //// bounds:  -0x0003d96 (-2^13.9445) <= r4  <= 0x00003d96 (+2^13.9445)
str.w r4, [r0, #1584]
/* computing z1 = x1y0 + x0y1 + zeta^132 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x17ca4b4 (-2^24.5723) <= r4  <= 0x017ca4b4 (+2^24.5723)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb57be4d (-2^27.5037) <= r4  <= 0x0b57be4d (+2^27.5037)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1532d7e6 (-2^28.4059) <= r4  <= 0x1532d7e6 (+2^28.4059)
MONTRED r4, r3
    //// bounds:  -0x0004732 (-2^14.1537) <= r4  <= 0x00004733 (+2^14.1538)
str.w r4, [r0, #1588]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1592]
ldr.w r10, [r1, #1596]
ldr.w r9, [r1, #1600]
ldr.w r8, [r1, #1604]
ldr.w r7, [r2, #1596]
ldr.w r6, [r2, #1600]
ldr.w r5, [r2, #1604]
/*** basemul 133 ***/
/* computing z0 = x0y0 + zeta^133 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =1628
mul.w r4, r4, r14
    //// bounds:  -0x1bb5168 (-2^24.7922) <= r4  <= 0x01bb5168 (+2^24.7922)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb966b01 (-2^27.5345) <= r4  <= 0x0b966b01 (+2^27.5345)
MONTRED r4, r3
    //// bounds:  -0x0003d96 (-2^13.9445) <= r4  <= 0x00003d96 (+2^13.9445)
str.w r4, [r0, #1596]
/* computing z1 = x1y0 + x0y1 + zeta^133 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x17ca4b4 (-2^24.5723) <= r4  <= 0x017ca4b4 (+2^24.5723)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb57be4d (-2^27.5037) <= r4  <= 0x0b57be4d (+2^27.5037)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1532d7e6 (-2^28.4059) <= r4  <= 0x1532d7e6 (+2^28.4059)
MONTRED r4, r3
    //// bounds:  -0x0004732 (-2^14.1537) <= r4  <= 0x00004733 (+2^14.1538)
str.w r4, [r0, #1600]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1604]
ldr.w r10, [r1, #1608]
ldr.w r9, [r1, #1612]
ldr.w r8, [r1, #1616]
ldr.w r7, [r2, #1608]
ldr.w r6, [r2, #1612]
ldr.w r5, [r2, #1616]
/*** basemul 134 ***/
/* computing z0 = x0y0 + zeta^134 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4470
mul.w r4, r4, r14
    //// bounds:  -0x4c137e4 (-2^26.2494) <= r4  <= 0x04c137e4 (+2^26.2494)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe9c517d (-2^27.8689) <= r4  <= 0x0e9c517d (+2^27.8689)
MONTRED r4, r3
    //// bounds:  -0x000409c (-2^14.0137) <= r4  <= 0x0000409c (+2^14.0137)
str.w r4, [r0, #1608]
/* computing z1 = x1y0 + x0y1 + zeta^134 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x41521f2 (-2^26.0295) <= r4  <= 0x041521f2 (+2^26.0295)
mla.w r4, r9, r7, r4
    //// bounds:  -0xdf03b8b (-2^27.8010) <= r4  <= 0x0df03b8b (+2^27.8010)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17cb5524 (-2^28.5725) <= r4  <= 0x17cb5524 (+2^28.5725)
MONTRED r4, r3
    //// bounds:  -0x00049cb (-2^14.2054) <= r4  <= 0x000049cb (+2^14.2054)
str.w r4, [r0, #1612]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1616]
ldr.w r10, [r1, #1620]
ldr.w r9, [r1, #1624]
ldr.w r8, [r1, #1628]
ldr.w r7, [r2, #1620]
ldr.w r6, [r2, #1624]
ldr.w r5, [r2, #1628]
/*** basemul 135 ***/
/* computing z0 = x0y0 + zeta^135 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4470
mul.w r4, r4, r14
    //// bounds:  -0x4c137e4 (-2^26.2494) <= r4  <= 0x04c137e4 (+2^26.2494)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe9c517d (-2^27.8689) <= r4  <= 0x0e9c517d (+2^27.8689)
MONTRED r4, r3
    //// bounds:  -0x000409c (-2^14.0137) <= r4  <= 0x0000409c (+2^14.0137)
str.w r4, [r0, #1620]
/* computing z1 = x1y0 + x0y1 + zeta^135 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x41521f2 (-2^26.0295) <= r4  <= 0x041521f2 (+2^26.0295)
mla.w r4, r9, r7, r4
    //// bounds:  -0xdf03b8b (-2^27.8010) <= r4  <= 0x0df03b8b (+2^27.8010)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17cb5524 (-2^28.5725) <= r4  <= 0x17cb5524 (+2^28.5725)
MONTRED r4, r3
    //// bounds:  -0x00049cb (-2^14.2054) <= r4  <= 0x000049cb (+2^14.2054)
str.w r4, [r0, #1624]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1628]
ldr.w r10, [r1, #1632]
ldr.w r9, [r1, #1636]
ldr.w r8, [r1, #1640]
ldr.w r7, [r2, #1632]
ldr.w r6, [r2, #1636]
ldr.w r5, [r2, #1640]
/*** basemul 136 ***/
/* computing z0 = x0y0 + zeta^136 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =9396
mul.w r4, r4, r14
    //// bounds:  -0x9fe9bf8 (-2^27.3211) <= r4  <= 0x09fe9bf8 (+2^27.3211)
mla.w r4, r10, r7, r4
    //// bounds:  -0x13d9b591 (-2^28.3111) <= r4  <= 0x13d9b591 (+2^28.3111)
MONTRED r4, r3
    //// bounds:  -0x00045d9 (-2^14.1261) <= r4  <= 0x000045da (+2^14.1262)
str.w r4, [r0, #1632]
/* computing z1 = x1y0 + x0y1 + zeta^136 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x894e1fc (-2^27.1012) <= r4  <= 0x0894e1fc (+2^27.1012)
mla.w r4, r9, r7, r4
    //// bounds:  -0x126ffb95 (-2^28.2046) <= r4  <= 0x126ffb95 (+2^28.2046)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c4b152e (-2^28.8224) <= r4  <= 0x1c4b152e (+2^28.8224)
MONTRED r4, r3
    //// bounds:  -0x0004e4b (-2^14.2908) <= r4  <= 0x00004e4b (+2^14.2908)
str.w r4, [r0, #1636]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1640]
ldr.w r10, [r1, #1644]
ldr.w r9, [r1, #1648]
ldr.w r8, [r1, #1652]
ldr.w r7, [r2, #1644]
ldr.w r6, [r2, #1648]
ldr.w r5, [r2, #1652]
/*** basemul 137 ***/
/* computing z0 = x0y0 + zeta^137 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-9396
mul.w r4, r4, r14
    //// bounds:  -0x9fe9bf8 (-2^27.3211) <= r4  <= 0x09fe9bf8 (+2^27.3211)
mla.w r4, r10, r7, r4
    //// bounds:  -0x13d9b591 (-2^28.3111) <= r4  <= 0x13d9b591 (+2^28.3111)
MONTRED r4, r3
    //// bounds:  -0x00045d9 (-2^14.1261) <= r4  <= 0x000045da (+2^14.1262)
str.w r4, [r0, #1644]
/* computing z1 = x1y0 + x0y1 + zeta^137 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x894e1fc (-2^27.1012) <= r4  <= 0x0894e1fc (+2^27.1012)
mla.w r4, r9, r7, r4
    //// bounds:  -0x126ffb95 (-2^28.2046) <= r4  <= 0x126ffb95 (+2^28.2046)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c4b152e (-2^28.8224) <= r4  <= 0x1c4b152e (+2^28.8224)
MONTRED r4, r3
    //// bounds:  -0x0004e4b (-2^14.2908) <= r4  <= 0x00004e4b (+2^14.2908)
str.w r4, [r0, #1648]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1652]
ldr.w r10, [r1, #1656]
ldr.w r9, [r1, #1660]
ldr.w r8, [r1, #1664]
ldr.w r7, [r2, #1656]
ldr.w r6, [r2, #1660]
ldr.w r5, [r2, #1664]
/*** basemul 138 ***/
/* computing z0 = x0y0 + zeta^138 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7099
mul.w r4, r4, r14
    //// bounds:  -0x78d1df2 (-2^26.9167) <= r4  <= 0x078d1df2 (+2^26.9167)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1168378b (-2^28.1216) <= r4  <= 0x1168378b (+2^28.1216)
MONTRED r4, r3
    //// bounds:  -0x0004368 (-2^14.0748) <= r4  <= 0x00004368 (+2^14.0748)
str.w r4, [r0, #1656]
/* computing z1 = x1y0 + x0y1 + zeta^138 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x67bd1f9 (-2^26.6968) <= r4  <= 0x067bd1f9 (+2^26.6968)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1056eb92 (-2^28.0303) <= r4  <= 0x1056eb92 (+2^28.0303)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a32052b (-2^28.7112) <= r4  <= 0x1a32052b (+2^28.7112)
MONTRED r4, r3
    //// bounds:  -0x0004c32 (-2^14.2516) <= r4  <= 0x00004c32 (+2^14.2516)
str.w r4, [r0, #1660]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1664]
ldr.w r10, [r1, #1668]
ldr.w r9, [r1, #1672]
ldr.w r8, [r1, #1676]
ldr.w r7, [r2, #1668]
ldr.w r6, [r2, #1672]
ldr.w r5, [r2, #1676]
/*** basemul 139 ***/
/* computing z0 = x0y0 + zeta^139 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7099
mul.w r4, r4, r14
    //// bounds:  -0x78d1df2 (-2^26.9167) <= r4  <= 0x078d1df2 (+2^26.9167)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1168378b (-2^28.1216) <= r4  <= 0x1168378b (+2^28.1216)
MONTRED r4, r3
    //// bounds:  -0x0004368 (-2^14.0748) <= r4  <= 0x00004368 (+2^14.0748)
str.w r4, [r0, #1668]
/* computing z1 = x1y0 + x0y1 + zeta^139 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x67bd1f9 (-2^26.6968) <= r4  <= 0x067bd1f9 (+2^26.6968)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1056eb92 (-2^28.0303) <= r4  <= 0x1056eb92 (+2^28.0303)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a32052b (-2^28.7112) <= r4  <= 0x1a32052b (+2^28.7112)
MONTRED r4, r3
    //// bounds:  -0x0004c32 (-2^14.2516) <= r4  <= 0x00004c32 (+2^14.2516)
str.w r4, [r0, #1672]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1676]
ldr.w r10, [r1, #1680]
ldr.w r9, [r1, #1684]
ldr.w r8, [r1, #1688]
ldr.w r7, [r2, #1680]
ldr.w r6, [r2, #1684]
ldr.w r5, [r2, #1688]
/*** basemul 140 ***/
/* computing z0 = x0y0 + zeta^140 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4873
mul.w r4, r4, r14
    //// bounds:  -0x52ef566 (-2^26.3739) <= r4  <= 0x052ef566 (+2^26.3739)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf0a0eff (-2^27.9107) <= r4  <= 0x0f0a0eff (+2^27.9107)
MONTRED r4, r3
    //// bounds:  -0x000410a (-2^14.0232) <= r4  <= 0x0000410a (+2^14.0232)
str.w r4, [r0, #1680]
/* computing z1 = x1y0 + x0y1 + zeta^140 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4735bb3 (-2^26.1540) <= r4  <= 0x04735bb3 (+2^26.1540)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe4e754c (-2^27.8386) <= r4  <= 0x0e4e754c (+2^27.8386)
mla.w r4, r10, r6, r4
    //// bounds:  -0x18298ee5 (-2^28.5947) <= r4  <= 0x18298ee5 (+2^28.5947)
MONTRED r4, r3
    //// bounds:  -0x0004a29 (-2^14.2126) <= r4  <= 0x00004a2a (+2^14.2126)
str.w r4, [r0, #1684]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1688]
ldr.w r10, [r1, #1692]
ldr.w r9, [r1, #1696]
ldr.w r8, [r1, #1700]
ldr.w r7, [r2, #1692]
ldr.w r6, [r2, #1696]
ldr.w r5, [r2, #1700]
/*** basemul 141 ***/
/* computing z0 = x0y0 + zeta^141 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4873
mul.w r4, r4, r14
    //// bounds:  -0x52ef566 (-2^26.3739) <= r4  <= 0x052ef566 (+2^26.3739)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf0a0eff (-2^27.9107) <= r4  <= 0x0f0a0eff (+2^27.9107)
MONTRED r4, r3
    //// bounds:  -0x000410a (-2^14.0232) <= r4  <= 0x0000410a (+2^14.0232)
str.w r4, [r0, #1692]
/* computing z1 = x1y0 + x0y1 + zeta^141 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4735bb3 (-2^26.1540) <= r4  <= 0x04735bb3 (+2^26.1540)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe4e754c (-2^27.8386) <= r4  <= 0x0e4e754c (+2^27.8386)
mla.w r4, r10, r6, r4
    //// bounds:  -0x18298ee5 (-2^28.5947) <= r4  <= 0x18298ee5 (+2^28.5947)
MONTRED r4, r3
    //// bounds:  -0x0004a29 (-2^14.2126) <= r4  <= 0x00004a2a (+2^14.2126)
str.w r4, [r0, #1696]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1700]
ldr.w r10, [r1, #1704]
ldr.w r9, [r1, #1708]
ldr.w r8, [r1, #1712]
ldr.w r7, [r2, #1704]
ldr.w r6, [r2, #1708]
ldr.w r5, [r2, #1712]
/*** basemul 142 ***/
/* computing z0 = x0y0 + zeta^142 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-11650
mul.w r4, r4, r14
    //// bounds:  -0xc64646c (-2^27.6314) <= r4  <= 0x0c64646c (+2^27.6314)
mla.w r4, r10, r7, r4
    //// bounds:  -0x163f7e05 (-2^28.4756) <= r4  <= 0x163f7e05 (+2^28.4756)
MONTRED r4, r3
    //// bounds:  -0x000483f (-2^14.1748) <= r4  <= 0x0000483f (+2^14.1748)
str.w r4, [r0, #1704]
/* computing z1 = x1y0 + x0y1 + zeta^142 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xaa3e436 (-2^27.4115) <= r4  <= 0x0aa3e436 (+2^27.4115)
mla.w r4, r9, r7, r4
    //// bounds:  -0x147efdcf (-2^28.3573) <= r4  <= 0x147efdcf (+2^28.3573)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e5a1768 (-2^28.9237) <= r4  <= 0x1e5a1768 (+2^28.9237)
MONTRED r4, r3
    //// bounds:  -0x000505a (-2^14.3283) <= r4  <= 0x0000505a (+2^14.3283)
str.w r4, [r0, #1708]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1712]
ldr.w r10, [r1, #1716]
ldr.w r9, [r1, #1720]
ldr.w r8, [r1, #1724]
ldr.w r7, [r2, #1716]
ldr.w r6, [r2, #1720]
ldr.w r5, [r2, #1724]
/*** basemul 143 ***/
/* computing z0 = x0y0 + zeta^143 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =11650
mul.w r4, r4, r14
    //// bounds:  -0xc64646c (-2^27.6314) <= r4  <= 0x0c64646c (+2^27.6314)
mla.w r4, r10, r7, r4
    //// bounds:  -0x163f7e05 (-2^28.4756) <= r4  <= 0x163f7e05 (+2^28.4756)
MONTRED r4, r3
    //// bounds:  -0x000483f (-2^14.1748) <= r4  <= 0x0000483f (+2^14.1748)
str.w r4, [r0, #1716]
/* computing z1 = x1y0 + x0y1 + zeta^143 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xaa3e436 (-2^27.4115) <= r4  <= 0x0aa3e436 (+2^27.4115)
mla.w r4, r9, r7, r4
    //// bounds:  -0x147efdcf (-2^28.3573) <= r4  <= 0x147efdcf (+2^28.3573)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e5a1768 (-2^28.9237) <= r4  <= 0x1e5a1768 (+2^28.9237)
MONTRED r4, r3
    //// bounds:  -0x000505a (-2^14.3283) <= r4  <= 0x0000505a (+2^14.3283)
str.w r4, [r0, #1720]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1724]
ldr.w r10, [r1, #1728]
ldr.w r9, [r1, #1732]
ldr.w r8, [r1, #1736]
ldr.w r7, [r2, #1728]
ldr.w r6, [r2, #1732]
ldr.w r5, [r2, #1736]
/*** basemul 144 ***/
/* computing z0 = x0y0 + zeta^144 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-9168
mul.w r4, r4, r14
    //// bounds:  -0x9c085e0 (-2^27.2857) <= r4  <= 0x09c085e0 (+2^27.2857)
mla.w r4, r10, r7, r4
    //// bounds:  -0x139b9f79 (-2^28.2934) <= r4  <= 0x139b9f79 (+2^28.2934)
MONTRED r4, r3
    //// bounds:  -0x000459b (-2^14.1211) <= r4  <= 0x0000459c (+2^14.1212)
str.w r4, [r0, #1728]
/* computing z1 = x1y0 + x0y1 + zeta^144 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x85f92f0 (-2^27.0658) <= r4  <= 0x085f92f0 (+2^27.0658)
mla.w r4, r9, r7, r4
    //// bounds:  -0x123aac89 (-2^28.1882) <= r4  <= 0x123aac89 (+2^28.1882)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c15c622 (-2^28.8117) <= r4  <= 0x1c15c622 (+2^28.8117)
MONTRED r4, r3
    //// bounds:  -0x0004e15 (-2^14.2869) <= r4  <= 0x00004e16 (+2^14.2870)
str.w r4, [r0, #1732]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1736]
ldr.w r10, [r1, #1740]
ldr.w r9, [r1, #1744]
ldr.w r8, [r1, #1748]
ldr.w r7, [r2, #1740]
ldr.w r6, [r2, #1744]
ldr.w r5, [r2, #1748]
/*** basemul 145 ***/
/* computing z0 = x0y0 + zeta^145 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =9168
mul.w r4, r4, r14
    //// bounds:  -0x9c085e0 (-2^27.2857) <= r4  <= 0x09c085e0 (+2^27.2857)
mla.w r4, r10, r7, r4
    //// bounds:  -0x139b9f79 (-2^28.2934) <= r4  <= 0x139b9f79 (+2^28.2934)
MONTRED r4, r3
    //// bounds:  -0x000459b (-2^14.1211) <= r4  <= 0x0000459c (+2^14.1212)
str.w r4, [r0, #1740]
/* computing z1 = x1y0 + x0y1 + zeta^145 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x85f92f0 (-2^27.0658) <= r4  <= 0x085f92f0 (+2^27.0658)
mla.w r4, r9, r7, r4
    //// bounds:  -0x123aac89 (-2^28.1882) <= r4  <= 0x123aac89 (+2^28.1882)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c15c622 (-2^28.8117) <= r4  <= 0x1c15c622 (+2^28.8117)
MONTRED r4, r3
    //// bounds:  -0x0004e15 (-2^14.2869) <= r4  <= 0x00004e16 (+2^14.2870)
str.w r4, [r0, #1744]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1748]
ldr.w r10, [r1, #1752]
ldr.w r9, [r1, #1756]
ldr.w r8, [r1, #1760]
ldr.w r7, [r2, #1752]
ldr.w r6, [r2, #1756]
ldr.w r5, [r2, #1760]
/*** basemul 146 ***/
/* computing z0 = x0y0 + zeta^146 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7623
mul.w r4, r4, r14
    //// bounds:  -0x81bce7a (-2^27.0195) <= r4  <= 0x081bce7a (+2^27.0195)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11f6e813 (-2^28.1671) <= r4  <= 0x11f6e813 (+2^28.1671)
MONTRED r4, r3
    //// bounds:  -0x00043f7 (-2^14.0867) <= r4  <= 0x000043f7 (+2^14.0867)
str.w r4, [r0, #1752]
/* computing z1 = x1y0 + x0y1 + zeta^146 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6f6563d (-2^26.7996) <= r4  <= 0x06f6563d (+2^26.7996)
mla.w r4, r9, r7, r4
    //// bounds:  -0x10d16fd6 (-2^28.0719) <= r4  <= 0x10d16fd6 (+2^28.0719)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1aac896f (-2^28.7374) <= r4  <= 0x1aac896f (+2^28.7374)
MONTRED r4, r3
    //// bounds:  -0x0004cac (-2^14.2606) <= r4  <= 0x00004cad (+2^14.2607)
str.w r4, [r0, #1756]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1760]
ldr.w r10, [r1, #1764]
ldr.w r9, [r1, #1768]
ldr.w r8, [r1, #1772]
ldr.w r7, [r2, #1764]
ldr.w r6, [r2, #1768]
ldr.w r5, [r2, #1772]
/*** basemul 147 ***/
/* computing z0 = x0y0 + zeta^147 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7623
mul.w r4, r4, r14
    //// bounds:  -0x81bce7a (-2^27.0195) <= r4  <= 0x081bce7a (+2^27.0195)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11f6e813 (-2^28.1671) <= r4  <= 0x11f6e813 (+2^28.1671)
MONTRED r4, r3
    //// bounds:  -0x00043f7 (-2^14.0867) <= r4  <= 0x000043f7 (+2^14.0867)
str.w r4, [r0, #1764]
/* computing z1 = x1y0 + x0y1 + zeta^147 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6f6563d (-2^26.7996) <= r4  <= 0x06f6563d (+2^26.7996)
mla.w r4, r9, r7, r4
    //// bounds:  -0x10d16fd6 (-2^28.0719) <= r4  <= 0x10d16fd6 (+2^28.0719)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1aac896f (-2^28.7374) <= r4  <= 0x1aac896f (+2^28.7374)
MONTRED r4, r3
    //// bounds:  -0x0004cac (-2^14.2606) <= r4  <= 0x00004cad (+2^14.2607)
str.w r4, [r0, #1768]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1772]
ldr.w r10, [r1, #1776]
ldr.w r9, [r1, #1780]
ldr.w r8, [r1, #1784]
ldr.w r7, [r2, #1776]
ldr.w r6, [r2, #1780]
ldr.w r5, [r2, #1784]
/*** basemul 148 ***/
/* computing z0 = x0y0 + zeta^148 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =3545
mul.w r4, r4, r14
    //// bounds:  -0x3c55546 (-2^25.9149) <= r4  <= 0x03c55546 (+2^25.9149)
mla.w r4, r10, r7, r4
    //// bounds:  -0xda06edf (-2^27.7684) <= r4  <= 0x0da06edf (+2^27.7684)
MONTRED r4, r3
    //// bounds:  -0x0003fa0 (-2^13.9915) <= r4  <= 0x00003fa0 (+2^13.9915)
str.w r4, [r0, #1776]
/* computing z1 = x1y0 + x0y1 + zeta^148 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x33cdba3 (-2^25.6950) <= r4  <= 0x033cdba3 (+2^25.6950)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd17f53c (-2^27.7108) <= r4  <= 0x0d17f53c (+2^27.7108)
mla.w r4, r10, r6, r4
    //// bounds:  -0x16f30ed5 (-2^28.5204) <= r4  <= 0x16f30ed5 (+2^28.5204)
MONTRED r4, r3
    //// bounds:  -0x00048f3 (-2^14.1888) <= r4  <= 0x000048f3 (+2^14.1888)
str.w r4, [r0, #1780]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1784]
ldr.w r10, [r1, #1788]
ldr.w r9, [r1, #1792]
ldr.w r8, [r1, #1796]
ldr.w r7, [r2, #1788]
ldr.w r6, [r2, #1792]
ldr.w r5, [r2, #1796]
/*** basemul 149 ***/
/* computing z0 = x0y0 + zeta^149 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-3545
mul.w r4, r4, r14
    //// bounds:  -0x3c55546 (-2^25.9149) <= r4  <= 0x03c55546 (+2^25.9149)
mla.w r4, r10, r7, r4
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0xda06edf (-2^27.7684) <= r4  <= 0x0da06edf (+2^27.7684)
MONTRED r4, r3
    //// bounds:  -0x0003fa0 (-2^13.9915) <= r4  <= 0x00003fa0 (+2^13.9915)
str.w r4, [r0, #1788]
/* computing z1 = x1y0 + x0y1 + zeta^149 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x33cdba3 (-2^25.6950) <= r4  <= 0x033cdba3 (+2^25.6950)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd17f53c (-2^27.7108) <= r4  <= 0x0d17f53c (+2^27.7108)
mla.w r4, r10, r6, r4
    //// bounds:  -0x16f30ed5 (-2^28.5204) <= r4  <= 0x16f30ed5 (+2^28.5204)
MONTRED r4, r3
    //// bounds:  -0x00048f3 (-2^14.1888) <= r4  <= 0x000048f3 (+2^14.1888)
str.w r4, [r0, #1792]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1796]
ldr.w r10, [r1, #1800]
ldr.w r9, [r1, #1804]
ldr.w r8, [r1, #1808]
ldr.w r7, [r2, #1800]
ldr.w r6, [r2, #1804]
ldr.w r5, [r2, #1808]
/*** basemul 150 ***/
/* computing z0 = x0y0 + zeta^150 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =3978
mul.w r4, r4, r14
    //// bounds:  -0x43b3e1c (-2^26.0811) <= r4  <= 0x043b3e1c (+2^26.0811)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe1657b5 (-2^27.8163) <= r4  <= 0x0e1657b5 (+2^27.8163)
MONTRED r4, r3
    //// bounds:  -0x0004016 (-2^14.0019) <= r4  <= 0x00004016 (+2^14.0019)
str.w r4, [r0, #1800]
/* computing z1 = x1y0 + x0y1 + zeta^150 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3a2190e (-2^25.8612) <= r4  <= 0x03a2190e (+2^25.8612)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd7d32a7 (-2^27.7537) <= r4  <= 0x0d7d32a7 (+2^27.7537)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17584c40 (-2^28.5450) <= r4  <= 0x17584c40 (+2^28.5450)
MONTRED r4, r3
    //// bounds:  -0x0004958 (-2^14.1966) <= r4  <= 0x00004958 (+2^14.1966)
str.w r4, [r0, #1804]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1808]
ldr.w r10, [r1, #1812]
ldr.w r9, [r1, #1816]
ldr.w r8, [r1, #1820]
ldr.w r7, [r2, #1812]
ldr.w r6, [r2, #1816]
ldr.w r5, [r2, #1820]
/*** basemul 151 ***/
/* computing z0 = x0y0 + zeta^151 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-3978
mul.w r4, r4, r14
    //// bounds:  -0x43b3e1c (-2^26.0811) <= r4  <= 0x043b3e1c (+2^26.0811)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe1657b5 (-2^27.8163) <= r4  <= 0x0e1657b5 (+2^27.8163)
MONTRED r4, r3
    //// bounds:  -0x0004016 (-2^14.0019) <= r4  <= 0x00004016 (+2^14.0019)
str.w r4, [r0, #1812]
/* computing z1 = x1y0 + x0y1 + zeta^151 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3a2190e (-2^25.8612) <= r4  <= 0x03a2190e (+2^25.8612)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd7d32a7 (-2^27.7537) <= r4  <= 0x0d7d32a7 (+2^27.7537)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17584c40 (-2^28.5450) <= r4  <= 0x17584c40 (+2^28.5450)
MONTRED r4, r3
    //// bounds:  -0x0004958 (-2^14.1966) <= r4  <= 0x00004958 (+2^14.1966)
str.w r4, [r0, #1816]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1820]
ldr.w r10, [r1, #1824]
ldr.w r9, [r1, #1828]
ldr.w r8, [r1, #1832]
ldr.w r7, [r2, #1824]
ldr.w r6, [r2, #1828]
ldr.w r5, [r2, #1832]
/*** basemul 152 ***/
/* computing z0 = x0y0 + zeta^152 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10836
mul.w r4, r4, r14
    //// bounds:  -0xb86bbb8 (-2^27.5269) <= r4  <= 0x0b86bbb8 (+2^27.5269)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1561d551 (-2^28.4183) <= r4  <= 0x1561d551 (+2^28.4183)
MONTRED r4, r3
    //// bounds:  -0x0004761 (-2^14.1574) <= r4  <= 0x00004762 (+2^14.1575)
str.w r4, [r0, #1824]
/* computing z1 = x1y0 + x0y1 + zeta^152 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x9e591dc (-2^27.3070) <= r4  <= 0x09e591dc (+2^27.3070)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13c0ab75 (-2^28.3040) <= r4  <= 0x13c0ab75 (+2^28.3040)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d9bc50e (-2^28.8879) <= r4  <= 0x1d9bc50e (+2^28.8879)
MONTRED r4, r3
    //// bounds:  -0x0004f9b (-2^14.3148) <= r4  <= 0x00004f9c (+2^14.3149)
str.w r4, [r0, #1828]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1832]
ldr.w r10, [r1, #1836]
ldr.w r9, [r1, #1840]
ldr.w r8, [r1, #1844]
ldr.w r7, [r2, #1836]
ldr.w r6, [r2, #1840]
ldr.w r5, [r2, #1844]
/*** basemul 153 ***/
/* computing z0 = x0y0 + zeta^153 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10836
mul.w r4, r4, r14
    //// bounds:  -0xb86bbb8 (-2^27.5269) <= r4  <= 0x0b86bbb8 (+2^27.5269)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1561d551 (-2^28.4183) <= r4  <= 0x1561d551 (+2^28.4183)
MONTRED r4, r3
    //// bounds:  -0x0004761 (-2^14.1574) <= r4  <= 0x00004762 (+2^14.1575)
str.w r4, [r0, #1836]
/* computing z1 = x1y0 + x0y1 + zeta^153 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x9e591dc (-2^27.3070) <= r4  <= 0x09e591dc (+2^27.3070)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13c0ab75 (-2^28.3040) <= r4  <= 0x13c0ab75 (+2^28.3040)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d9bc50e (-2^28.8879) <= r4  <= 0x1d9bc50e (+2^28.8879)
MONTRED r4, r3
    //// bounds:  -0x0004f9b (-2^14.3148) <= r4  <= 0x00004f9c (+2^14.3149)
str.w r4, [r0, #1840]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1844]
ldr.w r10, [r1, #1848]
ldr.w r9, [r1, #1852]
ldr.w r8, [r1, #1856]
ldr.w r7, [r2, #1848]
ldr.w r6, [r2, #1852]
ldr.w r5, [r2, #1856]
/*** basemul 154 ***/
/* computing z0 = x0y0 + zeta^154 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7108
mul.w r4, r4, r14
    //// bounds:  -0x78f9158 (-2^26.9185) <= r4  <= 0x078f9158 (+2^26.9185)
mla.w r4, r10, r7, r4
    //// bounds:  -0x116aaaf1 (-2^28.1224) <= r4  <= 0x116aaaf1 (+2^28.1224)
MONTRED r4, r3
    //// bounds:  -0x000436a (-2^14.0750) <= r4  <= 0x0000436b (+2^14.0751)
str.w r4, [r0, #1848]
/* computing z1 = x1y0 + x0y1 + zeta^154 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x67decac (-2^26.6986) <= r4  <= 0x067decac (+2^26.6986)
mla.w r4, r9, r7, r4
    //// bounds:  -0x10590645 (-2^28.0310) <= r4  <= 0x10590645 (+2^28.0310)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a341fde (-2^28.7117) <= r4  <= 0x1a341fde (+2^28.7117)
MONTRED r4, r3
    //// bounds:  -0x0004c34 (-2^14.2518) <= r4  <= 0x00004c34 (+2^14.2518)
str.w r4, [r0, #1852]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1856]
ldr.w r10, [r1, #1860]
ldr.w r9, [r1, #1864]
ldr.w r8, [r1, #1868]
ldr.w r7, [r2, #1860]
ldr.w r6, [r2, #1864]
ldr.w r5, [r2, #1868]
/*** basemul 155 ***/
/* computing z0 = x0y0 + zeta^155 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7108
mul.w r4, r4, r14
    //// bounds:  -0x78f9158 (-2^26.9185) <= r4  <= 0x078f9158 (+2^26.9185)
mla.w r4, r10, r7, r4
    //// bounds:  -0x116aaaf1 (-2^28.1224) <= r4  <= 0x116aaaf1 (+2^28.1224)
MONTRED r4, r3
    //// bounds:  -0x000436a (-2^14.0750) <= r4  <= 0x0000436b (+2^14.0751)
str.w r4, [r0, #1860]
/* computing z1 = x1y0 + x0y1 + zeta^155 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x67decac (-2^26.6986) <= r4  <= 0x067decac (+2^26.6986)
mla.w r4, r9, r7, r4
    //// bounds:  -0x10590645 (-2^28.0310) <= r4  <= 0x10590645 (+2^28.0310)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a341fde (-2^28.7117) <= r4  <= 0x1a341fde (+2^28.7117)
MONTRED r4, r3
    //// bounds:  -0x0004c34 (-2^14.2518) <= r4  <= 0x00004c34 (+2^14.2518)
str.w r4, [r0, #1864]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1868]
ldr.w r10, [r1, #1872]
ldr.w r9, [r1, #1876]
ldr.w r8, [r1, #1880]
ldr.w r7, [r2, #1872]
ldr.w r6, [r2, #1876]
ldr.w r5, [r2, #1880]
/*** basemul 156 ***/
/* computing z0 = x0y0 + zeta^156 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =2481
mul.w r4, r4, r14
    //// bounds:  -0x2a398d6 (-2^25.4000) <= r4  <= 0x02a398d6 (+2^25.4000)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc7eb26f (-2^27.6433) <= r4  <= 0x0c7eb26f (+2^27.6433)
MONTRED r4, r3
    //// bounds:  -0x0003e7e (-2^13.9656) <= r4  <= 0x00003e7f (+2^13.9657)
str.w r4, [r0, #1872]
/* computing z1 = x1y0 + x0y1 + zeta^156 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x244156b (-2^25.1801) <= r4  <= 0x0244156b (+2^25.1801)
mla.w r4, r9, r7, r4
    //// bounds:  -0xc1f2f04 (-2^27.5995) <= r4  <= 0x0c1f2f04 (+2^27.5995)
mla.w r4, r10, r6, r4
    //// bounds:  -0x15fa489d (-2^28.4580) <= r4  <= 0x15fa489d (+2^28.4580)
MONTRED r4, r3
    //// bounds:  -0x00047fa (-2^14.1695) <= r4  <= 0x000047fa (+2^14.1695)
str.w r4, [r0, #1876]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1880]
ldr.w r10, [r1, #1884]
ldr.w r9, [r1, #1888]
ldr.w r8, [r1, #1892]
ldr.w r7, [r2, #1884]
ldr.w r6, [r2, #1888]
ldr.w r5, [r2, #1892]
/*** basemul 157 ***/
/* computing z0 = x0y0 + zeta^157 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-2481
mul.w r4, r4, r14
    //// bounds:  -0x2a398d6 (-2^25.4000) <= r4  <= 0x02a398d6 (+2^25.4000)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc7eb26f (-2^27.6433) <= r4  <= 0x0c7eb26f (+2^27.6433)
MONTRED r4, r3
    //// bounds:  -0x0003e7e (-2^13.9656) <= r4  <= 0x00003e7f (+2^13.9657)
str.w r4, [r0, #1884]
/* computing z1 = x1y0 + x0y1 + zeta^157 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x244156b (-2^25.1801) <= r4  <= 0x0244156b (+2^25.1801)
mla.w r4, r9, r7, r4
    //// bounds:  -0xc1f2f04 (-2^27.5995) <= r4  <= 0x0c1f2f04 (+2^27.5995)
mla.w r4, r10, r6, r4
    //// bounds:  -0x15fa489d (-2^28.4580) <= r4  <= 0x15fa489d (+2^28.4580)
MONTRED r4, r3
    //// bounds:  -0x00047fa (-2^14.1695) <= r4  <= 0x000047fa (+2^14.1695)
str.w r4, [r0, #1888]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1892]
ldr.w r10, [r1, #1896]
ldr.w r9, [r1, #1900]
ldr.w r8, [r1, #1904]
ldr.w r7, [r2, #1896]
ldr.w r6, [r2, #1900]
ldr.w r5, [r2, #1904]
/*** basemul 158 ***/
/* computing z0 = x0y0 + zeta^158 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-12656
mul.w r4, r4, r14
    //// bounds:  -0xd7655a0 (-2^27.7508) <= r4  <= 0x0d7655a0 (+2^27.7508)
mla.w r4, r10, r7, r4
    //// bounds:  -0x17516f39 (-2^28.5434) <= r4  <= 0x17516f39 (+2^28.5434)
MONTRED r4, r3
    //// bounds:  -0x0004951 (-2^14.1961) <= r4  <= 0x00004951 (+2^14.1961)
str.w r4, [r0, #1896]
/* computing z1 = x1y0 + x0y1 + zeta^158 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb8f1ad0 (-2^27.5309) <= r4  <= 0x0b8f1ad0 (+2^27.5309)
mla.w r4, r9, r7, r4
    //// bounds:  -0x156a3469 (-2^28.4205) <= r4  <= 0x156a3469 (+2^28.4205)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1f454e02 (-2^28.9667) <= r4  <= 0x1f454e02 (+2^28.9667)
MONTRED r4, r3
    //// bounds:  -0x0005145 (-2^14.3446) <= r4  <= 0x00005145 (+2^14.3446)
str.w r4, [r0, #1900]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1904]
ldr.w r10, [r1, #1908]
ldr.w r9, [r1, #1912]
ldr.w r8, [r1, #1916]
ldr.w r7, [r2, #1908]
ldr.w r6, [r2, #1912]
ldr.w r5, [r2, #1916]
/*** basemul 159 ***/
/* computing z0 = x0y0 + zeta^159 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =12656
mul.w r4, r4, r14
    //// bounds:  -0xd7655a0 (-2^27.7508) <= r4  <= 0x0d7655a0 (+2^27.7508)
mla.w r4, r10, r7, r4
    //// bounds:  -0x17516f39 (-2^28.5434) <= r4  <= 0x17516f39 (+2^28.5434)
MONTRED r4, r3
    //// bounds:  -0x0004951 (-2^14.1961) <= r4  <= 0x00004951 (+2^14.1961)
str.w r4, [r0, #1908]
/* computing z1 = x1y0 + x0y1 + zeta^159 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb8f1ad0 (-2^27.5309) <= r4  <= 0x0b8f1ad0 (+2^27.5309)
mla.w r4, r9, r7, r4
    //// bounds:  -0x156a3469 (-2^28.4205) <= r4  <= 0x156a3469 (+2^28.4205)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1f454e02 (-2^28.9667) <= r4  <= 0x1f454e02 (+2^28.9667)
MONTRED r4, r3
    //// bounds:  -0x0005145 (-2^14.3446) <= r4  <= 0x00005145 (+2^14.3446)
str.w r4, [r0, #1912]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1916]
ldr.w r10, [r1, #1920]
ldr.w r9, [r1, #1924]
ldr.w r8, [r1, #1928]
ldr.w r7, [r2, #1920]
ldr.w r6, [r2, #1924]
ldr.w r5, [r2, #1928]
/*** basemul 160 ***/
/* computing z0 = x0y0 + zeta^160 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4215
mul.w r4, r4, r14
    //// bounds:  -0x47bc79a (-2^26.1646) <= r4  <= 0x047bc79a (+2^26.1646)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe56e133 (-2^27.8419) <= r4  <= 0x0e56e133 (+2^27.8419)
MONTRED r4, r3
    //// bounds:  -0x0004056 (-2^14.0076) <= r4  <= 0x00004057 (+2^14.0076)
str.w r4, [r0, #1920]
/* computing z1 = x1y0 + x0y1 + zeta^160 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3d982cd (-2^25.9447) <= r4  <= 0x03d982cd (+2^25.9447)
mla.w r4, r9, r7, r4
    //// bounds:  -0xdb49c66 (-2^27.7767) <= r4  <= 0x0db49c66 (+2^27.7767)
mla.w r4, r10, r6, r4
    //// bounds:  -0x178fb5ff (-2^28.5584) <= r4  <= 0x178fb5ff (+2^28.5584)
MONTRED r4, r3
    //// bounds:  -0x000498f (-2^14.2008) <= r4  <= 0x00004990 (+2^14.2009)
str.w r4, [r0, #1924]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1928]
ldr.w r10, [r1, #1932]
ldr.w r9, [r1, #1936]
ldr.w r8, [r1, #1940]
ldr.w r7, [r2, #1932]
ldr.w r6, [r2, #1936]
ldr.w r5, [r2, #1940]
/*** basemul 161 ***/
/* computing z0 = x0y0 + zeta^161 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4215
mul.w r4, r4, r14
    //// bounds:  -0x47bc79a (-2^26.1646) <= r4  <= 0x047bc79a (+2^26.1646)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe56e133 (-2^27.8419) <= r4  <= 0x0e56e133 (+2^27.8419)
MONTRED r4, r3
    //// bounds:  -0x0004056 (-2^14.0076) <= r4  <= 0x00004057 (+2^14.0076)
str.w r4, [r0, #1932]
/* computing z1 = x1y0 + x0y1 + zeta^161 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3d982cd (-2^25.9447) <= r4  <= 0x03d982cd (+2^25.9447)
mla.w r4, r9, r7, r4
    //// bounds:  -0xdb49c66 (-2^27.7767) <= r4  <= 0x0db49c66 (+2^27.7767)
mla.w r4, r10, r6, r4
    //// bounds:  -0x178fb5ff (-2^28.5584) <= r4  <= 0x178fb5ff (+2^28.5584)
MONTRED r4, r3
    //// bounds:  -0x000498f (-2^14.2008) <= r4  <= 0x00004990 (+2^14.2009)
str.w r4, [r0, #1936]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1940]
ldr.w r10, [r1, #1944]
ldr.w r9, [r1, #1948]
ldr.w r8, [r1, #1952]
ldr.w r7, [r2, #1944]
ldr.w r6, [r2, #1948]
ldr.w r5, [r2, #1952]
/*** basemul 162 ***/
/* computing z0 = x0y0 + zeta^162 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8774
mul.w r4, r4, r14
    //// bounds:  -0x9553bc4 (-2^27.2223) <= r4  <= 0x09553bc4 (+2^27.2223)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1330555d (-2^28.2622) <= r4  <= 0x1330555d (+2^28.2622)
MONTRED r4, r3
    //// bounds:  -0x0004530 (-2^14.1124) <= r4  <= 0x00004530 (+2^14.1124)
str.w r4, [r0, #1944]
/* computing z1 = x1y0 + x0y1 + zeta^162 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x80373e2 (-2^27.0024) <= r4  <= 0x080373e2 (+2^27.0024)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11de8d7b (-2^28.1594) <= r4  <= 0x11de8d7b (+2^28.1594)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1bb9a714 (-2^28.7931) <= r4  <= 0x1bb9a714 (+2^28.7931)
MONTRED r4, r3
    //// bounds:  -0x0004db9 (-2^14.2803) <= r4  <= 0x00004dba (+2^14.2803)
str.w r4, [r0, #1948]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1952]
ldr.w r10, [r1, #1956]
ldr.w r9, [r1, #1960]
ldr.w r8, [r1, #1964]
ldr.w r7, [r2, #1956]
ldr.w r6, [r2, #1960]
ldr.w r5, [r2, #1964]
/*** basemul 163 ***/
/* computing z0 = x0y0 + zeta^163 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8774
mul.w r4, r4, r14
    //// bounds:  -0x9553bc4 (-2^27.2223) <= r4  <= 0x09553bc4 (+2^27.2223)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1330555d (-2^28.2622) <= r4  <= 0x1330555d (+2^28.2622)
MONTRED r4, r3
    //// bounds:  -0x0004530 (-2^14.1124) <= r4  <= 0x00004530 (+2^14.1124)
str.w r4, [r0, #1956]
/* computing z1 = x1y0 + x0y1 + zeta^163 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x80373e2 (-2^27.0024) <= r4  <= 0x080373e2 (+2^27.0024)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11de8d7b (-2^28.1594) <= r4  <= 0x11de8d7b (+2^28.1594)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1bb9a714 (-2^28.7931) <= r4  <= 0x1bb9a714 (+2^28.7931)
MONTRED r4, r3
    //// bounds:  -0x0004db9 (-2^14.2803) <= r4  <= 0x00004dba (+2^14.2803)
str.w r4, [r0, #1960]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1964]
ldr.w r10, [r1, #1968]
ldr.w r9, [r1, #1972]
ldr.w r8, [r1, #1976]
ldr.w r7, [r2, #1968]
ldr.w r6, [r2, #1972]
ldr.w r5, [r2, #1976]
/*** basemul 164 ***/
/* computing z0 = x0y0 + zeta^164 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-9135
mul.w r4, r4, r14
    //// bounds:  -0x9b7896a (-2^27.2805) <= r4  <= 0x09b7896a (+2^27.2805)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1392a303 (-2^28.2908) <= r4  <= 0x1392a303 (+2^28.2908)
MONTRED r4, r3
    //// bounds:  -0x0004592 (-2^14.1204) <= r4  <= 0x00004593 (+2^14.1205)
str.w r4, [r0, #1968]
/* computing z1 = x1y0 + x0y1 + zeta^164 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x857dbb5 (-2^27.0606) <= r4  <= 0x0857dbb5 (+2^27.0606)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1232f54e (-2^28.1858) <= r4  <= 0x1232f54e (+2^28.1858)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c0e0ee7 (-2^28.8102) <= r4  <= 0x1c0e0ee7 (+2^28.8102)
MONTRED r4, r3
    //// bounds:  -0x0004e0e (-2^14.2864) <= r4  <= 0x00004e0e (+2^14.2864)
str.w r4, [r0, #1972]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1976]
ldr.w r10, [r1, #1980]
ldr.w r9, [r1, #1984]
ldr.w r8, [r1, #1988]
ldr.w r7, [r2, #1980]
ldr.w r6, [r2, #1984]
ldr.w r5, [r2, #1988]
/*** basemul 165 ***/
/* computing z0 = x0y0 + zeta^165 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =9135
mul.w r4, r4, r14
    //// bounds:  -0x9b7896a (-2^27.2805) <= r4  <= 0x09b7896a (+2^27.2805)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1392a303 (-2^28.2908) <= r4  <= 0x1392a303 (+2^28.2908)
MONTRED r4, r3
    //// bounds:  -0x0004592 (-2^14.1204) <= r4  <= 0x00004593 (+2^14.1205)
str.w r4, [r0, #1980]
/* computing z1 = x1y0 + x0y1 + zeta^165 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x857dbb5 (-2^27.0606) <= r4  <= 0x0857dbb5 (+2^27.0606)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1232f54e (-2^28.1858) <= r4  <= 0x1232f54e (+2^28.1858)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1c0e0ee7 (-2^28.8102) <= r4  <= 0x1c0e0ee7 (+2^28.8102)
MONTRED r4, r3
    //// bounds:  -0x0004e0e (-2^14.2864) <= r4  <= 0x00004e0e (+2^14.2864)
str.w r4, [r0, #1984]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #1988]
ldr.w r10, [r1, #1992]
ldr.w r9, [r1, #1996]
ldr.w r8, [r1, #2000]
ldr.w r7, [r2, #1992]
ldr.w r6, [r2, #1996]
ldr.w r5, [r2, #2000]
/*** basemul 166 ***/
/* computing z0 = x0y0 + zeta^166 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-2343
mul.w r4, r4, r14
    //// bounds:  -0x27e04ba (-2^25.3175) <= r4  <= 0x027e04ba (+2^25.3175)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc591e53 (-2^27.6262) <= r4  <= 0x0c591e53 (+2^27.6262)
MONTRED r4, r3
    //// bounds:  -0x0003e59 (-2^13.9623) <= r4  <= 0x00003e59 (+2^13.9623)
str.w r4, [r0, #1992]
/* computing z1 = x1y0 + x0y1 + zeta^166 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x223d15d (-2^25.0976) <= r4  <= 0x0223d15d (+2^25.0976)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbfeeaf6 (-2^27.5845) <= r4  <= 0x0bfeeaf6 (+2^27.5845)
mla.w r4, r10, r6, r4
    //// bounds:  -0x15da048f (-2^28.4497) <= r4  <= 0x15da048f (+2^28.4497)
MONTRED r4, r3
    //// bounds:  -0x00047da (-2^14.1669) <= r4  <= 0x000047da (+2^14.1669)
str.w r4, [r0, #1996]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2000]
ldr.w r10, [r1, #2004]
ldr.w r9, [r1, #2008]
ldr.w r8, [r1, #2012]
ldr.w r7, [r2, #2004]
ldr.w r6, [r2, #2008]
ldr.w r5, [r2, #2012]
/*** basemul 167 ***/
/* computing z0 = x0y0 + zeta^167 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =2343
mul.w r4, r4, r14
    //// bounds:  -0x27e04ba (-2^25.3175) <= r4  <= 0x027e04ba (+2^25.3175)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc591e53 (-2^27.6262) <= r4  <= 0x0c591e53 (+2^27.6262)
MONTRED r4, r3
    //// bounds:  -0x0003e59 (-2^13.9623) <= r4  <= 0x00003e59 (+2^13.9623)
str.w r4, [r0, #2004]
/* computing z1 = x1y0 + x0y1 + zeta^167 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x223d15d (-2^25.0976) <= r4  <= 0x0223d15d (+2^25.0976)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbfeeaf6 (-2^27.5845) <= r4  <= 0x0bfeeaf6 (+2^27.5845)
mla.w r4, r10, r6, r4
    //// bounds:  -0x15da048f (-2^28.4497) <= r4  <= 0x15da048f (+2^28.4497)
MONTRED r4, r3
    //// bounds:  -0x00047da (-2^14.1669) <= r4  <= 0x000047da (+2^14.1669)
str.w r4, [r0, #2008]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2012]
ldr.w r10, [r1, #2016]
ldr.w r9, [r1, #2020]
ldr.w r8, [r1, #2024]
ldr.w r7, [r2, #2016]
ldr.w r6, [r2, #2020]
ldr.w r5, [r2, #2024]
/*** basemul 168 ***/
/* computing z0 = x0y0 + zeta^168 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =11
mul.w r4, r4, r14
    //// bounds:  -0x002fed2 (-2^17.5827) <= r4  <= 0x0002fed2 (+2^17.5827)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9de186b (-2^27.3027) <= r4  <= 0x09de186b (+2^27.3027)
MONTRED r4, r3
    //// bounds:  -0x0003bde (-2^13.9037) <= r4  <= 0x00003bde (+2^13.9037)
str.w r4, [r0, #2016]
/* computing z1 = x1y0 + x0y1 + zeta^168 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0029269 (-2^17.3628) <= r4  <= 0x00029269 (+2^17.3628)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9ddac02 (-2^27.3025) <= r4  <= 0x09ddac02 (+2^27.3025)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13b8c59b (-2^28.3017) <= r4  <= 0x13b8c59b (+2^28.3017)
MONTRED r4, r3
    //// bounds:  -0x00045b8 (-2^14.1235) <= r4  <= 0x000045b9 (+2^14.1236)
str.w r4, [r0, #2020]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2024]
ldr.w r10, [r1, #2028]
ldr.w r9, [r1, #2032]
ldr.w r8, [r1, #2036]
ldr.w r7, [r2, #2028]
ldr.w r6, [r2, #2032]
ldr.w r5, [r2, #2036]
/*** basemul 169 ***/
/* computing z0 = x0y0 + zeta^169 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-11
mul.w r4, r4, r14
    //// bounds:  -0x002fed2 (-2^17.5827) <= r4  <= 0x0002fed2 (+2^17.5827)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9de186b (-2^27.3027) <= r4  <= 0x09de186b (+2^27.3027)
MONTRED r4, r3
    //// bounds:  -0x0003bde (-2^13.9037) <= r4  <= 0x00003bde (+2^13.9037)
str.w r4, [r0, #2028]
/* computing z1 = x1y0 + x0y1 + zeta^169 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0029269 (-2^17.3628) <= r4  <= 0x00029269 (+2^17.3628)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9ddac02 (-2^27.3025) <= r4  <= 0x09ddac02 (+2^27.3025)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13b8c59b (-2^28.3017) <= r4  <= 0x13b8c59b (+2^28.3017)
MONTRED r4, r3
    //// bounds:  -0x00045b8 (-2^14.1235) <= r4  <= 0x000045b9 (+2^14.1236)
str.w r4, [r0, #2032]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2036]
ldr.w r10, [r1, #2040]
ldr.w r9, [r1, #2044]
ldr.w r8, [r1, #2048]
ldr.w r7, [r2, #2040]
ldr.w r6, [r2, #2044]
ldr.w r5, [r2, #2048]
/*** basemul 170 ***/
/* computing z0 = x0y0 + zeta^170 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =1760
mul.w r4, r4, r14
    //// bounds:  -0x1df4340 (-2^24.9047) <= r4  <= 0x01df4340 (+2^24.9047)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbba5cd9 (-2^27.5519) <= r4  <= 0x0bba5cd9 (+2^27.5519)
MONTRED r4, r3
    //// bounds:  -0x0003dba (-2^13.9478) <= r4  <= 0x00003dba (+2^13.9478)
str.w r4, [r0, #2040]
/* computing z1 = x1y0 + x0y1 + zeta^170 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x19b81a0 (-2^24.6848) <= r4  <= 0x019b81a0 (+2^24.6848)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb769b39 (-2^27.5190) <= r4  <= 0x0b769b39 (+2^27.5190)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1551b4d2 (-2^28.4141) <= r4  <= 0x1551b4d2 (+2^28.4141)
MONTRED r4, r3
    //// bounds:  -0x0004751 (-2^14.1562) <= r4  <= 0x00004752 (+2^14.1562)
str.w r4, [r0, #2044]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2048]
ldr.w r10, [r1, #2052]
ldr.w r9, [r1, #2056]
ldr.w r8, [r1, #2060]
ldr.w r7, [r2, #2052]
ldr.w r6, [r2, #2056]
ldr.w r5, [r2, #2060]
/*** basemul 171 ***/
/* computing z0 = x0y0 + zeta^171 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-1760
mul.w r4, r4, r14
    //// bounds:  -0x1df4340 (-2^24.9047) <= r4  <= 0x01df4340 (+2^24.9047)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbba5cd9 (-2^27.5519) <= r4  <= 0x0bba5cd9 (+2^27.5519)
MONTRED r4, r3
    //// bounds:  -0x0003dba (-2^13.9478) <= r4  <= 0x00003dba (+2^13.9478)
str.w r4, [r0, #2052]
/* computing z1 = x1y0 + x0y1 + zeta^171 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x19b81a0 (-2^24.6848) <= r4  <= 0x019b81a0 (+2^24.6848)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb769b39 (-2^27.5190) <= r4  <= 0x0b769b39 (+2^27.5190)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1551b4d2 (-2^28.4141) <= r4  <= 0x1551b4d2 (+2^28.4141)
MONTRED r4, r3
    //// bounds:  -0x0004751 (-2^14.1562) <= r4  <= 0x00004752 (+2^14.1562)
str.w r4, [r0, #2056]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2060]
ldr.w r10, [r1, #2064]
ldr.w r9, [r1, #2068]
ldr.w r8, [r1, #2072]
ldr.w r7, [r2, #2064]
ldr.w r6, [r2, #2068]
ldr.w r5, [r2, #2072]
/*** basemul 172 ***/
/* computing z0 = x0y0 + zeta^172 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-12640
mul.w r4, r4, r14
    //// bounds:  -0xd71fa40 (-2^27.7490) <= r4  <= 0x0d71fa40 (+2^27.7490)
mla.w r4, r10, r7, r4
    //// bounds:  -0x174d13d9 (-2^28.5423) <= r4  <= 0x174d13d9 (+2^28.5423)
MONTRED r4, r3
    //// bounds:  -0x000494d (-2^14.1958) <= r4  <= 0x0000494d (+2^14.1958)
str.w r4, [r0, #2064]
/* computing z1 = x1y0 + x0y1 + zeta^172 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb8b5d20 (-2^27.5291) <= r4  <= 0x0b8b5d20 (+2^27.5291)
mla.w r4, r9, r7, r4
    //// bounds:  -0x156676b9 (-2^28.4196) <= r4  <= 0x156676b9 (+2^28.4196)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1f419052 (-2^28.9661) <= r4  <= 0x1f419052 (+2^28.9661)
MONTRED r4, r3
    //// bounds:  -0x0005141 (-2^14.3444) <= r4  <= 0x00005142 (+2^14.3444)
str.w r4, [r0, #2068]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2072]
ldr.w r10, [r1, #2076]
ldr.w r9, [r1, #2080]
ldr.w r8, [r1, #2084]
ldr.w r7, [r2, #2076]
ldr.w r6, [r2, #2080]
ldr.w r5, [r2, #2084]
/*** basemul 173 ***/
/* computing z0 = x0y0 + zeta^173 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =12640
mul.w r4, r4, r14
    //// bounds:  -0xd71fa40 (-2^27.7490) <= r4  <= 0x0d71fa40 (+2^27.7490)
mla.w r4, r10, r7, r4
    //// bounds:  -0x174d13d9 (-2^28.5423) <= r4  <= 0x174d13d9 (+2^28.5423)
MONTRED r4, r3
    //// bounds:  -0x000494d (-2^14.1958) <= r4  <= 0x0000494d (+2^14.1958)
str.w r4, [r0, #2076]
/* computing z1 = x1y0 + x0y1 + zeta^173 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb8b5d20 (-2^27.5291) <= r4  <= 0x0b8b5d20 (+2^27.5291)
mla.w r4, r9, r7, r4
    //// bounds:  -0x156676b9 (-2^28.4196) <= r4  <= 0x156676b9 (+2^28.4196)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1f419052 (-2^28.9661) <= r4  <= 0x1f419052 (+2^28.9661)
MONTRED r4, r3
    //// bounds:  -0x0005141 (-2^14.3444) <= r4  <= 0x00005142 (+2^14.3444)
str.w r4, [r0, #2080]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2084]
ldr.w r10, [r1, #2088]
ldr.w r9, [r1, #2092]
ldr.w r8, [r1, #2096]
ldr.w r7, [r2, #2088]
ldr.w r6, [r2, #2092]
ldr.w r5, [r2, #2096]
/*** basemul 174 ***/
/* computing z0 = x0y0 + zeta^174 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =79
mul.w r4, r4, r14
    //// bounds:  -0x015832a (-2^20.4271) <= r4  <= 0x0015832a (+2^20.4271)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9f09cc3 (-2^27.3132) <= r4  <= 0x09f09cc3 (+2^27.3132)
MONTRED r4, r3
    //// bounds:  -0x0003bf0 (-2^13.9054) <= r4  <= 0x00003bf1 (+2^13.9055)
str.w r4, [r0, #2088]
/* computing z1 = x1y0 + x0y1 + zeta^174 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0127895 (-2^20.2072) <= r4  <= 0x00127895 (+2^20.2072)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9ed922e (-2^27.3115) <= r4  <= 0x09ed922e (+2^27.3115)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13c8abc7 (-2^28.3063) <= r4  <= 0x13c8abc7 (+2^28.3063)
MONTRED r4, r3
    //// bounds:  -0x00045c8 (-2^14.1248) <= r4  <= 0x000045c9 (+2^14.1248)
str.w r4, [r0, #2092]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2096]
ldr.w r10, [r1, #2100]
ldr.w r9, [r1, #2104]
ldr.w r8, [r1, #2108]
ldr.w r7, [r2, #2100]
ldr.w r6, [r2, #2104]
ldr.w r5, [r2, #2108]
/*** basemul 175 ***/
/* computing z0 = x0y0 + zeta^175 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-79
mul.w r4, r4, r14
    //// bounds:  -0x015832a (-2^20.4271) <= r4  <= 0x0015832a (+2^20.4271)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9f09cc3 (-2^27.3132) <= r4  <= 0x09f09cc3 (+2^27.3132)
MONTRED r4, r3
    //// bounds:  -0x0003bf0 (-2^13.9054) <= r4  <= 0x00003bf1 (+2^13.9055)
str.w r4, [r0, #2100]
/* computing z1 = x1y0 + x0y1 + zeta^175 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0127895 (-2^20.2072) <= r4  <= 0x00127895 (+2^20.2072)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9ed922e (-2^27.3115) <= r4  <= 0x09ed922e (+2^27.3115)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13c8abc7 (-2^28.3063) <= r4  <= 0x13c8abc7 (+2^28.3063)
MONTRED r4, r3
    //// bounds:  -0x00045c8 (-2^14.1248) <= r4  <= 0x000045c9 (+2^14.1248)
str.w r4, [r0, #2104]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2108]
ldr.w r10, [r1, #2112]
ldr.w r9, [r1, #2116]
ldr.w r8, [r1, #2120]
ldr.w r7, [r2, #2112]
ldr.w r6, [r2, #2116]
ldr.w r5, [r2, #2120]
/*** basemul 176 ***/
/* computing z0 = x0y0 + zeta^176 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10452
mul.w r4, r4, r14
    //// bounds:  -0xb1e2ab8 (-2^27.4748) <= r4  <= 0x0b1e2ab8 (+2^27.4748)
mla.w r4, r10, r7, r4
    //// bounds:  -0x14f94451 (-2^28.3905) <= r4  <= 0x14f94451 (+2^28.3905)
MONTRED r4, r3
    //// bounds:  -0x00046f9 (-2^14.1492) <= r4  <= 0x000046f9 (+2^14.1492)
str.w r4, [r0, #2112]
/* computing z1 = x1y0 + x0y1 + zeta^176 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x98bc95c (-2^27.2549) <= r4  <= 0x098bc95c (+2^27.2549)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1366e2f5 (-2^28.2781) <= r4  <= 0x1366e2f5 (+2^28.2781)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d41fc8e (-2^28.8707) <= r4  <= 0x1d41fc8e (+2^28.8707)
MONTRED r4, r3
    //// bounds:  -0x0004f42 (-2^14.3085) <= r4  <= 0x00004f42 (+2^14.3085)
str.w r4, [r0, #2116]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2120]
ldr.w r10, [r1, #2124]
ldr.w r9, [r1, #2128]
ldr.w r8, [r1, #2132]
ldr.w r7, [r2, #2124]
ldr.w r6, [r2, #2128]
ldr.w r5, [r2, #2132]
/*** basemul 177 ***/
/* computing z0 = x0y0 + zeta^177 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10452
mul.w r4, r4, r14
    //// bounds:  -0xb1e2ab8 (-2^27.4748) <= r4  <= 0x0b1e2ab8 (+2^27.4748)
mla.w r4, r10, r7, r4
    //// bounds:  -0x14f94451 (-2^28.3905) <= r4  <= 0x14f94451 (+2^28.3905)
MONTRED r4, r3
    //// bounds:  -0x00046f9 (-2^14.1492) <= r4  <= 0x000046f9 (+2^14.1492)
str.w r4, [r0, #2124]
/* computing z1 = x1y0 + x0y1 + zeta^177 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x98bc95c (-2^27.2549) <= r4  <= 0x098bc95c (+2^27.2549)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1366e2f5 (-2^28.2781) <= r4  <= 0x1366e2f5 (+2^28.2781)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d41fc8e (-2^28.8707) <= r4  <= 0x1d41fc8e (+2^28.8707)
MONTRED r4, r3
    //// bounds:  -0x0004f42 (-2^14.3085) <= r4  <= 0x00004f42 (+2^14.3085)
str.w r4, [r0, #2128]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2132]
ldr.w r10, [r1, #2136]
ldr.w r9, [r1, #2140]
ldr.w r8, [r1, #2144]
ldr.w r7, [r2, #2136]
ldr.w r6, [r2, #2140]
ldr.w r5, [r2, #2144]
/*** basemul 178 ***/
/* computing z0 = x0y0 + zeta^178 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8255
mul.w r4, r4, r14
    //// bounds:  -0x8c7e7ca (-2^27.1344) <= r4  <= 0x08c7e7ca (+2^27.1344)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12a30163 (-2^28.2201) <= r4  <= 0x12a30163 (+2^28.2201)
MONTRED r4, r3
    //// bounds:  -0x00044a3 (-2^14.1009) <= r4  <= 0x000044a3 (+2^14.1009)
str.w r4, [r0, #2136]
/* computing z1 = x1y0 + x0y1 + zeta^178 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x78a1ae5 (-2^26.9145) <= r4  <= 0x078a1ae5 (+2^26.9145)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1165347e (-2^28.1206) <= r4  <= 0x1165347e (+2^28.1206)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b404e17 (-2^28.7682) <= r4  <= 0x1b404e17 (+2^28.7682)
MONTRED r4, r3
    //// bounds:  -0x0004d40 (-2^14.2715) <= r4  <= 0x00004d40 (+2^14.2715)
str.w r4, [r0, #2140]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2144]
ldr.w r10, [r1, #2148]
ldr.w r9, [r1, #2152]
ldr.w r8, [r1, #2156]
ldr.w r7, [r2, #2148]
ldr.w r6, [r2, #2152]
ldr.w r5, [r2, #2156]
/*** basemul 179 ***/
/* computing z0 = x0y0 + zeta^179 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8255
mul.w r4, r4, r14
    //// bounds:  -0x8c7e7ca (-2^27.1344) <= r4  <= 0x08c7e7ca (+2^27.1344)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12a30163 (-2^28.2201) <= r4  <= 0x12a30163 (+2^28.2201)
MONTRED r4, r3
    //// bounds:  -0x00044a3 (-2^14.1009) <= r4  <= 0x000044a3 (+2^14.1009)
str.w r4, [r0, #2148]
/* computing z1 = x1y0 + x0y1 + zeta^179 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x78a1ae5 (-2^26.9145) <= r4  <= 0x078a1ae5 (+2^26.9145)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1165347e (-2^28.1206) <= r4  <= 0x1165347e (+2^28.1206)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b404e17 (-2^28.7682) <= r4  <= 0x1b404e17 (+2^28.7682)
MONTRED r4, r3
    //// bounds:  -0x0004d40 (-2^14.2715) <= r4  <= 0x00004d40 (+2^14.2715)
str.w r4, [r0, #2152]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2156]
ldr.w r10, [r1, #2160]
ldr.w r9, [r1, #2164]
ldr.w r8, [r1, #2168]
ldr.w r7, [r2, #2160]
ldr.w r6, [r2, #2164]
ldr.w r5, [r2, #2168]
/*** basemul 180 ***/
/* computing z0 = x0y0 + zeta^180 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10535
mul.w r4, r4, r14
    //// bounds:  -0xb34c4ba (-2^27.4862) <= r4  <= 0x0b34c4ba (+2^27.4862)
mla.w r4, r10, r7, r4
    //// bounds:  -0x150fde53 (-2^28.3966) <= r4  <= 0x150fde53 (+2^28.3966)
MONTRED r4, r3
    //// bounds:  -0x000470f (-2^14.1509) <= r4  <= 0x00004710 (+2^14.1510)
str.w r4, [r0, #2160]
/* computing z1 = x1y0 + x0y1 + zeta^180 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x99f315d (-2^27.2663) <= r4  <= 0x099f315d (+2^27.2663)
mla.w r4, r9, r7, r4
    //// bounds:  -0x137a4af6 (-2^28.2838) <= r4  <= 0x137a4af6 (+2^28.2838)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d55648f (-2^28.8745) <= r4  <= 0x1d55648f (+2^28.8745)
MONTRED r4, r3
    //// bounds:  -0x0004f55 (-2^14.3098) <= r4  <= 0x00004f55 (+2^14.3098)
str.w r4, [r0, #2164]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2168]
ldr.w r10, [r1, #2172]
ldr.w r9, [r1, #2176]
ldr.w r8, [r1, #2180]
ldr.w r7, [r2, #2172]
ldr.w r6, [r2, #2176]
ldr.w r5, [r2, #2180]
/*** basemul 181 ***/
/* computing z0 = x0y0 + zeta^181 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10535
mul.w r4, r4, r14
    //// bounds:  -0xb34c4ba (-2^27.4862) <= r4  <= 0x0b34c4ba (+2^27.4862)
mla.w r4, r10, r7, r4
    //// bounds:  -0x150fde53 (-2^28.3966) <= r4  <= 0x150fde53 (+2^28.3966)
MONTRED r4, r3
    //// bounds:  -0x000470f (-2^14.1509) <= r4  <= 0x00004710 (+2^14.1510)
str.w r4, [r0, #2172]
/* computing z1 = x1y0 + x0y1 + zeta^181 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x99f315d (-2^27.2663) <= r4  <= 0x099f315d (+2^27.2663)
mla.w r4, r9, r7, r4
    //// bounds:  -0x137a4af6 (-2^28.2838) <= r4  <= 0x137a4af6 (+2^28.2838)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d55648f (-2^28.8745) <= r4  <= 0x1d55648f (+2^28.8745)
MONTRED r4, r3
    //// bounds:  -0x0004f55 (-2^14.3098) <= r4  <= 0x00004f55 (+2^14.3098)
str.w r4, [r0, #2176]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2180]
ldr.w r10, [r1, #2184]
ldr.w r9, [r1, #2188]
ldr.w r8, [r1, #2192]
ldr.w r7, [r2, #2184]
ldr.w r6, [r2, #2188]
ldr.w r5, [r2, #2192]
/*** basemul 182 ***/
/* computing z0 = x0y0 + zeta^182 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4066
mul.w r4, r4, r14
    //// bounds:  -0x45334ac (-2^26.1127) <= r4  <= 0x045334ac (+2^26.1127)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe2e4e45 (-2^27.8259) <= r4  <= 0x0e2e4e45 (+2^27.8259)
MONTRED r4, r3
    //// bounds:  -0x000402e (-2^14.0040) <= r4  <= 0x0000402e (+2^14.0040)
str.w r4, [r0, #2184]
/* computing z1 = x1y0 + x0y1 + zeta^182 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3b6ac56 (-2^25.8928) <= r4  <= 0x03b6ac56 (+2^25.8928)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd91c5ef (-2^27.7623) <= r4  <= 0x0d91c5ef (+2^27.7623)
mla.w r4, r10, r6, r4
    //// bounds:  -0x176cdf88 (-2^28.5500) <= r4  <= 0x176cdf88 (+2^28.5500)
MONTRED r4, r3
    //// bounds:  -0x000496c (-2^14.1981) <= r4  <= 0x0000496d (+2^14.1982)
str.w r4, [r0, #2188]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2192]
ldr.w r10, [r1, #2196]
ldr.w r9, [r1, #2200]
ldr.w r8, [r1, #2204]
ldr.w r7, [r2, #2196]
ldr.w r6, [r2, #2200]
ldr.w r5, [r2, #2204]
/*** basemul 183 ***/
/* computing z0 = x0y0 + zeta^183 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4066
mul.w r4, r4, r14
    //// bounds:  -0x45334ac (-2^26.1127) <= r4  <= 0x045334ac (+2^26.1127)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe2e4e45 (-2^27.8259) <= r4  <= 0x0e2e4e45 (+2^27.8259)
MONTRED r4, r3
    //// bounds:  -0x000402e (-2^14.0040) <= r4  <= 0x0000402e (+2^14.0040)
str.w r4, [r0, #2196]
/* computing z1 = x1y0 + x0y1 + zeta^183 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3b6ac56 (-2^25.8928) <= r4  <= 0x03b6ac56 (+2^25.8928)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd91c5ef (-2^27.7623) <= r4  <= 0x0d91c5ef (+2^27.7623)
mla.w r4, r10, r6, r4
    //// bounds:  -0x176cdf88 (-2^28.5500) <= r4  <= 0x176cdf88 (+2^28.5500)
MONTRED r4, r3
    //// bounds:  -0x000496c (-2^14.1981) <= r4  <= 0x0000496d (+2^14.1982)
str.w r4, [r0, #2200]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2204]
ldr.w r10, [r1, #2208]
ldr.w r9, [r1, #2212]
ldr.w r8, [r1, #2216]
ldr.w r7, [r2, #2208]
ldr.w r6, [r2, #2212]
ldr.w r5, [r2, #2216]
/*** basemul 184 ***/
/* computing z0 = x0y0 + zeta^184 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8154
mul.w r4, r4, r14
    //// bounds:  -0x8ac66fc (-2^27.1166) <= r4  <= 0x08ac66fc (+2^27.1166)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12878095 (-2^28.2117) <= r4  <= 0x12878095 (+2^28.2117)
MONTRED r4, r3
    //// bounds:  -0x0004487 (-2^14.0986) <= r4  <= 0x00004488 (+2^14.0987)
str.w r4, [r0, #2208]
/* computing z1 = x1y0 + x0y1 + zeta^184 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x7727d7e (-2^26.8967) <= r4  <= 0x07727d7e (+2^26.8967)
mla.w r4, r9, r7, r4
    //// bounds:  -0x114d9717 (-2^28.1130) <= r4  <= 0x114d9717 (+2^28.1130)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b28b0b0 (-2^28.7634) <= r4  <= 0x1b28b0b0 (+2^28.7634)
MONTRED r4, r3
    //// bounds:  -0x0004d28 (-2^14.2697) <= r4  <= 0x00004d29 (+2^14.2698)
str.w r4, [r0, #2212]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2216]
ldr.w r10, [r1, #2220]
ldr.w r9, [r1, #2224]
ldr.w r8, [r1, #2228]
ldr.w r7, [r2, #2220]
ldr.w r6, [r2, #2224]
ldr.w r5, [r2, #2228]
/*** basemul 185 ***/
/* computing z0 = x0y0 + zeta^185 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8154
mul.w r4, r4, r14
    //// bounds:  -0x8ac66fc (-2^27.1166) <= r4  <= 0x08ac66fc (+2^27.1166)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12878095 (-2^28.2117) <= r4  <= 0x12878095 (+2^28.2117)
MONTRED r4, r3
    //// bounds:  -0x0004487 (-2^14.0986) <= r4  <= 0x00004488 (+2^14.0987)
str.w r4, [r0, #2220]
/* computing z1 = x1y0 + x0y1 + zeta^185 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x7727d7e (-2^26.8967) <= r4  <= 0x07727d7e (+2^26.8967)
mla.w r4, r9, r7, r4
    //// bounds:  -0x114d9717 (-2^28.1130) <= r4  <= 0x114d9717 (+2^28.1130)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b28b0b0 (-2^28.7634) <= r4  <= 0x1b28b0b0 (+2^28.7634)
MONTRED r4, r3
    //// bounds:  -0x0004d28 (-2^14.2697) <= r4  <= 0x00004d29 (+2^14.2698)
str.w r4, [r0, #2224]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2228]
ldr.w r10, [r1, #2232]
ldr.w r9, [r1, #2236]
ldr.w r8, [r1, #2240]
ldr.w r7, [r2, #2232]
ldr.w r6, [r2, #2236]
ldr.w r5, [r2, #2240]
/*** basemul 186 ***/
/* computing z0 = x0y0 + zeta^186 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =1011
mul.w r4, r4, r14
    //// bounds:  -0x1134dc2 (-2^24.1049) <= r4  <= 0x01134dc2 (+2^24.1049)
mla.w r4, r10, r7, r4
    //// bounds:  -0xaee675b (-2^27.4504) <= r4  <= 0x0aee675b (+2^27.4504)
MONTRED r4, r3
    //// bounds:  -0x0003cee (-2^13.9291) <= r4  <= 0x00003cee (+2^13.9291)
str.w r4, [r0, #2232]
/* computing z1 = x1y0 + x0y1 + zeta^186 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0ec61e1 (-2^23.8850) <= r4  <= 0x00ec61e1 (+2^23.8850)
mla.w r4, r9, r7, r4
    //// bounds:  -0xac77b7a (-2^27.4302) <= r4  <= 0x0ac77b7a (+2^27.4302)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14a29513 (-2^28.3670) <= r4  <= 0x14a29513 (+2^28.3670)
MONTRED r4, r3
    //// bounds:  -0x00046a2 (-2^14.1423) <= r4  <= 0x000046a3 (+2^14.1423)
str.w r4, [r0, #2236]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2240]
ldr.w r10, [r1, #2244]
ldr.w r9, [r1, #2248]
ldr.w r8, [r1, #2252]
ldr.w r7, [r2, #2244]
ldr.w r6, [r2, #2248]
ldr.w r5, [r2, #2252]
/*** basemul 187 ***/
/* computing z0 = x0y0 + zeta^187 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-1011
mul.w r4, r4, r14
    //// bounds:  -0x1134dc2 (-2^24.1049) <= r4  <= 0x01134dc2 (+2^24.1049)
mla.w r4, r10, r7, r4
    //// bounds:  -0xaee675b (-2^27.4504) <= r4  <= 0x0aee675b (+2^27.4504)
MONTRED r4, r3
    //// bounds:  -0x0003cee (-2^13.9291) <= r4  <= 0x00003cee (+2^13.9291)
str.w r4, [r0, #2244]
/* computing z1 = x1y0 + x0y1 + zeta^187 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x0ec61e1 (-2^23.8850) <= r4  <= 0x00ec61e1 (+2^23.8850)
mla.w r4, r9, r7, r4
    //// bounds:  -0xac77b7a (-2^27.4302) <= r4  <= 0x0ac77b7a (+2^27.4302)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14a29513 (-2^28.3670) <= r4  <= 0x14a29513 (+2^28.3670)
MONTRED r4, r3
    //// bounds:  -0x00046a2 (-2^14.1423) <= r4  <= 0x000046a3 (+2^14.1423)
str.w r4, [r0, #2248]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2252]
ldr.w r10, [r1, #2256]
ldr.w r9, [r1, #2260]
ldr.w r8, [r1, #2264]
ldr.w r7, [r2, #2256]
ldr.w r6, [r2, #2260]
ldr.w r5, [r2, #2264]
/*** basemul 188 ***/
/* computing z0 = x0y0 + zeta^188 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4376
mul.w r4, r4, r14
    //// bounds:  -0x4a79f10 (-2^26.2187) <= r4  <= 0x04a79f10 (+2^26.2187)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe82b8a9 (-2^27.8590) <= r4  <= 0x0e82b8a9 (+2^27.8590)
MONTRED r4, r3
    //// bounds:  -0x0004082 (-2^14.0114) <= r4  <= 0x00004083 (+2^14.0115)
str.w r4, [r0, #2256]
/* computing z1 = x1y0 + x0y1 + zeta^188 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3ff2788 (-2^25.9988) <= r4  <= 0x03ff2788 (+2^25.9988)
mla.w r4, r9, r7, r4
    //// bounds:  -0xdda4121 (-2^27.7921) <= r4  <= 0x0dda4121 (+2^27.7921)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17b55aba (-2^28.5673) <= r4  <= 0x17b55aba (+2^28.5673)
MONTRED r4, r3
    //// bounds:  -0x00049b5 (-2^14.2037) <= r4  <= 0x000049b5 (+2^14.2037)
str.w r4, [r0, #2260]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2264]
ldr.w r10, [r1, #2268]
ldr.w r9, [r1, #2272]
ldr.w r8, [r1, #2276]
ldr.w r7, [r2, #2268]
ldr.w r6, [r2, #2272]
ldr.w r5, [r2, #2276]
/*** basemul 189 ***/
/* computing z0 = x0y0 + zeta^189 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4376
mul.w r4, r4, r14
    //// bounds:  -0x4a79f10 (-2^26.2187) <= r4  <= 0x04a79f10 (+2^26.2187)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe82b8a9 (-2^27.8590) <= r4  <= 0x0e82b8a9 (+2^27.8590)
MONTRED r4, r3
    //// bounds:  -0x0004082 (-2^14.0114) <= r4  <= 0x00004083 (+2^14.0115)
str.w r4, [r0, #2268]
/* computing z1 = x1y0 + x0y1 + zeta^189 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3ff2788 (-2^25.9988) <= r4  <= 0x03ff2788 (+2^25.9988)
mla.w r4, r9, r7, r4
    //// bounds:  -0xdda4121 (-2^27.7921) <= r4  <= 0x0dda4121 (+2^27.7921)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17b55aba (-2^28.5673) <= r4  <= 0x17b55aba (+2^28.5673)
MONTRED r4, r3
    //// bounds:  -0x00049b5 (-2^14.2037) <= r4  <= 0x000049b5 (+2^14.2037)
str.w r4, [r0, #2272]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2276]
ldr.w r10, [r1, #2280]
ldr.w r9, [r1, #2284]
ldr.w r8, [r1, #2288]
ldr.w r7, [r2, #2280]
ldr.w r6, [r2, #2284]
ldr.w r5, [r2, #2288]
/*** basemul 190 ***/
/* computing z0 = x0y0 + zeta^190 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8933
mul.w r4, r4, r14
    //// bounds:  -0x98087ce (-2^27.2482) <= r4  <= 0x098087ce (+2^27.2482)
mla.w r4, r10, r7, r4
    //// bounds:  -0x135ba167 (-2^28.2749) <= r4  <= 0x135ba167 (+2^28.2749)
MONTRED r4, r3
    //// bounds:  -0x000455b (-2^14.1159) <= r4  <= 0x0000455c (+2^14.1160)
str.w r4, [r0, #2280]
/* computing z1 = x1y0 + x0y1 + zeta^190 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x828a0e7 (-2^27.0283) <= r4  <= 0x0828a0e7 (+2^27.0283)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1203ba80 (-2^28.1711) <= r4  <= 0x1203ba80 (+2^28.1711)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1bded419 (-2^28.8007) <= r4  <= 0x1bded419 (+2^28.8007)
MONTRED r4, r3
    //// bounds:  -0x0004dde (-2^14.2829) <= r4  <= 0x00004ddf (+2^14.2830)
str.w r4, [r0, #2284]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2288]
ldr.w r10, [r1, #2292]
ldr.w r9, [r1, #2296]
ldr.w r8, [r1, #2300]
ldr.w r7, [r2, #2292]
ldr.w r6, [r2, #2296]
ldr.w r5, [r2, #2300]
/*** basemul 191 ***/
/* computing z0 = x0y0 + zeta^191 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8933
mul.w r4, r4, r14
    //// bounds:  -0x98087ce (-2^27.2482) <= r4  <= 0x098087ce (+2^27.2482)
mla.w r4, r10, r7, r4
    //// bounds:  -0x135ba167 (-2^28.2749) <= r4  <= 0x135ba167 (+2^28.2749)
MONTRED r4, r3
    //// bounds:  -0x000455b (-2^14.1159) <= r4  <= 0x0000455c (+2^14.1160)
str.w r4, [r0, #2292]
/* computing z1 = x1y0 + x0y1 + zeta^191 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x828a0e7 (-2^27.0283) <= r4  <= 0x0828a0e7 (+2^27.0283)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1203ba80 (-2^28.1711) <= r4  <= 0x1203ba80 (+2^28.1711)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1bded419 (-2^28.8007) <= r4  <= 0x1bded419 (+2^28.8007)
MONTRED r4, r3
    //// bounds:  -0x0004dde (-2^14.2829) <= r4  <= 0x00004ddf (+2^14.2830)
str.w r4, [r0, #2296]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2300]
ldr.w r10, [r1, #2304]
ldr.w r9, [r1, #2308]
ldr.w r8, [r1, #2312]
ldr.w r7, [r2, #2304]
ldr.w r6, [r2, #2308]
ldr.w r5, [r2, #2312]
/*** basemul 192 ***/
/* computing z0 = x0y0 + zeta^192 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4206
mul.w r4, r4, r14
    //// bounds:  -0x4795434 (-2^26.1615) <= r4  <= 0x04795434 (+2^26.1615)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe546dcd (-2^27.8409) <= r4  <= 0x0e546dcd (+2^27.8409)
MONTRED r4, r3
    //// bounds:  -0x0004054 (-2^14.0074) <= r4  <= 0x00004054 (+2^14.0074)
str.w r4, [r0, #2304]
/* computing z1 = x1y0 + x0y1 + zeta^192 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3d7681a (-2^25.9416) <= r4  <= 0x03d7681a (+2^25.9416)
mla.w r4, r9, r7, r4
    //// bounds:  -0xdb281b3 (-2^27.7758) <= r4  <= 0x0db281b3 (+2^27.7758)
mla.w r4, r10, r6, r4
    //// bounds:  -0x178d9b4c (-2^28.5578) <= r4  <= 0x178d9b4c (+2^28.5578)
MONTRED r4, r3
    //// bounds:  -0x000498d (-2^14.2007) <= r4  <= 0x0000498e (+2^14.2007)
str.w r4, [r0, #2308]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2312]
ldr.w r10, [r1, #2316]
ldr.w r9, [r1, #2320]
ldr.w r8, [r1, #2324]
ldr.w r7, [r2, #2316]
ldr.w r6, [r2, #2320]
ldr.w r5, [r2, #2324]
/*** basemul 193 ***/
/* computing z0 = x0y0 + zeta^193 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4206
mul.w r4, r4, r14
    //// bounds:  -0x4795434 (-2^26.1615) <= r4  <= 0x04795434 (+2^26.1615)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe546dcd (-2^27.8409) <= r4  <= 0x0e546dcd (+2^27.8409)
MONTRED r4, r3
    //// bounds:  -0x0004054 (-2^14.0074) <= r4  <= 0x00004054 (+2^14.0074)
str.w r4, [r0, #2316]
/* computing z1 = x1y0 + x0y1 + zeta^193 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3d7681a (-2^25.9416) <= r4  <= 0x03d7681a (+2^25.9416)
mla.w r4, r9, r7, r4
    //// bounds:  -0xdb281b3 (-2^27.7758) <= r4  <= 0x0db281b3 (+2^27.7758)
mla.w r4, r10, r6, r4
    //// bounds:  -0x178d9b4c (-2^28.5578) <= r4  <= 0x178d9b4c (+2^28.5578)
MONTRED r4, r3
    //// bounds:  -0x000498d (-2^14.2007) <= r4  <= 0x0000498e (+2^14.2007)
str.w r4, [r0, #2320]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2324]
ldr.w r10, [r1, #2328]
ldr.w r9, [r1, #2332]
ldr.w r8, [r1, #2336]
ldr.w r7, [r2, #2328]
ldr.w r6, [r2, #2332]
ldr.w r5, [r2, #2336]
/*** basemul 194 ***/
/* computing z0 = x0y0 + zeta^194 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7334
mul.w r4, r4, r14
    //// bounds:  -0x7cd1c04 (-2^26.9637) <= r4  <= 0x07cd1c04 (+2^26.9637)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11a8359d (-2^28.1422) <= r4  <= 0x11a8359d (+2^28.1422)
MONTRED r4, r3
    //// bounds:  -0x00043a8 (-2^14.0802) <= r4  <= 0x000043a8 (+2^14.0802)
str.w r4, [r0, #2328]
/* computing z1 = x1y0 + x0y1 + zeta^194 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6b2c402 (-2^26.7438) <= r4  <= 0x06b2c402 (+2^26.7438)
mla.w r4, r9, r7, r4
    //// bounds:  -0x108ddd9b (-2^28.0491) <= r4  <= 0x108ddd9b (+2^28.0491)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a68f734 (-2^28.7230) <= r4  <= 0x1a68f734 (+2^28.7230)
MONTRED r4, r3
    //// bounds:  -0x0004c69 (-2^14.2557) <= r4  <= 0x00004c69 (+2^14.2557)
str.w r4, [r0, #2332]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2336]
ldr.w r10, [r1, #2340]
ldr.w r9, [r1, #2344]
ldr.w r8, [r1, #2348]
ldr.w r7, [r2, #2340]
ldr.w r6, [r2, #2344]
ldr.w r5, [r2, #2348]
/*** basemul 195 ***/
/* computing z0 = x0y0 + zeta^195 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7334
mul.w r4, r4, r14
    //// bounds:  -0x7cd1c04 (-2^26.9637) <= r4  <= 0x07cd1c04 (+2^26.9637)
mla.w r4, r10, r7, r4
    //// bounds:  -0x11a8359d (-2^28.1422) <= r4  <= 0x11a8359d (+2^28.1422)
MONTRED r4, r3
    //// bounds:  -0x00043a8 (-2^14.0802) <= r4  <= 0x000043a8 (+2^14.0802)
str.w r4, [r0, #2340]
/* computing z1 = x1y0 + x0y1 + zeta^195 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x6b2c402 (-2^26.7438) <= r4  <= 0x06b2c402 (+2^26.7438)
mla.w r4, r9, r7, r4
    //// bounds:  -0x108ddd9b (-2^28.0491) <= r4  <= 0x108ddd9b (+2^28.0491)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a68f734 (-2^28.7230) <= r4  <= 0x1a68f734 (+2^28.7230)
MONTRED r4, r3
    //// bounds:  -0x0004c69 (-2^14.2557) <= r4  <= 0x00004c69 (+2^14.2557)
str.w r4, [r0, #2344]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2348]
ldr.w r10, [r1, #2352]
ldr.w r9, [r1, #2356]
ldr.w r8, [r1, #2360]
ldr.w r7, [r2, #2352]
ldr.w r6, [r2, #2356]
ldr.w r5, [r2, #2360]
/*** basemul 196 ***/
/* computing z0 = x0y0 + zeta^196 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7840
mul.w r4, r4, r14
    //// bounds:  -0x856e5c0 (-2^27.0600) <= r4  <= 0x0856e5c0 (+2^27.0600)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1231ff59 (-2^28.1855) <= r4  <= 0x1231ff59 (+2^28.1855)
MONTRED r4, r3
    //// bounds:  -0x0004432 (-2^14.0916) <= r4  <= 0x00004432 (+2^14.0916)
str.w r4, [r0, #2352]
/* computing z1 = x1y0 + x0y1 + zeta^196 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x72912e0 (-2^26.8400) <= r4  <= 0x072912e0 (+2^26.8400)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11042c79 (-2^28.0888) <= r4  <= 0x11042c79 (+2^28.0888)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1adf4612 (-2^28.7480) <= r4  <= 0x1adf4612 (+2^28.7480)
MONTRED r4, r3
    //// bounds:  -0x0004cdf (-2^14.2644) <= r4  <= 0x00004cdf (+2^14.2644)
str.w r4, [r0, #2356]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2360]
ldr.w r10, [r1, #2364]
ldr.w r9, [r1, #2368]
ldr.w r8, [r1, #2372]
ldr.w r7, [r2, #2364]
ldr.w r6, [r2, #2368]
ldr.w r5, [r2, #2372]
/*** basemul 197 ***/
/* computing z0 = x0y0 + zeta^197 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7840
mul.w r4, r4, r14
    //// bounds:  -0x856e5c0 (-2^27.0600) <= r4  <= 0x0856e5c0 (+2^27.0600)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1231ff59 (-2^28.1855) <= r4  <= 0x1231ff59 (+2^28.1855)
MONTRED r4, r3
    //// bounds:  -0x0004432 (-2^14.0916) <= r4  <= 0x00004432 (+2^14.0916)
str.w r4, [r0, #2364]
/* computing z1 = x1y0 + x0y1 + zeta^197 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x72912e0 (-2^26.8400) <= r4  <= 0x072912e0 (+2^26.8400)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11042c79 (-2^28.0888) <= r4  <= 0x11042c79 (+2^28.0888)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1adf4612 (-2^28.7480) <= r4  <= 0x1adf4612 (+2^28.7480)
MONTRED r4, r3
    //// bounds:  -0x0004cdf (-2^14.2644) <= r4  <= 0x00004cdf (+2^14.2644)
str.w r4, [r0, #2368]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2372]
ldr.w r10, [r1, #2376]
ldr.w r9, [r1, #2380]
ldr.w r8, [r1, #2384]
ldr.w r7, [r2, #2376]
ldr.w r6, [r2, #2380]
ldr.w r5, [r2, #2384]
/*** basemul 198 ***/
/* computing z0 = x0y0 + zeta^198 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =49
mul.w r4, r4, r14
    //// bounds:  -0x00d57d6 (-2^19.7380) <= r4  <= 0x000d57d6 (+2^19.7380)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9e8716f (-2^27.3086) <= r4  <= 0x09e8716f (+2^27.3086)
MONTRED r4, r3
    //// bounds:  -0x0003be8 (-2^13.9046) <= r4  <= 0x00003be8 (+2^13.9046)
str.w r4, [r0, #2376]
/* computing z1 = x1y0 + x0y1 + zeta^198 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x00b74eb (-2^19.5181) <= r4  <= 0x000b74eb (+2^19.5181)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9e68e84 (-2^27.3075) <= r4  <= 0x09e68e84 (+2^27.3075)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13c1a81d (-2^28.3043) <= r4  <= 0x13c1a81d (+2^28.3043)
MONTRED r4, r3
    //// bounds:  -0x00045c1 (-2^14.1242) <= r4  <= 0x000045c2 (+2^14.1243)
str.w r4, [r0, #2380]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2384]
ldr.w r10, [r1, #2388]
ldr.w r9, [r1, #2392]
ldr.w r8, [r1, #2396]
ldr.w r7, [r2, #2388]
ldr.w r6, [r2, #2392]
ldr.w r5, [r2, #2396]
/*** basemul 199 ***/
/* computing z0 = x0y0 + zeta^199 * (x2y1 + x1y2) */
mul.w r4, r9, r5
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-49
mul.w r4, r4, r14
    //// bounds:  -0x00d57d6 (-2^19.7380) <= r4  <= 0x000d57d6 (+2^19.7380)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9e8716f (-2^27.3086) <= r4  <= 0x09e8716f (+2^27.3086)
MONTRED r4, r3
    //// bounds:  -0x0003be8 (-2^13.9046) <= r4  <= 0x00003be8 (+2^13.9046)
str.w r4, [r0, #2388]
/* computing z1 = x1y0 + x0y1 + zeta^199 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x00b74eb (-2^19.5181) <= r4  <= 0x000b74eb (+2^19.5181)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9e68e84 (-2^27.3075) <= r4  <= 0x09e68e84 (+2^27.3075)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13c1a81d (-2^28.3043) <= r4  <= 0x13c1a81d (+2^28.3043)
MONTRED r4, r3
    //// bounds:  -0x00045c1 (-2^14.1242) <= r4  <= 0x000045c2 (+2^14.1243)
str.w r4, [r0, #2392]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2396]
ldr.w r10, [r1, #2400]
ldr.w r9, [r1, #2404]
ldr.w r8, [r1, #2408]
ldr.w r7, [r2, #2400]
ldr.w r6, [r2, #2404]
ldr.w r5, [r2, #2408]
/*** basemul 200 ***/
/* computing z0 = x0y0 + zeta^200 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-481
mul.w r4, r4, r14
    //// bounds:  -0x082faf6 (-2^23.0332) <= r4  <= 0x0082faf6 (+2^23.0332)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa5e148f (-2^27.3740) <= r4  <= 0x0a5e148f (+2^27.3740)
MONTRED r4, r3
    //// bounds:  -0x0003c5e (-2^13.9157) <= r4  <= 0x00003c5e (+2^13.9157)
str.w r4, [r0, #2400]
/* computing z1 = x1y0 + x0y1 + zeta^200 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x070767b (-2^22.8133) <= r4  <= 0x0070767b (+2^22.8133)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa4b9014 (-2^27.3639) <= r4  <= 0x0a4b9014 (+2^27.3639)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1426a9ad (-2^28.3328) <= r4  <= 0x1426a9ad (+2^28.3328)
MONTRED r4, r3
    //// bounds:  -0x0004626 (-2^14.1323) <= r4  <= 0x00004627 (+2^14.1324)
str.w r4, [r0, #2404]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2408]
ldr.w r10, [r1, #2412]
ldr.w r9, [r1, #2416]
ldr.w r8, [r1, #2420]
ldr.w r7, [r2, #2412]
ldr.w r6, [r2, #2416]
ldr.w r5, [r2, #2420]
/*** basemul 201 ***/
/* computing z0 = x0y0 + zeta^201 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =481
mul.w r4, r4, r14
    //// bounds:  -0x082faf6 (-2^23.0332) <= r4  <= 0x0082faf6 (+2^23.0332)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa5e148f (-2^27.3740) <= r4  <= 0x0a5e148f (+2^27.3740)
MONTRED r4, r3
    //// bounds:  -0x0003c5e (-2^13.9157) <= r4  <= 0x00003c5e (+2^13.9157)
str.w r4, [r0, #2412]
/* computing z1 = x1y0 + x0y1 + zeta^201 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x070767b (-2^22.8133) <= r4  <= 0x0070767b (+2^22.8133)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa4b9014 (-2^27.3639) <= r4  <= 0x0a4b9014 (+2^27.3639)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1426a9ad (-2^28.3328) <= r4  <= 0x1426a9ad (+2^28.3328)
MONTRED r4, r3
    //// bounds:  -0x0004626 (-2^14.1323) <= r4  <= 0x00004627 (+2^14.1324)
str.w r4, [r0, #2416]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2420]
ldr.w r10, [r1, #2424]
ldr.w r9, [r1, #2428]
ldr.w r8, [r1, #2432]
ldr.w r7, [r2, #2424]
ldr.w r6, [r2, #2428]
ldr.w r5, [r2, #2432]
/*** basemul 202 ***/
/* computing z0 = x0y0 + zeta^202 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-157
mul.w r4, r4, r14
    //// bounds:  -0x02ac09e (-2^21.4179) <= r4  <= 0x002ac09e (+2^21.4179)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa05da37 (-2^27.3252) <= r4  <= 0x0a05da37 (+2^27.3252)
MONTRED r4, r3
    //// bounds:  -0x0003c05 (-2^13.9074) <= r4  <= 0x00003c06 (+2^13.9075)
str.w r4, [r0, #2424]
/* computing z1 = x1y0 + x0y1 + zeta^202 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x024b54f (-2^21.1980) <= r4  <= 0x0024b54f (+2^21.1980)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9ffcee8 (-2^27.3218) <= r4  <= 0x09ffcee8 (+2^27.3218)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13dae881 (-2^28.3114) <= r4  <= 0x13dae881 (+2^28.3114)
MONTRED r4, r3
    //// bounds:  -0x00045db (-2^14.1263) <= r4  <= 0x000045db (+2^14.1263)
str.w r4, [r0, #2428]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2432]
ldr.w r10, [r1, #2436]
ldr.w r9, [r1, #2440]
ldr.w r8, [r1, #2444]
ldr.w r7, [r2, #2436]
ldr.w r6, [r2, #2440]
ldr.w r5, [r2, #2444]
/*** basemul 203 ***/
/* computing z0 = x0y0 + zeta^203 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =157
mul.w r4, r4, r14
    //// bounds:  -0x02ac09e (-2^21.4179) <= r4  <= 0x002ac09e (+2^21.4179)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa05da37 (-2^27.3252) <= r4  <= 0x0a05da37 (+2^27.3252)
MONTRED r4, r3
    //// bounds:  -0x0003c05 (-2^13.9074) <= r4  <= 0x00003c06 (+2^13.9075)
str.w r4, [r0, #2436]
/* computing z1 = x1y0 + x0y1 + zeta^203 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x024b54f (-2^21.1980) <= r4  <= 0x0024b54f (+2^21.1980)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9ffcee8 (-2^27.3218) <= r4  <= 0x09ffcee8 (+2^27.3218)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13dae881 (-2^28.3114) <= r4  <= 0x13dae881 (+2^28.3114)
MONTRED r4, r3
    //// bounds:  -0x00045db (-2^14.1263) <= r4  <= 0x000045db (+2^14.1263)
str.w r4, [r0, #2440]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2444]
ldr.w r10, [r1, #2448]
ldr.w r9, [r1, #2452]
ldr.w r8, [r1, #2456]
ldr.w r7, [r2, #2448]
ldr.w r6, [r2, #2452]
ldr.w r5, [r2, #2456]
/*** basemul 204 ***/
/* computing z0 = x0y0 + zeta^204 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10437
mul.w r4, r4, r14
    //// bounds:  -0xb1a150e (-2^27.4727) <= r4  <= 0x0b1a150e (+2^27.4727)
mla.w r4, r10, r7, r4
    //// bounds:  -0x14f52ea7 (-2^28.3894) <= r4  <= 0x14f52ea7 (+2^28.3894)
MONTRED r4, r3
    //// bounds:  -0x00046f5 (-2^14.1489) <= r4  <= 0x000046f5 (+2^14.1489)
str.w r4, [r0, #2448]
/* computing z1 = x1y0 + x0y1 + zeta^204 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x9884787 (-2^27.2528) <= r4  <= 0x09884787 (+2^27.2528)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13636120 (-2^28.2771) <= r4  <= 0x13636120 (+2^28.2771)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d3e7ab9 (-2^28.8701) <= r4  <= 0x1d3e7ab9 (+2^28.8701)
MONTRED r4, r3
    //// bounds:  -0x0004f3e (-2^14.3082) <= r4  <= 0x00004f3e (+2^14.3082)
str.w r4, [r0, #2452]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2456]
ldr.w r10, [r1, #2460]
ldr.w r9, [r1, #2464]
ldr.w r8, [r1, #2468]
ldr.w r7, [r2, #2460]
ldr.w r6, [r2, #2464]
ldr.w r5, [r2, #2468]
/*** basemul 205 ***/
/* computing z0 = x0y0 + zeta^205 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10437
mul.w r4, r4, r14
    //// bounds:  -0xb1a150e (-2^27.4727) <= r4  <= 0x0b1a150e (+2^27.4727)
mla.w r4, r10, r7, r4
    //// bounds:  -0x14f52ea7 (-2^28.3894) <= r4  <= 0x14f52ea7 (+2^28.3894)
MONTRED r4, r3
    //// bounds:  -0x00046f5 (-2^14.1489) <= r4  <= 0x000046f5 (+2^14.1489)
str.w r4, [r0, #2460]
/* computing z1 = x1y0 + x0y1 + zeta^205 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x9884787 (-2^27.2528) <= r4  <= 0x09884787 (+2^27.2528)
mla.w r4, r9, r7, r4
    //// bounds:  -0x13636120 (-2^28.2771) <= r4  <= 0x13636120 (+2^28.2771)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d3e7ab9 (-2^28.8701) <= r4  <= 0x1d3e7ab9 (+2^28.8701)
MONTRED r4, r3
    //// bounds:  -0x0004f3e (-2^14.3082) <= r4  <= 0x00004f3e (+2^14.3082)
str.w r4, [r0, #2464]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2468]
ldr.w r10, [r1, #2472]
ldr.w r9, [r1, #2476]
ldr.w r8, [r1, #2480]
ldr.w r7, [r2, #2472]
ldr.w r6, [r2, #2476]
ldr.w r5, [r2, #2480]
/*** basemul 206 ***/
/* computing z0 = x0y0 + zeta^206 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =5855
mul.w r4, r4, r14
    //// bounds:  -0x63a5d8a (-2^26.6388) <= r4  <= 0x063a5d8a (+2^26.6388)
mla.w r4, r10, r7, r4
    //// bounds:  -0x10157723 (-2^28.0075) <= r4  <= 0x10157723 (+2^28.0075)
MONTRED r4, r3
    //// bounds:  -0x0004215 (-2^14.0462) <= r4  <= 0x00004215 (+2^14.0462)
str.w r4, [r0, #2472]
/* computing z1 = x1y0 + x0y1 + zeta^206 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x558f5c5 (-2^26.4189) <= r4  <= 0x0558f5c5 (+2^26.4189)
mla.w r4, r9, r7, r4
    //// bounds:  -0xf340f5e (-2^27.9263) <= r4  <= 0x0f340f5e (+2^27.9263)
mla.w r4, r10, r6, r4
    //// bounds:  -0x190f28f7 (-2^28.6473) <= r4  <= 0x190f28f7 (+2^28.6473)
MONTRED r4, r3
    //// bounds:  -0x0004b0f (-2^14.2299) <= r4  <= 0x00004b0f (+2^14.2299)
str.w r4, [r0, #2476]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2480]
ldr.w r10, [r1, #2484]
ldr.w r9, [r1, #2488]
ldr.w r8, [r1, #2492]
ldr.w r7, [r2, #2484]
ldr.w r6, [r2, #2488]
ldr.w r5, [r2, #2492]
/*** basemul 207 ***/
/* computing z0 = x0y0 + zeta^207 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-5855
mul.w r4, r4, r14
    //// bounds:  -0x63a5d8a (-2^26.6388) <= r4  <= 0x063a5d8a (+2^26.6388)
mla.w r4, r10, r7, r4
    //// bounds:  -0x10157723 (-2^28.0075) <= r4  <= 0x10157723 (+2^28.0075)
MONTRED r4, r3
    //// bounds:  -0x0004215 (-2^14.0462) <= r4  <= 0x00004215 (+2^14.0462)
str.w r4, [r0, #2484]
/* computing z1 = x1y0 + x0y1 + zeta^207 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x558f5c5 (-2^26.4189) <= r4  <= 0x0558f5c5 (+2^26.4189)
mla.w r4, r9, r7, r4
    //// bounds:  -0xf340f5e (-2^27.9263) <= r4  <= 0x0f340f5e (+2^27.9263)
mla.w r4, r10, r6, r4
    //// bounds:  -0x190f28f7 (-2^28.6473) <= r4  <= 0x190f28f7 (+2^28.6473)
MONTRED r4, r3
    //// bounds:  -0x0004b0f (-2^14.2299) <= r4  <= 0x00004b0f (+2^14.2299)
str.w r4, [r0, #2488]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2492]
ldr.w r10, [r1, #2496]
ldr.w r9, [r1, #2500]
ldr.w r8, [r1, #2504]
ldr.w r7, [r2, #2496]
ldr.w r6, [r2, #2500]
ldr.w r5, [r2, #2504]
/*** basemul 208 ***/
/* computing z0 = x0y0 + zeta^208 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-12511
mul.w r4, r4, r14
    //// bounds:  -0xd4ed98a (-2^27.7342) <= r4  <= 0x0d4ed98a (+2^27.7342)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1729f323 (-2^28.5338) <= r4  <= 0x1729f323 (+2^28.5338)
MONTRED r4, r3
    //// bounds:  -0x000492a (-2^14.1931) <= r4  <= 0x0000492a (+2^14.1931)
str.w r4, [r0, #2496]
/* computing z1 = x1y0 + x0y1 + zeta^208 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb6d33c5 (-2^27.5143) <= r4  <= 0x0b6d33c5 (+2^27.5143)
mla.w r4, r9, r7, r4
    //// bounds:  -0x15484d5e (-2^28.4116) <= r4  <= 0x15484d5e (+2^28.4116)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1f2366f7 (-2^28.9606) <= r4  <= 0x1f2366f7 (+2^28.9606)
MONTRED r4, r3
    //// bounds:  -0x0005123 (-2^14.3423) <= r4  <= 0x00005123 (+2^14.3423)
str.w r4, [r0, #2500]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2504]
ldr.w r10, [r1, #2508]
ldr.w r9, [r1, #2512]
ldr.w r8, [r1, #2516]
ldr.w r7, [r2, #2508]
ldr.w r6, [r2, #2512]
ldr.w r5, [r2, #2516]
/*** basemul 209 ***/
/* computing z0 = x0y0 + zeta^209 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =12511
mul.w r4, r4, r14
    //// bounds:  -0xd4ed98a (-2^27.7342) <= r4  <= 0x0d4ed98a (+2^27.7342)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1729f323 (-2^28.5338) <= r4  <= 0x1729f323 (+2^28.5338)
MONTRED r4, r3
    //// bounds:  -0x000492a (-2^14.1931) <= r4  <= 0x0000492a (+2^14.1931)
str.w r4, [r0, #2508]
/* computing z1 = x1y0 + x0y1 + zeta^209 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb6d33c5 (-2^27.5143) <= r4  <= 0x0b6d33c5 (+2^27.5143)
mla.w r4, r9, r7, r4
    //// bounds:  -0x15484d5e (-2^28.4116) <= r4  <= 0x15484d5e (+2^28.4116)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1f2366f7 (-2^28.9606) <= r4  <= 0x1f2366f7 (+2^28.9606)
MONTRED r4, r3
    //// bounds:  -0x0005123 (-2^14.3423) <= r4  <= 0x00005123 (+2^14.3423)
str.w r4, [r0, #2512]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2516]
ldr.w r10, [r1, #2520]
ldr.w r9, [r1, #2524]
ldr.w r8, [r1, #2528]
ldr.w r7, [r2, #2520]
ldr.w r6, [r2, #2524]
ldr.w r5, [r2, #2528]
/*** basemul 210 ***/
/* computing z0 = x0y0 + zeta^210 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4882
mul.w r4, r4, r14
    //// bounds:  -0x53168cc (-2^26.3766) <= r4  <= 0x053168cc (+2^26.3766)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf0c8265 (-2^27.9116) <= r4  <= 0x0f0c8265 (+2^27.9116)
MONTRED r4, r3
    //// bounds:  -0x000410c (-2^14.0234) <= r4  <= 0x0000410d (+2^14.0235)
str.w r4, [r0, #2520]
/* computing z1 = x1y0 + x0y1 + zeta^210 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4757666 (-2^26.1567) <= r4  <= 0x04757666 (+2^26.1567)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe508fff (-2^27.8394) <= r4  <= 0x0e508fff (+2^27.8394)
mla.w r4, r10, r6, r4
    //// bounds:  -0x182ba998 (-2^28.5952) <= r4  <= 0x182ba998 (+2^28.5952)
MONTRED r4, r3
    //// bounds:  -0x0004a2b (-2^14.2127) <= r4  <= 0x00004a2c (+2^14.2128)
str.w r4, [r0, #2524]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2528]
ldr.w r10, [r1, #2532]
ldr.w r9, [r1, #2536]
ldr.w r8, [r1, #2540]
ldr.w r7, [r2, #2532]
ldr.w r6, [r2, #2536]
ldr.w r5, [r2, #2540]
/*** basemul 211 ***/
/* computing z0 = x0y0 + zeta^211 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4882
mul.w r4, r4, r14
    //// bounds:  -0x53168cc (-2^26.3766) <= r4  <= 0x053168cc (+2^26.3766)
mla.w r4, r10, r7, r4
    //// bounds:  -0xf0c8265 (-2^27.9116) <= r4  <= 0x0f0c8265 (+2^27.9116)
MONTRED r4, r3
    //// bounds:  -0x000410c (-2^14.0234) <= r4  <= 0x0000410d (+2^14.0235)
str.w r4, [r0, #2532]
/* computing z1 = x1y0 + x0y1 + zeta^211 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x4757666 (-2^26.1567) <= r4  <= 0x04757666 (+2^26.1567)
mla.w r4, r9, r7, r4
    //// bounds:  -0xe508fff (-2^27.8394) <= r4  <= 0x0e508fff (+2^27.8394)
mla.w r4, r10, r6, r4
    //// bounds:  -0x182ba998 (-2^28.5952) <= r4  <= 0x182ba998 (+2^28.5952)
MONTRED r4, r3
    //// bounds:  -0x0004a2b (-2^14.2127) <= r4  <= 0x00004a2c (+2^14.2128)
str.w r4, [r0, #2536]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2540]
ldr.w r10, [r1, #2544]
ldr.w r9, [r1, #2548]
ldr.w r8, [r1, #2552]
ldr.w r7, [r2, #2544]
ldr.w r6, [r2, #2548]
ldr.w r5, [r2, #2552]
/*** basemul 212 ***/
/* computing z0 = x0y0 + zeta^212 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =11788
mul.w r4, r4, r14
    //// bounds:  -0xc89f888 (-2^27.6483) <= r4  <= 0x0c89f888 (+2^27.6483)
mla.w r4, r10, r7, r4
    //// bounds:  -0x16651221 (-2^28.4851) <= r4  <= 0x16651221 (+2^28.4851)
MONTRED r4, r3
    //// bounds:  -0x0004865 (-2^14.1778) <= r4  <= 0x00004865 (+2^14.1778)
str.w r4, [r0, #2544]
/* computing z1 = x1y0 + x0y1 + zeta^212 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xac42844 (-2^27.4284) <= r4  <= 0x0ac42844 (+2^27.4284)
mla.w r4, r9, r7, r4
    //// bounds:  -0x149f41dd (-2^28.3661) <= r4  <= 0x149f41dd (+2^28.3661)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e7a5b76 (-2^28.9297) <= r4  <= 0x1e7a5b76 (+2^28.9297)
MONTRED r4, r3
    //// bounds:  -0x000507a (-2^14.3305) <= r4  <= 0x0000507a (+2^14.3305)
str.w r4, [r0, #2548]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2552]
ldr.w r10, [r1, #2556]
ldr.w r9, [r1, #2560]
ldr.w r8, [r1, #2564]
ldr.w r7, [r2, #2556]
ldr.w r6, [r2, #2560]
ldr.w r5, [r2, #2564]
/*** basemul 213 ***/
/* computing z0 = x0y0 + zeta^213 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-11788
mul.w r4, r4, r14
    //// bounds:  -0xc89f888 (-2^27.6483) <= r4  <= 0x0c89f888 (+2^27.6483)
mla.w r4, r10, r7, r4
    //// bounds:  -0x16651221 (-2^28.4851) <= r4  <= 0x16651221 (+2^28.4851)
MONTRED r4, r3
    //// bounds:  -0x0004865 (-2^14.1778) <= r4  <= 0x00004865 (+2^14.1778)
str.w r4, [r0, #2556]
/* computing z1 = x1y0 + x0y1 + zeta^213 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xac42844 (-2^27.4284) <= r4  <= 0x0ac42844 (+2^27.4284)
mla.w r4, r9, r7, r4
    //// bounds:  -0x149f41dd (-2^28.3661) <= r4  <= 0x149f41dd (+2^28.3661)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1e7a5b76 (-2^28.9297) <= r4  <= 0x1e7a5b76 (+2^28.9297)
MONTRED r4, r3
    //// bounds:  -0x000507a (-2^14.3305) <= r4  <= 0x0000507a (+2^14.3305)
str.w r4, [r0, #2560]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2564]
ldr.w r10, [r1, #2568]
ldr.w r9, [r1, #2572]
ldr.w r8, [r1, #2576]
ldr.w r7, [r2, #2568]
ldr.w r6, [r2, #2572]
ldr.w r5, [r2, #2576]
/*** basemul 214 ***/
/* computing z0 = x0y0 + zeta^214 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8394
mul.w r4, r4, r14
    //// bounds:  -0x8edc19c (-2^27.1585) <= r4  <= 0x08edc19c (+2^27.1585)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12c8db35 (-2^28.2315) <= r4  <= 0x12c8db35 (+2^28.2315)
MONTRED r4, r3
    //// bounds:  -0x00044c8 (-2^14.1039) <= r4  <= 0x000044c9 (+2^14.1040)
str.w r4, [r0, #2568]
/* computing z1 = x1y0 + x0y1 + zeta^214 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x7aa9ace (-2^26.9386) <= r4  <= 0x07aa9ace (+2^26.9386)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1185b467 (-2^28.1311) <= r4  <= 0x1185b467 (+2^28.1311)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b60ce00 (-2^28.7750) <= r4  <= 0x1b60ce00 (+2^28.7750)
MONTRED r4, r3
    //// bounds:  -0x0004d60 (-2^14.2738) <= r4  <= 0x00004d61 (+2^14.2739)
str.w r4, [r0, #2572]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2576]
ldr.w r10, [r1, #2580]
ldr.w r9, [r1, #2584]
ldr.w r8, [r1, #2588]
ldr.w r7, [r2, #2580]
ldr.w r6, [r2, #2584]
ldr.w r5, [r2, #2588]
/*** basemul 215 ***/
/* computing z0 = x0y0 + zeta^215 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8394
mul.w r4, r4, r14
    //// bounds:  -0x8edc19c (-2^27.1585) <= r4  <= 0x08edc19c (+2^27.1585)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12c8db35 (-2^28.2315) <= r4  <= 0x12c8db35 (+2^28.2315)
MONTRED r4, r3
    //// bounds:  -0x00044c8 (-2^14.1039) <= r4  <= 0x000044c9 (+2^14.1040)
str.w r4, [r0, #2580]
/* computing z1 = x1y0 + x0y1 + zeta^215 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x7aa9ace (-2^26.9386) <= r4  <= 0x07aa9ace (+2^26.9386)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1185b467 (-2^28.1311) <= r4  <= 0x1185b467 (+2^28.1311)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b60ce00 (-2^28.7750) <= r4  <= 0x1b60ce00 (+2^28.7750)
MONTRED r4, r3
    //// bounds:  -0x0004d60 (-2^14.2738) <= r4  <= 0x00004d61 (+2^14.2739)
str.w r4, [r0, #2584]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2588]
ldr.w r10, [r1, #2592]
ldr.w r9, [r1, #2596]
ldr.w r8, [r1, #2600]
ldr.w r7, [r2, #2592]
ldr.w r6, [r2, #2596]
ldr.w r5, [r2, #2600]
/*** basemul 216 ***/
/* computing z0 = x0y0 + zeta^216 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =9775
mul.w r4, r4, r14
    //// bounds:  -0xa65d06a (-2^27.3782) <= r4  <= 0x0a65d06a (+2^27.3782)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1440ea03 (-2^28.3401) <= r4  <= 0x1440ea03 (+2^28.3401)
MONTRED r4, r3
    //// bounds:  -0x0004641 (-2^14.1345) <= r4  <= 0x00004641 (+2^14.1345)
str.w r4, [r0, #2592]
/* computing z1 = x1y0 + x0y1 + zeta^216 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8ed7f35 (-2^27.1583) <= r4  <= 0x08ed7f35 (+2^27.1583)
mla.w r4, r9, r7, r4
    //// bounds:  -0x12c898ce (-2^28.2314) <= r4  <= 0x12c898ce (+2^28.2314)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ca3b267 (-2^28.8399) <= r4  <= 0x1ca3b267 (+2^28.8399)
MONTRED r4, r3
    //// bounds:  -0x0004ea3 (-2^14.2971) <= r4  <= 0x00004ea4 (+2^14.2972)
str.w r4, [r0, #2596]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2600]
ldr.w r10, [r1, #2604]
ldr.w r9, [r1, #2608]
ldr.w r8, [r1, #2612]
ldr.w r7, [r2, #2604]
ldr.w r6, [r2, #2608]
ldr.w r5, [r2, #2612]
/*** basemul 217 ***/
/* computing z0 = x0y0 + zeta^217 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-9775
mul.w r4, r4, r14
    //// bounds:  -0xa65d06a (-2^27.3782) <= r4  <= 0x0a65d06a (+2^27.3782)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1440ea03 (-2^28.3401) <= r4  <= 0x1440ea03 (+2^28.3401)
MONTRED r4, r3
    //// bounds:  -0x0004641 (-2^14.1345) <= r4  <= 0x00004641 (+2^14.1345)
str.w r4, [r0, #2604]
/* computing z1 = x1y0 + x0y1 + zeta^217 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x8ed7f35 (-2^27.1583) <= r4  <= 0x08ed7f35 (+2^27.1583)
mla.w r4, r9, r7, r4
    //// bounds:  -0x12c898ce (-2^28.2314) <= r4  <= 0x12c898ce (+2^28.2314)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ca3b267 (-2^28.8399) <= r4  <= 0x1ca3b267 (+2^28.8399)
MONTRED r4, r3
    //// bounds:  -0x0004ea3 (-2^14.2971) <= r4  <= 0x00004ea4 (+2^14.2972)
str.w r4, [r0, #2608]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2612]
ldr.w r10, [r1, #2616]
ldr.w r9, [r1, #2620]
ldr.w r8, [r1, #2624]
ldr.w r7, [r2, #2616]
ldr.w r6, [r2, #2620]
ldr.w r5, [r2, #2624]
/*** basemul 218 ***/
/* computing z0 = x0y0 + zeta^218 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =2339
mul.w r4, r4, r14
    //// bounds:  -0x27cede2 (-2^25.3150) <= r4  <= 0x027cede2 (+2^25.3150)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc58077b (-2^27.6257) <= r4  <= 0x0c58077b (+2^27.6257)
MONTRED r4, r3
    //// bounds:  -0x0003e58 (-2^13.9622) <= r4  <= 0x00003e58 (+2^13.9622)
str.w r4, [r0, #2616]
/* computing z1 = x1y0 + x0y1 + zeta^218 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x222e1f1 (-2^25.0951) <= r4  <= 0x0222e1f1 (+2^25.0951)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbfdfb8a (-2^27.5840) <= r4  <= 0x0bfdfb8a (+2^27.5840)
mla.w r4, r10, r6, r4
    //// bounds:  -0x15d91523 (-2^28.4494) <= r4  <= 0x15d91523 (+2^28.4494)
MONTRED r4, r3
    //// bounds:  -0x00047d9 (-2^14.1669) <= r4  <= 0x000047d9 (+2^14.1669)
str.w r4, [r0, #2620]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2624]
ldr.w r10, [r1, #2628]
ldr.w r9, [r1, #2632]
ldr.w r8, [r1, #2636]
ldr.w r7, [r2, #2628]
ldr.w r6, [r2, #2632]
ldr.w r5, [r2, #2636]
/*** basemul 219 ***/
/* computing z0 = x0y0 + zeta^219 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-2339
mul.w r4, r4, r14
    //// bounds:  -0x27cede2 (-2^25.3150) <= r4  <= 0x027cede2 (+2^25.3150)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc58077b (-2^27.6257) <= r4  <= 0x0c58077b (+2^27.6257)
MONTRED r4, r3
    //// bounds:  -0x0003e58 (-2^13.9622) <= r4  <= 0x00003e58 (+2^13.9622)
str.w r4, [r0, #2628]
/* computing z1 = x1y0 + x0y1 + zeta^219 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x222e1f1 (-2^25.0951) <= r4  <= 0x0222e1f1 (+2^25.0951)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbfdfb8a (-2^27.5840) <= r4  <= 0x0bfdfb8a (+2^27.5840)
mla.w r4, r10, r6, r4
    //// bounds:  -0x15d91523 (-2^28.4494) <= r4  <= 0x15d91523 (+2^28.4494)
MONTRED r4, r3
    //// bounds:  -0x00047d9 (-2^14.1669) <= r4  <= 0x000047d9 (+2^14.1669)
str.w r4, [r0, #2632]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2636]
ldr.w r10, [r1, #2640]
ldr.w r9, [r1, #2644]
ldr.w r8, [r1, #2648]
ldr.w r7, [r2, #2640]
ldr.w r6, [r2, #2644]
ldr.w r5, [r2, #2648]
/*** basemul 220 ***/
/* computing z0 = x0y0 + zeta^220 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =4148
mul.w r4, r4, r14
    //// bounds:  -0x46988f8 (-2^26.1415) <= r4  <= 0x046988f8 (+2^26.1415)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe44a291 (-2^27.8347) <= r4  <= 0x0e44a291 (+2^27.8347)
MONTRED r4, r3
    //// bounds:  -0x0004044 (-2^14.0060) <= r4  <= 0x00004045 (+2^14.0061)
str.w r4, [r0, #2640]
/* computing z1 = x1y0 + x0y1 + zeta^220 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3c9d87c (-2^25.9216) <= r4  <= 0x03c9d87c (+2^25.9216)
mla.w r4, r9, r7, r4
    //// bounds:  -0xda4f215 (-2^27.7702) <= r4  <= 0x0da4f215 (+2^27.7702)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17800bae (-2^28.5546) <= r4  <= 0x17800bae (+2^28.5546)
MONTRED r4, r3
    //// bounds:  -0x0004980 (-2^14.1997) <= r4  <= 0x00004980 (+2^14.1997)
str.w r4, [r0, #2644]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2648]
ldr.w r10, [r1, #2652]
ldr.w r9, [r1, #2656]
ldr.w r8, [r1, #2660]
ldr.w r7, [r2, #2652]
ldr.w r6, [r2, #2656]
ldr.w r5, [r2, #2660]
/*** basemul 221 ***/
/* computing z0 = x0y0 + zeta^221 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-4148
mul.w r4, r4, r14
    //// bounds:  -0x46988f8 (-2^26.1415) <= r4  <= 0x046988f8 (+2^26.1415)
mla.w r4, r10, r7, r4
    //// bounds:  -0xe44a291 (-2^27.8347) <= r4  <= 0x0e44a291 (+2^27.8347)
MONTRED r4, r3
    //// bounds:  -0x0004044 (-2^14.0060) <= r4  <= 0x00004045 (+2^14.0061)
str.w r4, [r0, #2652]
/* computing z1 = x1y0 + x0y1 + zeta^221 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x3c9d87c (-2^25.9216) <= r4  <= 0x03c9d87c (+2^25.9216)
mla.w r4, r9, r7, r4
    //// bounds:  -0xda4f215 (-2^27.7702) <= r4  <= 0x0da4f215 (+2^27.7702)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17800bae (-2^28.5546) <= r4  <= 0x17800bae (+2^28.5546)
MONTRED r4, r3
    //// bounds:  -0x0004980 (-2^14.1997) <= r4  <= 0x00004980 (+2^14.1997)
str.w r4, [r0, #2656]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2660]
ldr.w r10, [r1, #2664]
ldr.w r9, [r1, #2668]
ldr.w r8, [r1, #2672]
ldr.w r7, [r2, #2664]
ldr.w r6, [r2, #2668]
ldr.w r5, [r2, #2672]
/*** basemul 222 ***/
/* computing z0 = x0y0 + zeta^222 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-1946
mul.w r4, r4, r14
    //// bounds:  -0x211e97c (-2^25.0496) <= r4  <= 0x0211e97c (+2^25.0496)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbed0315 (-2^27.5760) <= r4  <= 0x0bed0315 (+2^27.5760)
MONTRED r4, r3
    //// bounds:  -0x0003ded (-2^13.9525) <= r4  <= 0x00003ded (+2^13.9525)
str.w r4, [r0, #2664]
/* computing z1 = x1y0 + x0y1 + zeta^222 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x1c6febe (-2^24.8297) <= r4  <= 0x01c6febe (+2^24.8297)
mla.w r4, r9, r7, r4
    //// bounds:  -0xba21857 (-2^27.5402) <= r4  <= 0x0ba21857 (+2^27.5402)
mla.w r4, r10, r6, r4
    //// bounds:  -0x157d31f0 (-2^28.4255) <= r4  <= 0x157d31f0 (+2^28.4255)
MONTRED r4, r3
    //// bounds:  -0x000477d (-2^14.1596) <= r4  <= 0x0000477d (+2^14.1596)
str.w r4, [r0, #2668]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2672]
ldr.w r10, [r1, #2676]
ldr.w r9, [r1, #2680]
ldr.w r8, [r1, #2684]
ldr.w r7, [r2, #2676]
ldr.w r6, [r2, #2680]
ldr.w r5, [r2, #2684]
/*** basemul 223 ***/
/* computing z0 = x0y0 + zeta^223 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =1946
mul.w r4, r4, r14
    //// bounds:  -0x211e97c (-2^25.0496) <= r4  <= 0x0211e97c (+2^25.0496)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbed0315 (-2^27.5760) <= r4  <= 0x0bed0315 (+2^27.5760)
MONTRED r4, r3
    //// bounds:  -0x0003ded (-2^13.9525) <= r4  <= 0x00003ded (+2^13.9525)
str.w r4, [r0, #2676]
/* computing z1 = x1y0 + x0y1 + zeta^223 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x1c6febe (-2^24.8297) <= r4  <= 0x01c6febe (+2^24.8297)
mla.w r4, r9, r7, r4
    //// bounds:  -0xba21857 (-2^27.5402) <= r4  <= 0x0ba21857 (+2^27.5402)
mla.w r4, r10, r6, r4
    //// bounds:  -0x157d31f0 (-2^28.4255) <= r4  <= 0x157d31f0 (+2^28.4255)
MONTRED r4, r3
    //// bounds:  -0x000477d (-2^14.1596) <= r4  <= 0x0000477d (+2^14.1596)
str.w r4, [r0, #2680]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2684]
ldr.w r10, [r1, #2688]
ldr.w r9, [r1, #2692]
b.w 1f
.ltorg /* constant pool */
1:
ldr.w r8, [r1, #2696]
ldr.w r7, [r2, #2688]
ldr.w r6, [r2, #2692]
ldr.w r5, [r2, #2696]
/*** basemul 224 ***/
/* computing z0 = x0y0 + zeta^224 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-6397
mul.w r4, r4, r14
    //// bounds:  -0x6cdf4de (-2^26.7665) <= r4  <= 0x06cdf4de (+2^26.7665)
mla.w r4, r10, r7, r4
    //// bounds:  -0x10a90e77 (-2^28.0583) <= r4  <= 0x10a90e77 (+2^28.0583)
MONTRED r4, r3
    //// bounds:  -0x00042a9 (-2^14.0588) <= r4  <= 0x000042a9 (+2^14.0588)
str.w r4, [r0, #2688]
/* computing z1 = x1y0 + x0y1 + zeta^224 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x5d7af6f (-2^26.5466) <= r4  <= 0x05d7af6f (+2^26.5466)
mla.w r4, r9, r7, r4
    //// bounds:  -0xfb2c908 (-2^27.9725) <= r4  <= 0x0fb2c908 (+2^27.9725)
mla.w r4, r10, r6, r4
    //// bounds:  -0x198de2a1 (-2^28.6755) <= r4  <= 0x198de2a1 (+2^28.6755)
MONTRED r4, r3
    //// bounds:  -0x0004b8d (-2^14.2394) <= r4  <= 0x00004b8e (+2^14.2394)
str.w r4, [r0, #2692]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2696]
ldr.w r10, [r1, #2700]
ldr.w r9, [r1, #2704]
ldr.w r8, [r1, #2708]
ldr.w r7, [r2, #2700]
ldr.w r6, [r2, #2704]
ldr.w r5, [r2, #2708]
/*** basemul 225 ***/
/* computing z0 = x0y0 + zeta^225 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =6397
mul.w r4, r4, r14
    //// bounds:  -0x6cdf4de (-2^26.7665) <= r4  <= 0x06cdf4de (+2^26.7665)
mla.w r4, r10, r7, r4
    //// bounds:  -0x10a90e77 (-2^28.0583) <= r4  <= 0x10a90e77 (+2^28.0583)
MONTRED r4, r3
    //// bounds:  -0x00042a9 (-2^14.0588) <= r4  <= 0x000042a9 (+2^14.0588)
str.w r4, [r0, #2700]
/* computing z1 = x1y0 + x0y1 + zeta^225 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x5d7af6f (-2^26.5466) <= r4  <= 0x05d7af6f (+2^26.5466)
mla.w r4, r9, r7, r4
    //// bounds:  -0xfb2c908 (-2^27.9725) <= r4  <= 0x0fb2c908 (+2^27.9725)
mla.w r4, r10, r6, r4
    //// bounds:  -0x198de2a1 (-2^28.6755) <= r4  <= 0x198de2a1 (+2^28.6755)
MONTRED r4, r3
    //// bounds:  -0x0004b8d (-2^14.2394) <= r4  <= 0x00004b8e (+2^14.2394)
str.w r4, [r0, #2704]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2708]
ldr.w r10, [r1, #2712]
ldr.w r9, [r1, #2716]
ldr.w r8, [r1, #2720]
ldr.w r7, [r2, #2712]
ldr.w r6, [r2, #2716]
ldr.w r5, [r2, #2720]
/*** basemul 226 ***/
/* computing z0 = x0y0 + zeta^226 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =520
mul.w r4, r4, r14
    //// bounds:  -0x08d99b0 (-2^23.1457) <= r4  <= 0x008d99b0 (+2^23.1457)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa68b349 (-2^27.3798) <= r4  <= 0x0a68b349 (+2^27.3798)
MONTRED r4, r3
    //// bounds:  -0x0003c68 (-2^13.9166) <= r4  <= 0x00003c69 (+2^13.9167)
str.w r4, [r0, #2712]
/* computing z1 = x1y0 + x0y1 + zeta^226 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x07994d8 (-2^22.9258) <= r4  <= 0x007994d8 (+2^22.9258)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa54ae71 (-2^27.3689) <= r4  <= 0x0a54ae71 (+2^27.3689)
mla.w r4, r10, r6, r4
    //// bounds:  -0x142fc80a (-2^28.3353) <= r4  <= 0x142fc80a (+2^28.3353)
MONTRED r4, r3
    //// bounds:  -0x000462f (-2^14.1331) <= r4  <= 0x00004630 (+2^14.1331)
str.w r4, [r0, #2716]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2720]
ldr.w r10, [r1, #2724]
ldr.w r9, [r1, #2728]
ldr.w r8, [r1, #2732]
ldr.w r7, [r2, #2724]
ldr.w r6, [r2, #2728]
ldr.w r5, [r2, #2732]
/*** basemul 227 ***/
/* computing z0 = x0y0 + zeta^227 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-520
mul.w r4, r4, r14
    //// bounds:  -0x08d99b0 (-2^23.1457) <= r4  <= 0x008d99b0 (+2^23.1457)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa68b349 (-2^27.3798) <= r4  <= 0x0a68b349 (+2^27.3798)
MONTRED r4, r3
    //// bounds:  -0x0003c68 (-2^13.9166) <= r4  <= 0x00003c69 (+2^13.9167)
str.w r4, [r0, #2724]
/* computing z1 = x1y0 + x0y1 + zeta^227 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x07994d8 (-2^22.9258) <= r4  <= 0x007994d8 (+2^22.9258)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa54ae71 (-2^27.3689) <= r4  <= 0x0a54ae71 (+2^27.3689)
mla.w r4, r10, r6, r4
    //// bounds:  -0x142fc80a (-2^28.3353) <= r4  <= 0x142fc80a (+2^28.3353)
MONTRED r4, r3
    //// bounds:  -0x000462f (-2^14.1331) <= r4  <= 0x00004630 (+2^14.1331)
str.w r4, [r0, #2728]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2732]
ldr.w r10, [r1, #2736]
ldr.w r9, [r1, #2740]
ldr.w r8, [r1, #2744]
ldr.w r7, [r2, #2736]
ldr.w r6, [r2, #2740]
ldr.w r5, [r2, #2744]
/*** basemul 228 ***/
/* computing z0 = x0y0 + zeta^228 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =12557
mul.w r4, r4, r14
    //// bounds:  -0xd5b603e (-2^27.7395) <= r4  <= 0x0d5b603e (+2^27.7395)
mla.w r4, r10, r7, r4
    //// bounds:  -0x173679d7 (-2^28.5368) <= r4  <= 0x173679d7 (+2^28.5368)
MONTRED r4, r3
    //// bounds:  -0x0004936 (-2^14.1940) <= r4  <= 0x00004936 (+2^14.1940)
str.w r4, [r0, #2736]
/* computing z1 = x1y0 + x0y1 + zeta^228 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb77f51f (-2^27.5196) <= r4  <= 0x0b77f51f (+2^27.5196)
mla.w r4, r9, r7, r4
    //// bounds:  -0x15530eb8 (-2^28.4144) <= r4  <= 0x15530eb8 (+2^28.4144)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1f2e2851 (-2^28.9626) <= r4  <= 0x1f2e2851 (+2^28.9626)
MONTRED r4, r3
    //// bounds:  -0x000512e (-2^14.3430) <= r4  <= 0x0000512e (+2^14.3430)
str.w r4, [r0, #2740]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2744]
ldr.w r10, [r1, #2748]
ldr.w r9, [r1, #2752]
ldr.w r8, [r1, #2756]
ldr.w r7, [r2, #2748]
ldr.w r6, [r2, #2752]
ldr.w r5, [r2, #2756]
/*** basemul 229 ***/
/* computing z0 = x0y0 + zeta^229 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-12557
mul.w r4, r4, r14
    //// bounds:  -0xd5b603e (-2^27.7395) <= r4  <= 0x0d5b603e (+2^27.7395)
mla.w r4, r10, r7, r4
    //// bounds:  -0x173679d7 (-2^28.5368) <= r4  <= 0x173679d7 (+2^28.5368)
MONTRED r4, r3
    //// bounds:  -0x0004936 (-2^14.1940) <= r4  <= 0x00004936 (+2^14.1940)
str.w r4, [r0, #2748]
/* computing z1 = x1y0 + x0y1 + zeta^229 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb77f51f (-2^27.5196) <= r4  <= 0x0b77f51f (+2^27.5196)
mla.w r4, r9, r7, r4
    //// bounds:  -0x15530eb8 (-2^28.4144) <= r4  <= 0x15530eb8 (+2^28.4144)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1f2e2851 (-2^28.9626) <= r4  <= 0x1f2e2851 (+2^28.9626)
MONTRED r4, r3
    //// bounds:  -0x000512e (-2^14.3430) <= r4  <= 0x0000512e (+2^14.3430)
str.w r4, [r0, #2752]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2756]
ldr.w r10, [r1, #2760]
ldr.w r9, [r1, #2764]
ldr.w r8, [r1, #2768]
ldr.w r7, [r2, #2760]
ldr.w r6, [r2, #2764]
ldr.w r5, [r2, #2768]
/*** basemul 230 ***/
/* computing z0 = x0y0 + zeta^230 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =12242
mul.w r4, r4, r14
    //// bounds:  -0xd05994c (-2^27.7029) <= r4  <= 0x0d05994c (+2^27.7029)
mla.w r4, r10, r7, r4
    //// bounds:  -0x16e0b2e5 (-2^28.5159) <= r4  <= 0x16e0b2e5 (+2^28.5159)
MONTRED r4, r3
    //// bounds:  -0x00048e0 (-2^14.1874) <= r4  <= 0x000048e1 (+2^14.1874)
str.w r4, [r0, #2760]
/* computing z1 = x1y0 + x0y1 + zeta^230 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb2e4ea6 (-2^27.4830) <= r4  <= 0x0b2e4ea6 (+2^27.4830)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1509683f (-2^28.3948) <= r4  <= 0x1509683f (+2^28.3948)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ee481d8 (-2^28.9492) <= r4  <= 0x1ee481d8 (+2^28.9492)
MONTRED r4, r3
    //// bounds:  -0x00050e4 (-2^14.3379) <= r4  <= 0x000050e5 (+2^14.3380)
str.w r4, [r0, #2764]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2768]
ldr.w r10, [r1, #2772]
ldr.w r9, [r1, #2776]
ldr.w r8, [r1, #2780]
ldr.w r7, [r2, #2772]
ldr.w r6, [r2, #2776]
ldr.w r5, [r2, #2780]
/*** basemul 231 ***/
/* computing z0 = x0y0 + zeta^231 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-12242
mul.w r4, r4, r14
    //// bounds:  -0xd05994c (-2^27.7029) <= r4  <= 0x0d05994c (+2^27.7029)
mla.w r4, r10, r7, r4
    //// bounds:  -0x16e0b2e5 (-2^28.5159) <= r4  <= 0x16e0b2e5 (+2^28.5159)
MONTRED r4, r3
    //// bounds:  -0x00048e0 (-2^14.1874) <= r4  <= 0x000048e1 (+2^14.1874)
str.w r4, [r0, #2772]
/* computing z1 = x1y0 + x0y1 + zeta^231 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb2e4ea6 (-2^27.4830) <= r4  <= 0x0b2e4ea6 (+2^27.4830)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1509683f (-2^28.3948) <= r4  <= 0x1509683f (+2^28.3948)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ee481d8 (-2^28.9492) <= r4  <= 0x1ee481d8 (+2^28.9492)
MONTRED r4, r3
    //// bounds:  -0x00050e4 (-2^14.3379) <= r4  <= 0x000050e5 (+2^14.3380)
str.w r4, [r0, #2776]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2780]
ldr.w r10, [r1, #2784]
ldr.w r9, [r1, #2788]
ldr.w r8, [r1, #2792]
ldr.w r7, [r2, #2784]
ldr.w r6, [r2, #2788]
ldr.w r5, [r2, #2792]
/*** basemul 232 ***/
/* computing z0 = x0y0 + zeta^232 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8356
mul.w r4, r4, r14
    //// bounds:  -0x8e36898 (-2^27.1519) <= r4  <= 0x08e36898 (+2^27.1519)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12be8231 (-2^28.2284) <= r4  <= 0x12be8231 (+2^28.2284)
MONTRED r4, r3
    //// bounds:  -0x00044be (-2^14.1031) <= r4  <= 0x000044bf (+2^14.1032)
str.w r4, [r0, #2784]
/* computing z1 = x1y0 + x0y1 + zeta^232 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x7a1b84c (-2^26.9320) <= r4  <= 0x07a1b84c (+2^26.9320)
mla.w r4, r9, r7, r4
    //// bounds:  -0x117cd1e5 (-2^28.1283) <= r4  <= 0x117cd1e5 (+2^28.1283)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b57eb7e (-2^28.7731) <= r4  <= 0x1b57eb7e (+2^28.7731)
MONTRED r4, r3
    //// bounds:  -0x0004d58 (-2^14.2732) <= r4  <= 0x00004d58 (+2^14.2732)
str.w r4, [r0, #2788]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2792]
ldr.w r10, [r1, #2796]
ldr.w r9, [r1, #2800]
ldr.w r8, [r1, #2804]
ldr.w r7, [r2, #2796]
ldr.w r6, [r2, #2800]
ldr.w r5, [r2, #2804]
/*** basemul 233 ***/
/* computing z0 = x0y0 + zeta^233 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8356
mul.w r4, r4, r14
    //// bounds:  -0x8e36898 (-2^27.1519) <= r4  <= 0x08e36898 (+2^27.1519)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12be8231 (-2^28.2284) <= r4  <= 0x12be8231 (+2^28.2284)
MONTRED r4, r3
    //// bounds:  -0x00044be (-2^14.1031) <= r4  <= 0x000044bf (+2^14.1032)
str.w r4, [r0, #2796]
/* computing z1 = x1y0 + x0y1 + zeta^233 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x7a1b84c (-2^26.9320) <= r4  <= 0x07a1b84c (+2^26.9320)
mla.w r4, r9, r7, r4
    //// bounds:  -0x117cd1e5 (-2^28.1283) <= r4  <= 0x117cd1e5 (+2^28.1283)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b57eb7e (-2^28.7731) <= r4  <= 0x1b57eb7e (+2^28.7731)
MONTRED r4, r3
    //// bounds:  -0x0004d58 (-2^14.2732) <= r4  <= 0x00004d58 (+2^14.2732)
str.w r4, [r0, #2800]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2804]
ldr.w r10, [r1, #2808]
ldr.w r9, [r1, #2812]
ldr.w r8, [r1, #2816]
ldr.w r7, [r2, #2808]
ldr.w r6, [r2, #2812]
ldr.w r5, [r2, #2816]
/*** basemul 234 ***/
/* computing z0 = x0y0 + zeta^234 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =5708
mul.w r4, r4, r14
    //// bounds:  -0x6125608 (-2^26.6021) <= r4  <= 0x06125608 (+2^26.6021)
mla.w r4, r10, r7, r4
    //// bounds:  -0xfed6fa1 (-2^27.9934) <= r4  <= 0x0fed6fa1 (+2^27.9934)
MONTRED r4, r3
    //// bounds:  -0x00041ed (-2^14.0428) <= r4  <= 0x000041ed (+2^14.0428)
str.w r4, [r0, #2808]
/* computing z1 = x1y0 + x0y1 + zeta^234 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x5369704 (-2^26.3822) <= r4  <= 0x05369704 (+2^26.3822)
mla.w r4, r9, r7, r4
    //// bounds:  -0xf11b09d (-2^27.9135) <= r4  <= 0x0f11b09d (+2^27.9135)
mla.w r4, r10, r6, r4
    //// bounds:  -0x18ecca36 (-2^28.6395) <= r4  <= 0x18ecca36 (+2^28.6395)
MONTRED r4, r3
    //// bounds:  -0x0004aec (-2^14.2273) <= r4  <= 0x00004aed (+2^14.2274)
str.w r4, [r0, #2812]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2816]
ldr.w r10, [r1, #2820]
ldr.w r9, [r1, #2824]
ldr.w r8, [r1, #2828]
ldr.w r7, [r2, #2820]
ldr.w r6, [r2, #2824]
ldr.w r5, [r2, #2828]
/*** basemul 235 ***/
/* computing z0 = x0y0 + zeta^235 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-5708
mul.w r4, r4, r14
    //// bounds:  -0x6125608 (-2^26.6021) <= r4  <= 0x06125608 (+2^26.6021)
mla.w r4, r10, r7, r4
    //// bounds:  -0xfed6fa1 (-2^27.9934) <= r4  <= 0x0fed6fa1 (+2^27.9934)
MONTRED r4, r3
    //// bounds:  -0x00041ed (-2^14.0428) <= r4  <= 0x000041ed (+2^14.0428)
str.w r4, [r0, #2820]
/* computing z1 = x1y0 + x0y1 + zeta^235 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x5369704 (-2^26.3822) <= r4  <= 0x05369704 (+2^26.3822)
mla.w r4, r9, r7, r4
    //// bounds:  -0xf11b09d (-2^27.9135) <= r4  <= 0x0f11b09d (+2^27.9135)
mla.w r4, r10, r6, r4
    //// bounds:  -0x18ecca36 (-2^28.6395) <= r4  <= 0x18ecca36 (+2^28.6395)
MONTRED r4, r3
    //// bounds:  -0x0004aec (-2^14.2273) <= r4  <= 0x00004aed (+2^14.2274)
str.w r4, [r0, #2824]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2828]
ldr.w r10, [r1, #2832]
ldr.w r9, [r1, #2836]
ldr.w r8, [r1, #2840]
ldr.w r7, [r2, #2832]
ldr.w r6, [r2, #2836]
ldr.w r5, [r2, #2840]
/*** basemul 236 ***/
/* computing z0 = x0y0 + zeta^236 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-3756
mul.w r4, r4, r14
    //// bounds:  -0x3feca48 (-2^25.9983) <= r4  <= 0x03feca48 (+2^25.9983)
mla.w r4, r10, r7, r4
    //// bounds:  -0xdd9e3e1 (-2^27.7919) <= r4  <= 0x0dd9e3e1 (+2^27.7919)
MONTRED r4, r3
    //// bounds:  -0x0003fd9 (-2^13.9966) <= r4  <= 0x00003fda (+2^13.9967)
str.w r4, [r0, #2832]
/* computing z1 = x1y0 + x0y1 + zeta^236 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x36e3124 (-2^25.7784) <= r4  <= 0x036e3124 (+2^25.7784)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd494abd (-2^27.7319) <= r4  <= 0x0d494abd (+2^27.7319)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17246456 (-2^28.5325) <= r4  <= 0x17246456 (+2^28.5325)
MONTRED r4, r3
    //// bounds:  -0x0004924 (-2^14.1926) <= r4  <= 0x00004924 (+2^14.1926)
str.w r4, [r0, #2836]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2840]
ldr.w r10, [r1, #2844]
ldr.w r9, [r1, #2848]
ldr.w r8, [r1, #2852]
ldr.w r7, [r2, #2844]
ldr.w r6, [r2, #2848]
ldr.w r5, [r2, #2852]
/*** basemul 237 ***/
/* computing z0 = x0y0 + zeta^237 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =3756
mul.w r4, r4, r14
    //// bounds:  -0x3feca48 (-2^25.9983) <= r4  <= 0x03feca48 (+2^25.9983)
mla.w r4, r10, r7, r4
    //// bounds:  -0xdd9e3e1 (-2^27.7919) <= r4  <= 0x0dd9e3e1 (+2^27.7919)
MONTRED r4, r3
    //// bounds:  -0x0003fd9 (-2^13.9966) <= r4  <= 0x00003fda (+2^13.9967)
str.w r4, [r0, #2844]
/* computing z1 = x1y0 + x0y1 + zeta^237 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x36e3124 (-2^25.7784) <= r4  <= 0x036e3124 (+2^25.7784)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd494abd (-2^27.7319) <= r4  <= 0x0d494abd (+2^27.7319)
mla.w r4, r10, r6, r4
    //// bounds:  -0x17246456 (-2^28.5325) <= r4  <= 0x17246456 (+2^28.5325)
MONTRED r4, r3
    //// bounds:  -0x0004924 (-2^14.1926) <= r4  <= 0x00004924 (+2^14.1926)
str.w r4, [r0, #2848]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2852]
ldr.w r10, [r1, #2856]
ldr.w r9, [r1, #2860]
ldr.w r8, [r1, #2864]
ldr.w r7, [r2, #2856]
ldr.w r6, [r2, #2860]
ldr.w r5, [r2, #2864]
/*** basemul 238 ***/
/* computing z0 = x0y0 + zeta^238 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-12137
mul.w r4, r4, r14
    //// bounds:  -0xce901a6 (-2^27.6904) <= r4  <= 0x0ce901a6 (+2^27.6904)
mla.w r4, r10, r7, r4
    //// bounds:  -0x16c41b3f (-2^28.5088) <= r4  <= 0x16c41b3f (+2^28.5088)
MONTRED r4, r3
    //// bounds:  -0x00048c4 (-2^14.1852) <= r4  <= 0x000048c4 (+2^14.1852)
str.w r4, [r0, #2856]
/* computing z1 = x1y0 + x0y1 + zeta^238 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb15c1d3 (-2^27.4705) <= r4  <= 0x0b15c1d3 (+2^27.4705)
mla.w r4, r9, r7, r4
    //// bounds:  -0x14f0db6c (-2^28.3882) <= r4  <= 0x14f0db6c (+2^28.3882)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ecbf505 (-2^28.9447) <= r4  <= 0x1ecbf505 (+2^28.9447)
MONTRED r4, r3
    //// bounds:  -0x00050cc (-2^14.3362) <= r4  <= 0x000050cc (+2^14.3362)
str.w r4, [r0, #2860]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2864]
ldr.w r10, [r1, #2868]
ldr.w r9, [r1, #2872]
ldr.w r8, [r1, #2876]
ldr.w r7, [r2, #2868]
ldr.w r6, [r2, #2872]
ldr.w r5, [r2, #2876]
/*** basemul 239 ***/
/* computing z0 = x0y0 + zeta^239 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =12137
mul.w r4, r4, r14
    //// bounds:  -0xce901a6 (-2^27.6904) <= r4  <= 0x0ce901a6 (+2^27.6904)
mla.w r4, r10, r7, r4
    //// bounds:  -0x16c41b3f (-2^28.5088) <= r4  <= 0x16c41b3f (+2^28.5088)
MONTRED r4, r3
    //// bounds:  -0x00048c4 (-2^14.1852) <= r4  <= 0x000048c4 (+2^14.1852)
str.w r4, [r0, #2868]
/* computing z1 = x1y0 + x0y1 + zeta^239 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0xb15c1d3 (-2^27.4705) <= r4  <= 0x0b15c1d3 (+2^27.4705)
mla.w r4, r9, r7, r4
    //// bounds:  -0x14f0db6c (-2^28.3882) <= r4  <= 0x14f0db6c (+2^28.3882)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1ecbf505 (-2^28.9447) <= r4  <= 0x1ecbf505 (+2^28.9447)
MONTRED r4, r3
    //// bounds:  -0x00050cc (-2^14.3362) <= r4  <= 0x000050cc (+2^14.3362)
str.w r4, [r0, #2872]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2876]
ldr.w r10, [r1, #2880]
ldr.w r9, [r1, #2884]
ldr.w r8, [r1, #2888]
ldr.w r7, [r2, #2880]
ldr.w r6, [r2, #2884]
ldr.w r5, [r2, #2888]
/*** basemul 240 ***/
/* computing z0 = x0y0 + zeta^240 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8064
mul.w r4, r4, r14
    //// bounds:  -0x893e500 (-2^27.1006) <= r4  <= 0x0893e500 (+2^27.1006)
mla.w r4, r10, r7, r4
    //// bounds:  -0x126efe99 (-2^28.2043) <= r4  <= 0x126efe99 (+2^28.2043)
MONTRED r4, r3
    //// bounds:  -0x000446f (-2^14.0966) <= r4  <= 0x0000446f (+2^14.0966)
str.w r4, [r0, #2880]
/* computing z1 = x1y0 + x0y1 + zeta^240 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x75d7280 (-2^26.8807) <= r4  <= 0x075d7280 (+2^26.8807)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11388c19 (-2^28.1061) <= r4  <= 0x11388c19 (+2^28.1061)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b13a5b2 (-2^28.7590) <= r4  <= 0x1b13a5b2 (+2^28.7590)
MONTRED r4, r3
    //// bounds:  -0x0004d13 (-2^14.2682) <= r4  <= 0x00004d14 (+2^14.2682)
str.w r4, [r0, #2884]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2888]
ldr.w r10, [r1, #2892]
ldr.w r9, [r1, #2896]
ldr.w r8, [r1, #2900]
ldr.w r7, [r2, #2892]
ldr.w r6, [r2, #2896]
ldr.w r5, [r2, #2900]
/*** basemul 241 ***/
/* computing z0 = x0y0 + zeta^241 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8064
mul.w r4, r4, r14
    //// bounds:  -0x893e500 (-2^27.1006) <= r4  <= 0x0893e500 (+2^27.1006)
mla.w r4, r10, r7, r4
    //// bounds:  -0x126efe99 (-2^28.2043) <= r4  <= 0x126efe99 (+2^28.2043)
MONTRED r4, r3
    //// bounds:  -0x000446f (-2^14.0966) <= r4  <= 0x0000446f (+2^14.0966)
str.w r4, [r0, #2892]
/* computing z1 = x1y0 + x0y1 + zeta^241 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x75d7280 (-2^26.8807) <= r4  <= 0x075d7280 (+2^26.8807)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11388c19 (-2^28.1061) <= r4  <= 0x11388c19 (+2^28.1061)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b13a5b2 (-2^28.7590) <= r4  <= 0x1b13a5b2 (+2^28.7590)
MONTRED r4, r3
    //// bounds:  -0x0004d13 (-2^14.2682) <= r4  <= 0x00004d14 (+2^14.2682)
str.w r4, [r0, #2896]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2900]
ldr.w r10, [r1, #2904]
ldr.w r9, [r1, #2908]
ldr.w r8, [r1, #2912]
ldr.w r7, [r2, #2904]
ldr.w r6, [r2, #2908]
ldr.w r5, [r2, #2912]
/*** basemul 242 ***/
/* computing z0 = x0y0 + zeta^242 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =10190
mul.w r4, r4, r14
    //// bounds:  -0xad6d274 (-2^27.4382) <= r4  <= 0x0ad6d274 (+2^27.4382)
mla.w r4, r10, r7, r4
    //// bounds:  -0x14b1ec0d (-2^28.3712) <= r4  <= 0x14b1ec0d (+2^28.3712)
MONTRED r4, r3
    //// bounds:  -0x00046b2 (-2^14.1435) <= r4  <= 0x000046b2 (+2^14.1435)
str.w r4, [r0, #2904]
/* computing z1 = x1y0 + x0y1 + zeta^242 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x94e873a (-2^27.2183) <= r4  <= 0x094e873a (+2^27.2183)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1329a0d3 (-2^28.2602) <= r4  <= 0x1329a0d3 (+2^28.2602)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d04ba6c (-2^28.8589) <= r4  <= 0x1d04ba6c (+2^28.8589)
MONTRED r4, r3
    //// bounds:  -0x0004f04 (-2^14.3041) <= r4  <= 0x00004f05 (+2^14.3041)
str.w r4, [r0, #2908]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2912]
ldr.w r10, [r1, #2916]
ldr.w r9, [r1, #2920]
ldr.w r8, [r1, #2924]
ldr.w r7, [r2, #2916]
ldr.w r6, [r2, #2920]
ldr.w r5, [r2, #2924]
/*** basemul 243 ***/
/* computing z0 = x0y0 + zeta^243 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-10190
mul.w r4, r4, r14
    //// bounds:  -0xad6d274 (-2^27.4382) <= r4  <= 0x0ad6d274 (+2^27.4382)
mla.w r4, r10, r7, r4
    //// bounds:  -0x14b1ec0d (-2^28.3712) <= r4  <= 0x14b1ec0d (+2^28.3712)
MONTRED r4, r3
    //// bounds:  -0x00046b2 (-2^14.1435) <= r4  <= 0x000046b2 (+2^14.1435)
str.w r4, [r0, #2916]
/* computing z1 = x1y0 + x0y1 + zeta^243 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x94e873a (-2^27.2183) <= r4  <= 0x094e873a (+2^27.2183)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1329a0d3 (-2^28.2602) <= r4  <= 0x1329a0d3 (+2^28.2602)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1d04ba6c (-2^28.8589) <= r4  <= 0x1d04ba6c (+2^28.8589)
MONTRED r4, r3
    //// bounds:  -0x0004f04 (-2^14.3041) <= r4  <= 0x00004f05 (+2^14.3041)
str.w r4, [r0, #2920]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2924]
ldr.w r10, [r1, #2928]
ldr.w r9, [r1, #2932]
ldr.w r8, [r1, #2936]
ldr.w r7, [r2, #2928]
ldr.w r6, [r2, #2932]
ldr.w r5, [r2, #2936]
/*** basemul 244 ***/
/* computing z0 = x0y0 + zeta^244 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8275
mul.w r4, r4, r14
    //// bounds:  -0x8cd5a02 (-2^27.1379) <= r4  <= 0x08cd5a02 (+2^27.1379)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12a8739b (-2^28.2217) <= r4  <= 0x12a8739b (+2^28.2217)
MONTRED r4, r3
    //// bounds:  -0x00044a8 (-2^14.1013) <= r4  <= 0x000044a8 (+2^14.1013)
str.w r4, [r0, #2928]
/* computing z1 = x1y0 + x0y1 + zeta^244 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x78ec801 (-2^26.9180) <= r4  <= 0x078ec801 (+2^26.9180)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1169e19a (-2^28.1221) <= r4  <= 0x1169e19a (+2^28.1221)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b44fb33 (-2^28.7692) <= r4  <= 0x1b44fb33 (+2^28.7692)
MONTRED r4, r3
    //// bounds:  -0x0004d45 (-2^14.2718) <= r4  <= 0x00004d45 (+2^14.2718)
str.w r4, [r0, #2932]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2936]
ldr.w r10, [r1, #2940]
ldr.w r9, [r1, #2944]
ldr.w r8, [r1, #2948]
ldr.w r7, [r2, #2940]
ldr.w r6, [r2, #2944]
ldr.w r5, [r2, #2948]
/*** basemul 245 ***/
/* computing z0 = x0y0 + zeta^245 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8275
mul.w r4, r4, r14
    //// bounds:  -0x8cd5a02 (-2^27.1379) <= r4  <= 0x08cd5a02 (+2^27.1379)
mla.w r4, r10, r7, r4
    //// bounds:  -0x12a8739b (-2^28.2217) <= r4  <= 0x12a8739b (+2^28.2217)
MONTRED r4, r3
    //// bounds:  -0x00044a8 (-2^14.1013) <= r4  <= 0x000044a8 (+2^14.1013)
str.w r4, [r0, #2940]
/* computing z1 = x1y0 + x0y1 + zeta^245 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x78ec801 (-2^26.9180) <= r4  <= 0x078ec801 (+2^26.9180)
mla.w r4, r9, r7, r4
    //// bounds:  -0x1169e19a (-2^28.1221) <= r4  <= 0x1169e19a (+2^28.1221)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b44fb33 (-2^28.7692) <= r4  <= 0x1b44fb33 (+2^28.7692)
MONTRED r4, r3
    //// bounds:  -0x0004d45 (-2^14.2718) <= r4  <= 0x00004d45 (+2^14.2718)
str.w r4, [r0, #2944]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2948]
ldr.w r10, [r1, #2952]
ldr.w r9, [r1, #2956]
ldr.w r8, [r1, #2960]
ldr.w r7, [r2, #2952]
ldr.w r6, [r2, #2956]
ldr.w r5, [r2, #2960]
/*** basemul 246 ***/
/* computing z0 = x0y0 + zeta^246 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-7252
mul.w r4, r4, r14
    //// bounds:  -0x7b6c7b8 (-2^26.9475) <= r4  <= 0x07b6c7b8 (+2^26.9475)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1191e151 (-2^28.1350) <= r4  <= 0x1191e151 (+2^28.1350)
MONTRED r4, r3
    //// bounds:  -0x0004391 (-2^14.0782) <= r4  <= 0x00004392 (+2^14.0783)
str.w r4, [r0, #2952]
/* computing z1 = x1y0 + x0y1 + zeta^246 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x69f97dc (-2^26.7276) <= r4  <= 0x069f97dc (+2^26.7276)
mla.w r4, r9, r7, r4
    //// bounds:  -0x107ab175 (-2^28.0426) <= r4  <= 0x107ab175 (+2^28.0426)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a55cb0e (-2^28.7189) <= r4  <= 0x1a55cb0e (+2^28.7189)
MONTRED r4, r3
    //// bounds:  -0x0004c55 (-2^14.2542) <= r4  <= 0x00004c56 (+2^14.2543)
str.w r4, [r0, #2956]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2960]
ldr.w r10, [r1, #2964]
ldr.w r9, [r1, #2968]
ldr.w r8, [r1, #2972]
ldr.w r7, [r2, #2964]
ldr.w r6, [r2, #2968]
ldr.w r5, [r2, #2972]
/*** basemul 247 ***/
/* computing z0 = x0y0 + zeta^247 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =7252
mul.w r4, r4, r14
    //// bounds:  -0x7b6c7b8 (-2^26.9475) <= r4  <= 0x07b6c7b8 (+2^26.9475)
mla.w r4, r10, r7, r4
    //// bounds:  -0x1191e151 (-2^28.1350) <= r4  <= 0x1191e151 (+2^28.1350)
MONTRED r4, r3
    //// bounds:  -0x0004391 (-2^14.0782) <= r4  <= 0x00004392 (+2^14.0783)
str.w r4, [r0, #2964]
/* computing z1 = x1y0 + x0y1 + zeta^247 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x69f97dc (-2^26.7276) <= r4  <= 0x069f97dc (+2^26.7276)
mla.w r4, r9, r7, r4
    //// bounds:  -0x107ab175 (-2^28.0426) <= r4  <= 0x107ab175 (+2^28.0426)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1a55cb0e (-2^28.7189) <= r4  <= 0x1a55cb0e (+2^28.7189)
MONTRED r4, r3
    //// bounds:  -0x0004c55 (-2^14.2542) <= r4  <= 0x00004c56 (+2^14.2543)
str.w r4, [r0, #2968]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2972]
ldr.w r10, [r1, #2976]
ldr.w r9, [r1, #2980]
ldr.w r8, [r1, #2984]
ldr.w r7, [r2, #2976]
ldr.w r6, [r2, #2980]
ldr.w r5, [r2, #2984]
/*** basemul 248 ***/
/* computing z0 = x0y0 + zeta^248 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-5615
mul.w r4, r4, r14
    //// bounds:  -0x5f902ea (-2^26.5784) <= r4  <= 0x05f902ea (+2^26.5784)
mla.w r4, r10, r7, r4
    //// bounds:  -0xfd41c83 (-2^27.9845) <= r4  <= 0x0fd41c83 (+2^27.9845)
MONTRED r4, r3
    //// bounds:  -0x00041d4 (-2^14.0406) <= r4  <= 0x000041d4 (+2^14.0406)
str.w r4, [r0, #2976]
/* computing z1 = x1y0 + x0y1 + zeta^248 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x520d875 (-2^26.3585) <= r4  <= 0x0520d875 (+2^26.3585)
mla.w r4, r9, r7, r4
    //// bounds:  -0xefbf20e (-2^27.9054) <= r4  <= 0x0efbf20e (+2^27.9054)
mla.w r4, r10, r6, r4
    //// bounds:  -0x18d70ba7 (-2^28.6346) <= r4  <= 0x18d70ba7 (+2^28.6346)
MONTRED r4, r3
    //// bounds:  -0x0004ad7 (-2^14.2257) <= r4  <= 0x00004ad7 (+2^14.2257)
str.w r4, [r0, #2980]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2984]
ldr.w r10, [r1, #2988]
ldr.w r9, [r1, #2992]
ldr.w r8, [r1, #2996]
ldr.w r7, [r2, #2988]
ldr.w r6, [r2, #2992]
ldr.w r5, [r2, #2996]
/*** basemul 249 ***/
/* computing z0 = x0y0 + zeta^249 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =5615
mul.w r4, r4, r14
    //// bounds:  -0x5f902ea (-2^26.5784) <= r4  <= 0x05f902ea (+2^26.5784)
mla.w r4, r10, r7, r4
    //// bounds:  -0xfd41c83 (-2^27.9845) <= r4  <= 0x0fd41c83 (+2^27.9845)
MONTRED r4, r3
    //// bounds:  -0x00041d4 (-2^14.0406) <= r4  <= 0x000041d4 (+2^14.0406)
str.w r4, [r0, #2988]
/* computing z1 = x1y0 + x0y1 + zeta^249 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x520d875 (-2^26.3585) <= r4  <= 0x0520d875 (+2^26.3585)
mla.w r4, r9, r7, r4
    //// bounds:  -0xefbf20e (-2^27.9054) <= r4  <= 0x0efbf20e (+2^27.9054)
mla.w r4, r10, r6, r4
    //// bounds:  -0x18d70ba7 (-2^28.6346) <= r4  <= 0x18d70ba7 (+2^28.6346)
MONTRED r4, r3
    //// bounds:  -0x0004ad7 (-2^14.2257) <= r4  <= 0x00004ad7 (+2^14.2257)
str.w r4, [r0, #2992]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #2996]
ldr.w r10, [r1, #3000]
ldr.w r9, [r1, #3004]
ldr.w r8, [r1, #3008]
ldr.w r7, [r2, #3000]
ldr.w r6, [r2, #3004]
ldr.w r5, [r2, #3008]
/*** basemul 250 ***/
/* computing z0 = x0y0 + zeta^250 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-2365
mul.w r4, r4, r14
    //// bounds:  -0x284025e (-2^25.3309) <= r4  <= 0x0284025e (+2^25.3309)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc5f1bf7 (-2^27.6290) <= r4  <= 0x0c5f1bf7 (+2^27.6290)
MONTRED r4, r3
    //// bounds:  -0x0003e5f (-2^13.9628) <= r4  <= 0x00003e5f (+2^13.9628)
str.w r4, [r0, #3000]
/* computing z1 = x1y0 + x0y1 + zeta^250 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x228f62f (-2^25.1110) <= r4  <= 0x0228f62f (+2^25.1110)
mla.w r4, r9, r7, r4
    //// bounds:  -0xc040fc8 (-2^27.5869) <= r4  <= 0x0c040fc8 (+2^27.5869)
mla.w r4, r10, r6, r4
    //// bounds:  -0x15df2961 (-2^28.4510) <= r4  <= 0x15df2961 (+2^28.4510)
MONTRED r4, r3
    //// bounds:  -0x00047df (-2^14.1673) <= r4  <= 0x000047df (+2^14.1673)
str.w r4, [r0, #3004]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3008]
ldr.w r10, [r1, #3012]
ldr.w r9, [r1, #3016]
ldr.w r8, [r1, #3020]
ldr.w r7, [r2, #3012]
ldr.w r6, [r2, #3016]
ldr.w r5, [r2, #3020]
/*** basemul 251 ***/
/* computing z0 = x0y0 + zeta^251 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =2365
mul.w r4, r4, r14
    //// bounds:  -0x284025e (-2^25.3309) <= r4  <= 0x0284025e (+2^25.3309)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc5f1bf7 (-2^27.6290) <= r4  <= 0x0c5f1bf7 (+2^27.6290)
MONTRED r4, r3
    //// bounds:  -0x0003e5f (-2^13.9628) <= r4  <= 0x00003e5f (+2^13.9628)
str.w r4, [r0, #3012]
/* computing z1 = x1y0 + x0y1 + zeta^251 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x228f62f (-2^25.1110) <= r4  <= 0x0228f62f (+2^25.1110)
mla.w r4, r9, r7, r4
    //// bounds:  -0xc040fc8 (-2^27.5869) <= r4  <= 0x0c040fc8 (+2^27.5869)
mla.w r4, r10, r6, r4
    //// bounds:  -0x15df2961 (-2^28.4510) <= r4  <= 0x15df2961 (+2^28.4510)
MONTRED r4, r3
    //// bounds:  -0x00047df (-2^14.1673) <= r4  <= 0x000047df (+2^14.1673)
str.w r4, [r0, #3016]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3020]
ldr.w r10, [r1, #3024]
ldr.w r9, [r1, #3028]
ldr.w r8, [r1, #3032]
ldr.w r7, [r2, #3024]
ldr.w r6, [r2, #3028]
ldr.w r5, [r2, #3032]
/*** basemul 252 ***/
/* computing z0 = x0y0 + zeta^252 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-8616
mul.w r4, r4, r14
    //// bounds:  -0x92a3570 (-2^27.1961) <= r4  <= 0x092a3570 (+2^27.1961)
mla.w r4, r10, r7, r4
    //// bounds:  -0x13054f09 (-2^28.2495) <= r4  <= 0x13054f09 (+2^28.2495)
MONTRED r4, r3
    //// bounds:  -0x0004505 (-2^14.1089) <= r4  <= 0x00004505 (+2^14.1089)
str.w r4, [r0, #3024]
/* computing z1 = x1y0 + x0y1 + zeta^252 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x7de82b8 (-2^26.9762) <= r4  <= 0x07de82b8 (+2^26.9762)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11b99c51 (-2^28.1477) <= r4  <= 0x11b99c51 (+2^28.1477)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b94b5ea (-2^28.7856) <= r4  <= 0x1b94b5ea (+2^28.7856)
MONTRED r4, r3
    //// bounds:  -0x0004d94 (-2^14.2776) <= r4  <= 0x00004d95 (+2^14.2777)
str.w r4, [r0, #3028]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3032]
ldr.w r10, [r1, #3036]
ldr.w r9, [r1, #3040]
ldr.w r8, [r1, #3044]
ldr.w r7, [r2, #3036]
ldr.w r6, [r2, #3040]
ldr.w r5, [r2, #3044]
/*** basemul 253 ***/
/* computing z0 = x0y0 + zeta^253 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =8616
mul.w r4, r4, r14
    //// bounds:  -0x92a3570 (-2^27.1961) <= r4  <= 0x092a3570 (+2^27.1961)
mla.w r4, r10, r7, r4
    //// bounds:  -0x13054f09 (-2^28.2495) <= r4  <= 0x13054f09 (+2^28.2495)
MONTRED r4, r3
    //// bounds:  -0x0004505 (-2^14.1089) <= r4  <= 0x00004505 (+2^14.1089)
str.w r4, [r0, #3036]
/* computing z1 = x1y0 + x0y1 + zeta^253 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x7de82b8 (-2^26.9762) <= r4  <= 0x07de82b8 (+2^26.9762)
mla.w r4, r9, r7, r4
    //// bounds:  -0x11b99c51 (-2^28.1477) <= r4  <= 0x11b99c51 (+2^28.1477)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1b94b5ea (-2^28.7856) <= r4  <= 0x1b94b5ea (+2^28.7856)
MONTRED r4, r3
    //// bounds:  -0x0004d94 (-2^14.2776) <= r4  <= 0x00004d95 (+2^14.2777)
str.w r4, [r0, #3040]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3044]
ldr.w r10, [r1, #3048]
ldr.w r9, [r1, #3052]
ldr.w r8, [r1, #3056]
ldr.w r7, [r2, #3048]
ldr.w r6, [r2, #3052]
ldr.w r5, [r2, #3056]
/*** basemul 254 ***/
/* computing z0 = x0y0 + zeta^254 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =3894
mul.w r4, r4, r14
    //// bounds:  -0x4245e64 (-2^26.0504) <= r4  <= 0x04245e64 (+2^26.0504)
mla.w r4, r10, r7, r4
    //// bounds:  -0xdff77fd (-2^27.8071) <= r4  <= 0x0dff77fd (+2^27.8071)
MONTRED r4, r3
    //// bounds:  -0x0003fff (-2^13.9999) <= r4  <= 0x00003fff (+2^13.9999)
str.w r4, [r0, #3048]
/* computing z1 = x1y0 + x0y1 + zeta^254 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x38e7532 (-2^25.8304) <= r4  <= 0x038e7532 (+2^25.8304)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd698ecb (-2^27.7455) <= r4  <= 0x0d698ecb (+2^27.7455)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1744a864 (-2^28.5403) <= r4  <= 0x1744a864 (+2^28.5403)
MONTRED r4, r3
    //// bounds:  -0x0004944 (-2^14.1951) <= r4  <= 0x00004945 (+2^14.1951)
str.w r4, [r0, #3052]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3056]
ldr.w r10, [r1, #3060]
ldr.w r9, [r1, #3064]
ldr.w r8, [r1, #3068]
ldr.w r7, [r2, #3060]
ldr.w r6, [r2, #3064]
ldr.w r5, [r2, #3068]
/*** basemul 255 ***/
/* computing z0 = x0y0 + zeta^255 * (x2y1 + x1y2) */
mul.w r4, r9, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r8, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
MONTRED r4, r3
    //// bounds:  -0x00045b6 (-2^14.1233) <= r4  <= 0x000045b6 (+2^14.1233)
ldr.w r14, =-3894
mul.w r4, r4, r14
    //// bounds:  -0x4245e64 (-2^26.0504) <= r4  <= 0x04245e64 (+2^26.0504)
mla.w r4, r10, r7, r4
    //// bounds:  -0xdff77fd (-2^27.8071) <= r4  <= 0x0dff77fd (+2^27.8071)
MONTRED r4, r3
    //// bounds:  -0x0003fff (-2^13.9999) <= r4  <= 0x00003fff (+2^13.9999)
str.w r4, [r0, #3060]
/* computing z1 = x1y0 + x0y1 + zeta^255 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
MONTRED r4, r3
    //// bounds:  -0x0003bdb (-2^13.9034) <= r4  <= 0x00003bdb (+2^13.9034)
mul.w r4, r4, r14
    //// bounds:  -0x38e7532 (-2^25.8304) <= r4  <= 0x038e7532 (+2^25.8304)
mla.w r4, r9, r7, r4
    //// bounds:  -0xd698ecb (-2^27.7455) <= r4  <= 0x0d698ecb (+2^27.7455)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1744a864 (-2^28.5403) <= r4  <= 0x1744a864 (+2^28.5403)
MONTRED r4, r3
    //// bounds:  -0x0004944 (-2^14.1951) <= r4  <= 0x00004945 (+2^14.1951)
str.w r4, [r0, #3064]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x9db1999 (-2^27.3010) <= r4  <= 0x09db1999 (+2^27.3010)
mla.w r4, r9, r6, r4
    //// bounds:  -0x13b63332 (-2^28.3010) <= r4  <= 0x13b63332 (+2^28.3010)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1d914ccb (-2^28.8859) <= r4  <= 0x1d914ccb (+2^28.8859)
MONTRED r4, r3
    //// bounds:  -0x0004f91 (-2^14.3141) <= r4  <= 0x00004f91 (+2^14.3141)
str.w r4, [r0, #3068]
    pop {r4-r11, pc}
    .ltorg
    
/* minimum available registers: 1 */
