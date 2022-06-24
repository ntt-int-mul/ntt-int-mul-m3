.syntax unified
.cpu cortex-m3
.section .text

.align 2
.global lower
.type lower, %function
lower:
mov.w r3, #0
ldr.w r12, [r1, #0]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #0]
ldr.w r12, [r1, #4]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #4]
ldr.w r12, [r1, #8]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #8]
ldr.w r12, [r1, #12]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #12]
ldr.w r12, [r1, #16]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #16]
ldr.w r12, [r1, #20]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #20]
ldr.w r12, [r1, #24]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #24]
ldr.w r12, [r1, #28]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #28]
ldr.w r12, [r1, #32]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #32]
ldr.w r12, [r1, #36]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #36]
ldr.w r12, [r1, #40]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #40]
ldr.w r12, [r1, #44]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #44]
ldr.w r12, [r1, #48]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #48]
ldr.w r12, [r1, #52]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #52]
ldr.w r12, [r1, #56]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #56]
ldr.w r12, [r1, #60]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #60]
ldr.w r12, [r1, #64]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #64]
ldr.w r12, [r1, #68]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #68]
ldr.w r12, [r1, #72]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #72]
ldr.w r12, [r1, #76]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #76]
ldr.w r12, [r1, #80]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #80]
ldr.w r12, [r1, #84]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #84]
ldr.w r12, [r1, #88]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #88]
ldr.w r12, [r1, #92]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #92]
ldr.w r12, [r1, #96]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #96]
ldr.w r12, [r1, #100]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #100]
ldr.w r12, [r1, #104]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #104]
ldr.w r12, [r1, #108]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #108]
ldr.w r12, [r1, #112]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #112]
ldr.w r12, [r1, #116]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #116]
ldr.w r12, [r1, #120]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #120]
ldr.w r12, [r1, #124]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #124]
ldr.w r12, [r1, #128]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #128]
ldr.w r12, [r1, #132]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #132]
ldr.w r12, [r1, #136]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #136]
ldr.w r12, [r1, #140]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #140]
ldr.w r12, [r1, #144]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #144]
ldr.w r12, [r1, #148]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #148]
ldr.w r12, [r1, #152]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #152]
ldr.w r12, [r1, #156]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #156]
ldr.w r12, [r1, #160]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #160]
ldr.w r12, [r1, #164]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #164]
ldr.w r12, [r1, #168]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #168]
ldr.w r12, [r1, #172]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #172]
ldr.w r12, [r1, #176]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #176]
ldr.w r12, [r1, #180]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #180]
ldr.w r12, [r1, #184]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #184]
ldr.w r12, [r1, #188]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #188]
ldr.w r12, [r1, #192]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #192]
ldr.w r12, [r1, #196]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #196]
ldr.w r12, [r1, #200]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #200]
ldr.w r12, [r1, #204]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #204]
ldr.w r12, [r1, #208]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #208]
ldr.w r12, [r1, #212]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #212]
ldr.w r12, [r1, #216]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #216]
ldr.w r12, [r1, #220]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #220]
ldr.w r12, [r1, #224]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #224]
ldr.w r12, [r1, #228]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #228]
ldr.w r12, [r1, #232]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #232]
ldr.w r12, [r1, #236]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #236]
ldr.w r12, [r1, #240]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #240]
ldr.w r12, [r1, #244]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #244]
ldr.w r12, [r1, #248]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #248]
ldr.w r12, [r1, #252]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #252]
ldr.w r12, [r1, #256]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #256]
ldr.w r12, [r1, #260]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #260]
ldr.w r12, [r1, #264]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #264]
ldr.w r12, [r1, #268]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #268]
ldr.w r12, [r1, #272]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #272]
ldr.w r12, [r1, #276]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #276]
ldr.w r12, [r1, #280]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #280]
ldr.w r12, [r1, #284]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #284]
ldr.w r12, [r1, #288]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #288]
ldr.w r12, [r1, #292]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #292]
ldr.w r12, [r1, #296]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #296]
ldr.w r12, [r1, #300]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #300]
ldr.w r12, [r1, #304]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #304]
ldr.w r12, [r1, #308]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #308]
ldr.w r12, [r1, #312]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #312]
ldr.w r12, [r1, #316]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #316]
ldr.w r12, [r1, #320]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #320]
ldr.w r12, [r1, #324]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #324]
ldr.w r12, [r1, #328]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #328]
ldr.w r12, [r1, #332]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #332]
ldr.w r12, [r1, #336]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #336]
ldr.w r12, [r1, #340]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #340]
ldr.w r12, [r1, #344]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #344]
ldr.w r12, [r1, #348]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #348]
ldr.w r12, [r1, #352]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #352]
ldr.w r12, [r1, #356]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #356]
ldr.w r12, [r1, #360]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #360]
ldr.w r12, [r1, #364]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #364]
ldr.w r12, [r1, #368]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #368]
ldr.w r12, [r1, #372]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #372]
ldr.w r12, [r1, #376]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #376]
ldr.w r12, [r1, #380]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #380]
ldr.w r12, [r1, #384]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #384]
ldr.w r12, [r1, #388]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #388]
ldr.w r12, [r1, #392]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #392]
ldr.w r12, [r1, #396]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #396]
ldr.w r12, [r1, #400]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #400]
ldr.w r12, [r1, #404]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #404]
ldr.w r12, [r1, #408]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #408]
ldr.w r12, [r1, #412]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #412]
ldr.w r12, [r1, #416]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #416]
ldr.w r12, [r1, #420]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #420]
ldr.w r12, [r1, #424]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #424]
ldr.w r12, [r1, #428]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #428]
ldr.w r12, [r1, #432]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #432]
ldr.w r12, [r1, #436]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #436]
ldr.w r12, [r1, #440]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #440]
ldr.w r12, [r1, #444]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #444]
ldr.w r12, [r1, #448]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #448]
ldr.w r12, [r1, #452]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #452]
ldr.w r12, [r1, #456]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #456]
ldr.w r12, [r1, #460]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #460]
ldr.w r12, [r1, #464]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #464]
ldr.w r12, [r1, #468]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #468]
ldr.w r12, [r1, #472]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #472]
ldr.w r12, [r1, #476]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #476]
ldr.w r12, [r1, #480]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #480]
ldr.w r12, [r1, #484]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #484]
ldr.w r12, [r1, #488]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #488]
ldr.w r12, [r1, #492]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #492]
ldr.w r12, [r1, #496]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #496]
ldr.w r12, [r1, #500]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #500]
ldr.w r12, [r1, #504]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #504]
ldr.w r12, [r1, #508]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #508]
ldr.w r12, [r1, #512]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #512]
ldr.w r12, [r1, #516]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #516]
ldr.w r12, [r1, #520]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #520]
ldr.w r12, [r1, #524]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #524]
ldr.w r12, [r1, #528]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #528]
ldr.w r12, [r1, #532]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #532]
ldr.w r12, [r1, #536]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #536]
ldr.w r12, [r1, #540]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #540]
ldr.w r12, [r1, #544]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #544]
ldr.w r12, [r1, #548]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #548]
ldr.w r12, [r1, #552]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #552]
ldr.w r12, [r1, #556]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #556]
ldr.w r12, [r1, #560]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #560]
ldr.w r12, [r1, #564]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #564]
ldr.w r12, [r1, #568]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #568]
ldr.w r12, [r1, #572]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #572]
ldr.w r12, [r1, #576]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #576]
ldr.w r12, [r1, #580]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #580]
ldr.w r12, [r1, #584]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #584]
ldr.w r12, [r1, #588]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #588]
ldr.w r12, [r1, #592]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #592]
ldr.w r12, [r1, #596]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #596]
ldr.w r12, [r1, #600]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #600]
ldr.w r12, [r1, #604]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #604]
ldr.w r12, [r1, #608]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #608]
ldr.w r12, [r1, #612]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #612]
ldr.w r12, [r1, #616]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #616]
ldr.w r12, [r1, #620]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #620]
ldr.w r12, [r1, #624]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #624]
ldr.w r12, [r1, #628]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #628]
ldr.w r12, [r1, #632]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #632]
ldr.w r12, [r1, #636]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #636]
ldr.w r12, [r1, #640]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #640]
ldr.w r12, [r1, #644]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #644]
ldr.w r12, [r1, #648]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #648]
ldr.w r12, [r1, #652]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #652]
ldr.w r12, [r1, #656]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #656]
ldr.w r12, [r1, #660]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #660]
ldr.w r12, [r1, #664]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #664]
ldr.w r12, [r1, #668]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #668]
ldr.w r12, [r1, #672]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #672]
ldr.w r12, [r1, #676]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #676]
ldr.w r12, [r1, #680]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #680]
ldr.w r12, [r1, #684]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #684]
ldr.w r12, [r1, #688]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #688]
ldr.w r12, [r1, #692]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #692]
ldr.w r12, [r1, #696]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #696]
ldr.w r12, [r1, #700]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #700]
ldr.w r12, [r1, #704]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #704]
ldr.w r12, [r1, #708]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #708]
ldr.w r12, [r1, #712]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #712]
ldr.w r12, [r1, #716]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #716]
ldr.w r12, [r1, #720]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #720]
ldr.w r12, [r1, #724]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #724]
ldr.w r12, [r1, #728]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #728]
ldr.w r12, [r1, #732]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #732]
ldr.w r12, [r1, #736]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #736]
ldr.w r12, [r1, #740]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #740]
ldr.w r12, [r1, #744]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #744]
ldr.w r12, [r1, #748]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #748]
ldr.w r12, [r1, #752]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #752]
ldr.w r12, [r1, #756]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #756]
ldr.w r12, [r1, #760]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #760]
ldr.w r12, [r1, #764]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #764]
ldr.w r12, [r1, #768]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #768]
ldr.w r12, [r1, #772]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #772]
ldr.w r12, [r1, #776]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #776]
ldr.w r12, [r1, #780]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #780]
ldr.w r12, [r1, #784]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #784]
ldr.w r12, [r1, #788]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #788]
ldr.w r12, [r1, #792]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #792]
ldr.w r12, [r1, #796]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #796]
ldr.w r12, [r1, #800]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #800]
ldr.w r12, [r1, #804]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #804]
ldr.w r12, [r1, #808]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #808]
ldr.w r12, [r1, #812]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #812]
ldr.w r12, [r1, #816]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #816]
ldr.w r12, [r1, #820]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #820]
ldr.w r12, [r1, #824]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #824]
ldr.w r12, [r1, #828]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #828]
ldr.w r12, [r1, #832]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #832]
ldr.w r12, [r1, #836]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #836]
ldr.w r12, [r1, #840]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #840]
ldr.w r12, [r1, #844]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #844]
ldr.w r12, [r1, #848]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #848]
ldr.w r12, [r1, #852]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #852]
ldr.w r12, [r1, #856]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #856]
ldr.w r12, [r1, #860]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #860]
ldr.w r12, [r1, #864]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #864]
ldr.w r12, [r1, #868]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #868]
ldr.w r12, [r1, #872]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #872]
ldr.w r12, [r1, #876]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #876]
ldr.w r12, [r1, #880]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #880]
ldr.w r12, [r1, #884]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #884]
ldr.w r12, [r1, #888]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #888]
ldr.w r12, [r1, #892]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #892]
ldr.w r12, [r1, #896]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #896]
ldr.w r12, [r1, #900]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #900]
ldr.w r12, [r1, #904]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #904]
ldr.w r12, [r1, #908]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #908]
ldr.w r12, [r1, #912]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #912]
ldr.w r12, [r1, #916]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #916]
ldr.w r12, [r1, #920]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #920]
ldr.w r12, [r1, #924]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #924]
ldr.w r12, [r1, #928]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #928]
ldr.w r12, [r1, #932]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #932]
ldr.w r12, [r1, #936]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #936]
ldr.w r12, [r1, #940]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #940]
ldr.w r12, [r1, #944]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #944]
ldr.w r12, [r1, #948]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #948]
ldr.w r12, [r1, #952]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #952]
ldr.w r12, [r1, #956]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #956]
ldr.w r12, [r1, #960]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #960]
ldr.w r12, [r1, #964]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #964]
ldr.w r12, [r1, #968]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #968]
ldr.w r12, [r1, #972]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #972]
ldr.w r12, [r1, #976]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #976]
ldr.w r12, [r1, #980]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #980]
ldr.w r12, [r1, #984]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #984]
ldr.w r12, [r1, #988]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #988]
ldr.w r12, [r1, #992]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #992]
ldr.w r12, [r1, #996]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #996]
ldr.w r12, [r1, #1000]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1000]
ldr.w r12, [r1, #1004]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1004]
ldr.w r12, [r1, #1008]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1008]
ldr.w r12, [r1, #1012]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1012]
ldr.w r12, [r1, #1016]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1016]
ldr.w r12, [r1, #1020]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1020]
ldr.w r12, [r1, #1024]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1024]
ldr.w r12, [r1, #1028]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1028]
ldr.w r12, [r1, #1032]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1032]
ldr.w r12, [r1, #1036]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1036]
ldr.w r12, [r1, #1040]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1040]
ldr.w r12, [r1, #1044]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1044]
ldr.w r12, [r1, #1048]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1048]
ldr.w r12, [r1, #1052]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1052]
ldr.w r12, [r1, #1056]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1056]
ldr.w r12, [r1, #1060]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1060]
ldr.w r12, [r1, #1064]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1064]
ldr.w r12, [r1, #1068]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1068]
ldr.w r12, [r1, #1072]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1072]
ldr.w r12, [r1, #1076]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1076]
ldr.w r12, [r1, #1080]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1080]
ldr.w r12, [r1, #1084]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1084]
ldr.w r12, [r1, #1088]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1088]
ldr.w r12, [r1, #1092]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1092]
ldr.w r12, [r1, #1096]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1096]
ldr.w r12, [r1, #1100]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1100]
ldr.w r12, [r1, #1104]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1104]
ldr.w r12, [r1, #1108]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1108]
ldr.w r12, [r1, #1112]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1112]
ldr.w r12, [r1, #1116]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1116]
ldr.w r12, [r1, #1120]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1120]
ldr.w r12, [r1, #1124]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1124]
ldr.w r12, [r1, #1128]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1128]
ldr.w r12, [r1, #1132]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1132]
ldr.w r12, [r1, #1136]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1136]
ldr.w r12, [r1, #1140]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1140]
ldr.w r12, [r1, #1144]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1144]
ldr.w r12, [r1, #1148]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1148]
ldr.w r12, [r1, #1152]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1152]
ldr.w r12, [r1, #1156]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1156]
ldr.w r12, [r1, #1160]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1160]
ldr.w r12, [r1, #1164]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1164]
ldr.w r12, [r1, #1168]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1168]
ldr.w r12, [r1, #1172]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1172]
ldr.w r12, [r1, #1176]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1176]
ldr.w r12, [r1, #1180]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1180]
ldr.w r12, [r1, #1184]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1184]
ldr.w r12, [r1, #1188]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1188]
ldr.w r12, [r1, #1192]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1192]
ldr.w r12, [r1, #1196]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1196]
ldr.w r12, [r1, #1200]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1200]
ldr.w r12, [r1, #1204]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1204]
ldr.w r12, [r1, #1208]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1208]
ldr.w r12, [r1, #1212]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1212]
ldr.w r12, [r1, #1216]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1216]
ldr.w r12, [r1, #1220]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1220]
ldr.w r12, [r1, #1224]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1224]
ldr.w r12, [r1, #1228]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1228]
ldr.w r12, [r1, #1232]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1232]
ldr.w r12, [r1, #1236]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1236]
ldr.w r12, [r1, #1240]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1240]
ldr.w r12, [r1, #1244]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1244]
ldr.w r12, [r1, #1248]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1248]
ldr.w r12, [r1, #1252]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1252]
ldr.w r12, [r1, #1256]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1256]
ldr.w r12, [r1, #1260]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1260]
ldr.w r12, [r1, #1264]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1264]
ldr.w r12, [r1, #1268]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1268]
ldr.w r12, [r1, #1272]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1272]
ldr.w r12, [r1, #1276]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1276]
ldr.w r12, [r1, #1280]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1280]
ldr.w r12, [r1, #1284]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1284]
ldr.w r12, [r1, #1288]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1288]
ldr.w r12, [r1, #1292]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1292]
ldr.w r12, [r1, #1296]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1296]
ldr.w r12, [r1, #1300]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1300]
ldr.w r12, [r1, #1304]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1304]
ldr.w r12, [r1, #1308]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1308]
ldr.w r12, [r1, #1312]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1312]
ldr.w r12, [r1, #1316]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1316]
ldr.w r12, [r1, #1320]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1320]
ldr.w r12, [r1, #1324]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1324]
ldr.w r12, [r1, #1328]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1328]
ldr.w r12, [r1, #1332]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1332]
ldr.w r12, [r1, #1336]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1336]
ldr.w r12, [r1, #1340]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1340]
ldr.w r12, [r1, #1344]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1344]
ldr.w r12, [r1, #1348]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1348]
ldr.w r12, [r1, #1352]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1352]
ldr.w r12, [r1, #1356]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1356]
ldr.w r12, [r1, #1360]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1360]
ldr.w r12, [r1, #1364]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1364]
ldr.w r12, [r1, #1368]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1368]
ldr.w r12, [r1, #1372]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1372]
ldr.w r12, [r1, #1376]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1376]
ldr.w r12, [r1, #1380]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1380]
ldr.w r12, [r1, #1384]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1384]
ldr.w r12, [r1, #1388]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1388]
ldr.w r12, [r1, #1392]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1392]
ldr.w r12, [r1, #1396]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1396]
ldr.w r12, [r1, #1400]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1400]
ldr.w r12, [r1, #1404]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1404]
ldr.w r12, [r1, #1408]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1408]
ldr.w r12, [r1, #1412]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1412]
ldr.w r12, [r1, #1416]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1416]
ldr.w r12, [r1, #1420]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1420]
ldr.w r12, [r1, #1424]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1424]
ldr.w r12, [r1, #1428]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1428]
ldr.w r12, [r1, #1432]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1432]
ldr.w r12, [r1, #1436]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1436]
ldr.w r12, [r1, #1440]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1440]
ldr.w r12, [r1, #1444]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1444]
ldr.w r12, [r1, #1448]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1448]
ldr.w r12, [r1, #1452]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1452]
ldr.w r12, [r1, #1456]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1456]
ldr.w r12, [r1, #1460]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1460]
ldr.w r12, [r1, #1464]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1464]
ldr.w r12, [r1, #1468]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1468]
ldr.w r12, [r1, #1472]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1472]
ldr.w r12, [r1, #1476]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1476]
ldr.w r12, [r1, #1480]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1480]
ldr.w r12, [r1, #1484]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1484]
ldr.w r12, [r1, #1488]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1488]
ldr.w r12, [r1, #1492]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1492]
ldr.w r12, [r1, #1496]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1496]
ldr.w r12, [r1, #1500]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1500]
ldr.w r12, [r1, #1504]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1504]
ldr.w r12, [r1, #1508]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1508]
ldr.w r12, [r1, #1512]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1512]
ldr.w r12, [r1, #1516]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1516]
ldr.w r12, [r1, #1520]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1520]
ldr.w r12, [r1, #1524]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1524]
ldr.w r12, [r1, #1528]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1528]
ldr.w r12, [r1, #1532]
add.w r3, r12, r3, lsr#11
ubfx.w r12, r3, #0, #11
str.w r12, [r0, #1532]
bx lr
