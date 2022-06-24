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
ldr.w r3, [r1, #256]
ubfx.w r12, r3, #0, #9
ubfx.w r2, r2, #30, #2
eor.w r12, r2, r12, lsl#2
str.w r12, [r0, #744]
ubfx.w r12, r3, #9, #11
str.w r12, [r0, #748]
ubfx.w r12, r3, #20, #11
str.w r12, [r0, #752]
ldr.w r2, [r1, #260]
ubfx.w r12, r2, #0, #10
ubfx.w r3, r3, #31, #1
eor.w r12, r3, r12, lsl#1
str.w r12, [r0, #756]
ubfx.w r12, r2, #10, #11
str.w r12, [r0, #760]
ubfx.w r12, r2, #21, #11
str.w r12, [r0, #764]
ldr.w r3, [r1, #264]
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #768]
ubfx.w r12, r3, #11, #11
str.w r12, [r0, #772]
ldr.w r2, [r1, #268]
ubfx.w r12, r2, #0, #1
ubfx.w r3, r3, #22, #10
eor.w r12, r3, r12, lsl#10
str.w r12, [r0, #776]
ubfx.w r12, r2, #1, #11
str.w r12, [r0, #780]
ubfx.w r12, r2, #12, #11
str.w r12, [r0, #784]
ldr.w r3, [r1, #272]
ubfx.w r12, r3, #0, #2
ubfx.w r2, r2, #23, #9
eor.w r12, r2, r12, lsl#9
str.w r12, [r0, #788]
ubfx.w r12, r3, #2, #11
str.w r12, [r0, #792]
ubfx.w r12, r3, #13, #11
str.w r12, [r0, #796]
ldr.w r2, [r1, #276]
ubfx.w r12, r2, #0, #3
ubfx.w r3, r3, #24, #8
eor.w r12, r3, r12, lsl#8
str.w r12, [r0, #800]
ubfx.w r12, r2, #3, #11
str.w r12, [r0, #804]
ubfx.w r12, r2, #14, #11
str.w r12, [r0, #808]
ldr.w r3, [r1, #280]
ubfx.w r12, r3, #0, #4
ubfx.w r2, r2, #25, #7
eor.w r12, r2, r12, lsl#7
str.w r12, [r0, #812]
ubfx.w r12, r3, #4, #11
str.w r12, [r0, #816]
ubfx.w r12, r3, #15, #11
str.w r12, [r0, #820]
ldr.w r2, [r1, #284]
ubfx.w r12, r2, #0, #5
ubfx.w r3, r3, #26, #6
eor.w r12, r3, r12, lsl#6
str.w r12, [r0, #824]
ubfx.w r12, r2, #5, #11
str.w r12, [r0, #828]
ubfx.w r12, r2, #16, #11
str.w r12, [r0, #832]
ldr.w r3, [r1, #288]
ubfx.w r12, r3, #0, #6
ubfx.w r2, r2, #27, #5
eor.w r12, r2, r12, lsl#5
str.w r12, [r0, #836]
ubfx.w r12, r3, #6, #11
str.w r12, [r0, #840]
ubfx.w r12, r3, #17, #11
str.w r12, [r0, #844]
ldr.w r2, [r1, #292]
ubfx.w r12, r2, #0, #7
ubfx.w r3, r3, #28, #4
eor.w r12, r3, r12, lsl#4
str.w r12, [r0, #848]
ubfx.w r12, r2, #7, #11
str.w r12, [r0, #852]
ubfx.w r12, r2, #18, #11
str.w r12, [r0, #856]
ldr.w r3, [r1, #296]
ubfx.w r12, r3, #0, #8
ubfx.w r2, r2, #29, #3
eor.w r12, r2, r12, lsl#3
str.w r12, [r0, #860]
ubfx.w r12, r3, #8, #11
str.w r12, [r0, #864]
ubfx.w r12, r3, #19, #11
str.w r12, [r0, #868]
ldr.w r2, [r1, #300]
ubfx.w r12, r2, #0, #9
ubfx.w r3, r3, #30, #2
eor.w r12, r3, r12, lsl#2
str.w r12, [r0, #872]
ubfx.w r12, r2, #9, #11
str.w r12, [r0, #876]
ubfx.w r12, r2, #20, #11
str.w r12, [r0, #880]
ldr.w r3, [r1, #304]
ubfx.w r12, r3, #0, #10
ubfx.w r2, r2, #31, #1
eor.w r12, r2, r12, lsl#1
str.w r12, [r0, #884]
ubfx.w r12, r3, #10, #11
str.w r12, [r0, #888]
ubfx.w r12, r3, #21, #11
str.w r12, [r0, #892]
ldr.w r2, [r1, #308]
ubfx.w r12, r2, #0, #11
str.w r12, [r0, #896]
ubfx.w r12, r2, #11, #11
str.w r12, [r0, #900]
ldr.w r3, [r1, #312]
ubfx.w r12, r3, #0, #1
ubfx.w r2, r2, #22, #10
eor.w r12, r2, r12, lsl#10
str.w r12, [r0, #904]
ubfx.w r12, r3, #1, #11
str.w r12, [r0, #908]
ubfx.w r12, r3, #12, #11
str.w r12, [r0, #912]
ldr.w r2, [r1, #316]
ubfx.w r12, r2, #0, #2
ubfx.w r3, r3, #23, #9
eor.w r12, r3, r12, lsl#9
str.w r12, [r0, #916]
ubfx.w r12, r2, #2, #11
str.w r12, [r0, #920]
ubfx.w r12, r2, #13, #11
str.w r12, [r0, #924]
ldr.w r3, [r1, #320]
ubfx.w r12, r3, #0, #3
ubfx.w r2, r2, #24, #8
eor.w r12, r2, r12, lsl#8
str.w r12, [r0, #928]
ubfx.w r12, r3, #3, #11
str.w r12, [r0, #932]
ubfx.w r12, r3, #14, #11
str.w r12, [r0, #936]
ldr.w r2, [r1, #324]
ubfx.w r12, r2, #0, #4
ubfx.w r3, r3, #25, #7
eor.w r12, r3, r12, lsl#7
str.w r12, [r0, #940]
ubfx.w r12, r2, #4, #11
str.w r12, [r0, #944]
ubfx.w r12, r2, #15, #11
str.w r12, [r0, #948]
ldr.w r3, [r1, #328]
ubfx.w r12, r3, #0, #5
ubfx.w r2, r2, #26, #6
eor.w r12, r2, r12, lsl#6
str.w r12, [r0, #952]
ubfx.w r12, r3, #5, #11
str.w r12, [r0, #956]
ubfx.w r12, r3, #16, #11
str.w r12, [r0, #960]
ldr.w r2, [r1, #332]
ubfx.w r12, r2, #0, #6
ubfx.w r3, r3, #27, #5
eor.w r12, r3, r12, lsl#5
str.w r12, [r0, #964]
ubfx.w r12, r2, #6, #11
str.w r12, [r0, #968]
ubfx.w r12, r2, #17, #11
str.w r12, [r0, #972]
ldr.w r3, [r1, #336]
ubfx.w r12, r3, #0, #7
ubfx.w r2, r2, #28, #4
eor.w r12, r2, r12, lsl#4
str.w r12, [r0, #976]
ubfx.w r12, r3, #7, #11
str.w r12, [r0, #980]
ubfx.w r12, r3, #18, #11
str.w r12, [r0, #984]
ldr.w r2, [r1, #340]
ubfx.w r12, r2, #0, #8
ubfx.w r3, r3, #29, #3
eor.w r12, r3, r12, lsl#3
str.w r12, [r0, #988]
ubfx.w r12, r2, #8, #11
str.w r12, [r0, #992]
ubfx.w r12, r2, #19, #11
str.w r12, [r0, #996]
ldr.w r3, [r1, #344]
ubfx.w r12, r3, #0, #9
ubfx.w r2, r2, #30, #2
eor.w r12, r2, r12, lsl#2
str.w r12, [r0, #1000]
ubfx.w r12, r3, #9, #11
str.w r12, [r0, #1004]
ubfx.w r12, r3, #20, #11
str.w r12, [r0, #1008]
ldr.w r2, [r1, #348]
ubfx.w r12, r2, #0, #10
ubfx.w r3, r3, #31, #1
eor.w r12, r3, r12, lsl#1
str.w r12, [r0, #1012]
ubfx.w r12, r2, #10, #11
str.w r12, [r0, #1016]
ubfx.w r12, r2, #21, #11
str.w r12, [r0, #1020]
ldr.w r3, [r1, #352]
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1024]
ubfx.w r12, r3, #11, #11
str.w r12, [r0, #1028]
ldr.w r2, [r1, #356]
ubfx.w r12, r2, #0, #1
ubfx.w r3, r3, #22, #10
eor.w r12, r3, r12, lsl#10
str.w r12, [r0, #1032]
ubfx.w r12, r2, #1, #11
str.w r12, [r0, #1036]
ubfx.w r12, r2, #12, #11
str.w r12, [r0, #1040]
ldr.w r3, [r1, #360]
ubfx.w r12, r3, #0, #2
ubfx.w r2, r2, #23, #9
eor.w r12, r2, r12, lsl#9
str.w r12, [r0, #1044]
ubfx.w r12, r3, #2, #11
str.w r12, [r0, #1048]
ubfx.w r12, r3, #13, #11
str.w r12, [r0, #1052]
ldr.w r2, [r1, #364]
ubfx.w r12, r2, #0, #3
ubfx.w r3, r3, #24, #8
eor.w r12, r3, r12, lsl#8
str.w r12, [r0, #1056]
ubfx.w r12, r2, #3, #11
str.w r12, [r0, #1060]
ubfx.w r12, r2, #14, #11
str.w r12, [r0, #1064]
ldr.w r3, [r1, #368]
ubfx.w r12, r3, #0, #4
ubfx.w r2, r2, #25, #7
eor.w r12, r2, r12, lsl#7
str.w r12, [r0, #1068]
ubfx.w r12, r3, #4, #11
str.w r12, [r0, #1072]
ubfx.w r12, r3, #15, #11
str.w r12, [r0, #1076]
ldr.w r2, [r1, #372]
ubfx.w r12, r2, #0, #5
ubfx.w r3, r3, #26, #6
eor.w r12, r3, r12, lsl#6
str.w r12, [r0, #1080]
ubfx.w r12, r2, #5, #11
str.w r12, [r0, #1084]
ubfx.w r12, r2, #16, #11
str.w r12, [r0, #1088]
ldr.w r3, [r1, #376]
ubfx.w r12, r3, #0, #6
ubfx.w r2, r2, #27, #5
eor.w r12, r2, r12, lsl#5
str.w r12, [r0, #1092]
ubfx.w r12, r3, #6, #11
str.w r12, [r0, #1096]
ubfx.w r12, r3, #17, #11
str.w r12, [r0, #1100]
ldr.w r2, [r1, #380]
ubfx.w r12, r2, #0, #7
ubfx.w r3, r3, #28, #4
eor.w r12, r3, r12, lsl#4
str.w r12, [r0, #1104]
ubfx.w r12, r2, #7, #11
str.w r12, [r0, #1108]
ubfx.w r12, r2, #18, #11
str.w r12, [r0, #1112]
ldr.w r3, [r1, #384]
ubfx.w r12, r3, #0, #8
ubfx.w r2, r2, #29, #3
eor.w r12, r2, r12, lsl#3
str.w r12, [r0, #1116]
ubfx.w r12, r3, #8, #11
str.w r12, [r0, #1120]
ubfx.w r12, r3, #19, #11
str.w r12, [r0, #1124]
ldr.w r2, [r1, #388]
ubfx.w r12, r2, #0, #9
ubfx.w r3, r3, #30, #2
eor.w r12, r3, r12, lsl#2
str.w r12, [r0, #1128]
ubfx.w r12, r2, #9, #11
str.w r12, [r0, #1132]
ubfx.w r12, r2, #20, #11
str.w r12, [r0, #1136]
ldr.w r3, [r1, #392]
ubfx.w r12, r3, #0, #10
ubfx.w r2, r2, #31, #1
eor.w r12, r2, r12, lsl#1
str.w r12, [r0, #1140]
ubfx.w r12, r3, #10, #11
str.w r12, [r0, #1144]
ubfx.w r12, r3, #21, #11
str.w r12, [r0, #1148]
ldr.w r2, [r1, #396]
ubfx.w r12, r2, #0, #11
str.w r12, [r0, #1152]
ubfx.w r12, r2, #11, #11
str.w r12, [r0, #1156]
ldr.w r3, [r1, #400]
ubfx.w r12, r3, #0, #1
ubfx.w r2, r2, #22, #10
eor.w r12, r2, r12, lsl#10
str.w r12, [r0, #1160]
ubfx.w r12, r3, #1, #11
str.w r12, [r0, #1164]
ubfx.w r12, r3, #12, #11
str.w r12, [r0, #1168]
ldr.w r2, [r1, #404]
ubfx.w r12, r2, #0, #2
ubfx.w r3, r3, #23, #9
eor.w r12, r3, r12, lsl#9
str.w r12, [r0, #1172]
ubfx.w r12, r2, #2, #11
str.w r12, [r0, #1176]
ubfx.w r12, r2, #13, #11
str.w r12, [r0, #1180]
ldr.w r3, [r1, #408]
ubfx.w r12, r3, #0, #3
ubfx.w r2, r2, #24, #8
eor.w r12, r2, r12, lsl#8
str.w r12, [r0, #1184]
ubfx.w r12, r3, #3, #11
str.w r12, [r0, #1188]
ubfx.w r12, r3, #14, #11
str.w r12, [r0, #1192]
ldr.w r2, [r1, #412]
ubfx.w r12, r2, #0, #4
ubfx.w r3, r3, #25, #7
eor.w r12, r3, r12, lsl#7
str.w r12, [r0, #1196]
ubfx.w r12, r2, #4, #11
str.w r12, [r0, #1200]
ubfx.w r12, r2, #15, #11
str.w r12, [r0, #1204]
ldr.w r3, [r1, #416]
ubfx.w r12, r3, #0, #5
ubfx.w r2, r2, #26, #6
eor.w r12, r2, r12, lsl#6
str.w r12, [r0, #1208]
ubfx.w r12, r3, #5, #11
str.w r12, [r0, #1212]
ubfx.w r12, r3, #16, #11
str.w r12, [r0, #1216]
ldr.w r2, [r1, #420]
ubfx.w r12, r2, #0, #6
ubfx.w r3, r3, #27, #5
eor.w r12, r3, r12, lsl#5
str.w r12, [r0, #1220]
ubfx.w r12, r2, #6, #11
str.w r12, [r0, #1224]
ubfx.w r12, r2, #17, #11
str.w r12, [r0, #1228]
ldr.w r3, [r1, #424]
ubfx.w r12, r3, #0, #7
ubfx.w r2, r2, #28, #4
eor.w r12, r2, r12, lsl#4
str.w r12, [r0, #1232]
ubfx.w r12, r3, #7, #11
str.w r12, [r0, #1236]
ubfx.w r12, r3, #18, #11
str.w r12, [r0, #1240]
ldr.w r2, [r1, #428]
ubfx.w r12, r2, #0, #8
ubfx.w r3, r3, #29, #3
eor.w r12, r3, r12, lsl#3
str.w r12, [r0, #1244]
ubfx.w r12, r2, #8, #11
str.w r12, [r0, #1248]
ubfx.w r12, r2, #19, #11
str.w r12, [r0, #1252]
ldr.w r3, [r1, #432]
ubfx.w r12, r3, #0, #9
ubfx.w r2, r2, #30, #2
eor.w r12, r2, r12, lsl#2
str.w r12, [r0, #1256]
ubfx.w r12, r3, #9, #11
str.w r12, [r0, #1260]
ubfx.w r12, r3, #20, #11
str.w r12, [r0, #1264]
ldr.w r2, [r1, #436]
ubfx.w r12, r2, #0, #10
ubfx.w r3, r3, #31, #1
eor.w r12, r3, r12, lsl#1
str.w r12, [r0, #1268]
ubfx.w r12, r2, #10, #11
str.w r12, [r0, #1272]
ubfx.w r12, r2, #21, #11
str.w r12, [r0, #1276]
ldr.w r3, [r1, #440]
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1280]
ubfx.w r12, r3, #11, #11
str.w r12, [r0, #1284]
ldr.w r2, [r1, #444]
ubfx.w r12, r2, #0, #1
ubfx.w r3, r3, #22, #10
eor.w r12, r3, r12, lsl#10
str.w r12, [r0, #1288]
ubfx.w r12, r2, #1, #11
str.w r12, [r0, #1292]
ubfx.w r12, r2, #12, #11
str.w r12, [r0, #1296]
ldr.w r3, [r1, #448]
ubfx.w r12, r3, #0, #2
ubfx.w r2, r2, #23, #9
eor.w r12, r2, r12, lsl#9
str.w r12, [r0, #1300]
ubfx.w r12, r3, #2, #11
str.w r12, [r0, #1304]
ubfx.w r12, r3, #13, #11
str.w r12, [r0, #1308]
ldr.w r2, [r1, #452]
ubfx.w r12, r2, #0, #3
ubfx.w r3, r3, #24, #8
eor.w r12, r3, r12, lsl#8
str.w r12, [r0, #1312]
ubfx.w r12, r2, #3, #11
str.w r12, [r0, #1316]
ubfx.w r12, r2, #14, #11
str.w r12, [r0, #1320]
ldr.w r3, [r1, #456]
ubfx.w r12, r3, #0, #4
ubfx.w r2, r2, #25, #7
eor.w r12, r2, r12, lsl#7
str.w r12, [r0, #1324]
ubfx.w r12, r3, #4, #11
str.w r12, [r0, #1328]
ubfx.w r12, r3, #15, #11
str.w r12, [r0, #1332]
ldr.w r2, [r1, #460]
ubfx.w r12, r2, #0, #5
ubfx.w r3, r3, #26, #6
eor.w r12, r3, r12, lsl#6
str.w r12, [r0, #1336]
ubfx.w r12, r2, #5, #11
str.w r12, [r0, #1340]
ubfx.w r12, r2, #16, #11
str.w r12, [r0, #1344]
ldr.w r3, [r1, #464]
ubfx.w r12, r3, #0, #6
ubfx.w r2, r2, #27, #5
eor.w r12, r2, r12, lsl#5
str.w r12, [r0, #1348]
ubfx.w r12, r3, #6, #11
str.w r12, [r0, #1352]
ubfx.w r12, r3, #17, #11
str.w r12, [r0, #1356]
ldr.w r2, [r1, #468]
ubfx.w r12, r2, #0, #7
ubfx.w r3, r3, #28, #4
eor.w r12, r3, r12, lsl#4
str.w r12, [r0, #1360]
ubfx.w r12, r2, #7, #11
str.w r12, [r0, #1364]
ubfx.w r12, r2, #18, #11
str.w r12, [r0, #1368]
ldr.w r3, [r1, #472]
ubfx.w r12, r3, #0, #8
ubfx.w r2, r2, #29, #3
eor.w r12, r2, r12, lsl#3
str.w r12, [r0, #1372]
ubfx.w r12, r3, #8, #11
str.w r12, [r0, #1376]
ubfx.w r12, r3, #19, #11
str.w r12, [r0, #1380]
ldr.w r2, [r1, #476]
ubfx.w r12, r2, #0, #9
ubfx.w r3, r3, #30, #2
eor.w r12, r3, r12, lsl#2
str.w r12, [r0, #1384]
ubfx.w r12, r2, #9, #11
str.w r12, [r0, #1388]
ubfx.w r12, r2, #20, #11
str.w r12, [r0, #1392]
ldr.w r3, [r1, #480]
ubfx.w r12, r3, #0, #10
ubfx.w r2, r2, #31, #1
eor.w r12, r2, r12, lsl#1
str.w r12, [r0, #1396]
ubfx.w r12, r3, #10, #11
str.w r12, [r0, #1400]
ubfx.w r12, r3, #21, #11
str.w r12, [r0, #1404]
ldr.w r2, [r1, #484]
ubfx.w r12, r2, #0, #11
str.w r12, [r0, #1408]
ubfx.w r12, r2, #11, #11
str.w r12, [r0, #1412]
ldr.w r3, [r1, #488]
ubfx.w r12, r3, #0, #1
ubfx.w r2, r2, #22, #10
eor.w r12, r2, r12, lsl#10
str.w r12, [r0, #1416]
ubfx.w r12, r3, #1, #11
str.w r12, [r0, #1420]
ubfx.w r12, r3, #12, #11
str.w r12, [r0, #1424]
ldr.w r2, [r1, #492]
ubfx.w r12, r2, #0, #2
ubfx.w r3, r3, #23, #9
eor.w r12, r3, r12, lsl#9
str.w r12, [r0, #1428]
ubfx.w r12, r2, #2, #11
str.w r12, [r0, #1432]
ubfx.w r12, r2, #13, #11
str.w r12, [r0, #1436]
ldr.w r3, [r1, #496]
ubfx.w r12, r3, #0, #3
ubfx.w r2, r2, #24, #8
eor.w r12, r2, r12, lsl#8
str.w r12, [r0, #1440]
ubfx.w r12, r3, #3, #11
str.w r12, [r0, #1444]
ubfx.w r12, r3, #14, #11
str.w r12, [r0, #1448]
ldr.w r2, [r1, #500]
ubfx.w r12, r2, #0, #4
ubfx.w r3, r3, #25, #7
eor.w r12, r3, r12, lsl#7
str.w r12, [r0, #1452]
ubfx.w r12, r2, #4, #11
str.w r12, [r0, #1456]
ubfx.w r12, r2, #15, #11
str.w r12, [r0, #1460]
ldr.w r3, [r1, #504]
ubfx.w r12, r3, #0, #5
ubfx.w r2, r2, #26, #6
eor.w r12, r2, r12, lsl#6
str.w r12, [r0, #1464]
ubfx.w r12, r3, #5, #11
str.w r12, [r0, #1468]
ubfx.w r12, r3, #16, #11
str.w r12, [r0, #1472]
ldr.w r2, [r1, #508]
ubfx.w r12, r2, #0, #6
ubfx.w r3, r3, #27, #5
eor.w r12, r3, r12, lsl#5
str.w r12, [r0, #1476]
ubfx.w r12, r2, #6, #11
str.w r12, [r0, #1480]
ubfx.w r12, r2, #17, #11
str.w r12, [r0, #1484]
ubfx.w r12, r2, #28, #4
str.w r12, [r0, #1488]
mov.w r12, #0
str.w r12, [r0, #1492]
str.w r12, [r0, #1496]
str.w r12, [r0, #1500]
str.w r12, [r0, #1504]
str.w r12, [r0, #1508]
str.w r12, [r0, #1512]
str.w r12, [r0, #1516]
str.w r12, [r0, #1520]
str.w r12, [r0, #1524]
str.w r12, [r0, #1528]
str.w r12, [r0, #1532]
bx lr
