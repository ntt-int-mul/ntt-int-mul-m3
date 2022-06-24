.syntax unified
.cpu cortex-m3
.section .text

.align 2
.global chunk
.type chunk, %function
chunk:
ldr.w r3, [r1, #0]
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #0]
ubfx.w r12, r3, #11, #11
str.w r12, [r0, #4]
ldr.w r2, [r1, #4]
ubfx.w r12, r2, #0, #1
ubfx.w r3, r3, #22, #10
eor.w r12, r3, r12, lsl#10
str.w r12, [r0, #8]
ubfx.w r12, r2, #1, #11
str.w r12, [r0, #12]
ubfx.w r12, r2, #12, #11
str.w r12, [r0, #16]
ldr.w r3, [r1, #8]
ubfx.w r12, r3, #0, #2
ubfx.w r2, r2, #23, #9
eor.w r12, r2, r12, lsl#9
str.w r12, [r0, #20]
ubfx.w r12, r3, #2, #11
str.w r12, [r0, #24]
ubfx.w r12, r3, #13, #11
str.w r12, [r0, #28]
ldr.w r2, [r1, #12]
ubfx.w r12, r2, #0, #3
ubfx.w r3, r3, #24, #8
eor.w r12, r3, r12, lsl#8
str.w r12, [r0, #32]
ubfx.w r12, r2, #3, #11
str.w r12, [r0, #36]
ubfx.w r12, r2, #14, #11
str.w r12, [r0, #40]
ldr.w r3, [r1, #16]
ubfx.w r12, r3, #0, #4
ubfx.w r2, r2, #25, #7
eor.w r12, r2, r12, lsl#7
str.w r12, [r0, #44]
ubfx.w r12, r3, #4, #11
str.w r12, [r0, #48]
ubfx.w r12, r3, #15, #11
str.w r12, [r0, #52]
ldr.w r2, [r1, #20]
ubfx.w r12, r2, #0, #5
ubfx.w r3, r3, #26, #6
eor.w r12, r3, r12, lsl#6
str.w r12, [r0, #56]
ubfx.w r12, r2, #5, #11
str.w r12, [r0, #60]
ubfx.w r12, r2, #16, #11
str.w r12, [r0, #64]
ldr.w r3, [r1, #24]
ubfx.w r12, r3, #0, #6
ubfx.w r2, r2, #27, #5
eor.w r12, r2, r12, lsl#5
str.w r12, [r0, #68]
ubfx.w r12, r3, #6, #11
str.w r12, [r0, #72]
ubfx.w r12, r3, #17, #11
str.w r12, [r0, #76]
ldr.w r2, [r1, #28]
ubfx.w r12, r2, #0, #7
ubfx.w r3, r3, #28, #4
eor.w r12, r3, r12, lsl#4
str.w r12, [r0, #80]
ubfx.w r12, r2, #7, #11
str.w r12, [r0, #84]
ubfx.w r12, r2, #18, #11
str.w r12, [r0, #88]
ldr.w r3, [r1, #32]
ubfx.w r12, r3, #0, #8
ubfx.w r2, r2, #29, #3
eor.w r12, r2, r12, lsl#3
str.w r12, [r0, #92]
ubfx.w r12, r3, #8, #11
str.w r12, [r0, #96]
ubfx.w r12, r3, #19, #11
str.w r12, [r0, #100]
ldr.w r2, [r1, #36]
ubfx.w r12, r2, #0, #9
ubfx.w r3, r3, #30, #2
eor.w r12, r3, r12, lsl#2
str.w r12, [r0, #104]
ubfx.w r12, r2, #9, #11
str.w r12, [r0, #108]
ubfx.w r12, r2, #20, #11
str.w r12, [r0, #112]
ldr.w r3, [r1, #40]
ubfx.w r12, r3, #0, #10
ubfx.w r2, r2, #31, #1
eor.w r12, r2, r12, lsl#1
str.w r12, [r0, #116]
ubfx.w r12, r3, #10, #11
str.w r12, [r0, #120]
ubfx.w r12, r3, #21, #11
str.w r12, [r0, #124]
ldr.w r2, [r1, #44]
ubfx.w r12, r2, #0, #11
str.w r12, [r0, #128]
ubfx.w r12, r2, #11, #11
str.w r12, [r0, #132]
ldr.w r3, [r1, #48]
ubfx.w r12, r3, #0, #1
ubfx.w r2, r2, #22, #10
eor.w r12, r2, r12, lsl#10
str.w r12, [r0, #136]
ubfx.w r12, r3, #1, #11
str.w r12, [r0, #140]
ubfx.w r12, r3, #12, #11
str.w r12, [r0, #144]
ldr.w r2, [r1, #52]
ubfx.w r12, r2, #0, #2
ubfx.w r3, r3, #23, #9
eor.w r12, r3, r12, lsl#9
str.w r12, [r0, #148]
ubfx.w r12, r2, #2, #11
str.w r12, [r0, #152]
ubfx.w r12, r2, #13, #11
str.w r12, [r0, #156]
ldr.w r3, [r1, #56]
ubfx.w r12, r3, #0, #3
ubfx.w r2, r2, #24, #8
eor.w r12, r2, r12, lsl#8
str.w r12, [r0, #160]
ubfx.w r12, r3, #3, #11
str.w r12, [r0, #164]
ubfx.w r12, r3, #14, #11
str.w r12, [r0, #168]
ldr.w r2, [r1, #60]
ubfx.w r12, r2, #0, #4
ubfx.w r3, r3, #25, #7
eor.w r12, r3, r12, lsl#7
str.w r12, [r0, #172]
ubfx.w r12, r2, #4, #11
str.w r12, [r0, #176]
ubfx.w r12, r2, #15, #11
str.w r12, [r0, #180]
ldr.w r3, [r1, #64]
ubfx.w r12, r3, #0, #5
ubfx.w r2, r2, #26, #6
eor.w r12, r2, r12, lsl#6
str.w r12, [r0, #184]
ubfx.w r12, r3, #5, #11
str.w r12, [r0, #188]
ubfx.w r12, r3, #16, #11
str.w r12, [r0, #192]
ldr.w r2, [r1, #68]
ubfx.w r12, r2, #0, #6
ubfx.w r3, r3, #27, #5
eor.w r12, r3, r12, lsl#5
str.w r12, [r0, #196]
ubfx.w r12, r2, #6, #11
str.w r12, [r0, #200]
ubfx.w r12, r2, #17, #11
str.w r12, [r0, #204]
ldr.w r3, [r1, #72]
ubfx.w r12, r3, #0, #7
ubfx.w r2, r2, #28, #4
eor.w r12, r2, r12, lsl#4
str.w r12, [r0, #208]
ubfx.w r12, r3, #7, #11
str.w r12, [r0, #212]
ubfx.w r12, r3, #18, #11
str.w r12, [r0, #216]
ldr.w r2, [r1, #76]
ubfx.w r12, r2, #0, #8
ubfx.w r3, r3, #29, #3
eor.w r12, r3, r12, lsl#3
str.w r12, [r0, #220]
ubfx.w r12, r2, #8, #11
str.w r12, [r0, #224]
ubfx.w r12, r2, #19, #11
str.w r12, [r0, #228]
ldr.w r3, [r1, #80]
ubfx.w r12, r3, #0, #9
ubfx.w r2, r2, #30, #2
eor.w r12, r2, r12, lsl#2
str.w r12, [r0, #232]
ubfx.w r12, r3, #9, #11
str.w r12, [r0, #236]
ubfx.w r12, r3, #20, #11
str.w r12, [r0, #240]
ldr.w r2, [r1, #84]
ubfx.w r12, r2, #0, #10
ubfx.w r3, r3, #31, #1
eor.w r12, r3, r12, lsl#1
str.w r12, [r0, #244]
ubfx.w r12, r2, #10, #11
str.w r12, [r0, #248]
ubfx.w r12, r2, #21, #11
str.w r12, [r0, #252]
ldr.w r3, [r1, #88]
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #256]
ubfx.w r12, r3, #11, #11
str.w r12, [r0, #260]
ldr.w r2, [r1, #92]
ubfx.w r12, r2, #0, #1
ubfx.w r3, r3, #22, #10
eor.w r12, r3, r12, lsl#10
str.w r12, [r0, #264]
ubfx.w r12, r2, #1, #11
str.w r12, [r0, #268]
ubfx.w r12, r2, #12, #11
str.w r12, [r0, #272]
ldr.w r3, [r1, #96]
ubfx.w r12, r3, #0, #2
ubfx.w r2, r2, #23, #9
eor.w r12, r2, r12, lsl#9
str.w r12, [r0, #276]
ubfx.w r12, r3, #2, #11
str.w r12, [r0, #280]
ubfx.w r12, r3, #13, #11
str.w r12, [r0, #284]
ldr.w r2, [r1, #100]
ubfx.w r12, r2, #0, #3
ubfx.w r3, r3, #24, #8
eor.w r12, r3, r12, lsl#8
str.w r12, [r0, #288]
ubfx.w r12, r2, #3, #11
str.w r12, [r0, #292]
ubfx.w r12, r2, #14, #11
str.w r12, [r0, #296]
ldr.w r3, [r1, #104]
ubfx.w r12, r3, #0, #4
ubfx.w r2, r2, #25, #7
eor.w r12, r2, r12, lsl#7
str.w r12, [r0, #300]
ubfx.w r12, r3, #4, #11
str.w r12, [r0, #304]
ubfx.w r12, r3, #15, #11
str.w r12, [r0, #308]
ldr.w r2, [r1, #108]
ubfx.w r12, r2, #0, #5
ubfx.w r3, r3, #26, #6
eor.w r12, r3, r12, lsl#6
str.w r12, [r0, #312]
ubfx.w r12, r2, #5, #11
str.w r12, [r0, #316]
ubfx.w r12, r2, #16, #11
str.w r12, [r0, #320]
ldr.w r3, [r1, #112]
ubfx.w r12, r3, #0, #6
ubfx.w r2, r2, #27, #5
eor.w r12, r2, r12, lsl#5
str.w r12, [r0, #324]
ubfx.w r12, r3, #6, #11
str.w r12, [r0, #328]
ubfx.w r12, r3, #17, #11
str.w r12, [r0, #332]
ldr.w r2, [r1, #116]
ubfx.w r12, r2, #0, #7
ubfx.w r3, r3, #28, #4
eor.w r12, r3, r12, lsl#4
str.w r12, [r0, #336]
ubfx.w r12, r2, #7, #11
str.w r12, [r0, #340]
ubfx.w r12, r2, #18, #11
str.w r12, [r0, #344]
ldr.w r3, [r1, #120]
ubfx.w r12, r3, #0, #8
ubfx.w r2, r2, #29, #3
eor.w r12, r2, r12, lsl#3
str.w r12, [r0, #348]
ubfx.w r12, r3, #8, #11
str.w r12, [r0, #352]
ubfx.w r12, r3, #19, #11
str.w r12, [r0, #356]
ldr.w r2, [r1, #124]
ubfx.w r12, r2, #0, #9
ubfx.w r3, r3, #30, #2
eor.w r12, r3, r12, lsl#2
str.w r12, [r0, #360]
ubfx.w r12, r2, #9, #11
str.w r12, [r0, #364]
ubfx.w r12, r2, #20, #11
str.w r12, [r0, #368]
ldr.w r3, [r1, #128]
ubfx.w r12, r3, #0, #10
ubfx.w r2, r2, #31, #1
eor.w r12, r2, r12, lsl#1
str.w r12, [r0, #372]
ubfx.w r12, r3, #10, #11
str.w r12, [r0, #376]
ubfx.w r12, r3, #21, #11
str.w r12, [r0, #380]
ldr.w r2, [r1, #132]
ubfx.w r12, r2, #0, #11
str.w r12, [r0, #384]
ubfx.w r12, r2, #11, #11
str.w r12, [r0, #388]
ldr.w r3, [r1, #136]
ubfx.w r12, r3, #0, #1
ubfx.w r2, r2, #22, #10
eor.w r12, r2, r12, lsl#10
str.w r12, [r0, #392]
ubfx.w r12, r3, #1, #11
str.w r12, [r0, #396]
ubfx.w r12, r3, #12, #11
str.w r12, [r0, #400]
ldr.w r2, [r1, #140]
ubfx.w r12, r2, #0, #2
ubfx.w r3, r3, #23, #9
eor.w r12, r3, r12, lsl#9
str.w r12, [r0, #404]
ubfx.w r12, r2, #2, #11
str.w r12, [r0, #408]
ubfx.w r12, r2, #13, #11
str.w r12, [r0, #412]
ldr.w r3, [r1, #144]
ubfx.w r12, r3, #0, #3
ubfx.w r2, r2, #24, #8
eor.w r12, r2, r12, lsl#8
str.w r12, [r0, #416]
ubfx.w r12, r3, #3, #11
str.w r12, [r0, #420]
ubfx.w r12, r3, #14, #11
str.w r12, [r0, #424]
ldr.w r2, [r1, #148]
ubfx.w r12, r2, #0, #4
ubfx.w r3, r3, #25, #7
eor.w r12, r3, r12, lsl#7
str.w r12, [r0, #428]
ubfx.w r12, r2, #4, #11
str.w r12, [r0, #432]
ubfx.w r12, r2, #15, #11
str.w r12, [r0, #436]
ldr.w r3, [r1, #152]
ubfx.w r12, r3, #0, #5
ubfx.w r2, r2, #26, #6
eor.w r12, r2, r12, lsl#6
str.w r12, [r0, #440]
ubfx.w r12, r3, #5, #11
str.w r12, [r0, #444]
ubfx.w r12, r3, #16, #11
str.w r12, [r0, #448]
ldr.w r2, [r1, #156]
ubfx.w r12, r2, #0, #6
ubfx.w r3, r3, #27, #5
eor.w r12, r3, r12, lsl#5
str.w r12, [r0, #452]
ubfx.w r12, r2, #6, #11
str.w r12, [r0, #456]
ubfx.w r12, r2, #17, #11
str.w r12, [r0, #460]
ldr.w r3, [r1, #160]
ubfx.w r12, r3, #0, #7
ubfx.w r2, r2, #28, #4
eor.w r12, r2, r12, lsl#4
str.w r12, [r0, #464]
ubfx.w r12, r3, #7, #11
str.w r12, [r0, #468]
ubfx.w r12, r3, #18, #11
str.w r12, [r0, #472]
ldr.w r2, [r1, #164]
ubfx.w r12, r2, #0, #8
ubfx.w r3, r3, #29, #3
eor.w r12, r3, r12, lsl#3
str.w r12, [r0, #476]
ubfx.w r12, r2, #8, #11
str.w r12, [r0, #480]
ubfx.w r12, r2, #19, #11
str.w r12, [r0, #484]
ldr.w r3, [r1, #168]
ubfx.w r12, r3, #0, #9
ubfx.w r2, r2, #30, #2
eor.w r12, r2, r12, lsl#2
str.w r12, [r0, #488]
ubfx.w r12, r3, #9, #11
str.w r12, [r0, #492]
ubfx.w r12, r3, #20, #11
str.w r12, [r0, #496]
ldr.w r2, [r1, #172]
ubfx.w r12, r2, #0, #10
ubfx.w r3, r3, #31, #1
eor.w r12, r3, r12, lsl#1
str.w r12, [r0, #500]
ubfx.w r12, r2, #10, #11
str.w r12, [r0, #504]
ubfx.w r12, r2, #21, #11
str.w r12, [r0, #508]
ldr.w r3, [r1, #176]
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #512]
ubfx.w r12, r3, #11, #11
str.w r12, [r0, #516]
ldr.w r2, [r1, #180]
ubfx.w r12, r2, #0, #1
ubfx.w r3, r3, #22, #10
eor.w r12, r3, r12, lsl#10
str.w r12, [r0, #520]
ubfx.w r12, r2, #1, #11
str.w r12, [r0, #524]
ubfx.w r12, r2, #12, #11
str.w r12, [r0, #528]
ldr.w r3, [r1, #184]
ubfx.w r12, r3, #0, #2
ubfx.w r2, r2, #23, #9
eor.w r12, r2, r12, lsl#9
str.w r12, [r0, #532]
ubfx.w r12, r3, #2, #11
str.w r12, [r0, #536]
ubfx.w r12, r3, #13, #11
str.w r12, [r0, #540]
ldr.w r2, [r1, #188]
ubfx.w r12, r2, #0, #3
ubfx.w r3, r3, #24, #8
eor.w r12, r3, r12, lsl#8
str.w r12, [r0, #544]
ubfx.w r12, r2, #3, #11
str.w r12, [r0, #548]
ubfx.w r12, r2, #14, #11
str.w r12, [r0, #552]
ldr.w r3, [r1, #192]
ubfx.w r12, r3, #0, #4
ubfx.w r2, r2, #25, #7
eor.w r12, r2, r12, lsl#7
str.w r12, [r0, #556]
ubfx.w r12, r3, #4, #11
str.w r12, [r0, #560]
ubfx.w r12, r3, #15, #11
str.w r12, [r0, #564]
ldr.w r2, [r1, #196]
ubfx.w r12, r2, #0, #5
ubfx.w r3, r3, #26, #6
eor.w r12, r3, r12, lsl#6
str.w r12, [r0, #568]
ubfx.w r12, r2, #5, #11
str.w r12, [r0, #572]
ubfx.w r12, r2, #16, #11
str.w r12, [r0, #576]
ldr.w r3, [r1, #200]
ubfx.w r12, r3, #0, #6
ubfx.w r2, r2, #27, #5
eor.w r12, r2, r12, lsl#5
str.w r12, [r0, #580]
ubfx.w r12, r3, #6, #11
str.w r12, [r0, #584]
ubfx.w r12, r3, #17, #11
str.w r12, [r0, #588]
ldr.w r2, [r1, #204]
ubfx.w r12, r2, #0, #7
ubfx.w r3, r3, #28, #4
eor.w r12, r3, r12, lsl#4
str.w r12, [r0, #592]
ubfx.w r12, r2, #7, #11
str.w r12, [r0, #596]
ubfx.w r12, r2, #18, #11
str.w r12, [r0, #600]
ldr.w r3, [r1, #208]
ubfx.w r12, r3, #0, #8
ubfx.w r2, r2, #29, #3
eor.w r12, r2, r12, lsl#3
str.w r12, [r0, #604]
ubfx.w r12, r3, #8, #11
str.w r12, [r0, #608]
ubfx.w r12, r3, #19, #11
str.w r12, [r0, #612]
ldr.w r2, [r1, #212]
ubfx.w r12, r2, #0, #9
ubfx.w r3, r3, #30, #2
eor.w r12, r3, r12, lsl#2
str.w r12, [r0, #616]
ubfx.w r12, r2, #9, #11
str.w r12, [r0, #620]
ubfx.w r12, r2, #20, #11
str.w r12, [r0, #624]
ldr.w r3, [r1, #216]
ubfx.w r12, r3, #0, #10
ubfx.w r2, r2, #31, #1
eor.w r12, r2, r12, lsl#1
str.w r12, [r0, #628]
ubfx.w r12, r3, #10, #11
str.w r12, [r0, #632]
ubfx.w r12, r3, #21, #11
str.w r12, [r0, #636]
ldr.w r2, [r1, #220]
ubfx.w r12, r2, #0, #11
str.w r12, [r0, #640]
ubfx.w r12, r2, #11, #11
str.w r12, [r0, #644]
ldr.w r3, [r1, #224]
ubfx.w r12, r3, #0, #1
ubfx.w r2, r2, #22, #10
eor.w r12, r2, r12, lsl#10
str.w r12, [r0, #648]
ubfx.w r12, r3, #1, #11
str.w r12, [r0, #652]
ubfx.w r12, r3, #12, #11
str.w r12, [r0, #656]
ldr.w r2, [r1, #228]
ubfx.w r12, r2, #0, #2
ubfx.w r3, r3, #23, #9
eor.w r12, r3, r12, lsl#9
str.w r12, [r0, #660]
ubfx.w r12, r2, #2, #11
str.w r12, [r0, #664]
ubfx.w r12, r2, #13, #11
str.w r12, [r0, #668]
ldr.w r3, [r1, #232]
ubfx.w r12, r3, #0, #3
ubfx.w r2, r2, #24, #8
eor.w r12, r2, r12, lsl#8
str.w r12, [r0, #672]
ubfx.w r12, r3, #3, #11
str.w r12, [r0, #676]
ubfx.w r12, r3, #14, #11
str.w r12, [r0, #680]
ldr.w r2, [r1, #236]
ubfx.w r12, r2, #0, #4
ubfx.w r3, r3, #25, #7
eor.w r12, r3, r12, lsl#7
str.w r12, [r0, #684]
ubfx.w r12, r2, #4, #11
str.w r12, [r0, #688]
ubfx.w r12, r2, #15, #11
str.w r12, [r0, #692]
ldr.w r3, [r1, #240]
ubfx.w r12, r3, #0, #5
ubfx.w r2, r2, #26, #6
eor.w r12, r2, r12, lsl#6
str.w r12, [r0, #696]
ubfx.w r12, r3, #5, #11
str.w r12, [r0, #700]
ubfx.w r12, r3, #16, #11
str.w r12, [r0, #704]
ldr.w r2, [r1, #244]
ubfx.w r12, r2, #0, #6
ubfx.w r3, r3, #27, #5
eor.w r12, r3, r12, lsl#5
str.w r12, [r0, #708]
ubfx.w r12, r2, #6, #11
str.w r12, [r0, #712]
ubfx.w r12, r2, #17, #11
str.w r12, [r0, #716]
ldr.w r3, [r1, #248]
ubfx.w r12, r3, #0, #7
ubfx.w r2, r2, #28, #4
eor.w r12, r2, r12, lsl#4
str.w r12, [r0, #720]
ubfx.w r12, r3, #7, #11
str.w r12, [r0, #724]
ubfx.w r12, r3, #18, #11
str.w r12, [r0, #728]
ldr.w r2, [r1, #252]
ubfx.w r12, r2, #0, #8
ubfx.w r3, r3, #29, #3
eor.w r12, r3, r12, lsl#3
str.w r12, [r0, #732]
ubfx.w r12, r2, #8, #11
str.w r12, [r0, #736]
ubfx.w r12, r2, #19, #11
str.w r12, [r0, #740]
ubfx.w r12, r2, #30, #2
str.w r12, [r0, #744]
mov.w r12, #0
str.w r12, [r0, #748]
str.w r12, [r0, #752]
str.w r12, [r0, #756]
str.w r12, [r0, #760]
str.w r12, [r0, #764]
bx lr
