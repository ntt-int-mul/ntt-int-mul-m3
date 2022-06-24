    .syntax unified
    .cpu cortex-m3
    .section .text

    .align 2
    .global basemul_12289
    .type basemul_12289, %function
    basemul_12289:
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
        .macro MONTRED z, tmp
            mul.w \tmp, \z, r11
            sbfx.w \tmp, \tmp, #0, #16
            mls.w \z, \tmp, r12, \z
            asr.w \z, #16
        .endm
        
ldr.w r11, =53249
ldr.w r12, =12289
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4091
mul.w r4, r4, r14
    //// bounds:  -0x29bfeff (-2^25.3837) <= r4  <= 0x029bfeff (+2^25.3837)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb82910f (-2^27.5248) <= r4  <= 0x0b82910f (+2^27.5248)
MONTRED r4, r3
    //// bounds:  -0x0002382 (-2^13.1501) <= r4  <= 0x00002383 (+2^13.1502)
str.w r4, [r0, #0]
/* computing z1 = x1y0 + x0y1 + zeta^0 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x20dbb82 (-2^25.0382) <= r4  <= 0x020dcb7d (+2^25.0384)
mla.w r4, r9, r7, r4
    //// bounds:  -0xaf44d92 (-2^27.4534) <= r4  <= 0x0af45d8d (+2^27.4535)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13dadfa2 (-2^28.3114) <= r4  <= 0x13daef9d (+2^28.3114)
MONTRED r4, r3
    //// bounds:  -0x0002bdb (-2^13.4547) <= r4  <= 0x00002bdb (+2^13.4547)
str.w r4, [r0, #4]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4091
mul.w r4, r4, r14
    //// bounds:  -0x29bfeff (-2^25.3837) <= r4  <= 0x029bfeff (+2^25.3837)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb82910f (-2^27.5248) <= r4  <= 0x0b82910f (+2^27.5248)
MONTRED r4, r3
    //// bounds:  -0x0002382 (-2^13.1501) <= r4  <= 0x00002383 (+2^13.1502)
str.w r4, [r0, #12]
/* computing z1 = x1y0 + x0y1 + zeta^1 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x20dcb7d (-2^25.0384) <= r4  <= 0x020dbb82 (+2^25.0382)
mla.w r4, r9, r7, r4
    //// bounds:  -0xaf45d8d (-2^27.4535) <= r4  <= 0x0af44d92 (+2^27.4534)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13daef9d (-2^28.3114) <= r4  <= 0x13dadfa2 (+2^28.3114)
MONTRED r4, r3
    //// bounds:  -0x0002bdb (-2^13.4547) <= r4  <= 0x00002bdb (+2^13.4547)
str.w r4, [r0, #16]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4401
mul.w r4, r4, r14
    //// bounds:  -0x2ce9d3d (-2^25.4891) <= r4  <= 0x02ce9d3d (+2^25.4891)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbb52f4d (-2^27.5494) <= r4  <= 0x0bb52f4d (+2^27.5494)
MONTRED r4, r3
    //// bounds:  -0x00023b5 (-2^13.1581) <= r4  <= 0x000023b5 (+2^13.1581)
str.w r4, [r0, #24]
/* computing z1 = x1y0 + x0y1 + zeta^2 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2359206 (-2^25.1436) <= r4  <= 0x0235a337 (+2^25.1437)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb1c2416 (-2^27.4738) <= r4  <= 0x0b1c3547 (+2^27.4738)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1402b626 (-2^28.3227) <= r4  <= 0x1402c757 (+2^28.3227)
MONTRED r4, r3
    //// bounds:  -0x0002c03 (-2^13.4598) <= r4  <= 0x00002c03 (+2^13.4598)
str.w r4, [r0, #28]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4401
mul.w r4, r4, r14
    //// bounds:  -0x2ce9d3d (-2^25.4891) <= r4  <= 0x02ce9d3d (+2^25.4891)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbb52f4d (-2^27.5494) <= r4  <= 0x0bb52f4d (+2^27.5494)
MONTRED r4, r3
    //// bounds:  -0x00023b5 (-2^13.1581) <= r4  <= 0x000023b5 (+2^13.1581)
str.w r4, [r0, #36]
/* computing z1 = x1y0 + x0y1 + zeta^3 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x235a337 (-2^25.1437) <= r4  <= 0x02359206 (+2^25.1436)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb1c3547 (-2^27.4738) <= r4  <= 0x0b1c2416 (+2^27.4738)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1402c757 (-2^28.3227) <= r4  <= 0x1402b626 (+2^28.3227)
MONTRED r4, r3
    //// bounds:  -0x0002c03 (-2^13.4598) <= r4  <= 0x00002c03 (+2^13.4598)
str.w r4, [r0, #40]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1081
mul.w r4, r4, r14
    //// bounds:  -0x0b082a5 (-2^23.4636) <= r4  <= 0x00b082a5 (+2^23.4636)
mla.w r4, r10, r7, r4
    //// bounds:  -0x99714b5 (-2^27.2616) <= r4  <= 0x099714b5 (+2^27.2616)
MONTRED r4, r3
    //// bounds:  -0x0002197 (-2^13.0700) <= r4  <= 0x00002197 (+2^13.0700)
str.w r4, [r0, #48]
/* computing z1 = x1y0 + x0y1 + zeta^4 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x08aef6f (-2^23.1183) <= r4  <= 0x008aeb36 (+2^23.1181)
mla.w r4, r9, r7, r4
    //// bounds:  -0x971817f (-2^27.2393) <= r4  <= 0x09717d46 (+2^27.2393)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1258138f (-2^28.1972) <= r4  <= 0x12580f56 (+2^28.1972)
MONTRED r4, r3
    //// bounds:  -0x0002a58 (-2^13.4041) <= r4  <= 0x00002a58 (+2^13.4041)
str.w r4, [r0, #52]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1081
mul.w r4, r4, r14
    //// bounds:  -0x0b082a5 (-2^23.4636) <= r4  <= 0x00b082a5 (+2^23.4636)
mla.w r4, r10, r7, r4
    //// bounds:  -0x99714b5 (-2^27.2616) <= r4  <= 0x099714b5 (+2^27.2616)
MONTRED r4, r3
    //// bounds:  -0x0002197 (-2^13.0700) <= r4  <= 0x00002197 (+2^13.0700)
str.w r4, [r0, #60]
/* computing z1 = x1y0 + x0y1 + zeta^5 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x08aeb36 (-2^23.1181) <= r4  <= 0x008aef6f (+2^23.1183)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9717d46 (-2^27.2393) <= r4  <= 0x0971817f (+2^27.2393)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12580f56 (-2^28.1972) <= r4  <= 0x1258138f (+2^28.1972)
MONTRED r4, r3
    //// bounds:  -0x0002a58 (-2^13.4041) <= r4  <= 0x00002a58 (+2^13.4041)
str.w r4, [r0, #64]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1229
mul.w r4, r4, r14
    //// bounds:  -0x0c8ad29 (-2^23.6487) <= r4  <= 0x00c8ad29 (+2^23.6487)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9af3f39 (-2^27.2757) <= r4  <= 0x09af3f39 (+2^27.2757)
MONTRED r4, r3
    //// bounds:  -0x00021af (-2^13.0740) <= r4  <= 0x000021af (+2^13.0740)
str.w r4, [r0, #72]
/* computing z1 = x1y0 + x0y1 + zeta^6 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x09df4fb (-2^23.3034) <= r4  <= 0x009df02e (+2^23.3032)
mla.w r4, r9, r7, r4
    //// bounds:  -0x984870b (-2^27.2506) <= r4  <= 0x0984823e (+2^27.2506)
mla.w r4, r10, r6, r4
    //// bounds:  -0x126b191b (-2^28.2031) <= r4  <= 0x126b144e (+2^28.2031)
MONTRED r4, r3
    //// bounds:  -0x0002a6b (-2^13.4066) <= r4  <= 0x00002a6b (+2^13.4066)
str.w r4, [r0, #76]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1229
mul.w r4, r4, r14
    //// bounds:  -0x0c8ad29 (-2^23.6487) <= r4  <= 0x00c8ad29 (+2^23.6487)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9af3f39 (-2^27.2757) <= r4  <= 0x09af3f39 (+2^27.2757)
MONTRED r4, r3
    //// bounds:  -0x00021af (-2^13.0740) <= r4  <= 0x000021af (+2^13.0740)
str.w r4, [r0, #84]
/* computing z1 = x1y0 + x0y1 + zeta^7 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x09df02e (-2^23.3032) <= r4  <= 0x009df4fb (+2^23.3034)
mla.w r4, r9, r7, r4
    //// bounds:  -0x984823e (-2^27.2506) <= r4  <= 0x0984870b (+2^27.2506)
mla.w r4, r10, r6, r4
    //// bounds:  -0x126b144e (-2^28.2031) <= r4  <= 0x126b191b (+2^28.2031)
MONTRED r4, r3
    //// bounds:  -0x0002a6b (-2^13.4066) <= r4  <= 0x00002a6b (+2^13.4066)
str.w r4, [r0, #88]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-6014
mul.w r4, r4, r14
    //// bounds:  -0x3d5fde6 (-2^25.9396) <= r4  <= 0x03d5fde6 (+2^25.9396)
mla.w r4, r10, r7, r4
    //// bounds:  -0xcbc8ff6 (-2^27.6709) <= r4  <= 0x0cbc8ff6 (+2^27.6709)
MONTRED r4, r3
    //// bounds:  -0x00024bc (-2^13.1991) <= r4  <= 0x000024bd (+2^13.1992)
str.w r4, [r0, #96]
/* computing z1 = x1y0 + x0y1 + zeta^8 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x304f2b2 (-2^25.5942) <= r4  <= 0x0304db34 (+2^25.5941)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbeb84c2 (-2^27.5753) <= r4  <= 0x0beb6d44 (+2^27.5753)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14d216d2 (-2^28.3799) <= r4  <= 0x14d1ff54 (+2^28.3799)
MONTRED r4, r3
    //// bounds:  -0x0002cd2 (-2^13.4861) <= r4  <= 0x00002cd2 (+2^13.4861)
str.w r4, [r0, #100]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =6014
mul.w r4, r4, r14
    //// bounds:  -0x3d5fde6 (-2^25.9396) <= r4  <= 0x03d5fde6 (+2^25.9396)
mla.w r4, r10, r7, r4
    //// bounds:  -0xcbc8ff6 (-2^27.6709) <= r4  <= 0x0cbc8ff6 (+2^27.6709)
MONTRED r4, r3
    //// bounds:  -0x00024bc (-2^13.1991) <= r4  <= 0x000024bd (+2^13.1992)
str.w r4, [r0, #108]
/* computing z1 = x1y0 + x0y1 + zeta^9 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x304db34 (-2^25.5941) <= r4  <= 0x0304f2b2 (+2^25.5942)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbeb6d44 (-2^27.5753) <= r4  <= 0x0beb84c2 (+2^27.5753)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14d1ff54 (-2^28.3799) <= r4  <= 0x14d216d2 (+2^28.3799)
MONTRED r4, r3
    //// bounds:  -0x0002cd2 (-2^13.4861) <= r4  <= 0x00002cd2 (+2^13.4861)
str.w r4, [r0, #112]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =2530
mul.w r4, r4, r14
    //// bounds:  -0x19d1bfa (-2^24.6904) <= r4  <= 0x019d1bfa (+2^24.6904)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa83ae0a (-2^27.3943) <= r4  <= 0x0a83ae0a (+2^27.3943)
MONTRED r4, r3
    //// bounds:  -0x0002283 (-2^13.1090) <= r4  <= 0x00002284 (+2^13.1092)
str.w r4, [r0, #120]
/* computing z1 = x1y0 + x0y1 + zeta^10 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x145210c (-2^24.3449) <= r4  <= 0x01452aee (+2^24.3450)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa2bb31c (-2^27.3463) <= r4  <= 0x0a2bbcfe (+2^27.3464)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1312452c (-2^28.2533) <= r4  <= 0x13124f0e (+2^28.2533)
MONTRED r4, r3
    //// bounds:  -0x0002b12 (-2^13.4286) <= r4  <= 0x00002b12 (+2^13.4286)
str.w r4, [r0, #124]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-2530
mul.w r4, r4, r14
    //// bounds:  -0x19d1bfa (-2^24.6904) <= r4  <= 0x019d1bfa (+2^24.6904)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa83ae0a (-2^27.3943) <= r4  <= 0x0a83ae0a (+2^27.3943)
MONTRED r4, r3
    //// bounds:  -0x0002283 (-2^13.1090) <= r4  <= 0x00002284 (+2^13.1092)
str.w r4, [r0, #132]
/* computing z1 = x1y0 + x0y1 + zeta^11 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1452aee (-2^24.3450) <= r4  <= 0x0145210c (+2^24.3449)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa2bbcfe (-2^27.3464) <= r4  <= 0x0a2bb31c (+2^27.3463)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13124f0e (-2^28.2533) <= r4  <= 0x1312452c (+2^28.2533)
MONTRED r4, r3
    //// bounds:  -0x0002b12 (-2^13.4286) <= r4  <= 0x00002b12 (+2^13.4286)
str.w r4, [r0, #136]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5329
mul.w r4, r4, r14
    //// bounds:  -0x366245d (-2^25.7651) <= r4  <= 0x0366245d (+2^25.7651)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc4cb66d (-2^27.6205) <= r4  <= 0x0c4cb66d (+2^27.6205)
MONTRED r4, r3
    //// bounds:  -0x000244d (-2^13.1819) <= r4  <= 0x0000244d (+2^13.1819)
str.w r4, [r0, #144]
/* computing z1 = x1y0 + x0y1 + zeta^12 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2acd3c6 (-2^25.4196) <= r4  <= 0x02ace897 (+2^25.4198)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb9365d6 (-2^27.5330) <= r4  <= 0x0b937aa7 (+2^27.5331)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1479f7e6 (-2^28.3559) <= r4  <= 0x147a0cb7 (+2^28.3559)
MONTRED r4, r3
    //// bounds:  -0x0002c7a (-2^13.4750) <= r4  <= 0x00002c7a (+2^13.4750)
str.w r4, [r0, #148]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5329
mul.w r4, r4, r14
    //// bounds:  -0x366245d (-2^25.7651) <= r4  <= 0x0366245d (+2^25.7651)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc4cb66d (-2^27.6205) <= r4  <= 0x0c4cb66d (+2^27.6205)
MONTRED r4, r3
    //// bounds:  -0x000244d (-2^13.1819) <= r4  <= 0x0000244d (+2^13.1819)
str.w r4, [r0, #156]
/* computing z1 = x1y0 + x0y1 + zeta^13 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2ace897 (-2^25.4198) <= r4  <= 0x02acd3c6 (+2^25.4196)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb937aa7 (-2^27.5331) <= r4  <= 0x0b9365d6 (+2^27.5330)
mla.w r4, r10, r6, r4
    //// bounds:  -0x147a0cb7 (-2^28.3559) <= r4  <= 0x1479f7e6 (+2^28.3559)
MONTRED r4, r3
    //// bounds:  -0x0002c7a (-2^13.4750) <= r4  <= 0x00002c7a (+2^13.4750)
str.w r4, [r0, #160]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4342
mul.w r4, r4, r14
    //// bounds:  -0x2c4fafe (-2^25.4696) <= r4  <= 0x02c4fafe (+2^25.4696)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbab8d0e (-2^27.5447) <= r4  <= 0x0bab8d0e (+2^27.5447)
MONTRED r4, r3
    //// bounds:  -0x00023ab (-2^13.1566) <= r4  <= 0x000023ac (+2^13.1567)
str.w r4, [r0, #168]
/* computing z1 = x1y0 + x0y1 + zeta^14 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x22dfd04 (-2^25.1241) <= r4  <= 0x022e0dfa (+2^25.1243)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb148f14 (-2^27.4699) <= r4  <= 0x0b14a00a (+2^27.4700)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13fb2124 (-2^28.3206) <= r4  <= 0x13fb321a (+2^28.3206)
MONTRED r4, r3
    //// bounds:  -0x0002bfb (-2^13.4588) <= r4  <= 0x00002bfb (+2^13.4588)
str.w r4, [r0, #172]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4342
mul.w r4, r4, r14
    //// bounds:  -0x2c4fafe (-2^25.4696) <= r4  <= 0x02c4fafe (+2^25.4696)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbab8d0e (-2^27.5447) <= r4  <= 0x0bab8d0e (+2^27.5447)
MONTRED r4, r3
    //// bounds:  -0x00023ab (-2^13.1566) <= r4  <= 0x000023ac (+2^13.1567)
str.w r4, [r0, #180]
/* computing z1 = x1y0 + x0y1 + zeta^15 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x22e0dfa (-2^25.1243) <= r4  <= 0x022dfd04 (+2^25.1241)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb14a00a (-2^27.4700) <= r4  <= 0x0b148f14 (+2^27.4699)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13fb321a (-2^28.3206) <= r4  <= 0x13fb2124 (+2^28.3206)
MONTRED r4, r3
    //// bounds:  -0x0002bfb (-2^13.4588) <= r4  <= 0x00002bfb (+2^13.4588)
str.w r4, [r0, #184]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =586
mul.w r4, r4, r14
    //// bounds:  -0x05faf42 (-2^22.5802) <= r4  <= 0x005faf42 (+2^22.5802)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9464152 (-2^27.2133) <= r4  <= 0x09464152 (+2^27.2133)
MONTRED r4, r3
    //// bounds:  -0x0002146 (-2^13.0563) <= r4  <= 0x00002146 (+2^13.0563)
str.w r4, [r0, #192]
/* computing z1 = x1y0 + x0y1 + zeta^16 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x04b4e7c (-2^22.2347) <= r4  <= 0x004b50c6 (+2^22.2349)
mla.w r4, r9, r7, r4
    //// bounds:  -0x931e08c (-2^27.2008) <= r4  <= 0x0931e2d6 (+2^27.2008)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1218729c (-2^28.1776) <= r4  <= 0x121874e6 (+2^28.1776)
MONTRED r4, r3
    //// bounds:  -0x0002a18 (-2^13.3955) <= r4  <= 0x00002a18 (+2^13.3955)
str.w r4, [r0, #196]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-586
mul.w r4, r4, r14
    //// bounds:  -0x05faf42 (-2^22.5802) <= r4  <= 0x005faf42 (+2^22.5802)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9464152 (-2^27.2133) <= r4  <= 0x09464152 (+2^27.2133)
MONTRED r4, r3
    //// bounds:  -0x0002146 (-2^13.0563) <= r4  <= 0x00002146 (+2^13.0563)
str.w r4, [r0, #204]
/* computing z1 = x1y0 + x0y1 + zeta^17 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x04b50c6 (-2^22.2349) <= r4  <= 0x004b4e7c (+2^22.2347)
mla.w r4, r9, r7, r4
    //// bounds:  -0x931e2d6 (-2^27.2008) <= r4  <= 0x0931e08c (+2^27.2008)
mla.w r4, r10, r6, r4
    //// bounds:  -0x121874e6 (-2^28.1776) <= r4  <= 0x1218729c (+2^28.1776)
MONTRED r4, r3
    //// bounds:  -0x0002a18 (-2^13.3955) <= r4  <= 0x00002a18 (+2^13.3955)
str.w r4, [r0, #208]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5825
mul.w r4, r4, r14
    //// bounds:  -0x3b7218d (-2^25.8935) <= r4  <= 0x03b7218d (+2^25.8935)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc9db39d (-2^27.6572) <= r4  <= 0x0c9db39d (+2^27.6572)
MONTRED r4, r3
    //// bounds:  -0x000249e (-2^13.1944) <= r4  <= 0x0000249e (+2^13.1944)
str.w r4, [r0, #216]
/* computing z1 = x1y0 + x0y1 + zeta^18 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2eca827 (-2^25.5482) <= r4  <= 0x02ec9166 (+2^25.5480)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbd33a37 (-2^27.5638) <= r4  <= 0x0bd32376 (+2^27.5637)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14b9cc47 (-2^28.3734) <= r4  <= 0x14b9b586 (+2^28.3733)
MONTRED r4, r3
    //// bounds:  -0x0002cba (-2^13.4831) <= r4  <= 0x00002cba (+2^13.4831)
str.w r4, [r0, #220]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5825
mul.w r4, r4, r14
    //// bounds:  -0x3b7218d (-2^25.8935) <= r4  <= 0x03b7218d (+2^25.8935)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc9db39d (-2^27.6572) <= r4  <= 0x0c9db39d (+2^27.6572)
MONTRED r4, r3
    //// bounds:  -0x000249e (-2^13.1944) <= r4  <= 0x0000249e (+2^13.1944)
str.w r4, [r0, #228]
/* computing z1 = x1y0 + x0y1 + zeta^19 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2ec9166 (-2^25.5480) <= r4  <= 0x02eca827 (+2^25.5482)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbd32376 (-2^27.5637) <= r4  <= 0x0bd33a37 (+2^27.5638)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14b9b586 (-2^28.3733) <= r4  <= 0x14b9cc47 (+2^28.3734)
MONTRED r4, r3
    //// bounds:  -0x0002cba (-2^13.4831) <= r4  <= 0x00002cba (+2^13.4831)
str.w r4, [r0, #232]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-2579
mul.w r4, r4, r14
    //// bounds:  -0x1a51c37 (-2^24.7181) <= r4  <= 0x01a51c37 (+2^24.7181)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa8bae47 (-2^27.3986) <= r4  <= 0x0a8bae47 (+2^27.3986)
MONTRED r4, r3
    //// bounds:  -0x000228b (-2^13.1103) <= r4  <= 0x0000228c (+2^13.1105)
str.w r4, [r0, #240]
/* computing z1 = x1y0 + x0y1 + zeta^20 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x14b7725 (-2^24.3727) <= r4  <= 0x014b6d12 (+2^24.3725)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa320935 (-2^27.3499) <= r4  <= 0x0a31ff22 (+2^27.3498)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13189b45 (-2^28.2552) <= r4  <= 0x13189132 (+2^28.2552)
MONTRED r4, r3
    //// bounds:  -0x0002b18 (-2^13.4294) <= r4  <= 0x00002b19 (+2^13.4295)
str.w r4, [r0, #244]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =2579
mul.w r4, r4, r14
    //// bounds:  -0x1a51c37 (-2^24.7181) <= r4  <= 0x01a51c37 (+2^24.7181)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa8bae47 (-2^27.3986) <= r4  <= 0x0a8bae47 (+2^27.3986)
MONTRED r4, r3
    //// bounds:  -0x000228b (-2^13.1103) <= r4  <= 0x0000228c (+2^13.1105)
str.w r4, [r0, #252]
/* computing z1 = x1y0 + x0y1 + zeta^21 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x14b6d12 (-2^24.3725) <= r4  <= 0x014b7725 (+2^24.3727)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa31ff22 (-2^27.3498) <= r4  <= 0x0a320935 (+2^27.3499)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13189132 (-2^28.2552) <= r4  <= 0x13189b45 (+2^28.2552)
MONTRED r4, r3
    //// bounds:  -0x0002b18 (-2^13.4294) <= r4  <= 0x00002b19 (+2^13.4295)
str.w r4, [r0, #256]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4751
mul.w r4, r4, r14
    //// bounds:  -0x307c383 (-2^25.5995) <= r4  <= 0x0307c383 (+2^25.5995)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbee5593 (-2^27.5766) <= r4  <= 0x0bee5593 (+2^27.5766)
MONTRED r4, r3
    //// bounds:  -0x00023ee (-2^13.1671) <= r4  <= 0x000023ee (+2^13.1671)
str.w r4, [r0, #264]
/* computing z1 = x1y0 + x0y1 + zeta^22 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2629f09 (-2^25.2541) <= r4  <= 0x02628c7a (+2^25.2540)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb493119 (-2^27.4965) <= r4  <= 0x0b491e8a (+2^27.4964)
mla.w r4, r10, r6, r4
    //// bounds:  -0x142fc329 (-2^28.3353) <= r4  <= 0x142fb09a (+2^28.3353)
MONTRED r4, r3
    //// bounds:  -0x0002c30 (-2^13.4656) <= r4  <= 0x00002c30 (+2^13.4656)
str.w r4, [r0, #268]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4751
mul.w r4, r4, r14
    //// bounds:  -0x307c383 (-2^25.5995) <= r4  <= 0x0307c383 (+2^25.5995)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbee5593 (-2^27.5766) <= r4  <= 0x0bee5593 (+2^27.5766)
MONTRED r4, r3
    //// bounds:  -0x00023ee (-2^13.1671) <= r4  <= 0x000023ee (+2^13.1671)
str.w r4, [r0, #276]
/* computing z1 = x1y0 + x0y1 + zeta^23 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2628c7a (-2^25.2540) <= r4  <= 0x02629f09 (+2^25.2541)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb491e8a (-2^27.4964) <= r4  <= 0x0b493119 (+2^27.4965)
mla.w r4, r10, r6, r4
    //// bounds:  -0x142fb09a (-2^28.3353) <= r4  <= 0x142fc329 (+2^28.3353)
MONTRED r4, r3
    //// bounds:  -0x0002c30 (-2^13.4656) <= r4  <= 0x00002c30 (+2^13.4656)
str.w r4, [r0, #280]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5890
mul.w r4, r4, r14
    //// bounds:  -0x3c1be9a (-2^25.9095) <= r4  <= 0x03c1be9a (+2^25.9095)
mla.w r4, r10, r7, r4
    //// bounds:  -0xca850aa (-2^27.6619) <= r4  <= 0x0ca850aa (+2^27.6619)
MONTRED r4, r3
    //// bounds:  -0x00024a8 (-2^13.1960) <= r4  <= 0x000024a8 (+2^13.1960)
str.w r4, [r0, #288]
/* computing z1 = x1y0 + x0y1 + zeta^24 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2f502ce (-2^25.5642) <= r4  <= 0x02f4ebcc (+2^25.5640)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbdb94de (-2^27.5678) <= r4  <= 0x0bdb7ddc (+2^27.5677)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14c226ee (-2^28.3756) <= r4  <= 0x14c20fec (+2^28.3756)
MONTRED r4, r3
    //// bounds:  -0x0002cc2 (-2^13.4841) <= r4  <= 0x00002cc2 (+2^13.4841)
str.w r4, [r0, #292]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5890
mul.w r4, r4, r14
    //// bounds:  -0x3c1be9a (-2^25.9095) <= r4  <= 0x03c1be9a (+2^25.9095)
mla.w r4, r10, r7, r4
    //// bounds:  -0xca850aa (-2^27.6619) <= r4  <= 0x0ca850aa (+2^27.6619)
MONTRED r4, r3
    //// bounds:  -0x00024a8 (-2^13.1960) <= r4  <= 0x000024a8 (+2^13.1960)
str.w r4, [r0, #300]
/* computing z1 = x1y0 + x0y1 + zeta^25 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2f4ebcc (-2^25.5640) <= r4  <= 0x02f502ce (+2^25.5642)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbdb7ddc (-2^27.5677) <= r4  <= 0x0bdb94de (+2^27.5678)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14c20fec (-2^28.3756) <= r4  <= 0x14c226ee (+2^28.3756)
MONTRED r4, r3
    //// bounds:  -0x0002cc2 (-2^13.4841) <= r4  <= 0x00002cc2 (+2^13.4841)
str.w r4, [r0, #304]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1591
mul.w r4, r4, r14
    //// bounds:  -0x103c90b (-2^24.0212) <= r4  <= 0x0103c90b (+2^24.0212)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9ea5b1b (-2^27.3097) <= r4  <= 0x09ea5b1b (+2^27.3097)
MONTRED r4, r3
    //// bounds:  -0x00021ea (-2^13.0838) <= r4  <= 0x000021ea (+2^13.0838)
str.w r4, [r0, #312]
/* computing z1 = x1y0 + x0y1 + zeta^26 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0cc756a (-2^23.6757) <= r4  <= 0x00cc7ba1 (+2^23.6758)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9b3077a (-2^27.2779) <= r4  <= 0x09b30db1 (+2^27.2779)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1299998a (-2^28.2172) <= r4  <= 0x12999fc1 (+2^28.2172)
MONTRED r4, r3
    //// bounds:  -0x0002a99 (-2^13.4127) <= r4  <= 0x00002a9a (+2^13.4128)
str.w r4, [r0, #316]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1591
mul.w r4, r4, r14
    //// bounds:  -0x103c90b (-2^24.0212) <= r4  <= 0x0103c90b (+2^24.0212)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9ea5b1b (-2^27.3097) <= r4  <= 0x09ea5b1b (+2^27.3097)
MONTRED r4, r3
    //// bounds:  -0x00021ea (-2^13.0838) <= r4  <= 0x000021ea (+2^13.0838)
str.w r4, [r0, #324]
/* computing z1 = x1y0 + x0y1 + zeta^27 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0cc7ba1 (-2^23.6758) <= r4  <= 0x00cc756a (+2^23.6757)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9b30db1 (-2^27.2779) <= r4  <= 0x09b3077a (+2^27.2779)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12999fc1 (-2^28.2172) <= r4  <= 0x1299998a (+2^28.2172)
MONTRED r4, r3
    //// bounds:  -0x0002a99 (-2^13.4127) <= r4  <= 0x00002a9a (+2^13.4128)
str.w r4, [r0, #328]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =2812
mul.w r4, r4, r14
    //// bounds:  -0x1cb27cc (-2^24.8428) <= r4  <= 0x01cb27cc (+2^24.8428)
mla.w r4, r10, r7, r4
    //// bounds:  -0xab1b9dc (-2^27.4188) <= r4  <= 0x0ab1b9dc (+2^27.4188)
MONTRED r4, r3
    //// bounds:  -0x00022b2 (-2^13.1167) <= r4  <= 0x000022b2 (+2^13.1167)
str.w r4, [r0, #336]
/* computing z1 = x1y0 + x0y1 + zeta^28 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1695e68 (-2^24.4973) <= r4  <= 0x01696964 (+2^24.4975)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa4ff078 (-2^27.3663) <= r4  <= 0x0a4ffb74 (+2^27.3663)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13368288 (-2^28.2640) <= r4  <= 0x13368d84 (+2^28.2640)
MONTRED r4, r3
    //// bounds:  -0x0002b36 (-2^13.4333) <= r4  <= 0x00002b37 (+2^13.4335)
str.w r4, [r0, #340]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-2812
mul.w r4, r4, r14
    //// bounds:  -0x1cb27cc (-2^24.8428) <= r4  <= 0x01cb27cc (+2^24.8428)
mla.w r4, r10, r7, r4
    //// bounds:  -0xab1b9dc (-2^27.4188) <= r4  <= 0x0ab1b9dc (+2^27.4188)
MONTRED r4, r3
    //// bounds:  -0x00022b2 (-2^13.1167) <= r4  <= 0x000022b2 (+2^13.1167)
str.w r4, [r0, #348]
/* computing z1 = x1y0 + x0y1 + zeta^29 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1696964 (-2^24.4975) <= r4  <= 0x01695e68 (+2^24.4973)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa4ffb74 (-2^27.3663) <= r4  <= 0x0a4ff078 (+2^27.3663)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13368d84 (-2^28.2640) <= r4  <= 0x13368288 (+2^28.2640)
MONTRED r4, r3
    //// bounds:  -0x0002b36 (-2^13.4333) <= r4  <= 0x00002b37 (+2^13.4335)
str.w r4, [r0, #352]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5266
mul.w r4, r4, r14
    //// bounds:  -0x35bdaea (-2^25.7479) <= r4  <= 0x035bdaea (+2^25.7479)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc426cfa (-2^27.6158) <= r4  <= 0x0c426cfa (+2^27.6158)
MONTRED r4, r3
    //// bounds:  -0x0002442 (-2^13.1802) <= r4  <= 0x00002442 (+2^13.1802)
str.w r4, [r0, #360]
/* computing z1 = x1y0 + x0y1 + zeta^30 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2a4bb2c (-2^25.4024) <= r4  <= 0x02a4cfbe (+2^25.4026)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb8b4d3c (-2^27.5291) <= r4  <= 0x0b8b61ce (+2^27.5291)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1471df4c (-2^28.3537) <= r4  <= 0x1471f3de (+2^28.3537)
MONTRED r4, r3
    //// bounds:  -0x0002c72 (-2^13.4740) <= r4  <= 0x00002c72 (+2^13.4740)
str.w r4, [r0, #364]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5266
mul.w r4, r4, r14
    //// bounds:  -0x35bdaea (-2^25.7479) <= r4  <= 0x035bdaea (+2^25.7479)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc426cfa (-2^27.6158) <= r4  <= 0x0c426cfa (+2^27.6158)
MONTRED r4, r3
    //// bounds:  -0x0002442 (-2^13.1802) <= r4  <= 0x00002442 (+2^13.1802)
str.w r4, [r0, #372]
/* computing z1 = x1y0 + x0y1 + zeta^31 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2a4cfbe (-2^25.4026) <= r4  <= 0x02a4bb2c (+2^25.4024)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb8b61ce (-2^27.5291) <= r4  <= 0x0b8b4d3c (+2^27.5291)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1471f3de (-2^28.3537) <= r4  <= 0x1471df4c (+2^28.3537)
MONTRED r4, r3
    //// bounds:  -0x0002c72 (-2^13.4740) <= r4  <= 0x00002c72 (+2^13.4740)
str.w r4, [r0, #376]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1875
mul.w r4, r4, r14
    //// bounds:  -0x1322877 (-2^24.2581) <= r4  <= 0x01322877 (+2^24.2581)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa18ba87 (-2^27.3358) <= r4  <= 0x0a18ba87 (+2^27.3358)
MONTRED r4, r3
    //// bounds:  -0x0002219 (-2^13.0916) <= r4  <= 0x00002219 (+2^13.0916)
str.w r4, [r0, #384]
/* computing z1 = x1y0 + x0y1 + zeta^32 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0f0f492 (-2^23.9126) <= r4  <= 0x00f0fbe5 (+2^23.9128)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9d786a2 (-2^27.2989) <= r4  <= 0x09d78df5 (+2^27.2990)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12be18b2 (-2^28.2282) <= r4  <= 0x12be2005 (+2^28.2283)
MONTRED r4, r3
    //// bounds:  -0x0002abe (-2^13.4176) <= r4  <= 0x00002abe (+2^13.4176)
str.w r4, [r0, #388]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1875
mul.w r4, r4, r14
    //// bounds:  -0x1322877 (-2^24.2581) <= r4  <= 0x01322877 (+2^24.2581)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa18ba87 (-2^27.3358) <= r4  <= 0x0a18ba87 (+2^27.3358)
MONTRED r4, r3
    //// bounds:  -0x0002219 (-2^13.0916) <= r4  <= 0x00002219 (+2^13.0916)
str.w r4, [r0, #396]
/* computing z1 = x1y0 + x0y1 + zeta^33 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0f0fbe5 (-2^23.9128) <= r4  <= 0x00f0f492 (+2^23.9126)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9d78df5 (-2^27.2990) <= r4  <= 0x09d786a2 (+2^27.2989)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12be2005 (-2^28.2283) <= r4  <= 0x12be18b2 (+2^28.2282)
MONTRED r4, r3
    //// bounds:  -0x0002abe (-2^13.4176) <= r4  <= 0x00002abe (+2^13.4176)
str.w r4, [r0, #400]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4189
mul.w r4, r4, r14
    //// bounds:  -0x2abff79 (-2^25.4178) <= r4  <= 0x02abff79 (+2^25.4178)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb929189 (-2^27.5326) <= r4  <= 0x0b929189 (+2^27.5326)
MONTRED r4, r3
    //// bounds:  -0x0002392 (-2^13.1526) <= r4  <= 0x00002393 (+2^13.1528)
str.w r4, [r0, #408]
/* computing z1 = x1y0 + x0y1 + zeta^34 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x21a63eb (-2^25.0725) <= r4  <= 0x021a538e (+2^25.0723)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb00f5fb (-2^27.4599) <= r4  <= 0x0b00e59e (+2^27.4599)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13e7880b (-2^28.3150) <= r4  <= 0x13e777ae (+2^28.3150)
MONTRED r4, r3
    //// bounds:  -0x0002be7 (-2^13.4562) <= r4  <= 0x00002be8 (+2^13.4564)
str.w r4, [r0, #412]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4189
mul.w r4, r4, r14
    //// bounds:  -0x2abff79 (-2^25.4178) <= r4  <= 0x02abff79 (+2^25.4178)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb929189 (-2^27.5326) <= r4  <= 0x0b929189 (+2^27.5326)
MONTRED r4, r3
    //// bounds:  -0x0002392 (-2^13.1526) <= r4  <= 0x00002393 (+2^13.1528)
str.w r4, [r0, #420]
/* computing z1 = x1y0 + x0y1 + zeta^35 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x21a538e (-2^25.0723) <= r4  <= 0x021a63eb (+2^25.0725)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb00e59e (-2^27.4599) <= r4  <= 0x0b00f5fb (+2^27.4599)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13e777ae (-2^28.3150) <= r4  <= 0x13e7880b (+2^28.3150)
MONTRED r4, r3
    //// bounds:  -0x0002be7 (-2^13.4562) <= r4  <= 0x00002be8 (+2^13.4564)
str.w r4, [r0, #424]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1688
mul.w r4, r4, r14
    //// bounds:  -0x1139fb8 (-2^24.1066) <= r4  <= 0x01139fb8 (+2^24.1066)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9fa31c8 (-2^27.3187) <= r4  <= 0x09fa31c8 (+2^27.3187)
MONTRED r4, r3
    //// bounds:  -0x00021fa (-2^13.0865) <= r4  <= 0x000021fa (+2^13.0865)
str.w r4, [r0, #432]
/* computing z1 = x1y0 + x0y1 + zeta^36 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0d8f328 (-2^23.7612) <= r4  <= 0x00d8ec90 (+2^23.7610)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9bf8538 (-2^27.2851) <= r4  <= 0x09bf7ea0 (+2^27.2851)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12a61748 (-2^28.2210) <= r4  <= 0x12a610b0 (+2^28.2210)
MONTRED r4, r3
    //// bounds:  -0x0002aa6 (-2^13.4144) <= r4  <= 0x00002aa6 (+2^13.4144)
str.w r4, [r0, #436]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1688
mul.w r4, r4, r14
    //// bounds:  -0x1139fb8 (-2^24.1066) <= r4  <= 0x01139fb8 (+2^24.1066)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9fa31c8 (-2^27.3187) <= r4  <= 0x09fa31c8 (+2^27.3187)
MONTRED r4, r3
    //// bounds:  -0x00021fa (-2^13.0865) <= r4  <= 0x000021fa (+2^13.0865)
str.w r4, [r0, #444]
/* computing z1 = x1y0 + x0y1 + zeta^37 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0d8ec90 (-2^23.7610) <= r4  <= 0x00d8f328 (+2^23.7612)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9bf7ea0 (-2^27.2851) <= r4  <= 0x09bf8538 (+2^27.2851)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12a610b0 (-2^28.2210) <= r4  <= 0x12a61748 (+2^28.2210)
MONTRED r4, r3
    //// bounds:  -0x0002aa6 (-2^13.4144) <= r4  <= 0x00002aa6 (+2^13.4144)
str.w r4, [r0, #448]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1885
mul.w r4, r4, r14
    //// bounds:  -0x133ca79 (-2^24.2658) <= r4  <= 0x0133ca79 (+2^24.2658)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa1a5c89 (-2^27.3367) <= r4  <= 0x0a1a5c89 (+2^27.3367)
MONTRED r4, r3
    //// bounds:  -0x000221a (-2^13.0918) <= r4  <= 0x0000221a (+2^13.0918)
str.w r4, [r0, #456]
/* computing z1 = x1y0 + x0y1 + zeta^38 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0f244eb (-2^23.9205) <= r4  <= 0x00f23d8e (+2^23.9203)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9d8d6fb (-2^27.2997) <= r4  <= 0x09d8cf9e (+2^27.2997)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12bf690b (-2^28.2286) <= r4  <= 0x12bf61ae (+2^28.2286)
MONTRED r4, r3
    //// bounds:  -0x0002abf (-2^13.4177) <= r4  <= 0x00002abf (+2^13.4177)
str.w r4, [r0, #460]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1885
mul.w r4, r4, r14
    //// bounds:  -0x133ca79 (-2^24.2658) <= r4  <= 0x0133ca79 (+2^24.2658)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa1a5c89 (-2^27.3367) <= r4  <= 0x0a1a5c89 (+2^27.3367)
MONTRED r4, r3
    //// bounds:  -0x000221a (-2^13.0918) <= r4  <= 0x0000221a (+2^13.0918)
str.w r4, [r0, #468]
/* computing z1 = x1y0 + x0y1 + zeta^39 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0f23d8e (-2^23.9203) <= r4  <= 0x00f244eb (+2^23.9205)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9d8cf9e (-2^27.2997) <= r4  <= 0x09d8d6fb (+2^27.2997)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12bf61ae (-2^28.2286) <= r4  <= 0x12bf690b (+2^28.2286)
MONTRED r4, r3
    //// bounds:  -0x0002abf (-2^13.4177) <= r4  <= 0x00002abf (+2^13.4177)
str.w r4, [r0, #472]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =2125
mul.w r4, r4, r14
    //// bounds:  -0x15afaa9 (-2^24.4387) <= r4  <= 0x015afaa9 (+2^24.4387)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa418cb9 (-2^27.3584) <= r4  <= 0x0a418cb9 (+2^27.3584)
MONTRED r4, r3
    //// bounds:  -0x0002241 (-2^13.0982) <= r4  <= 0x00002242 (+2^13.0984)
str.w r4, [r0, #480]
/* computing z1 = x1y0 + x0y1 + zeta^40 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x111152e (-2^24.0932) <= r4  <= 0x01111d7b (+2^24.0934)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9f7a73e (-2^27.3172) <= r4  <= 0x09f7af8b (+2^27.3172)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12de394e (-2^28.2379) <= r4  <= 0x12de419b (+2^28.2379)
MONTRED r4, r3
    //// bounds:  -0x0002ade (-2^13.4218) <= r4  <= 0x00002ade (+2^13.4218)
str.w r4, [r0, #484]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-2125
mul.w r4, r4, r14
    //// bounds:  -0x15afaa9 (-2^24.4387) <= r4  <= 0x015afaa9 (+2^24.4387)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa418cb9 (-2^27.3584) <= r4  <= 0x0a418cb9 (+2^27.3584)
MONTRED r4, r3
    //// bounds:  -0x0002241 (-2^13.0982) <= r4  <= 0x00002242 (+2^13.0984)
str.w r4, [r0, #492]
/* computing z1 = x1y0 + x0y1 + zeta^41 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1111d7b (-2^24.0934) <= r4  <= 0x0111152e (+2^24.0932)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9f7af8b (-2^27.3172) <= r4  <= 0x09f7a73e (+2^27.3172)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12de419b (-2^28.2379) <= r4  <= 0x12de394e (+2^28.2379)
MONTRED r4, r3
    //// bounds:  -0x0002ade (-2^13.4218) <= r4  <= 0x00002ade (+2^13.4218)
str.w r4, [r0, #496]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-3109
mul.w r4, r4, r14
    //// bounds:  -0x1fba6a1 (-2^24.9877) <= r4  <= 0x01fba6a1 (+2^24.9877)
mla.w r4, r10, r7, r4
    //// bounds:  -0xae238b1 (-2^27.4441) <= r4  <= 0x0ae238b1 (+2^27.4441)
MONTRED r4, r3
    //// bounds:  -0x00022e2 (-2^13.1244) <= r4  <= 0x000022e2 (+2^13.1244)
str.w r4, [r0, #504]
/* computing z1 = x1y0 + x0y1 + zeta^42 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x18f9563 (-2^24.6424) <= r4  <= 0x018f893e (+2^24.6422)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa762773 (-2^27.3870) <= r4  <= 0x0a761b4e (+2^27.3870)
mla.w r4, r10, r6, r4
    //// bounds:  -0x135cb983 (-2^28.2752) <= r4  <= 0x135cad5e (+2^28.2752)
MONTRED r4, r3
    //// bounds:  -0x0002b5d (-2^13.4384) <= r4  <= 0x00002b5d (+2^13.4384)
str.w r4, [r0, #508]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =3109
mul.w r4, r4, r14
    //// bounds:  -0x1fba6a1 (-2^24.9877) <= r4  <= 0x01fba6a1 (+2^24.9877)
mla.w r4, r10, r7, r4
    //// bounds:  -0xae238b1 (-2^27.4441) <= r4  <= 0x0ae238b1 (+2^27.4441)
MONTRED r4, r3
    //// bounds:  -0x00022e2 (-2^13.1244) <= r4  <= 0x000022e2 (+2^13.1244)
str.w r4, [r0, #516]
/* computing z1 = x1y0 + x0y1 + zeta^43 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x18f893e (-2^24.6422) <= r4  <= 0x018f9563 (+2^24.6424)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa761b4e (-2^27.3870) <= r4  <= 0x0a762773 (+2^27.3870)
mla.w r4, r10, r6, r4
    //// bounds:  -0x135cad5e (-2^28.2752) <= r4  <= 0x135cb983 (+2^28.2752)
MONTRED r4, r3
    //// bounds:  -0x0002b5d (-2^13.4384) <= r4  <= 0x00002b5d (+2^13.4384)
str.w r4, [r0, #520]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1364
mul.w r4, r4, r14
    //// bounds:  -0x0deb844 (-2^23.7991) <= r4  <= 0x00deb844 (+2^23.7991)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9c54a54 (-2^27.2885) <= r4  <= 0x09c54a54 (+2^27.2885)
MONTRED r4, r3
    //// bounds:  -0x00021c5 (-2^13.0777) <= r4  <= 0x000021c5 (+2^13.0777)
str.w r4, [r0, #528]
/* computing z1 = x1y0 + x0y1 + zeta^44 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0af4978 (-2^23.4536) <= r4  <= 0x00af4ecc (+2^23.4537)
mla.w r4, r9, r7, r4
    //// bounds:  -0x995db88 (-2^27.2608) <= r4  <= 0x0995e0dc (+2^27.2608)
mla.w r4, r10, r6, r4
    //// bounds:  -0x127c6d98 (-2^28.2084) <= r4  <= 0x127c72ec (+2^28.2084)
MONTRED r4, r3
    //// bounds:  -0x0002a7c (-2^13.4089) <= r4  <= 0x00002a7c (+2^13.4089)
str.w r4, [r0, #532]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1364
mul.w r4, r4, r14
    //// bounds:  -0x0deb844 (-2^23.7991) <= r4  <= 0x00deb844 (+2^23.7991)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9c54a54 (-2^27.2885) <= r4  <= 0x09c54a54 (+2^27.2885)
MONTRED r4, r3
    //// bounds:  -0x00021c5 (-2^13.0777) <= r4  <= 0x000021c5 (+2^13.0777)
str.w r4, [r0, #540]
/* computing z1 = x1y0 + x0y1 + zeta^45 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0af4ecc (-2^23.4537) <= r4  <= 0x00af4978 (+2^23.4536)
mla.w r4, r9, r7, r4
    //// bounds:  -0x995e0dc (-2^27.2608) <= r4  <= 0x0995db88 (+2^27.2608)
mla.w r4, r10, r6, r4
    //// bounds:  -0x127c72ec (-2^28.2084) <= r4  <= 0x127c6d98 (+2^28.2084)
MONTRED r4, r3
    //// bounds:  -0x0002a7c (-2^13.4089) <= r4  <= 0x00002a7c (+2^13.4089)
str.w r4, [r0, #544]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1960
mul.w r4, r4, r14
    //// bounds:  -0x1400988 (-2^24.3221) <= r4  <= 0x01400988 (+2^24.3221)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa269b98 (-2^27.3435) <= r4  <= 0x0a269b98 (+2^27.3435)
MONTRED r4, r3
    //// bounds:  -0x0002226 (-2^13.0937) <= r4  <= 0x00002227 (+2^13.0939)
str.w r4, [r0, #552]
/* computing z1 = x1y0 + x0y1 + zeta^46 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0fbe0f0 (-2^23.9766) <= r4  <= 0x00fbe898 (+2^23.9768)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9e27300 (-2^27.3052) <= r4  <= 0x09e27aa8 (+2^27.3052)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12c90510 (-2^28.2315) <= r4  <= 0x12c90cb8 (+2^28.2315)
MONTRED r4, r3
    //// bounds:  -0x0002ac9 (-2^13.4190) <= r4  <= 0x00002ac9 (+2^13.4190)
str.w r4, [r0, #556]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1960
mul.w r4, r4, r14
    //// bounds:  -0x1400988 (-2^24.3221) <= r4  <= 0x01400988 (+2^24.3221)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa269b98 (-2^27.3435) <= r4  <= 0x0a269b98 (+2^27.3435)
MONTRED r4, r3
    //// bounds:  -0x0002226 (-2^13.0937) <= r4  <= 0x00002227 (+2^13.0939)
str.w r4, [r0, #564]
/* computing z1 = x1y0 + x0y1 + zeta^47 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0fbe898 (-2^23.9768) <= r4  <= 0x00fbe0f0 (+2^23.9766)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9e27aa8 (-2^27.3052) <= r4  <= 0x09e27300 (+2^27.3052)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12c90cb8 (-2^28.2315) <= r4  <= 0x12c90510 (+2^28.2315)
MONTRED r4, r3
    //// bounds:  -0x0002ac9 (-2^13.4190) <= r4  <= 0x00002ac9 (+2^13.4190)
str.w r4, [r0, #568]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1711
mul.w r4, r4, r14
    //// bounds:  -0x1176123 (-2^24.1261) <= r4  <= 0x01176123 (+2^24.1261)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9fdf333 (-2^27.3208) <= r4  <= 0x09fdf333 (+2^27.3208)
MONTRED r4, r3
    //// bounds:  -0x00021fe (-2^13.0871) <= r4  <= 0x000021fe (+2^13.0871)
str.w r4, [r0, #576]
/* computing z1 = x1y0 + x0y1 + zeta^48 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0dbe7e9 (-2^23.7807) <= r4  <= 0x00dbe13a (+2^23.7806)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9c279f9 (-2^27.2868) <= r4  <= 0x09c2734a (+2^27.2868)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12a90c09 (-2^28.2219) <= r4  <= 0x12a9055a (+2^28.2219)
MONTRED r4, r3
    //// bounds:  -0x0002aa9 (-2^13.4148) <= r4  <= 0x00002aa9 (+2^13.4148)
str.w r4, [r0, #580]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1711
mul.w r4, r4, r14
    //// bounds:  -0x1176123 (-2^24.1261) <= r4  <= 0x01176123 (+2^24.1261)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9fdf333 (-2^27.3208) <= r4  <= 0x09fdf333 (+2^27.3208)
MONTRED r4, r3
    //// bounds:  -0x00021fe (-2^13.0871) <= r4  <= 0x000021fe (+2^13.0871)
str.w r4, [r0, #588]
/* computing z1 = x1y0 + x0y1 + zeta^49 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0dbe13a (-2^23.7806) <= r4  <= 0x00dbe7e9 (+2^23.7807)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9c2734a (-2^27.2868) <= r4  <= 0x09c279f9 (+2^27.2868)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12a9055a (-2^28.2219) <= r4  <= 0x12a90c09 (+2^28.2219)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x0002aa9 (-2^13.4148) <= r4  <= 0x00002aa9 (+2^13.4148)
str.w r4, [r0, #592]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =965
mul.w r4, r4, r14
    //// bounds:  -0x09d91c1 (-2^23.2998) <= r4  <= 0x009d91c1 (+2^23.2998)
mla.w r4, r10, r7, r4
    //// bounds:  -0x98423d1 (-2^27.2504) <= r4  <= 0x098423d1 (+2^27.2504)
MONTRED r4, r3
    //// bounds:  -0x0002184 (-2^13.0668) <= r4  <= 0x00002184 (+2^13.0668)
str.w r4, [r0, #600]
/* computing z1 = x1y0 + x0y1 + zeta^50 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x07c02fe (-2^22.9543) <= r4  <= 0x007c06c3 (+2^22.9545)
mla.w r4, r9, r7, r4
    //// bounds:  -0x962950e (-2^27.2304) <= r4  <= 0x096298d3 (+2^27.2304)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1249271e (-2^28.1926) <= r4  <= 0x12492ae3 (+2^28.1927)
MONTRED r4, r3
    //// bounds:  -0x0002a49 (-2^13.4021) <= r4  <= 0x00002a49 (+2^13.4021)
str.w r4, [r0, #604]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-965
mul.w r4, r4, r14
    //// bounds:  -0x09d91c1 (-2^23.2998) <= r4  <= 0x009d91c1 (+2^23.2998)
mla.w r4, r10, r7, r4
    //// bounds:  -0x98423d1 (-2^27.2504) <= r4  <= 0x098423d1 (+2^27.2504)
MONTRED r4, r3
    //// bounds:  -0x0002184 (-2^13.0668) <= r4  <= 0x00002184 (+2^13.0668)
str.w r4, [r0, #612]
/* computing z1 = x1y0 + x0y1 + zeta^51 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x07c06c3 (-2^22.9545) <= r4  <= 0x007c02fe (+2^22.9543)
mla.w r4, r9, r7, r4
    //// bounds:  -0x96298d3 (-2^27.2304) <= r4  <= 0x0962950e (+2^27.2304)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12492ae3 (-2^28.1927) <= r4  <= 0x1249271e (+2^28.1926)
MONTRED r4, r3
    //// bounds:  -0x0002a49 (-2^13.4021) <= r4  <= 0x00002a49 (+2^13.4021)
str.w r4, [r0, #616]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1134
mul.w r4, r4, r14
    //// bounds:  -0x0b92a16 (-2^23.5327) <= r4  <= 0x00b92a16 (+2^23.5327)
mla.w r4, r10, r7, r4
    //// bounds:  -0x99fbc26 (-2^27.2666) <= r4  <= 0x099fbc26 (+2^27.2666)
MONTRED r4, r3
    //// bounds:  -0x00021a0 (-2^13.0715) <= r4  <= 0x000021a0 (+2^13.0715)
str.w r4, [r0, #624]
/* computing z1 = x1y0 + x0y1 + zeta^52 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x091bad4 (-2^23.1872) <= r4  <= 0x0091bf42 (+2^23.1873)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9784ce4 (-2^27.2434) <= r4  <= 0x09785152 (+2^27.2434)
mla.w r4, r10, r6, r4
    //// bounds:  -0x125edef4 (-2^28.1993) <= r4  <= 0x125ee362 (+2^28.1993)
MONTRED r4, r3
    //// bounds:  -0x0002a5f (-2^13.4050) <= r4  <= 0x00002a5f (+2^13.4050)
str.w r4, [r0, #628]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1134
mul.w r4, r4, r14
    //// bounds:  -0x0b92a16 (-2^23.5327) <= r4  <= 0x00b92a16 (+2^23.5327)
mla.w r4, r10, r7, r4
    //// bounds:  -0x99fbc26 (-2^27.2666) <= r4  <= 0x099fbc26 (+2^27.2666)
MONTRED r4, r3
    //// bounds:  -0x00021a0 (-2^13.0715) <= r4  <= 0x000021a0 (+2^13.0715)
str.w r4, [r0, #636]
/* computing z1 = x1y0 + x0y1 + zeta^53 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x091bf42 (-2^23.1873) <= r4  <= 0x0091bad4 (+2^23.1872)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9785152 (-2^27.2434) <= r4  <= 0x09784ce4 (+2^27.2434)
mla.w r4, r10, r6, r4
    //// bounds:  -0x125ee362 (-2^28.1993) <= r4  <= 0x125edef4 (+2^28.1993)
MONTRED r4, r3
    //// bounds:  -0x0002a5f (-2^13.4050) <= r4  <= 0x00002a5f (+2^13.4050)
str.w r4, [r0, #640]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5882
mul.w r4, r4, r14
    //// bounds:  -0x3c07032 (-2^25.9075) <= r4  <= 0x03c07032 (+2^25.9075)
mla.w r4, r10, r7, r4
    //// bounds:  -0xca70242 (-2^27.6613) <= r4  <= 0x0ca70242 (+2^27.6613)
MONTRED r4, r3
    //// bounds:  -0x00024a7 (-2^13.1958) <= r4  <= 0x000024a7 (+2^13.1958)
str.w r4, [r0, #648]
/* computing z1 = x1y0 + x0y1 + zeta^54 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2f3e49c (-2^25.5620) <= r4  <= 0x02f3fb96 (+2^25.5622)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbda76ac (-2^27.5672) <= r4  <= 0x0bda8da6 (+2^27.5673)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14c108bc (-2^28.3753) <= r4  <= 0x14c11fb6 (+2^28.3753)
MONTRED r4, r3
    //// bounds:  -0x0002cc1 (-2^13.4839) <= r4  <= 0x00002cc1 (+2^13.4839)
str.w r4, [r0, #652]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5882
mul.w r4, r4, r14
    //// bounds:  -0x3c07032 (-2^25.9075) <= r4  <= 0x03c07032 (+2^25.9075)
mla.w r4, r10, r7, r4
    //// bounds:  -0xca70242 (-2^27.6613) <= r4  <= 0x0ca70242 (+2^27.6613)
MONTRED r4, r3
    //// bounds:  -0x00024a7 (-2^13.1958) <= r4  <= 0x000024a7 (+2^13.1958)
str.w r4, [r0, #660]
/* computing z1 = x1y0 + x0y1 + zeta^55 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2f3fb96 (-2^25.5622) <= r4  <= 0x02f3e49c (+2^25.5620)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbda8da6 (-2^27.5673) <= r4  <= 0x0bda76ac (+2^27.5672)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14c11fb6 (-2^28.3753) <= r4  <= 0x14c108bc (+2^28.3753)
MONTRED r4, r3
    //// bounds:  -0x0002cc1 (-2^13.4839) <= r4  <= 0x00002cc1 (+2^13.4839)
str.w r4, [r0, #664]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4615
mul.w r4, r4, r14
    //// bounds:  -0x2f18e9b (-2^25.5576) <= r4  <= 0x02f18e9b (+2^25.5576)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbd820ab (-2^27.5661) <= r4  <= 0x0bd820ab (+2^27.5661)
MONTRED r4, r3
    //// bounds:  -0x00023d8 (-2^13.1636) <= r4  <= 0x000023d8 (+2^13.1636)
str.w r4, [r0, #672]
/* computing z1 = x1y0 + x0y1 + zeta^56 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x251124a (-2^25.2121) <= r4  <= 0x02512451 (+2^25.2122)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb37a45a (-2^27.4877) <= r4  <= 0x0b37b661 (+2^27.4877)
mla.w r4, r10, r6, r4
    //// bounds:  -0x141e366a (-2^28.3304) <= r4  <= 0x141e4871 (+2^28.3304)
MONTRED r4, r3
    //// bounds:  -0x0002c1e (-2^13.4633) <= r4  <= 0x00002c1e (+2^13.4633)
str.w r4, [r0, #676]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4615
mul.w r4, r4, r14
    //// bounds:  -0x2f18e9b (-2^25.5576) <= r4  <= 0x02f18e9b (+2^25.5576)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbd820ab (-2^27.5661) <= r4  <= 0x0bd820ab (+2^27.5661)
MONTRED r4, r3
    //// bounds:  -0x00023d8 (-2^13.1636) <= r4  <= 0x000023d8 (+2^13.1636)
str.w r4, [r0, #684]
/* computing z1 = x1y0 + x0y1 + zeta^57 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2512451 (-2^25.2122) <= r4  <= 0x0251124a (+2^25.2121)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb37b661 (-2^27.4877) <= r4  <= 0x0b37a45a (+2^27.4877)
mla.w r4, r10, r6, r4
    //// bounds:  -0x141e4871 (-2^28.3304) <= r4  <= 0x141e366a (+2^28.3304)
MONTRED r4, r3
    //// bounds:  -0x0002c1e (-2^13.4633) <= r4  <= 0x00002c1e (+2^13.4633)
str.w r4, [r0, #688]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5190
mul.w r4, r4, r14
    //// bounds:  -0x34f720e (-2^25.7270) <= r4  <= 0x034f720e (+2^25.7270)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc36041e (-2^27.6101) <= r4  <= 0x0c36041e (+2^27.6101)
MONTRED r4, r3
    //// bounds:  -0x0002436 (-2^13.1784) <= r4  <= 0x00002436 (+2^13.1784)
str.w r4, [r0, #696]
/* computing z1 = x1y0 + x0y1 + zeta^58 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x29af6e4 (-2^25.3815) <= r4  <= 0x029b0b2a (+2^25.3816)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb8188f4 (-2^27.5243) <= r4  <= 0x0b819d3a (+2^27.5244)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14681b04 (-2^28.3510) <= r4  <= 0x14682f4a (+2^28.3510)
MONTRED r4, r3
    //// bounds:  -0x0002c68 (-2^13.4727) <= r4  <= 0x00002c68 (+2^13.4727)
str.w r4, [r0, #700]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5190
mul.w r4, r4, r14
    //// bounds:  -0x34f720e (-2^25.7270) <= r4  <= 0x034f720e (+2^25.7270)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc36041e (-2^27.6101) <= r4  <= 0x0c36041e (+2^27.6101)
MONTRED r4, r3
    //// bounds:  -0x0002436 (-2^13.1784) <= r4  <= 0x00002436 (+2^13.1784)
str.w r4, [r0, #708]
/* computing z1 = x1y0 + x0y1 + zeta^59 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x29b0b2a (-2^25.3816) <= r4  <= 0x029af6e4 (+2^25.3815)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb819d3a (-2^27.5244) <= r4  <= 0x0b8188f4 (+2^27.5243)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14682f4a (-2^28.3510) <= r4  <= 0x14681b04 (+2^28.3510)
MONTRED r4, r3
    //// bounds:  -0x0002c68 (-2^13.4727) <= r4  <= 0x00002c68 (+2^13.4727)
str.w r4, [r0, #712]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =3743
mul.w r4, r4, r14
    //// bounds:  -0x2632c53 (-2^25.2554) <= r4  <= 0x02632c53 (+2^25.2554)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb49be63 (-2^27.4967) <= r4  <= 0x0b49be63 (+2^27.4967)
MONTRED r4, r3
    //// bounds:  -0x000234a (-2^13.1411) <= r4  <= 0x0000234a (+2^13.1411)
str.w r4, [r0, #720]
/* computing z1 = x1y0 + x0y1 + zeta^60 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1e102da (-2^24.9099) <= r4  <= 0x01e11179 (+2^24.9101)
mla.w r4, r9, r7, r4
    //// bounds:  -0xac794ea (-2^27.4302) <= r4  <= 0x0ac7a389 (+2^27.4303)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13ae26fa (-2^28.2987) <= r4  <= 0x13ae3599 (+2^28.2987)
MONTRED r4, r3
    //// bounds:  -0x0002bae (-2^13.4489) <= r4  <= 0x00002bae (+2^13.4489)
str.w r4, [r0, #724]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-3743
mul.w r4, r4, r14
    //// bounds:  -0x2632c53 (-2^25.2554) <= r4  <= 0x02632c53 (+2^25.2554)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb49be63 (-2^27.4967) <= r4  <= 0x0b49be63 (+2^27.4967)
MONTRED r4, r3
    //// bounds:  -0x000234a (-2^13.1411) <= r4  <= 0x0000234a (+2^13.1411)
str.w r4, [r0, #732]
/* computing z1 = x1y0 + x0y1 + zeta^61 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1e11179 (-2^24.9101) <= r4  <= 0x01e102da (+2^24.9099)
mla.w r4, r9, r7, r4
    //// bounds:  -0xac7a389 (-2^27.4303) <= r4  <= 0x0ac794ea (+2^27.4302)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13ae3599 (-2^28.2987) <= r4  <= 0x13ae26fa (+2^28.2987)
MONTRED r4, r3
    //// bounds:  -0x0002bae (-2^13.4489) <= r4  <= 0x00002bae (+2^13.4489)
str.w r4, [r0, #736]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5847
mul.w r4, r4, r14
    //// bounds:  -0x3bab92b (-2^25.8989) <= r4  <= 0x03bab92b (+2^25.8989)
mla.w r4, r10, r7, r4
    //// bounds:  -0xca14b3b (-2^27.6588) <= r4  <= 0x0ca14b3b (+2^27.6588)
MONTRED r4, r3
    //// bounds:  -0x00024a1 (-2^13.1949) <= r4  <= 0x000024a1 (+2^13.1949)
str.w r4, [r0, #744]
/* computing z1 = x1y0 + x0y1 + zeta^62 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2ef652a (-2^25.5534) <= r4  <= 0x02ef7c01 (+2^25.5536)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbd5f73a (-2^27.5651) <= r4  <= 0x0bd60e11 (+2^27.5651)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14bc894a (-2^28.3741) <= r4  <= 0x14bca021 (+2^28.3741)
MONTRED r4, r3
    //// bounds:  -0x0002cbc (-2^13.4833) <= r4  <= 0x00002cbd (+2^13.4834)
str.w r4, [r0, #748]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5847
mul.w r4, r4, r14
    //// bounds:  -0x3bab92b (-2^25.8989) <= r4  <= 0x03bab92b (+2^25.8989)
mla.w r4, r10, r7, r4
    //// bounds:  -0xca14b3b (-2^27.6588) <= r4  <= 0x0ca14b3b (+2^27.6588)
MONTRED r4, r3
    //// bounds:  -0x00024a1 (-2^13.1949) <= r4  <= 0x000024a1 (+2^13.1949)
str.w r4, [r0, #756]
/* computing z1 = x1y0 + x0y1 + zeta^63 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2ef7c01 (-2^25.5536) <= r4  <= 0x02ef652a (+2^25.5534)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbd60e11 (-2^27.5651) <= r4  <= 0x0bd5f73a (+2^27.5651)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14bca021 (-2^28.3741) <= r4  <= 0x14bc894a (+2^28.3741)
MONTRED r4, r3
    //// bounds:  -0x0002cbc (-2^13.4833) <= r4  <= 0x00002cbd (+2^13.4834)
str.w r4, [r0, #760]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-432
mul.w r4, r4, r14
    //// bounds:  -0x04689f0 (-2^22.1403) <= r4  <= 0x004689f0 (+2^22.1403)
mla.w r4, r10, r7, r4
    //// bounds:  -0x92d1c00 (-2^27.1979) <= r4  <= 0x092d1c00 (+2^27.1979)
MONTRED r4, r3
    //// bounds:  -0x000212d (-2^13.0521) <= r4  <= 0x0000212d (+2^13.0521)
str.w r4, [r0, #768]
/* computing z1 = x1y0 + x0y1 + zeta^64 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x03785d0 (-2^21.7950) <= r4  <= 0x00378420 (+2^21.7948)
mla.w r4, r9, r7, r4
    //// bounds:  -0x91e17e0 (-2^27.1886) <= r4  <= 0x091e1630 (+2^27.1886)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1204a9f0 (-2^28.1714) <= r4  <= 0x1204a840 (+2^28.1714)
MONTRED r4, r3
    //// bounds:  -0x0002a04 (-2^13.3929) <= r4  <= 0x00002a05 (+2^13.3930)
str.w r4, [r0, #772]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =432
mul.w r4, r4, r14
    //// bounds:  -0x04689f0 (-2^22.1403) <= r4  <= 0x004689f0 (+2^22.1403)
mla.w r4, r10, r7, r4
    //// bounds:  -0x92d1c00 (-2^27.1979) <= r4  <= 0x092d1c00 (+2^27.1979)
MONTRED r4, r3
    //// bounds:  -0x000212d (-2^13.0521) <= r4  <= 0x0000212d (+2^13.0521)
str.w r4, [r0, #780]
/* computing z1 = x1y0 + x0y1 + zeta^65 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0378420 (-2^21.7948) <= r4  <= 0x003785d0 (+2^21.7950)
mla.w r4, r9, r7, r4
    //// bounds:  -0x91e1630 (-2^27.1886) <= r4  <= 0x091e17e0 (+2^27.1886)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1204a840 (-2^28.1714) <= r4  <= 0x1204a9f0 (+2^28.1714)
MONTRED r4, r3
    //// bounds:  -0x0002a04 (-2^13.3929) <= r4  <= 0x00002a05 (+2^13.3930)
str.w r4, [r0, #784]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =100
mul.w r4, r4, r14
    //// bounds:  -0x0105414 (-2^20.0293) <= r4  <= 0x00105414 (+2^20.0293)
mla.w r4, r10, r7, r4
    //// bounds:  -0x8f6e624 (-2^27.1642) <= r4  <= 0x08f6e624 (+2^27.1642)
MONTRED r4, r3
    //// bounds:  -0x00020f7 (-2^13.0429) <= r4  <= 0x000020f7 (+2^13.0429)
str.w r4, [r0, #792]
/* computing z1 = x1y0 + x0y1 + zeta^66 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x00cd9d8 (-2^19.6838) <= r4  <= 0x000cda3c (+2^19.6840)
mla.w r4, r9, r7, r4
    //// bounds:  -0x8f36be8 (-2^27.1620) <= r4  <= 0x08f36c4c (+2^27.1620)
mla.w r4, r10, r6, r4
    //// bounds:  -0x11d9fdf8 (-2^28.1580) <= r4  <= 0x11d9fe5c (+2^28.1580)
MONTRED r4, r3
    //// bounds:  -0x00029da (-2^13.3872) <= r4  <= 0x000029da (+2^13.3872)
str.w r4, [r0, #796]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-100
mul.w r4, r4, r14
    //// bounds:  -0x0105414 (-2^20.0293) <= r4  <= 0x00105414 (+2^20.0293)
mla.w r4, r10, r7, r4
    //// bounds:  -0x8f6e624 (-2^27.1642) <= r4  <= 0x08f6e624 (+2^27.1642)
MONTRED r4, r3
    //// bounds:  -0x00020f7 (-2^13.0429) <= r4  <= 0x000020f7 (+2^13.0429)
str.w r4, [r0, #804]
/* computing z1 = x1y0 + x0y1 + zeta^67 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x00cda3c (-2^19.6840) <= r4  <= 0x000cd9d8 (+2^19.6838)
mla.w r4, r9, r7, r4
    //// bounds:  -0x8f36c4c (-2^27.1620) <= r4  <= 0x08f36be8 (+2^27.1620)
mla.w r4, r10, r6, r4
    //// bounds:  -0x11d9fe5c (-2^28.1580) <= r4  <= 0x11d9fdf8 (+2^28.1580)
MONTRED r4, r3
    //// bounds:  -0x00029da (-2^13.3872) <= r4  <= 0x000029da (+2^13.3872)
str.w r4, [r0, #808]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1538
mul.w r4, r4, r14
    //// bounds:  -0x0fb219a (-2^23.9723) <= r4  <= 0x00fb219a (+2^23.9723)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9e1b3aa (-2^27.3048) <= r4  <= 0x09e1b3aa (+2^27.3048)
MONTRED r4, r3
    //// bounds:  -0x00021e2 (-2^13.0825) <= r4  <= 0x000021e2 (+2^13.0825)
str.w r4, [r0, #816]
/* computing z1 = x1y0 + x0y1 + zeta^68 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0c5abce (-2^23.6270) <= r4  <= 0x00c5a5cc (+2^23.6268)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9ac3dde (-2^27.2739) <= r4  <= 0x09ac37dc (+2^27.2739)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1292cfee (-2^28.2152) <= r4  <= 0x1292c9ec (+2^28.2152)
MONTRED r4, r3
    //// bounds:  -0x0002a93 (-2^13.4119) <= r4  <= 0x00002a93 (+2^13.4119)
str.w r4, [r0, #820]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1538
mul.w r4, r4, r14
    //// bounds:  -0x0fb219a (-2^23.9723) <= r4  <= 0x00fb219a (+2^23.9723)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9e1b3aa (-2^27.3048) <= r4  <= 0x09e1b3aa (+2^27.3048)
MONTRED r4, r3
    //// bounds:  -0x00021e2 (-2^13.0825) <= r4  <= 0x000021e2 (+2^13.0825)
str.w r4, [r0, #828]
/* computing z1 = x1y0 + x0y1 + zeta^69 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0c5a5cc (-2^23.6268) <= r4  <= 0x00c5abce (+2^23.6270)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9ac37dc (-2^27.2739) <= r4  <= 0x09ac3dde (+2^27.2739)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1292c9ec (-2^28.2152) <= r4  <= 0x1292cfee (+2^28.2152)
MONTRED r4, r3
    //// bounds:  -0x0002a93 (-2^13.4119) <= r4  <= 0x00002a93 (+2^13.4119)
str.w r4, [r0, #832]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1237
mul.w r4, r4, r14
    //// bounds:  -0x0c9fb91 (-2^23.6581) <= r4  <= 0x00c9fb91 (+2^23.6581)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9b08da1 (-2^27.2764) <= r4  <= 0x09b08da1 (+2^27.2764)
MONTRED r4, r3
    //// bounds:  -0x00021b0 (-2^13.0741) <= r4  <= 0x000021b1 (+2^13.0743)
str.w r4, [r0, #840]
/* computing z1 = x1y0 + x0y1 + zeta^70 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x09efc33 (-2^23.3127) <= r4  <= 0x009ef75e (+2^23.3126)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9858e43 (-2^27.2512) <= r4  <= 0x0985896e (+2^27.2512)
mla.w r4, r10, r6, r4
    //// bounds:  -0x126c2053 (-2^28.2034) <= r4  <= 0x126c1b7e (+2^28.2034)
MONTRED r4, r3
    //// bounds:  -0x0002a6c (-2^13.4067) <= r4  <= 0x00002a6c (+2^13.4067)
str.w r4, [r0, #844]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1237
mul.w r4, r4, r14
    //// bounds:  -0x0c9fb91 (-2^23.6581) <= r4  <= 0x00c9fb91 (+2^23.6581)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9b08da1 (-2^27.2764) <= r4  <= 0x09b08da1 (+2^27.2764)
MONTRED r4, r3
    //// bounds:  -0x00021b0 (-2^13.0741) <= r4  <= 0x000021b1 (+2^13.0743)
str.w r4, [r0, #852]
/* computing z1 = x1y0 + x0y1 + zeta^71 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x09ef75e (-2^23.3126) <= r4  <= 0x009efc33 (+2^23.3127)
mla.w r4, r9, r7, r4
    //// bounds:  -0x985896e (-2^27.2512) <= r4  <= 0x09858e43 (+2^27.2512)
mla.w r4, r10, r6, r4
    //// bounds:  -0x126c1b7e (-2^28.2034) <= r4  <= 0x126c2053 (+2^28.2034)
MONTRED r4, r3
    //// bounds:  -0x0002a6c (-2^13.4067) <= r4  <= 0x00002a6c (+2^13.4067)
str.w r4, [r0, #856]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4426
mul.w r4, r4, r14
    //// bounds:  -0x2d2b242 (-2^25.4972) <= r4  <= 0x02d2b242 (+2^25.4972)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbb94452 (-2^27.5514) <= r4  <= 0x0bb94452 (+2^27.5514)
MONTRED r4, r3
    //// bounds:  -0x00023b9 (-2^13.1588) <= r4  <= 0x000023b9 (+2^13.1588)
str.w r4, [r0, #864]
/* computing z1 = x1y0 + x0y1 + zeta^72 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x238c87c (-2^25.1517) <= r4  <= 0x0238d9c6 (+2^25.1519)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb1f5a8c (-2^27.4754) <= r4  <= 0x0b1f6bd6 (+2^27.4754)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1405ec9c (-2^28.3236) <= r4  <= 0x1405fde6 (+2^28.3236)
MONTRED r4, r3
    //// bounds:  -0x0002c06 (-2^13.4602) <= r4  <= 0x00002c06 (+2^13.4602)
str.w r4, [r0, #868]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4426
mul.w r4, r4, r14
    //// bounds:  -0x2d2b242 (-2^25.4972) <= r4  <= 0x02d2b242 (+2^25.4972)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbb94452 (-2^27.5514) <= r4  <= 0x0bb94452 (+2^27.5514)
MONTRED r4, r3
    //// bounds:  -0x00023b9 (-2^13.1588) <= r4  <= 0x000023b9 (+2^13.1588)
str.w r4, [r0, #876]
/* computing z1 = x1y0 + x0y1 + zeta^73 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x238d9c6 (-2^25.1519) <= r4  <= 0x0238c87c (+2^25.1517)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb1f6bd6 (-2^27.4754) <= r4  <= 0x0b1f5a8c (+2^27.4754)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1405fde6 (-2^28.3236) <= r4  <= 0x1405ec9c (+2^28.3236)
MONTRED r4, r3
    //// bounds:  -0x0002c06 (-2^13.4602) <= r4  <= 0x00002c06 (+2^13.4602)
str.w r4, [r0, #880]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-3983
mul.w r4, r4, r14
    //// bounds:  -0x28a5c83 (-2^25.3451) <= r4  <= 0x028a5c83 (+2^25.3451)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb70ee93 (-2^27.5162) <= r4  <= 0x0b70ee93 (+2^27.5162)
MONTRED r4, r3
    //// bounds:  -0x0002371 (-2^13.1474) <= r4  <= 0x00002371 (+2^13.1474)
str.w r4, [r0, #888]
/* computing z1 = x1y0 + x0y1 + zeta^74 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1ffea09 (-2^24.9998) <= r4  <= 0x01ffda7a (+2^24.9996)
mla.w r4, r9, r7, r4
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0xae67c19 (-2^27.4463) <= r4  <= 0x0ae66c8a (+2^27.4463)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13cd0e29 (-2^28.3075) <= r4  <= 0x13ccfe9a (+2^28.3075)
MONTRED r4, r3
    //// bounds:  -0x0002bcd (-2^13.4529) <= r4  <= 0x00002bcd (+2^13.4529)
str.w r4, [r0, #892]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =3983
mul.w r4, r4, r14
    //// bounds:  -0x28a5c83 (-2^25.3451) <= r4  <= 0x028a5c83 (+2^25.3451)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb70ee93 (-2^27.5162) <= r4  <= 0x0b70ee93 (+2^27.5162)
MONTRED r4, r3
    //// bounds:  -0x0002371 (-2^13.1474) <= r4  <= 0x00002371 (+2^13.1474)
str.w r4, [r0, #900]
/* computing z1 = x1y0 + x0y1 + zeta^75 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1ffda7a (-2^24.9996) <= r4  <= 0x01ffea09 (+2^24.9998)
mla.w r4, r9, r7, r4
    //// bounds:  -0xae66c8a (-2^27.4463) <= r4  <= 0x0ae67c19 (+2^27.4463)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13ccfe9a (-2^28.3075) <= r4  <= 0x13cd0e29 (+2^28.3075)
MONTRED r4, r3
    //// bounds:  -0x0002bcd (-2^13.4529) <= r4  <= 0x00002bcd (+2^13.4529)
str.w r4, [r0, #904]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1534
mul.w r4, r4, r14
    //// bounds:  -0x0fa7a66 (-2^23.9685) <= r4  <= 0x00fa7a66 (+2^23.9685)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9e10c76 (-2^27.3044) <= r4  <= 0x09e10c76 (+2^27.3044)
MONTRED r4, r3
    //// bounds:  -0x00021e1 (-2^13.0823) <= r4  <= 0x000021e1 (+2^13.0823)
str.w r4, [r0, #912]
/* computing z1 = x1y0 + x0y1 + zeta^76 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0c52234 (-2^23.6230) <= r4  <= 0x00c52832 (+2^23.6232)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9abb444 (-2^27.2736) <= r4  <= 0x09abba42 (+2^27.2736)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12924654 (-2^28.2150) <= r4  <= 0x12924c52 (+2^28.2150)
MONTRED r4, r3
    //// bounds:  -0x0002a92 (-2^13.4118) <= r4  <= 0x00002a92 (+2^13.4118)
str.w r4, [r0, #916]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1534
mul.w r4, r4, r14
    //// bounds:  -0x0fa7a66 (-2^23.9685) <= r4  <= 0x00fa7a66 (+2^23.9685)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9e10c76 (-2^27.3044) <= r4  <= 0x09e10c76 (+2^27.3044)
MONTRED r4, r3
    //// bounds:  -0x00021e1 (-2^13.0823) <= r4  <= 0x000021e1 (+2^13.0823)
str.w r4, [r0, #924]
/* computing z1 = x1y0 + x0y1 + zeta^77 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0c52832 (-2^23.6232) <= r4  <= 0x00c52234 (+2^23.6230)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9abba42 (-2^27.2736) <= r4  <= 0x09abb444 (+2^27.2736)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12924c52 (-2^28.2150) <= r4  <= 0x12924654 (+2^28.2150)
MONTRED r4, r3
    //// bounds:  -0x0002a92 (-2^13.4118) <= r4  <= 0x00002a92 (+2^13.4118)
str.w r4, [r0, #928]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4679
mul.w r4, r4, r14
    //// bounds:  -0x2fc01db (-2^25.5774) <= r4  <= 0x02fc01db (+2^25.5774)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbe293eb (-2^27.5711) <= r4  <= 0x0be293eb (+2^27.5711)
MONTRED r4, r3
    //// bounds:  -0x00023e2 (-2^13.1652) <= r4  <= 0x000023e3 (+2^13.1654)
str.w r4, [r0, #936]
/* computing z1 = x1y0 + x0y1 + zeta^78 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2595e11 (-2^25.2321) <= r4  <= 0x02594bca (+2^25.2319)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb3ff021 (-2^27.4918) <= r4  <= 0x0b3fddda (+2^27.4918)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14268231 (-2^28.3327) <= r4  <= 0x14266fea (+2^28.3327)
MONTRED r4, r3
    //// bounds:  -0x0002c26 (-2^13.4643) <= r4  <= 0x00002c27 (+2^13.4644)
str.w r4, [r0, #940]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4679
mul.w r4, r4, r14
    //// bounds:  -0x2fc01db (-2^25.5774) <= r4  <= 0x02fc01db (+2^25.5774)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbe293eb (-2^27.5711) <= r4  <= 0x0be293eb (+2^27.5711)
MONTRED r4, r3
    //// bounds:  -0x00023e2 (-2^13.1652) <= r4  <= 0x000023e3 (+2^13.1654)
str.w r4, [r0, #948]
/* computing z1 = x1y0 + x0y1 + zeta^79 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2594bca (-2^25.2319) <= r4  <= 0x02595e11 (+2^25.2321)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb3fddda (-2^27.4918) <= r4  <= 0x0b3ff021 (+2^27.4918)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14266fea (-2^28.3327) <= r4  <= 0x14268231 (+2^28.3327)
MONTRED r4, r3
    //// bounds:  -0x0002c26 (-2^13.4643) <= r4  <= 0x00002c27 (+2^13.4644)
str.w r4, [r0, #952]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1690
mul.w r4, r4, r14
    //// bounds:  -0x113f352 (-2^24.1083) <= r4  <= 0x0113f352 (+2^24.1083)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9fa8562 (-2^27.3188) <= r4  <= 0x09fa8562 (+2^27.3188)
MONTRED r4, r3
    //// bounds:  -0x00021fa (-2^13.0865) <= r4  <= 0x000021fb (+2^13.0866)
str.w r4, [r0, #960]
/* computing z1 = x1y0 + x0y1 + zeta^80 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0d934f6 (-2^23.7629) <= r4  <= 0x00d92e5c (+2^23.7628)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9bfc706 (-2^27.2853) <= r4  <= 0x09bfc06c (+2^27.2853)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12a65916 (-2^28.2211) <= r4  <= 0x12a6527c (+2^28.2211)
MONTRED r4, r3
    //// bounds:  -0x0002aa6 (-2^13.4144) <= r4  <= 0x00002aa6 (+2^13.4144)
str.w r4, [r0, #964]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1690
mul.w r4, r4, r14
    //// bounds:  -0x113f352 (-2^24.1083) <= r4  <= 0x0113f352 (+2^24.1083)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9fa8562 (-2^27.3188) <= r4  <= 0x09fa8562 (+2^27.3188)
MONTRED r4, r3
    //// bounds:  -0x00021fa (-2^13.0865) <= r4  <= 0x000021fb (+2^13.0866)
str.w r4, [r0, #972]
/* computing z1 = x1y0 + x0y1 + zeta^81 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0d92e5c (-2^23.7628) <= r4  <= 0x00d934f6 (+2^23.7629)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9bfc06c (-2^27.2853) <= r4  <= 0x09bfc706 (+2^27.2853)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12a6527c (-2^28.2211) <= r4  <= 0x12a65916 (+2^28.2211)
MONTRED r4, r3
    //// bounds:  -0x0002aa6 (-2^13.4144) <= r4  <= 0x00002aa6 (+2^13.4144)
str.w r4, [r0, #976]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4843
mul.w r4, r4, r14
    //// bounds:  -0x316c92f (-2^25.6271) <= r4  <= 0x0316c92f (+2^25.6271)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbfd5b3f (-2^27.5837) <= r4  <= 0x0bfd5b3f (+2^27.5837)
MONTRED r4, r3
    //// bounds:  -0x00023fd (-2^13.1695) <= r4  <= 0x000023fd (+2^13.1695)
str.w r4, [r0, #984]
/* computing z1 = x1y0 + x0y1 + zeta^82 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x26e720d (-2^25.2818) <= r4  <= 0x026e5f22 (+2^25.2816)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb55041d (-2^27.5023) <= r4  <= 0x0b54f132 (+2^27.5023)
mla.w r4, r10, r6, r4
    //// bounds:  -0x143b962d (-2^28.3386) <= r4  <= 0x143b8342 (+2^28.3386)
MONTRED r4, r3
    //// bounds:  -0x0002c3b (-2^13.4670) <= r4  <= 0x00002c3c (+2^13.4671)
str.w r4, [r0, #988]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4843
mul.w r4, r4, r14
    //// bounds:  -0x316c92f (-2^25.6271) <= r4  <= 0x0316c92f (+2^25.6271)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbfd5b3f (-2^27.5837) <= r4  <= 0x0bfd5b3f (+2^27.5837)
MONTRED r4, r3
    //// bounds:  -0x00023fd (-2^13.1695) <= r4  <= 0x000023fd (+2^13.1695)
str.w r4, [r0, #996]
/* computing z1 = x1y0 + x0y1 + zeta^83 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x26e5f22 (-2^25.2816) <= r4  <= 0x026e720d (+2^25.2818)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb54f132 (-2^27.5023) <= r4  <= 0x0b55041d (+2^27.5023)
mla.w r4, r10, r6, r4
    //// bounds:  -0x143b8342 (-2^28.3386) <= r4  <= 0x143b962d (+2^28.3386)
MONTRED r4, r3
    //// bounds:  -0x0002c3b (-2^13.4670) <= r4  <= 0x00002c3c (+2^13.4671)
str.w r4, [r0, #1000]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =14
mul.w r4, r4, r14
    //// bounds:  -0x0024936 (-2^17.1928) <= r4  <= 0x00024936 (+2^17.1928)
mla.w r4, r10, r7, r4
    //// bounds:  -0x8e8db46 (-2^27.1554) <= r4  <= 0x08e8db46 (+2^27.1554)
MONTRED r4, r3
    //// bounds:  -0x00020e9 (-2^13.0405) <= r4  <= 0x000020e9 (+2^13.0405)
str.w r4, [r0, #1008]
/* computing z1 = x1y0 + x0y1 + zeta^84 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x001cc94 (-2^16.8473) <= r4  <= 0x0001cca2 (+2^16.8475)
mla.w r4, r9, r7, r4
    //// bounds:  -0x8e85ea4 (-2^27.1551) <= r4  <= 0x08e85eb2 (+2^27.1551)
mla.w r4, r10, r6, r4
    //// bounds:  -0x11cef0b4 (-2^28.1545) <= r4  <= 0x11cef0c2 (+2^28.1545)
MONTRED r4, r3
    //// bounds:  -0x00029cf (-2^13.3857) <= r4  <= 0x000029cf (+2^13.3857)
str.w r4, [r0, #1012]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-14
mul.w r4, r4, r14
    //// bounds:  -0x0024936 (-2^17.1928) <= r4  <= 0x00024936 (+2^17.1928)
mla.w r4, r10, r7, r4
    //// bounds:  -0x8e8db46 (-2^27.1554) <= r4  <= 0x08e8db46 (+2^27.1554)
MONTRED r4, r3
    //// bounds:  -0x00020e9 (-2^13.0405) <= r4  <= 0x000020e9 (+2^13.0405)
str.w r4, [r0, #1020]
/* computing z1 = x1y0 + x0y1 + zeta^85 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x001cca2 (-2^16.8475) <= r4  <= 0x0001cc94 (+2^16.8473)
mla.w r4, r9, r7, r4
    //// bounds:  -0x8e85eb2 (-2^27.1551) <= r4  <= 0x08e85ea4 (+2^27.1551)
mla.w r4, r10, r6, r4
    //// bounds:  -0x11cef0c2 (-2^28.1545) <= r4  <= 0x11cef0b4 (+2^28.1545)
MONTRED r4, r3
    //// bounds:  -0x00029cf (-2^13.3857) <= r4  <= 0x000029cf (+2^13.3857)
str.w r4, [r0, #1024]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-3872
mul.w r4, r4, r14
    //// bounds:  -0x2783ca0 (-2^25.3043) <= r4  <= 0x02783ca0 (+2^25.3043)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb5eceb0 (-2^27.5072) <= r4  <= 0x0b5eceb0 (+2^27.5072)
MONTRED r4, r3
    //// bounds:  -0x000235f (-2^13.1445) <= r4  <= 0x0000235f (+2^13.1445)
str.w r4, [r0, #1032]
/* computing z1 = x1y0 + x0y1 + zeta^86 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1f1a5e0 (-2^24.9590) <= r4  <= 0x01f196c0 (+2^24.9588)
mla.w r4, r9, r7, r4
    //// bounds:  -0xad837f0 (-2^27.4389) <= r4  <= 0x0ad828d0 (+2^27.4389)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13beca00 (-2^28.3034) <= r4  <= 0x13bebae0 (+2^28.3034)
MONTRED r4, r3
    //// bounds:  -0x0002bbf (-2^13.4511) <= r4  <= 0x00002bbf (+2^13.4511)
str.w r4, [r0, #1036]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =3872
mul.w r4, r4, r14
    //// bounds:  -0x2783ca0 (-2^25.3043) <= r4  <= 0x02783ca0 (+2^25.3043)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb5eceb0 (-2^27.5072) <= r4  <= 0x0b5eceb0 (+2^27.5072)
MONTRED r4, r3
    //// bounds:  -0x000235f (-2^13.1445) <= r4  <= 0x0000235f (+2^13.1445)
str.w r4, [r0, #1044]
/* computing z1 = x1y0 + x0y1 + zeta^87 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1f196c0 (-2^24.9588) <= r4  <= 0x01f1a5e0 (+2^24.9590)
mla.w r4, r9, r7, r4
    //// bounds:  -0xad828d0 (-2^27.4389) <= r4  <= 0x0ad837f0 (+2^27.4389)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13bebae0 (-2^28.3034) <= r4  <= 0x13beca00 (+2^28.3034)
MONTRED r4, r3
    //// bounds:  -0x0002bbf (-2^13.4511) <= r4  <= 0x00002bbf (+2^13.4511)
str.w r4, [r0, #1048]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =2181
mul.w r4, r4, r14
    //// bounds:  -0x1641f81 (-2^24.4762) <= r4  <= 0x01641f81 (+2^24.4762)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa4ab191 (-2^27.3634) <= r4  <= 0x0a4ab191 (+2^27.3634)
MONTRED r4, r3
    //// bounds:  -0x000224b (-2^13.0998) <= r4  <= 0x0000224b (+2^13.0998)
str.w r4, [r0, #1056]
/* computing z1 = x1y0 + x0y1 + zeta^88 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x118477e (-2^24.1307) <= r4  <= 0x01185003 (+2^24.1309)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9fed98e (-2^27.3213) <= r4  <= 0x09fee213 (+2^27.3213)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12e56b9e (-2^28.2400) <= r4  <= 0x12e57423 (+2^28.2400)
MONTRED r4, r3
    //// bounds:  -0x0002ae5 (-2^13.4227) <= r4  <= 0x00002ae5 (+2^13.4227)
str.w r4, [r0, #1060]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-2181
mul.w r4, r4, r14
    //// bounds:  -0x1641f81 (-2^24.4762) <= r4  <= 0x01641f81 (+2^24.4762)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa4ab191 (-2^27.3634) <= r4  <= 0x0a4ab191 (+2^27.3634)
MONTRED r4, r3
    //// bounds:  -0x000224b (-2^13.0998) <= r4  <= 0x0000224b (+2^13.0998)
str.w r4, [r0, #1068]
/* computing z1 = x1y0 + x0y1 + zeta^89 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1185003 (-2^24.1309) <= r4  <= 0x0118477e (+2^24.1307)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9fee213 (-2^27.3213) <= r4  <= 0x09fed98e (+2^27.3213)
mla.w r4, r10, r6, r4
    //// bounds:  -0x12e57423 (-2^28.2400) <= r4  <= 0x12e56b9e (+2^28.2400)
MONTRED r4, r3
    //// bounds:  -0x0002ae5 (-2^13.4227) <= r4  <= 0x00002ae5 (+2^13.4227)
str.w r4, [r0, #1072]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5981
mul.w r4, r4, r14
    //// bounds:  -0x3d09a79 (-2^25.9316) <= r4  <= 0x03d09a79 (+2^25.9316)
mla.w r4, r10, r7, r4
    //// bounds:  -0xcb72c89 (-2^27.6685) <= r4  <= 0x0cb72c89 (+2^27.6685)
MONTRED r4, r3
    //// bounds:  -0x00024b7 (-2^13.1983) <= r4  <= 0x000024b7 (+2^13.1983)
str.w r4, [r0, #1080]
/* computing z1 = x1y0 + x0y1 + zeta^90 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x3009d8e (-2^25.5861) <= r4  <= 0x0300b4eb (+2^25.5863)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbe72f9e (-2^27.5733) <= r4  <= 0x0be746fb (+2^27.5733)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14cdc1ae (-2^28.3788) <= r4  <= 0x14cdd90b (+2^28.3788)
MONTRED r4, r3
    //// bounds:  -0x0002cce (-2^13.4856) <= r4  <= 0x00002cce (+2^13.4856)
str.w r4, [r0, #1084]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5981
mul.w r4, r4, r14
    //// bounds:  -0x3d09a79 (-2^25.9316) <= r4  <= 0x03d09a79 (+2^25.9316)
mla.w r4, r10, r7, r4
    //// bounds:  -0xcb72c89 (-2^27.6685) <= r4  <= 0x0cb72c89 (+2^27.6685)
MONTRED r4, r3
    //// bounds:  -0x00024b7 (-2^13.1983) <= r4  <= 0x000024b7 (+2^13.1983)
str.w r4, [r0, #1092]
/* computing z1 = x1y0 + x0y1 + zeta^91 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x300b4eb (-2^25.5863) <= r4  <= 0x03009d8e (+2^25.5861)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbe746fb (-2^27.5733) <= r4  <= 0x0be72f9e (+2^27.5733)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14cdd90b (-2^28.3788) <= r4  <= 0x14cdc1ae (+2^28.3788)
MONTRED r4, r3
    //// bounds:  -0x0002cce (-2^13.4856) <= r4  <= 0x00002cce (+2^13.4856)
str.w r4, [r0, #1096]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5719
mul.w r4, r4, r14
    //// bounds:  -0x3a5d2ab (-2^25.8670) <= r4  <= 0x03a5d2ab (+2^25.8670)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc8c64bb (-2^27.6494) <= r4  <= 0x0c8c64bb (+2^27.6494)
MONTRED r4, r3
    //// bounds:  -0x000248c (-2^13.1917) <= r4  <= 0x0000248c (+2^13.1917)
str.w r4, [r0, #1104]
/* computing z1 = x1y0 + x0y1 + zeta^92 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2df0881 (-2^25.5217) <= r4  <= 0x02def22a (+2^25.5215)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbc59a91 (-2^27.5573) <= r4  <= 0x0bc5843a (+2^27.5572)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14ac2ca1 (-2^28.3696) <= r4  <= 0x14ac164a (+2^28.3696)
MONTRED r4, r3
    //// bounds:  -0x0002cac (-2^13.4813) <= r4  <= 0x00002cac (+2^13.4813)
str.w r4, [r0, #1108]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5719
mul.w r4, r4, r14
    //// bounds:  -0x3a5d2ab (-2^25.8670) <= r4  <= 0x03a5d2ab (+2^25.8670)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc8c64bb (-2^27.6494) <= r4  <= 0x0c8c64bb (+2^27.6494)
MONTRED r4, r3
    //// bounds:  -0x000248c (-2^13.1917) <= r4  <= 0x0000248c (+2^13.1917)
str.w r4, [r0, #1116]
/* computing z1 = x1y0 + x0y1 + zeta^93 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2def22a (-2^25.5215) <= r4  <= 0x02df0881 (+2^25.5217)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbc5843a (-2^27.5572) <= r4  <= 0x0bc59a91 (+2^27.5573)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14ac164a (-2^28.3696) <= r4  <= 0x14ac2ca1 (+2^28.3696)
MONTRED r4, r3
    //// bounds:  -0x0002cac (-2^13.4813) <= r4  <= 0x00002cac (+2^13.4813)
str.w r4, [r0, #1120]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-3569
mul.w r4, r4, r14
    //// bounds:  -0x246c2fd (-2^25.1868) <= r4  <= 0x0246c2fd (+2^25.1868)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb2d550d (-2^27.4825) <= r4  <= 0x0b2d550d (+2^27.4825)
MONTRED r4, r3
    //// bounds:  -0x000232d (-2^13.1365) <= r4  <= 0x0000232d (+2^13.1365)
str.w r4, [r0, #1128]
/* computing z1 = x1y0 + x0y1 + zeta^94 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1cab477 (-2^24.8414) <= r4  <= 0x01caa686 (+2^24.8413)
mla.w r4, r9, r7, r4
    //// bounds:  -0xab14687 (-2^27.4185) <= r4  <= 0x0ab13896 (+2^27.4185)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1397d897 (-2^28.2923) <= r4  <= 0x1397caa6 (+2^28.2923)
MONTRED r4, r3
    //// bounds:  -0x0002b98 (-2^13.4460) <= r4  <= 0x00002b98 (+2^13.4460)
str.w r4, [r0, #1132]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =3569
mul.w r4, r4, r14
    //// bounds:  -0x246c2fd (-2^25.1868) <= r4  <= 0x0246c2fd (+2^25.1868)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb2d550d (-2^27.4825) <= r4  <= 0x0b2d550d (+2^27.4825)
MONTRED r4, r3
    //// bounds:  -0x000232d (-2^13.1365) <= r4  <= 0x0000232d (+2^13.1365)
str.w r4, [r0, #1140]
/* computing z1 = x1y0 + x0y1 + zeta^95 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1caa686 (-2^24.8413) <= r4  <= 0x01cab477 (+2^24.8414)
mla.w r4, r9, r7, r4
    //// bounds:  -0xab13896 (-2^27.4185) <= r4  <= 0x0ab14687 (+2^27.4185)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1397caa6 (-2^28.2923) <= r4  <= 0x1397d897 (+2^28.2923)
MONTRED r4, r3
    //// bounds:  -0x0002b98 (-2^13.4460) <= r4  <= 0x00002b98 (+2^13.4460)
str.w r4, [r0, #1144]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4407
mul.w r4, r4, r14
    //// bounds:  -0x2cf980b (-2^25.4910) <= r4  <= 0x02cf980b (+2^25.4910)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbb62a1b (-2^27.5499) <= r4  <= 0x0bb62a1b (+2^27.5499)
MONTRED r4, r3
    //// bounds:  -0x00023b6 (-2^13.1583) <= r4  <= 0x000023b6 (+2^13.1583)
str.w r4, [r0, #1152]
/* computing z1 = x1y0 + x0y1 + zeta^96 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x236576a (-2^25.1455) <= r4  <= 0x023668a1 (+2^25.1457)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb1ce97a (-2^27.4742) <= r4  <= 0x0b1cfab1 (+2^27.4742)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14037b8a (-2^28.3229) <= r4  <= 0x14038cc1 (+2^28.3229)
MONTRED r4, r3
    //// bounds:  -0x0002c03 (-2^13.4598) <= r4  <= 0x00002c04 (+2^13.4599)
str.w r4, [r0, #1156]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4407
mul.w r4, r4, r14
    //// bounds:  -0x2cf980b (-2^25.4910) <= r4  <= 0x02cf980b (+2^25.4910)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbb62a1b (-2^27.5499) <= r4  <= 0x0bb62a1b (+2^27.5499)
MONTRED r4, r3
    //// bounds:  -0x00023b6 (-2^13.1583) <= r4  <= 0x000023b6 (+2^13.1583)
str.w r4, [r0, #1164]
/* computing z1 = x1y0 + x0y1 + zeta^97 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x23668a1 (-2^25.1457) <= r4  <= 0x0236576a (+2^25.1455)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb1cfab1 (-2^27.4742) <= r4  <= 0x0b1ce97a (+2^27.4742)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14038cc1 (-2^28.3229) <= r4  <= 0x14037b8a (+2^28.3229)
MONTRED r4, r3
    //// bounds:  -0x0002c03 (-2^13.4598) <= r4  <= 0x00002c04 (+2^13.4599)
str.w r4, [r0, #1168]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4783
mul.w r4, r4, r14
    //// bounds:  -0x30cfd23 (-2^25.6092) <= r4  <= 0x030cfd23 (+2^25.6092)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbf38f33 (-2^27.5791) <= r4  <= 0x0bf38f33 (+2^27.5791)
MONTRED r4, r3
    //// bounds:  -0x00023f3 (-2^13.1679) <= r4  <= 0x000023f4 (+2^13.1680)
str.w r4, [r0, #1176]
/* computing z1 = x1y0 + x0y1 + zeta^98 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x266a93a (-2^25.2636) <= r4  <= 0x0266bbe9 (+2^25.2638)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb4d3b4a (-2^27.4985) <= r4  <= 0x0b4d4df9 (+2^27.4985)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1433cd5a (-2^28.3365) <= r4  <= 0x1433e009 (+2^28.3365)
MONTRED r4, r3
    //// bounds:  -0x0002c34 (-2^13.4661) <= r4  <= 0x00002c34 (+2^13.4661)
str.w r4, [r0, #1180]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4783
mul.w r4, r4, r14
    //// bounds:  -0x30cfd23 (-2^25.6092) <= r4  <= 0x030cfd23 (+2^25.6092)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbf38f33 (-2^27.5791) <= r4  <= 0x0bf38f33 (+2^27.5791)
MONTRED r4, r3
    //// bounds:  -0x00023f3 (-2^13.1679) <= r4  <= 0x000023f4 (+2^13.1680)
str.w r4, [r0, #1188]
/* computing z1 = x1y0 + x0y1 + zeta^99 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
b.w 1f
.ltorg /* constant pool */
1:
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x266bbe9 (-2^25.2638) <= r4  <= 0x0266a93a (+2^25.2636)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb4d4df9 (-2^27.4985) <= r4  <= 0x0b4d3b4a (+2^27.4985)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1433e009 (-2^28.3365) <= r4  <= 0x1433cd5a (+2^28.3365)
MONTRED r4, r3
    //// bounds:  -0x0002c34 (-2^13.4661) <= r4  <= 0x00002c34 (+2^13.4661)
str.w r4, [r0, #1192]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-1549
mul.w r4, r4, r14
    //// bounds:  -0x0fced69 (-2^23.9826) <= r4  <= 0x00fced69 (+2^23.9826)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9e37f79 (-2^27.3058) <= r4  <= 0x09e37f79 (+2^27.3058)
MONTRED r4, r3
    //// bounds:  -0x00021e3 (-2^13.0826) <= r4  <= 0x000021e3 (+2^13.0826)
str.w r4, [r0, #1200]
/* computing z1 = x1y0 + x0y1 + zeta^100 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0c715bb (-2^23.6372) <= r4  <= 0x00c70fae (+2^23.6371)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9ada7cb (-2^27.2748) <= r4  <= 0x09ada1be (+2^27.2747)
mla.w r4, r10, r6, r4
    //// bounds:  -0x129439db (-2^28.2156) <= r4  <= 0x129433ce (+2^28.2156)
MONTRED r4, r3
    //// bounds:  -0x0002a94 (-2^13.4120) <= r4  <= 0x00002a94 (+2^13.4120)
str.w r4, [r0, #1204]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =1549
mul.w r4, r4, r14
    //// bounds:  -0x0fced69 (-2^23.9826) <= r4  <= 0x00fced69 (+2^23.9826)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9e37f79 (-2^27.3058) <= r4  <= 0x09e37f79 (+2^27.3058)
MONTRED r4, r3
    //// bounds:  -0x00021e3 (-2^13.0826) <= r4  <= 0x000021e3 (+2^13.0826)
str.w r4, [r0, #1212]
/* computing z1 = x1y0 + x0y1 + zeta^101 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0c70fae (-2^23.6371) <= r4  <= 0x00c715bb (+2^23.6372)
mla.w r4, r9, r7, r4
    //// bounds:  -0x9ada1be (-2^27.2747) <= r4  <= 0x09ada7cb (+2^27.2748)
mla.w r4, r10, r6, r4
    //// bounds:  -0x129433ce (-2^28.2156) <= r4  <= 0x129439db (+2^28.2156)
MONTRED r4, r3
    //// bounds:  -0x0002a94 (-2^13.4120) <= r4  <= 0x00002a94 (+2^13.4120)
str.w r4, [r0, #1216]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5217
mul.w r4, r4, r14
    //// bounds:  -0x353daad (-2^25.7345) <= r4  <= 0x0353daad (+2^25.7345)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc3a6cbd (-2^27.6121) <= r4  <= 0x0c3a6cbd (+2^27.6121)
MONTRED r4, r3
    //// bounds:  -0x000243a (-2^13.1790) <= r4  <= 0x0000243a (+2^13.1790)
str.w r4, [r0, #1224]
/* computing z1 = x1y0 + x0y1 + zeta^102 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x29e8387 (-2^25.3891) <= r4  <= 0x029e6f26 (+2^25.3890)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb851597 (-2^27.5261) <= r4  <= 0x0b850136 (+2^27.5260)
mla.w r4, r10, r6, r4
    //// bounds:  -0x146ba7a7 (-2^28.3519) <= r4  <= 0x146b9346 (+2^28.3519)
MONTRED r4, r3
    //// bounds:  -0x0002c6b (-2^13.4731) <= r4  <= 0x00002c6c (+2^13.4732)
str.w r4, [r0, #1228]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5217
mul.w r4, r4, r14
    //// bounds:  -0x353daad (-2^25.7345) <= r4  <= 0x0353daad (+2^25.7345)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc3a6cbd (-2^27.6121) <= r4  <= 0x0c3a6cbd (+2^27.6121)
MONTRED r4, r3
    //// bounds:  -0x000243a (-2^13.1790) <= r4  <= 0x0000243a (+2^13.1790)
str.w r4, [r0, #1236]
/* computing z1 = x1y0 + x0y1 + zeta^103 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x29e6f26 (-2^25.3890) <= r4  <= 0x029e8387 (+2^25.3891)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb850136 (-2^27.5260) <= r4  <= 0x0b851597 (+2^27.5261)
mla.w r4, r10, r6, r4
    //// bounds:  -0x146b9346 (-2^28.3519) <= r4  <= 0x146ba7a7 (+2^28.3519)
MONTRED r4, r3
    //// bounds:  -0x0002c6b (-2^13.4731) <= r4  <= 0x00002c6c (+2^13.4732)
str.w r4, [r0, #1240]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =79
mul.w r4, r4, r14
    //// bounds:  -0x00ce643 (-2^19.6892) <= r4  <= 0x000ce643 (+2^19.6892)
mla.w r4, r10, r7, r4
    //// bounds:  -0x8f37853 (-2^27.1621) <= r4  <= 0x08f37853 (+2^27.1621)
MONTRED r4, r3
    //// bounds:  -0x00020f3 (-2^13.0422) <= r4  <= 0x000020f3 (+2^13.0422)
str.w r4, [r0, #1248]
/* computing z1 = x1y0 + x0y1 + zeta^104 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x00a26fa (-2^19.3437) <= r4  <= 0x000a2749 (+2^19.3439)
mla.w r4, r9, r7, r4
    //// bounds:  -0x8f0b90a (-2^27.1603) <= r4  <= 0x08f0b959 (+2^27.1603)
mla.w r4, r10, r6, r4
    //// bounds:  -0x11d74b1a (-2^28.1571) <= r4  <= 0x11d74b69 (+2^28.1571)
MONTRED r4, r3
    //// bounds:  -0x00029d7 (-2^13.3868) <= r4  <= 0x000029d7 (+2^13.3868)
str.w r4, [r0, #1252]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-79
mul.w r4, r4, r14
    //// bounds:  -0x00ce643 (-2^19.6892) <= r4  <= 0x000ce643 (+2^19.6892)
mla.w r4, r10, r7, r4
    //// bounds:  -0x8f37853 (-2^27.1621) <= r4  <= 0x08f37853 (+2^27.1621)
MONTRED r4, r3
    //// bounds:  -0x00020f3 (-2^13.0422) <= r4  <= 0x000020f3 (+2^13.0422)
str.w r4, [r0, #1260]
/* computing z1 = x1y0 + x0y1 + zeta^105 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x00a2749 (-2^19.3439) <= r4  <= 0x000a26fa (+2^19.3437)
mla.w r4, r9, r7, r4
    //// bounds:  -0x8f0b959 (-2^27.1603) <= r4  <= 0x08f0b90a (+2^27.1603)
mla.w r4, r10, r6, r4
    //// bounds:  -0x11d74b69 (-2^28.1571) <= r4  <= 0x11d74b1a (+2^28.1571)
MONTRED r4, r3
    //// bounds:  -0x00029d7 (-2^13.3868) <= r4  <= 0x000029d7 (+2^13.3868)
str.w r4, [r0, #1264]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-6049
mul.w r4, r4, r14
    //// bounds:  -0x3dbb4ed (-2^25.9479) <= r4  <= 0x03dbb4ed (+2^25.9479)
mla.w r4, r10, r7, r4
    //// bounds:  -0xcc246fd (-2^27.6734) <= r4  <= 0x0cc246fd (+2^27.6734)
MONTRED r4, r3
    //// bounds:  -0x00024c2 (-2^13.2000) <= r4  <= 0x000024c2 (+2^13.2000)
str.w r4, [r0, #1272]
/* computing z1 = x1y0 + x0y1 + zeta^106 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x3097247 (-2^25.6026) <= r4  <= 0x03095aa6 (+2^25.6024)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbf00457 (-2^27.5774) <= r4  <= 0x0befecb6 (+2^27.5774)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14d69667 (-2^28.3812) <= r4  <= 0x14d67ec6 (+2^28.3811)
MONTRED r4, r3
    //// bounds:  -0x0002cd6 (-2^13.4866) <= r4  <= 0x00002cd7 (+2^13.4867)
str.w r4, [r0, #1276]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =6049
mul.w r4, r4, r14
    //// bounds:  -0x3dbb4ed (-2^25.9479) <= r4  <= 0x03dbb4ed (+2^25.9479)
mla.w r4, r10, r7, r4
    //// bounds:  -0xcc246fd (-2^27.6734) <= r4  <= 0x0cc246fd (+2^27.6734)
MONTRED r4, r3
    //// bounds:  -0x00024c2 (-2^13.2000) <= r4  <= 0x000024c2 (+2^13.2000)
str.w r4, [r0, #1284]
/* computing z1 = x1y0 + x0y1 + zeta^107 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x3095aa6 (-2^25.6024) <= r4  <= 0x03097247 (+2^25.6026)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbefecb6 (-2^27.5774) <= r4  <= 0x0bf00457 (+2^27.5774)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14d67ec6 (-2^28.3811) <= r4  <= 0x14d69667 (+2^28.3812)
MONTRED r4, r3
    //// bounds:  -0x0002cd6 (-2^13.4866) <= r4  <= 0x00002cd7 (+2^13.4867)
str.w r4, [r0, #1288]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-117
mul.w r4, r4, r14
    //// bounds:  -0x0131ab1 (-2^20.2558) <= r4  <= 0x00131ab1 (+2^20.2558)
mla.w r4, r10, r7, r4
    //// bounds:  -0x8f9acc1 (-2^27.1660) <= r4  <= 0x08f9acc1 (+2^27.1660)
MONTRED r4, r3
    //// bounds:  -0x00020f9 (-2^13.0432) <= r4  <= 0x000020fa (+2^13.0434)
str.w r4, [r0, #1296]
/* computing z1 = x1y0 + x0y1 + zeta^108 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x00f0993 (-2^19.9105) <= r4  <= 0x000f091e (+2^19.9103)
mla.w r4, r9, r7, r4
    //// bounds:  -0x8f59ba3 (-2^27.1634) <= r4  <= 0x08f59b2e (+2^27.1634)
mla.w r4, r10, r6, r4
    //// bounds:  -0x11dc2db3 (-2^28.1587) <= r4  <= 0x11dc2d3e (+2^28.1587)
MONTRED r4, r3
    //// bounds:  -0x00029dc (-2^13.3875) <= r4  <= 0x000029dc (+2^13.3875)
str.w r4, [r0, #1300]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =117
mul.w r4, r4, r14
    //// bounds:  -0x0131ab1 (-2^20.2558) <= r4  <= 0x00131ab1 (+2^20.2558)
mla.w r4, r10, r7, r4
    //// bounds:  -0x8f9acc1 (-2^27.1660) <= r4  <= 0x08f9acc1 (+2^27.1660)
MONTRED r4, r3
    //// bounds:  -0x00020f9 (-2^13.0432) <= r4  <= 0x000020fa (+2^13.0434)
str.w r4, [r0, #1308]
/* computing z1 = x1y0 + x0y1 + zeta^109 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x00f091e (-2^19.9103) <= r4  <= 0x000f0993 (+2^19.9105)
mla.w r4, r9, r7, r4
    //// bounds:  -0x8f59b2e (-2^27.1634) <= r4  <= 0x08f59ba3 (+2^27.1634)
mla.w r4, r10, r6, r4
    //// bounds:  -0x11dc2d3e (-2^28.1587) <= r4  <= 0x11dc2db3 (+2^28.1587)
MONTRED r4, r3
    //// bounds:  -0x00029dc (-2^13.3875) <= r4  <= 0x000029dc (+2^13.3875)
str.w r4, [r0, #1312]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-997
mul.w r4, r4, r14
    //// bounds:  -0x0a2cb61 (-2^23.3469) <= r4  <= 0x00a2cb61 (+2^23.3469)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9895d71 (-2^27.2535) <= r4  <= 0x09895d71 (+2^27.2535)
MONTRED r4, r3
    //// bounds:  -0x0002189 (-2^13.0676) <= r4  <= 0x00002189 (+2^13.0676)
str.w r4, [r0, #1320]
/* computing z1 = x1y0 + x0y1 + zeta^110 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x08023a3 (-2^23.0016) <= r4  <= 0x00801fbe (+2^23.0014)
mla.w r4, r9, r7, r4
    //// bounds:  -0x966b5b3 (-2^27.2328) <= r4  <= 0x0966b1ce (+2^27.2328)
mla.w r4, r10, r6, r4
    //// bounds:  -0x124d47c3 (-2^28.1939) <= r4  <= 0x124d43de (+2^28.1939)
MONTRED r4, r3
    //// bounds:  -0x0002a4d (-2^13.4026) <= r4  <= 0x00002a4d (+2^13.4026)
str.w r4, [r0, #1324]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =997
mul.w r4, r4, r14
    //// bounds:  -0x0a2cb61 (-2^23.3469) <= r4  <= 0x00a2cb61 (+2^23.3469)
mla.w r4, r10, r7, r4
    //// bounds:  -0x9895d71 (-2^27.2535) <= r4  <= 0x09895d71 (+2^27.2535)
MONTRED r4, r3
    //// bounds:  -0x0002189 (-2^13.0676) <= r4  <= 0x00002189 (+2^13.0676)
str.w r4, [r0, #1332]
/* computing z1 = x1y0 + x0y1 + zeta^111 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x0801fbe (-2^23.0014) <= r4  <= 0x008023a3 (+2^23.0016)
mla.w r4, r9, r7, r4
    //// bounds:  -0x966b1ce (-2^27.2328) <= r4  <= 0x0966b5b3 (+2^27.2328)
mla.w r4, r10, r6, r4
    //// bounds:  -0x124d43de (-2^28.1939) <= r4  <= 0x124d47c3 (+2^28.1939)
MONTRED r4, r3
    //// bounds:  -0x0002a4d (-2^13.4026) <= r4  <= 0x00002a4d (+2^13.4026)
str.w r4, [r0, #1336]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-3412
mul.w r4, r4, r14
    //// bounds:  -0x22d2044 (-2^25.1219) <= r4  <= 0x022d2044 (+2^25.1219)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb13b254 (-2^27.4695) <= r4  <= 0x0b13b254 (+2^27.4695)
MONTRED r4, r3
    //// bounds:  -0x0002314 (-2^13.1325) <= r4  <= 0x00002314 (+2^13.1325)
str.w r4, [r0, #1344]
/* computing z1 = x1y0 + x0y1 + zeta^112 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1b686cc (-2^24.7765) <= r4  <= 0x01b67978 (+2^24.7763)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa9d18dc (-2^27.4079) <= r4  <= 0x0a9d0b88 (+2^27.4078)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1383aaec (-2^28.2865) <= r4  <= 0x13839d98 (+2^28.2864)
MONTRED r4, r3
    //// bounds:  -0x0002b83 (-2^13.4433) <= r4  <= 0x00002b84 (+2^13.4435)
str.w r4, [r0, #1348]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =3412
mul.w r4, r4, r14
    //// bounds:  -0x22d2044 (-2^25.1219) <= r4  <= 0x022d2044 (+2^25.1219)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb13b254 (-2^27.4695) <= r4  <= 0x0b13b254 (+2^27.4695)
MONTRED r4, r3
    //// bounds:  -0x0002314 (-2^13.1325) <= r4  <= 0x00002314 (+2^13.1325)
str.w r4, [r0, #1356]
/* computing z1 = x1y0 + x0y1 + zeta^113 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1b67978 (-2^24.7763) <= r4  <= 0x01b686cc (+2^24.7765)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa9d0b88 (-2^27.4078) <= r4  <= 0x0a9d18dc (+2^27.4079)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13839d98 (-2^28.2864) <= r4  <= 0x1383aaec (+2^28.2865)
MONTRED r4, r3
    //// bounds:  -0x0002b83 (-2^13.4433) <= r4  <= 0x00002b84 (+2^13.4435)
str.w r4, [r0, #1360]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4431
mul.w r4, r4, r14
    //// bounds:  -0x2d38343 (-2^25.4989) <= r4  <= 0x02d38343 (+2^25.4989)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbba1553 (-2^27.5517) <= r4  <= 0x0bba1553 (+2^27.5517)
MONTRED r4, r3
    //// bounds:  -0x00023ba (-2^13.1589) <= r4  <= 0x000023ba (+2^13.1589)
str.w r4, [r0, #1368]
/* computing z1 = x1y0 + x0y1 + zeta^114 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2396cfa (-2^25.1534) <= r4  <= 0x02397e49 (+2^25.1535)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb1fff0a (-2^27.4757) <= r4  <= 0x0b201059 (+2^27.4758)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1406911a (-2^28.3238) <= r4  <= 0x1406a269 (+2^28.3238)
MONTRED r4, r3
    //// bounds:  -0x0002c06 (-2^13.4602) <= r4  <= 0x00002c07 (+2^13.4603)
str.w r4, [r0, #1372]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4431
mul.w r4, r4, r14
    //// bounds:  -0x2d38343 (-2^25.4989) <= r4  <= 0x02d38343 (+2^25.4989)
mla.w r4, r10, r7, r4
    //// bounds:  -0xbba1553 (-2^27.5517) <= r4  <= 0x0bba1553 (+2^27.5517)
MONTRED r4, r3
    //// bounds:  -0x00023ba (-2^13.1589) <= r4  <= 0x000023ba (+2^13.1589)
str.w r4, [r0, #1380]
/* computing z1 = x1y0 + x0y1 + zeta^115 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2397e49 (-2^25.1535) <= r4  <= 0x02396cfa (+2^25.1534)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb201059 (-2^27.4758) <= r4  <= 0x0b1fff0a (+2^27.4757)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1406a269 (-2^28.3238) <= r4  <= 0x1406911a (+2^28.3238)
MONTRED r4, r3
    //// bounds:  -0x0002c06 (-2^13.4602) <= r4  <= 0x00002c07 (+2^13.4603)
str.w r4, [r0, #1384]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5831
mul.w r4, r4, r14
    //// bounds:  -0x3b81c5b (-2^25.8950) <= r4  <= 0x03b81c5b (+2^25.8950)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc9eae6b (-2^27.6576) <= r4  <= 0x0c9eae6b (+2^27.6576)
MONTRED r4, r3
    //// bounds:  -0x000249e (-2^13.1944) <= r4  <= 0x0000249f (+2^13.1946)
str.w r4, [r0, #1392]
/* computing z1 = x1y0 + x0y1 + zeta^116 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2ed56ca (-2^25.5495) <= r4  <= 0x02ed6d91 (+2^25.5496)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbd3e8da (-2^27.5641) <= r4  <= 0x0bd3ffa1 (+2^27.5641)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14ba7aea (-2^28.3735) <= r4  <= 0x14ba91b1 (+2^28.3736)
MONTRED r4, r3
    //// bounds:  -0x0002cba (-2^13.4831) <= r4  <= 0x00002cbb (+2^13.4832)
str.w r4, [r0, #1396]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5831
mul.w r4, r4, r14
    //// bounds:  -0x3b81c5b (-2^25.8950) <= r4  <= 0x03b81c5b (+2^25.8950)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc9eae6b (-2^27.6576) <= r4  <= 0x0c9eae6b (+2^27.6576)
MONTRED r4, r3
    //// bounds:  -0x000249e (-2^13.1944) <= r4  <= 0x0000249f (+2^13.1946)
str.w r4, [r0, #1404]
/* computing z1 = x1y0 + x0y1 + zeta^117 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2ed6d91 (-2^25.5496) <= r4  <= 0x02ed56ca (+2^25.5495)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbd3ffa1 (-2^27.5641) <= r4  <= 0x0bd3e8da (+2^27.5641)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14ba91b1 (-2^28.3736) <= r4  <= 0x14ba7aea (+2^28.3735)
MONTRED r4, r3
    //// bounds:  -0x0002cba (-2^13.4831) <= r4  <= 0x00002cbb (+2^13.4832)
str.w r4, [r0, #1408]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-2829
mul.w r4, r4, r14
    //// bounds:  -0x1cdee69 (-2^24.8515) <= r4  <= 0x01cdee69 (+2^24.8515)
mla.w r4, r10, r7, r4
    //// bounds:  -0xab48079 (-2^27.4202) <= r4  <= 0x0ab48079 (+2^27.4202)
MONTRED r4, r3
    //// bounds:  -0x00022b4 (-2^13.1170) <= r4  <= 0x000022b5 (+2^13.1172)
str.w r4, [r0, #1416]
/* computing z1 = x1y0 + x0y1 + zeta^118 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x16b98bb (-2^24.5062) <= r4  <= 0x016b8dae (+2^24.5060)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa522acb (-2^27.3675) <= r4  <= 0x0a521fbe (+2^27.3675)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1338bcdb (-2^28.2647) <= r4  <= 0x1338b1ce (+2^28.2646)
MONTRED r4, r3
    //// bounds:  -0x0002b39 (-2^13.4337) <= r4  <= 0x00002b39 (+2^13.4337)
str.w r4, [r0, #1420]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =2829
mul.w r4, r4, r14
    //// bounds:  -0x1cdee69 (-2^24.8515) <= r4  <= 0x01cdee69 (+2^24.8515)
mla.w r4, r10, r7, r4
    //// bounds:  -0xab48079 (-2^27.4202) <= r4  <= 0x0ab48079 (+2^27.4202)
MONTRED r4, r3
    //// bounds:  -0x00022b4 (-2^13.1170) <= r4  <= 0x000022b5 (+2^13.1172)
str.w r4, [r0, #1428]
/* computing z1 = x1y0 + x0y1 + zeta^119 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x16b8dae (-2^24.5060) <= r4  <= 0x016b98bb (+2^24.5062)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa521fbe (-2^27.3675) <= r4  <= 0x0a522acb (+2^27.3675)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1338b1ce (-2^28.2646) <= r4  <= 0x1338bcdb (+2^28.2647)
MONTRED r4, r3
    //// bounds:  -0x0002b39 (-2^13.4337) <= r4  <= 0x00002b39 (+2^13.4337)
str.w r4, [r0, #1432]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5145
mul.w r4, r4, r14
    //// bounds:  -0x3481905 (-2^25.7144) <= r4  <= 0x03481905 (+2^25.7144)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc2eab15 (-2^27.6067) <= r4  <= 0x0c2eab15 (+2^27.6067)
MONTRED r4, r3
    //// bounds:  -0x000242e (-2^13.1771) <= r4  <= 0x0000242f (+2^13.1773)
str.w r4, [r0, #1440]
/* computing z1 = x1y0 + x0y1 + zeta^120 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2952e76 (-2^25.3689) <= r4  <= 0x0295428f (+2^25.3691)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb7bc086 (-2^27.5215) <= r4  <= 0x0b7bd49f (+2^27.5215)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14625296 (-2^28.3494) <= r4  <= 0x146266af (+2^28.3494)
MONTRED r4, r3
    //// bounds:  -0x0002c62 (-2^13.4719) <= r4  <= 0x00002c62 (+2^13.4719)
str.w r4, [r0, #1444]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5145
mul.w r4, r4, r14
    //// bounds:  -0x3481905 (-2^25.7144) <= r4  <= 0x03481905 (+2^25.7144)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc2eab15 (-2^27.6067) <= r4  <= 0x0c2eab15 (+2^27.6067)
MONTRED r4, r3
    //// bounds:  -0x000242e (-2^13.1771) <= r4  <= 0x0000242f (+2^13.1773)
str.w r4, [r0, #1452]
/* computing z1 = x1y0 + x0y1 + zeta^121 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x295428f (-2^25.3691) <= r4  <= 0x02952e76 (+2^25.3689)
mla.w r4, r9, r7, r4
    //// bounds:  -0xb7bd49f (-2^27.5215) <= r4  <= 0x0b7bc086 (+2^27.5215)
mla.w r4, r10, r6, r4
    //// bounds:  -0x146266af (-2^28.3494) <= r4  <= 0x14625296 (+2^28.3494)
MONTRED r4, r3
    //// bounds:  -0x0002c62 (-2^13.4719) <= r4  <= 0x00002c62 (+2^13.4719)
str.w r4, [r0, #1456]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =2564
mul.w r4, r4, r14
    //// bounds:  -0x1a2a934 (-2^24.7096) <= r4  <= 0x01a2a934 (+2^24.7096)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa893b44 (-2^27.3973) <= r4  <= 0x0a893b44 (+2^27.3973)
MONTRED r4, r3
    //// bounds:  -0x0002289 (-2^13.1100) <= r4  <= 0x00002289 (+2^13.1100)
str.w r4, [r0, #1464]
/* computing z1 = x1y0 + x0y1 + zeta^122 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x1497f98 (-2^24.3641) <= r4  <= 0x0149899c (+2^24.3643)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa3011a8 (-2^27.3488) <= r4  <= 0x0a301bac (+2^27.3488)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1316a3b8 (-2^28.2546) <= r4  <= 0x1316adbc (+2^28.2546)
MONTRED r4, r3
    //// bounds:  -0x0002b16 (-2^13.4291) <= r4  <= 0x00002b17 (+2^13.4293)
str.w r4, [r0, #1468]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-2564
mul.w r4, r4, r14
    //// bounds:  -0x1a2a934 (-2^24.7096) <= r4  <= 0x01a2a934 (+2^24.7096)
mla.w r4, r10, r7, r4
    //// bounds:  -0xa893b44 (-2^27.3973) <= r4  <= 0x0a893b44 (+2^27.3973)
MONTRED r4, r3
    //// bounds:  -0x0002289 (-2^13.1100) <= r4  <= 0x00002289 (+2^13.1100)
str.w r4, [r0, #1476]
/* computing z1 = x1y0 + x0y1 + zeta^123 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x149899c (-2^24.3643) <= r4  <= 0x01497f98 (+2^24.3641)
mla.w r4, r9, r7, r4
    //// bounds:  -0xa301bac (-2^27.3488) <= r4  <= 0x0a3011a8 (+2^27.3488)
mla.w r4, r10, r6, r4
    //// bounds:  -0x1316adbc (-2^28.2546) <= r4  <= 0x1316a3b8 (+2^28.2546)
MONTRED r4, r3
    //// bounds:  -0x0002b16 (-2^13.4291) <= r4  <= 0x00002b17 (+2^13.4293)
str.w r4, [r0, #1480]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-4042
mul.w r4, r4, r14
    //// bounds:  -0x293fec2 (-2^25.3663) <= r4  <= 0x0293fec2 (+2^25.3663)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb7a90d2 (-2^27.5209) <= r4  <= 0x0b7a90d2 (+2^27.5209)
MONTRED r4, r3
    //// bounds:  -0x000237a (-2^13.1488) <= r4  <= 0x0000237b (+2^13.1490)
str.w r4, [r0, #1488]
b.w 1f
.ltorg /* constant pool */
1:
/* computing z1 = x1y0 + x0y1 + zeta^124 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2077f46 (-2^25.0210) <= r4  <= 0x02076f7c (+2^25.0208)
mla.w r4, r9, r7, r4
    //// bounds:  -0xaee1156 (-2^27.4502) <= r4  <= 0x0aee018c (+2^27.4502)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13d4a366 (-2^28.3097) <= r4  <= 0x13d4939c (+2^28.3096)
MONTRED r4, r3
    //// bounds:  -0x0002bd4 (-2^13.4538) <= r4  <= 0x00002bd5 (+2^13.4539)
str.w r4, [r0, #1492]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =4042
mul.w r4, r4, r14
    //// bounds:  -0x293fec2 (-2^25.3663) <= r4  <= 0x0293fec2 (+2^25.3663)
mla.w r4, r10, r7, r4
    //// bounds:  -0xb7a90d2 (-2^27.5209) <= r4  <= 0x0b7a90d2 (+2^27.5209)
MONTRED r4, r3
    //// bounds:  -0x000237a (-2^13.1488) <= r4  <= 0x0000237b (+2^13.1490)
str.w r4, [r0, #1500]
/* computing z1 = x1y0 + x0y1 + zeta^125 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2076f7c (-2^25.0208) <= r4  <= 0x02077f46 (+2^25.0210)
mla.w r4, r9, r7, r4
    //// bounds:  -0xaee018c (-2^27.4502) <= r4  <= 0x0aee1156 (+2^27.4502)
mla.w r4, r10, r6, r4
    //// bounds:  -0x13d4939c (-2^28.3096) <= r4  <= 0x13d4a366 (+2^28.3097)
MONTRED r4, r3
    //// bounds:  -0x0002bd4 (-2^13.4538) <= r4  <= 0x00002bd5 (+2^13.4539)
str.w r4, [r0, #1504]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =-5664
mul.w r4, r4, r14
    //// bounds:  -0x39cd7a0 (-2^25.8531) <= r4  <= 0x039cd7a0 (+2^25.8531)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc8369b0 (-2^27.6454) <= r4  <= 0x0c8369b0 (+2^27.6454)
MONTRED r4, r3
    //// bounds:  -0x0002483 (-2^13.1903) <= r4  <= 0x00002483 (+2^13.1903)
str.w r4, [r0, #1512]
/* computing z1 = x1y0 + x0y1 + zeta^126 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2d7f6e0 (-2^25.5077) <= r4  <= 0x02d7e0c0 (+2^25.5076)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbbe88f0 (-2^27.5539) <= r4  <= 0x0bbe72d0 (+2^27.5538)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14a51b00 (-2^28.3677) <= r4  <= 0x14a504e0 (+2^28.3677)
MONTRED r4, r3
    //// bounds:  -0x0002ca5 (-2^13.4804) <= r4  <= 0x00002ca5 (+2^13.4804)
str.w r4, [r0, #1516]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
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
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r8, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
MONTRED r4, r3
    //// bounds:  -0x00029cd (-2^13.3855) <= r4  <= 0x000029cd (+2^13.3855)
ldr.w r14, =5664
mul.w r4, r4, r14
    //// bounds:  -0x39cd7a0 (-2^25.8531) <= r4  <= 0x039cd7a0 (+2^25.8531)
mla.w r4, r10, r7, r4
    //// bounds:  -0xc8369b0 (-2^27.6454) <= r4  <= 0x0c8369b0 (+2^27.6454)
MONTRED r4, r3
    //// bounds:  -0x0002483 (-2^13.1903) <= r4  <= 0x00002483 (+2^13.1903)
str.w r4, [r0, #1524]
/* computing z1 = x1y0 + x0y1 + zeta^127 * x2y2 */
mul.w r4, r8, r5
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
MONTRED r4, r3
    //// bounds:  -0x00020e6 (-2^13.0399) <= r4  <= 0x000020e7 (+2^13.0401)
mul.w r4, r4, r14
    //// bounds:  -0x2d7e0c0 (-2^25.5076) <= r4  <= 0x02d7f6e0 (+2^25.5077)
mla.w r4, r9, r7, r4
    //// bounds:  -0xbbe72d0 (-2^27.5538) <= r4  <= 0x0bbe88f0 (+2^27.5539)
mla.w r4, r10, r6, r4
    //// bounds:  -0x14a504e0 (-2^28.3677) <= r4  <= 0x14a51b00 (+2^28.3677)
MONTRED r4, r3
    //// bounds:  -0x0002ca5 (-2^13.4804) <= r4  <= 0x00002ca5 (+2^13.4804)
str.w r4, [r0, #1528]
/* computing z2 = x2y0 + x1y1 + x0y2 */
mul.w r4, r8, r7
    //// bounds:  -0x8e69210 (-2^27.1539) <= r4  <= 0x08e69210 (+2^27.1539)
mla.w r4, r9, r6, r4
    //// bounds:  -0x11cd2420 (-2^28.1539) <= r4  <= 0x11cd2420 (+2^28.1539)
mla.w r4, r10, r5, r4
    //// bounds:  -0x1ab3b630 (-2^28.7389) <= r4  <= 0x1ab3b630 (+2^28.7389)
MONTRED r4, r3
    //// bounds:  -0x00032b4 (-2^13.6640) <= r4  <= 0x000032b4 (+2^13.6640)
str.w r4, [r0, #1532]
    pop {r4-r11, pc}
    .ltorg
    
/* minimum available registers: 1 */
