.syntax unified
.cpu cortex-m3
.section .text

.align 2
.global dechunk
.type dechunk, %function
dechunk:
push.w {lr}
ldr.w r2, [r1, #0]
mov.w r14, #0
ldr.w r12, [r1, #4]
adds.w r2, r2, r12, lsl#11
adc.w r3, r14, r12, lsr#21
ldr.w r12, [r1, #8]
adds.w r2, r2, r12, lsl#22
adc.w r3, r3, r12, lsr#10
str.w r2, [r0, #0]
ldr.w r12, [r1, #12]
adds.w r3, r3, r12, lsl#1
adc.w r2, r14, r12, lsr#31
ldr.w r12, [r1, #16]
adds.w r3, r3, r12, lsl#12
adc.w r2, r2, r12, lsr#20
ldr.w r12, [r1, #20]
adds.w r3, r3, r12, lsl#23
adc.w r2, r2, r12, lsr#9
str.w r3, [r0, #4]
ldr.w r12, [r1, #24]
adds.w r2, r2, r12, lsl#2
adc.w r3, r14, r12, lsr#30
ldr.w r12, [r1, #28]
adds.w r2, r2, r12, lsl#13
adc.w r3, r3, r12, lsr#19
ldr.w r12, [r1, #32]
adds.w r2, r2, r12, lsl#24
adc.w r3, r3, r12, lsr#8
str.w r2, [r0, #8]
ldr.w r12, [r1, #36]
adds.w r3, r3, r12, lsl#3
adc.w r2, r14, r12, lsr#29
ldr.w r12, [r1, #40]
adds.w r3, r3, r12, lsl#14
adc.w r2, r2, r12, lsr#18
ldr.w r12, [r1, #44]
adds.w r3, r3, r12, lsl#25
adc.w r2, r2, r12, lsr#7
str.w r3, [r0, #12]
ldr.w r12, [r1, #48]
adds.w r2, r2, r12, lsl#4
adc.w r3, r14, r12, lsr#28
ldr.w r12, [r1, #52]
adds.w r2, r2, r12, lsl#15
adc.w r3, r3, r12, lsr#17
ldr.w r12, [r1, #56]
adds.w r2, r2, r12, lsl#26
adc.w r3, r3, r12, lsr#6
str.w r2, [r0, #16]
ldr.w r12, [r1, #60]
adds.w r3, r3, r12, lsl#5
adc.w r2, r14, r12, lsr#27
ldr.w r12, [r1, #64]
adds.w r3, r3, r12, lsl#16
adc.w r2, r2, r12, lsr#16
ldr.w r12, [r1, #68]
adds.w r3, r3, r12, lsl#27
adc.w r2, r2, r12, lsr#5
str.w r3, [r0, #20]
ldr.w r12, [r1, #72]
adds.w r2, r2, r12, lsl#6
adc.w r3, r14, r12, lsr#26
ldr.w r12, [r1, #76]
adds.w r2, r2, r12, lsl#17
adc.w r3, r3, r12, lsr#15
ldr.w r12, [r1, #80]
adds.w r2, r2, r12, lsl#28
adc.w r3, r3, r12, lsr#4
str.w r2, [r0, #24]
ldr.w r12, [r1, #84]
adds.w r3, r3, r12, lsl#7
adc.w r2, r14, r12, lsr#25
ldr.w r12, [r1, #88]
adds.w r3, r3, r12, lsl#18
adc.w r2, r2, r12, lsr#14
ldr.w r12, [r1, #92]
adds.w r3, r3, r12, lsl#29
adc.w r2, r2, r12, lsr#3
str.w r3, [r0, #28]
ldr.w r12, [r1, #96]
adds.w r2, r2, r12, lsl#8
adc.w r3, r14, r12, lsr#24
ldr.w r12, [r1, #100]
adds.w r2, r2, r12, lsl#19
adc.w r3, r3, r12, lsr#13
ldr.w r12, [r1, #104]
adds.w r2, r2, r12, lsl#30
adc.w r3, r3, r12, lsr#2
str.w r2, [r0, #32]
ldr.w r12, [r1, #108]
adds.w r3, r3, r12, lsl#9
adc.w r2, r14, r12, lsr#23
ldr.w r12, [r1, #112]
adds.w r3, r3, r12, lsl#20
adc.w r2, r2, r12, lsr#12
ldr.w r12, [r1, #116]
adds.w r3, r3, r12, lsl#31
adc.w r2, r2, r12, lsr#1
str.w r3, [r0, #36]
ldr.w r12, [r1, #120]
adds.w r2, r2, r12, lsl#10
adc.w r3, r14, r12, lsr#22
ldr.w r12, [r1, #124]
adds.w r2, r2, r12, lsl#21
adc.w r3, r3, r12, lsr#11
str.w r2, [r0, #40]
ldr.w r12, [r1, #128]
adds.w r3, r3, r12, lsl#0
adc.w r2, r14, r12, lsr#32
ldr.w r12, [r1, #132]
adds.w r3, r3, r12, lsl#11
adc.w r2, r2, r12, lsr#21
ldr.w r12, [r1, #136]
adds.w r3, r3, r12, lsl#22
adc.w r2, r2, r12, lsr#10
str.w r3, [r0, #44]
ldr.w r12, [r1, #140]
adds.w r2, r2, r12, lsl#1
adc.w r3, r14, r12, lsr#31
ldr.w r12, [r1, #144]
adds.w r2, r2, r12, lsl#12
adc.w r3, r3, r12, lsr#20
ldr.w r12, [r1, #148]
adds.w r2, r2, r12, lsl#23
adc.w r3, r3, r12, lsr#9
str.w r2, [r0, #48]
ldr.w r12, [r1, #152]
adds.w r3, r3, r12, lsl#2
adc.w r2, r14, r12, lsr#30
ldr.w r12, [r1, #156]
adds.w r3, r3, r12, lsl#13
adc.w r2, r2, r12, lsr#19
ldr.w r12, [r1, #160]
adds.w r3, r3, r12, lsl#24
adc.w r2, r2, r12, lsr#8
str.w r3, [r0, #52]
ldr.w r12, [r1, #164]
adds.w r2, r2, r12, lsl#3
adc.w r3, r14, r12, lsr#29
ldr.w r12, [r1, #168]
adds.w r2, r2, r12, lsl#14
adc.w r3, r3, r12, lsr#18
ldr.w r12, [r1, #172]
adds.w r2, r2, r12, lsl#25
adc.w r3, r3, r12, lsr#7
str.w r2, [r0, #56]
ldr.w r12, [r1, #176]
adds.w r3, r3, r12, lsl#4
adc.w r2, r14, r12, lsr#28
ldr.w r12, [r1, #180]
adds.w r3, r3, r12, lsl#15
adc.w r2, r2, r12, lsr#17
ldr.w r12, [r1, #184]
adds.w r3, r3, r12, lsl#26
adc.w r2, r2, r12, lsr#6
str.w r3, [r0, #60]
ldr.w r12, [r1, #188]
adds.w r2, r2, r12, lsl#5
adc.w r3, r14, r12, lsr#27
ldr.w r12, [r1, #192]
adds.w r2, r2, r12, lsl#16
adc.w r3, r3, r12, lsr#16
ldr.w r12, [r1, #196]
adds.w r2, r2, r12, lsl#27
adc.w r3, r3, r12, lsr#5
str.w r2, [r0, #64]
ldr.w r12, [r1, #200]
adds.w r3, r3, r12, lsl#6
adc.w r2, r14, r12, lsr#26
ldr.w r12, [r1, #204]
adds.w r3, r3, r12, lsl#17
adc.w r2, r2, r12, lsr#15
ldr.w r12, [r1, #208]
adds.w r3, r3, r12, lsl#28
adc.w r2, r2, r12, lsr#4
str.w r3, [r0, #68]
ldr.w r12, [r1, #212]
adds.w r2, r2, r12, lsl#7
adc.w r3, r14, r12, lsr#25
ldr.w r12, [r1, #216]
adds.w r2, r2, r12, lsl#18
adc.w r3, r3, r12, lsr#14
ldr.w r12, [r1, #220]
adds.w r2, r2, r12, lsl#29
adc.w r3, r3, r12, lsr#3
str.w r2, [r0, #72]
ldr.w r12, [r1, #224]
adds.w r3, r3, r12, lsl#8
adc.w r2, r14, r12, lsr#24
ldr.w r12, [r1, #228]
adds.w r3, r3, r12, lsl#19
adc.w r2, r2, r12, lsr#13
ldr.w r12, [r1, #232]
adds.w r3, r3, r12, lsl#30
adc.w r2, r2, r12, lsr#2
str.w r3, [r0, #76]
ldr.w r12, [r1, #236]
adds.w r2, r2, r12, lsl#9
adc.w r3, r14, r12, lsr#23
ldr.w r12, [r1, #240]
adds.w r2, r2, r12, lsl#20
adc.w r3, r3, r12, lsr#12
ldr.w r12, [r1, #244]
adds.w r2, r2, r12, lsl#31
adc.w r3, r3, r12, lsr#1
str.w r2, [r0, #80]
ldr.w r12, [r1, #248]
adds.w r3, r3, r12, lsl#10
adc.w r2, r14, r12, lsr#22
ldr.w r12, [r1, #252]
adds.w r3, r3, r12, lsl#21
adc.w r2, r2, r12, lsr#11
str.w r3, [r0, #84]
ldr.w r12, [r1, #256]
adds.w r2, r2, r12, lsl#0
adc.w r3, r14, r12, lsr#32
ldr.w r12, [r1, #260]
adds.w r2, r2, r12, lsl#11
adc.w r3, r3, r12, lsr#21
ldr.w r12, [r1, #264]
adds.w r2, r2, r12, lsl#22
adc.w r3, r3, r12, lsr#10
str.w r2, [r0, #88]
ldr.w r12, [r1, #268]
adds.w r3, r3, r12, lsl#1
adc.w r2, r14, r12, lsr#31
ldr.w r12, [r1, #272]
adds.w r3, r3, r12, lsl#12
adc.w r2, r2, r12, lsr#20
ldr.w r12, [r1, #276]
adds.w r3, r3, r12, lsl#23
adc.w r2, r2, r12, lsr#9
str.w r3, [r0, #92]
ldr.w r12, [r1, #280]
adds.w r2, r2, r12, lsl#2
adc.w r3, r14, r12, lsr#30
ldr.w r12, [r1, #284]
adds.w r2, r2, r12, lsl#13
adc.w r3, r3, r12, lsr#19
ldr.w r12, [r1, #288]
adds.w r2, r2, r12, lsl#24
adc.w r3, r3, r12, lsr#8
str.w r2, [r0, #96]
ldr.w r12, [r1, #292]
adds.w r3, r3, r12, lsl#3
adc.w r2, r14, r12, lsr#29
ldr.w r12, [r1, #296]
adds.w r3, r3, r12, lsl#14
adc.w r2, r2, r12, lsr#18
ldr.w r12, [r1, #300]
adds.w r3, r3, r12, lsl#25
adc.w r2, r2, r12, lsr#7
str.w r3, [r0, #100]
ldr.w r12, [r1, #304]
adds.w r2, r2, r12, lsl#4
adc.w r3, r14, r12, lsr#28
ldr.w r12, [r1, #308]
adds.w r2, r2, r12, lsl#15
adc.w r3, r3, r12, lsr#17
ldr.w r12, [r1, #312]
adds.w r2, r2, r12, lsl#26
adc.w r3, r3, r12, lsr#6
str.w r2, [r0, #104]
ldr.w r12, [r1, #316]
adds.w r3, r3, r12, lsl#5
adc.w r2, r14, r12, lsr#27
ldr.w r12, [r1, #320]
adds.w r3, r3, r12, lsl#16
adc.w r2, r2, r12, lsr#16
ldr.w r12, [r1, #324]
adds.w r3, r3, r12, lsl#27
adc.w r2, r2, r12, lsr#5
str.w r3, [r0, #108]
ldr.w r12, [r1, #328]
adds.w r2, r2, r12, lsl#6
adc.w r3, r14, r12, lsr#26
ldr.w r12, [r1, #332]
adds.w r2, r2, r12, lsl#17
adc.w r3, r3, r12, lsr#15
ldr.w r12, [r1, #336]
adds.w r2, r2, r12, lsl#28
adc.w r3, r3, r12, lsr#4
str.w r2, [r0, #112]
ldr.w r12, [r1, #340]
adds.w r3, r3, r12, lsl#7
adc.w r2, r14, r12, lsr#25
ldr.w r12, [r1, #344]
adds.w r3, r3, r12, lsl#18
adc.w r2, r2, r12, lsr#14
ldr.w r12, [r1, #348]
adds.w r3, r3, r12, lsl#29
adc.w r2, r2, r12, lsr#3
str.w r3, [r0, #116]
ldr.w r12, [r1, #352]
adds.w r2, r2, r12, lsl#8
adc.w r3, r14, r12, lsr#24
ldr.w r12, [r1, #356]
adds.w r2, r2, r12, lsl#19
adc.w r3, r3, r12, lsr#13
ldr.w r12, [r1, #360]
adds.w r2, r2, r12, lsl#30
adc.w r3, r3, r12, lsr#2
str.w r2, [r0, #120]
ldr.w r12, [r1, #364]
adds.w r3, r3, r12, lsl#9
adc.w r2, r14, r12, lsr#23
ldr.w r12, [r1, #368]
adds.w r3, r3, r12, lsl#20
adc.w r2, r2, r12, lsr#12
ldr.w r12, [r1, #372]
adds.w r3, r3, r12, lsl#31
adc.w r2, r2, r12, lsr#1
str.w r3, [r0, #124]
ldr.w r12, [r1, #376]
adds.w r2, r2, r12, lsl#10
adc.w r3, r14, r12, lsr#22
ldr.w r12, [r1, #380]
adds.w r2, r2, r12, lsl#21
adc.w r3, r3, r12, lsr#11
str.w r2, [r0, #128]
ldr.w r12, [r1, #384]
adds.w r3, r3, r12, lsl#0
adc.w r2, r14, r12, lsr#32
ldr.w r12, [r1, #388]
adds.w r3, r3, r12, lsl#11
adc.w r2, r2, r12, lsr#21
ldr.w r12, [r1, #392]
adds.w r3, r3, r12, lsl#22
adc.w r2, r2, r12, lsr#10
str.w r3, [r0, #132]
ldr.w r12, [r1, #396]
adds.w r2, r2, r12, lsl#1
adc.w r3, r14, r12, lsr#31
ldr.w r12, [r1, #400]
adds.w r2, r2, r12, lsl#12
adc.w r3, r3, r12, lsr#20
ldr.w r12, [r1, #404]
adds.w r2, r2, r12, lsl#23
adc.w r3, r3, r12, lsr#9
str.w r2, [r0, #136]
ldr.w r12, [r1, #408]
adds.w r3, r3, r12, lsl#2
adc.w r2, r14, r12, lsr#30
ldr.w r12, [r1, #412]
adds.w r3, r3, r12, lsl#13
adc.w r2, r2, r12, lsr#19
ldr.w r12, [r1, #416]
adds.w r3, r3, r12, lsl#24
adc.w r2, r2, r12, lsr#8
str.w r3, [r0, #140]
ldr.w r12, [r1, #420]
adds.w r2, r2, r12, lsl#3
adc.w r3, r14, r12, lsr#29
ldr.w r12, [r1, #424]
adds.w r2, r2, r12, lsl#14
adc.w r3, r3, r12, lsr#18
ldr.w r12, [r1, #428]
adds.w r2, r2, r12, lsl#25
adc.w r3, r3, r12, lsr#7
str.w r2, [r0, #144]
ldr.w r12, [r1, #432]
adds.w r3, r3, r12, lsl#4
adc.w r2, r14, r12, lsr#28
ldr.w r12, [r1, #436]
adds.w r3, r3, r12, lsl#15
adc.w r2, r2, r12, lsr#17
ldr.w r12, [r1, #440]
adds.w r3, r3, r12, lsl#26
adc.w r2, r2, r12, lsr#6
str.w r3, [r0, #148]
ldr.w r12, [r1, #444]
adds.w r2, r2, r12, lsl#5
adc.w r3, r14, r12, lsr#27
ldr.w r12, [r1, #448]
adds.w r2, r2, r12, lsl#16
adc.w r3, r3, r12, lsr#16
ldr.w r12, [r1, #452]
adds.w r2, r2, r12, lsl#27
adc.w r3, r3, r12, lsr#5
str.w r2, [r0, #152]
ldr.w r12, [r1, #456]
adds.w r3, r3, r12, lsl#6
adc.w r2, r14, r12, lsr#26
ldr.w r12, [r1, #460]
adds.w r3, r3, r12, lsl#17
adc.w r2, r2, r12, lsr#15
ldr.w r12, [r1, #464]
adds.w r3, r3, r12, lsl#28
adc.w r2, r2, r12, lsr#4
str.w r3, [r0, #156]
ldr.w r12, [r1, #468]
adds.w r2, r2, r12, lsl#7
adc.w r3, r14, r12, lsr#25
ldr.w r12, [r1, #472]
adds.w r2, r2, r12, lsl#18
adc.w r3, r3, r12, lsr#14
ldr.w r12, [r1, #476]
adds.w r2, r2, r12, lsl#29
adc.w r3, r3, r12, lsr#3
str.w r2, [r0, #160]
ldr.w r12, [r1, #480]
adds.w r3, r3, r12, lsl#8
adc.w r2, r14, r12, lsr#24
ldr.w r12, [r1, #484]
adds.w r3, r3, r12, lsl#19
adc.w r2, r2, r12, lsr#13
ldr.w r12, [r1, #488]
adds.w r3, r3, r12, lsl#30
adc.w r2, r2, r12, lsr#2
str.w r3, [r0, #164]
ldr.w r12, [r1, #492]
adds.w r2, r2, r12, lsl#9
adc.w r3, r14, r12, lsr#23
ldr.w r12, [r1, #496]
adds.w r2, r2, r12, lsl#20
adc.w r3, r3, r12, lsr#12
ldr.w r12, [r1, #500]
adds.w r2, r2, r12, lsl#31
adc.w r3, r3, r12, lsr#1
str.w r2, [r0, #168]
ldr.w r12, [r1, #504]
adds.w r3, r3, r12, lsl#10
adc.w r2, r14, r12, lsr#22
ldr.w r12, [r1, #508]
adds.w r3, r3, r12, lsl#21
adc.w r2, r2, r12, lsr#11
str.w r3, [r0, #172]
ldr.w r12, [r1, #512]
adds.w r2, r2, r12, lsl#0
adc.w r3, r14, r12, lsr#32
ldr.w r12, [r1, #516]
adds.w r2, r2, r12, lsl#11
adc.w r3, r3, r12, lsr#21
ldr.w r12, [r1, #520]
adds.w r2, r2, r12, lsl#22
adc.w r3, r3, r12, lsr#10
str.w r2, [r0, #176]
ldr.w r12, [r1, #524]
adds.w r3, r3, r12, lsl#1
adc.w r2, r14, r12, lsr#31
ldr.w r12, [r1, #528]
adds.w r3, r3, r12, lsl#12
adc.w r2, r2, r12, lsr#20
ldr.w r12, [r1, #532]
adds.w r3, r3, r12, lsl#23
adc.w r2, r2, r12, lsr#9
str.w r3, [r0, #180]
ldr.w r12, [r1, #536]
adds.w r2, r2, r12, lsl#2
adc.w r3, r14, r12, lsr#30
ldr.w r12, [r1, #540]
adds.w r2, r2, r12, lsl#13
adc.w r3, r3, r12, lsr#19
ldr.w r12, [r1, #544]
adds.w r2, r2, r12, lsl#24
adc.w r3, r3, r12, lsr#8
str.w r2, [r0, #184]
ldr.w r12, [r1, #548]
adds.w r3, r3, r12, lsl#3
adc.w r2, r14, r12, lsr#29
ldr.w r12, [r1, #552]
adds.w r3, r3, r12, lsl#14
adc.w r2, r2, r12, lsr#18
ldr.w r12, [r1, #556]
adds.w r3, r3, r12, lsl#25
adc.w r2, r2, r12, lsr#7
str.w r3, [r0, #188]
ldr.w r12, [r1, #560]
adds.w r2, r2, r12, lsl#4
adc.w r3, r14, r12, lsr#28
ldr.w r12, [r1, #564]
adds.w r2, r2, r12, lsl#15
adc.w r3, r3, r12, lsr#17
ldr.w r12, [r1, #568]
adds.w r2, r2, r12, lsl#26
adc.w r3, r3, r12, lsr#6
str.w r2, [r0, #192]
ldr.w r12, [r1, #572]
adds.w r3, r3, r12, lsl#5
adc.w r2, r14, r12, lsr#27
ldr.w r12, [r1, #576]
adds.w r3, r3, r12, lsl#16
adc.w r2, r2, r12, lsr#16
ldr.w r12, [r1, #580]
adds.w r3, r3, r12, lsl#27
adc.w r2, r2, r12, lsr#5
str.w r3, [r0, #196]
ldr.w r12, [r1, #584]
adds.w r2, r2, r12, lsl#6
adc.w r3, r14, r12, lsr#26
ldr.w r12, [r1, #588]
adds.w r2, r2, r12, lsl#17
adc.w r3, r3, r12, lsr#15
ldr.w r12, [r1, #592]
adds.w r2, r2, r12, lsl#28
adc.w r3, r3, r12, lsr#4
str.w r2, [r0, #200]
ldr.w r12, [r1, #596]
adds.w r3, r3, r12, lsl#7
adc.w r2, r14, r12, lsr#25
ldr.w r12, [r1, #600]
adds.w r3, r3, r12, lsl#18
adc.w r2, r2, r12, lsr#14
ldr.w r12, [r1, #604]
adds.w r3, r3, r12, lsl#29
adc.w r2, r2, r12, lsr#3
str.w r3, [r0, #204]
ldr.w r12, [r1, #608]
adds.w r2, r2, r12, lsl#8
adc.w r3, r14, r12, lsr#24
ldr.w r12, [r1, #612]
adds.w r2, r2, r12, lsl#19
adc.w r3, r3, r12, lsr#13
ldr.w r12, [r1, #616]
adds.w r2, r2, r12, lsl#30
adc.w r3, r3, r12, lsr#2
str.w r2, [r0, #208]
ldr.w r12, [r1, #620]
adds.w r3, r3, r12, lsl#9
adc.w r2, r14, r12, lsr#23
ldr.w r12, [r1, #624]
adds.w r3, r3, r12, lsl#20
adc.w r2, r2, r12, lsr#12
ldr.w r12, [r1, #628]
adds.w r3, r3, r12, lsl#31
adc.w r2, r2, r12, lsr#1
str.w r3, [r0, #212]
ldr.w r12, [r1, #632]
adds.w r2, r2, r12, lsl#10
adc.w r3, r14, r12, lsr#22
ldr.w r12, [r1, #636]
adds.w r2, r2, r12, lsl#21
adc.w r3, r3, r12, lsr#11
str.w r2, [r0, #216]
ldr.w r12, [r1, #640]
adds.w r3, r3, r12, lsl#0
adc.w r2, r14, r12, lsr#32
ldr.w r12, [r1, #644]
adds.w r3, r3, r12, lsl#11
adc.w r2, r2, r12, lsr#21
ldr.w r12, [r1, #648]
adds.w r3, r3, r12, lsl#22
adc.w r2, r2, r12, lsr#10
str.w r3, [r0, #220]
ldr.w r12, [r1, #652]
adds.w r2, r2, r12, lsl#1
adc.w r3, r14, r12, lsr#31
ldr.w r12, [r1, #656]
adds.w r2, r2, r12, lsl#12
adc.w r3, r3, r12, lsr#20
ldr.w r12, [r1, #660]
adds.w r2, r2, r12, lsl#23
adc.w r3, r3, r12, lsr#9
str.w r2, [r0, #224]
ldr.w r12, [r1, #664]
adds.w r3, r3, r12, lsl#2
adc.w r2, r14, r12, lsr#30
ldr.w r12, [r1, #668]
adds.w r3, r3, r12, lsl#13
adc.w r2, r2, r12, lsr#19
ldr.w r12, [r1, #672]
adds.w r3, r3, r12, lsl#24
adc.w r2, r2, r12, lsr#8
str.w r3, [r0, #228]
ldr.w r12, [r1, #676]
adds.w r2, r2, r12, lsl#3
adc.w r3, r14, r12, lsr#29
ldr.w r12, [r1, #680]
adds.w r2, r2, r12, lsl#14
adc.w r3, r3, r12, lsr#18
ldr.w r12, [r1, #684]
adds.w r2, r2, r12, lsl#25
adc.w r3, r3, r12, lsr#7
str.w r2, [r0, #232]
ldr.w r12, [r1, #688]
adds.w r3, r3, r12, lsl#4
adc.w r2, r14, r12, lsr#28
ldr.w r12, [r1, #692]
adds.w r3, r3, r12, lsl#15
adc.w r2, r2, r12, lsr#17
ldr.w r12, [r1, #696]
adds.w r3, r3, r12, lsl#26
adc.w r2, r2, r12, lsr#6
str.w r3, [r0, #236]
ldr.w r12, [r1, #700]
adds.w r2, r2, r12, lsl#5
adc.w r3, r14, r12, lsr#27
ldr.w r12, [r1, #704]
adds.w r2, r2, r12, lsl#16
adc.w r3, r3, r12, lsr#16
ldr.w r12, [r1, #708]
adds.w r2, r2, r12, lsl#27
adc.w r3, r3, r12, lsr#5
str.w r2, [r0, #240]
ldr.w r12, [r1, #712]
adds.w r3, r3, r12, lsl#6
adc.w r2, r14, r12, lsr#26
ldr.w r12, [r1, #716]
adds.w r3, r3, r12, lsl#17
adc.w r2, r2, r12, lsr#15
ldr.w r12, [r1, #720]
adds.w r3, r3, r12, lsl#28
adc.w r2, r2, r12, lsr#4
str.w r3, [r0, #244]
ldr.w r12, [r1, #724]
adds.w r2, r2, r12, lsl#7
adc.w r3, r14, r12, lsr#25
ldr.w r12, [r1, #728]
adds.w r2, r2, r12, lsl#18
adc.w r3, r3, r12, lsr#14
ldr.w r12, [r1, #732]
adds.w r2, r2, r12, lsl#29
adc.w r3, r3, r12, lsr#3
str.w r2, [r0, #248]
ldr.w r12, [r1, #736]
adds.w r3, r3, r12, lsl#8
adc.w r2, r14, r12, lsr#24
ldr.w r12, [r1, #740]
adds.w r3, r3, r12, lsl#19
adc.w r2, r2, r12, lsr#13
ldr.w r12, [r1, #744]
adds.w r3, r3, r12, lsl#30
adc.w r2, r2, r12, lsr#2
str.w r3, [r0, #252]
ldr.w r12, [r1, #748]
adds.w r2, r2, r12, lsl#9
adc.w r3, r14, r12, lsr#23
ldr.w r12, [r1, #752]
adds.w r2, r2, r12, lsl#20
adc.w r3, r3, r12, lsr#12
ldr.w r12, [r1, #756]
adds.w r2, r2, r12, lsl#31
adc.w r3, r3, r12, lsr#1
str.w r2, [r0, #256]
ldr.w r12, [r1, #760]
adds.w r3, r3, r12, lsl#10
adc.w r2, r14, r12, lsr#22
ldr.w r12, [r1, #764]
adds.w r3, r3, r12, lsl#21
adc.w r2, r2, r12, lsr#11
str.w r3, [r0, #260]
ldr.w r12, [r1, #768]
adds.w r2, r2, r12, lsl#0
adc.w r3, r14, r12, lsr#32
ldr.w r12, [r1, #772]
adds.w r2, r2, r12, lsl#11
adc.w r3, r3, r12, lsr#21
ldr.w r12, [r1, #776]
adds.w r2, r2, r12, lsl#22
adc.w r3, r3, r12, lsr#10
str.w r2, [r0, #264]
ldr.w r12, [r1, #780]
adds.w r3, r3, r12, lsl#1
adc.w r2, r14, r12, lsr#31
ldr.w r12, [r1, #784]
adds.w r3, r3, r12, lsl#12
adc.w r2, r2, r12, lsr#20
ldr.w r12, [r1, #788]
adds.w r3, r3, r12, lsl#23
adc.w r2, r2, r12, lsr#9
str.w r3, [r0, #268]
ldr.w r12, [r1, #792]
adds.w r2, r2, r12, lsl#2
adc.w r3, r14, r12, lsr#30
ldr.w r12, [r1, #796]
adds.w r2, r2, r12, lsl#13
adc.w r3, r3, r12, lsr#19
ldr.w r12, [r1, #800]
adds.w r2, r2, r12, lsl#24
adc.w r3, r3, r12, lsr#8
str.w r2, [r0, #272]
ldr.w r12, [r1, #804]
adds.w r3, r3, r12, lsl#3
adc.w r2, r14, r12, lsr#29
ldr.w r12, [r1, #808]
adds.w r3, r3, r12, lsl#14
adc.w r2, r2, r12, lsr#18
ldr.w r12, [r1, #812]
adds.w r3, r3, r12, lsl#25
adc.w r2, r2, r12, lsr#7
str.w r3, [r0, #276]
ldr.w r12, [r1, #816]
adds.w r2, r2, r12, lsl#4
adc.w r3, r14, r12, lsr#28
ldr.w r12, [r1, #820]
adds.w r2, r2, r12, lsl#15
adc.w r3, r3, r12, lsr#17
ldr.w r12, [r1, #824]
adds.w r2, r2, r12, lsl#26
adc.w r3, r3, r12, lsr#6
str.w r2, [r0, #280]
ldr.w r12, [r1, #828]
adds.w r3, r3, r12, lsl#5
adc.w r2, r14, r12, lsr#27
ldr.w r12, [r1, #832]
adds.w r3, r3, r12, lsl#16
adc.w r2, r2, r12, lsr#16
ldr.w r12, [r1, #836]
adds.w r3, r3, r12, lsl#27
adc.w r2, r2, r12, lsr#5
str.w r3, [r0, #284]
ldr.w r12, [r1, #840]
adds.w r2, r2, r12, lsl#6
adc.w r3, r14, r12, lsr#26
ldr.w r12, [r1, #844]
adds.w r2, r2, r12, lsl#17
adc.w r3, r3, r12, lsr#15
ldr.w r12, [r1, #848]
adds.w r2, r2, r12, lsl#28
adc.w r3, r3, r12, lsr#4
str.w r2, [r0, #288]
ldr.w r12, [r1, #852]
adds.w r3, r3, r12, lsl#7
adc.w r2, r14, r12, lsr#25
ldr.w r12, [r1, #856]
adds.w r3, r3, r12, lsl#18
adc.w r2, r2, r12, lsr#14
ldr.w r12, [r1, #860]
adds.w r3, r3, r12, lsl#29
adc.w r2, r2, r12, lsr#3
str.w r3, [r0, #292]
ldr.w r12, [r1, #864]
adds.w r2, r2, r12, lsl#8
adc.w r3, r14, r12, lsr#24
ldr.w r12, [r1, #868]
adds.w r2, r2, r12, lsl#19
adc.w r3, r3, r12, lsr#13
ldr.w r12, [r1, #872]
adds.w r2, r2, r12, lsl#30
adc.w r3, r3, r12, lsr#2
str.w r2, [r0, #296]
ldr.w r12, [r1, #876]
adds.w r3, r3, r12, lsl#9
adc.w r2, r14, r12, lsr#23
ldr.w r12, [r1, #880]
adds.w r3, r3, r12, lsl#20
adc.w r2, r2, r12, lsr#12
ldr.w r12, [r1, #884]
adds.w r3, r3, r12, lsl#31
adc.w r2, r2, r12, lsr#1
str.w r3, [r0, #300]
ldr.w r12, [r1, #888]
adds.w r2, r2, r12, lsl#10
adc.w r3, r14, r12, lsr#22
ldr.w r12, [r1, #892]
adds.w r2, r2, r12, lsl#21
adc.w r3, r3, r12, lsr#11
str.w r2, [r0, #304]
ldr.w r12, [r1, #896]
adds.w r3, r3, r12, lsl#0
adc.w r2, r14, r12, lsr#32
ldr.w r12, [r1, #900]
adds.w r3, r3, r12, lsl#11
adc.w r2, r2, r12, lsr#21
ldr.w r12, [r1, #904]
adds.w r3, r3, r12, lsl#22
adc.w r2, r2, r12, lsr#10
str.w r3, [r0, #308]
ldr.w r12, [r1, #908]
adds.w r2, r2, r12, lsl#1
adc.w r3, r14, r12, lsr#31
ldr.w r12, [r1, #912]
adds.w r2, r2, r12, lsl#12
adc.w r3, r3, r12, lsr#20
ldr.w r12, [r1, #916]
adds.w r2, r2, r12, lsl#23
adc.w r3, r3, r12, lsr#9
str.w r2, [r0, #312]
ldr.w r12, [r1, #920]
adds.w r3, r3, r12, lsl#2
adc.w r2, r14, r12, lsr#30
ldr.w r12, [r1, #924]
adds.w r3, r3, r12, lsl#13
adc.w r2, r2, r12, lsr#19
ldr.w r12, [r1, #928]
adds.w r3, r3, r12, lsl#24
adc.w r2, r2, r12, lsr#8
str.w r3, [r0, #316]
ldr.w r12, [r1, #932]
adds.w r2, r2, r12, lsl#3
adc.w r3, r14, r12, lsr#29
ldr.w r12, [r1, #936]
adds.w r2, r2, r12, lsl#14
adc.w r3, r3, r12, lsr#18
ldr.w r12, [r1, #940]
adds.w r2, r2, r12, lsl#25
adc.w r3, r3, r12, lsr#7
str.w r2, [r0, #320]
ldr.w r12, [r1, #944]
adds.w r3, r3, r12, lsl#4
adc.w r2, r14, r12, lsr#28
ldr.w r12, [r1, #948]
adds.w r3, r3, r12, lsl#15
adc.w r2, r2, r12, lsr#17
ldr.w r12, [r1, #952]
adds.w r3, r3, r12, lsl#26
adc.w r2, r2, r12, lsr#6
str.w r3, [r0, #324]
ldr.w r12, [r1, #956]
adds.w r2, r2, r12, lsl#5
adc.w r3, r14, r12, lsr#27
ldr.w r12, [r1, #960]
adds.w r2, r2, r12, lsl#16
adc.w r3, r3, r12, lsr#16
ldr.w r12, [r1, #964]
adds.w r2, r2, r12, lsl#27
adc.w r3, r3, r12, lsr#5
str.w r2, [r0, #328]
ldr.w r12, [r1, #968]
adds.w r3, r3, r12, lsl#6
adc.w r2, r14, r12, lsr#26
ldr.w r12, [r1, #972]
adds.w r3, r3, r12, lsl#17
adc.w r2, r2, r12, lsr#15
ldr.w r12, [r1, #976]
adds.w r3, r3, r12, lsl#28
adc.w r2, r2, r12, lsr#4
str.w r3, [r0, #332]
ldr.w r12, [r1, #980]
adds.w r2, r2, r12, lsl#7
adc.w r3, r14, r12, lsr#25
ldr.w r12, [r1, #984]
adds.w r2, r2, r12, lsl#18
adc.w r3, r3, r12, lsr#14
ldr.w r12, [r1, #988]
adds.w r2, r2, r12, lsl#29
adc.w r3, r3, r12, lsr#3
str.w r2, [r0, #336]
ldr.w r12, [r1, #992]
adds.w r3, r3, r12, lsl#8
adc.w r2, r14, r12, lsr#24
ldr.w r12, [r1, #996]
adds.w r3, r3, r12, lsl#19
adc.w r2, r2, r12, lsr#13
ldr.w r12, [r1, #1000]
adds.w r3, r3, r12, lsl#30
adc.w r2, r2, r12, lsr#2
str.w r3, [r0, #340]
ldr.w r12, [r1, #1004]
adds.w r2, r2, r12, lsl#9
adc.w r3, r14, r12, lsr#23
ldr.w r12, [r1, #1008]
adds.w r2, r2, r12, lsl#20
adc.w r3, r3, r12, lsr#12
ldr.w r12, [r1, #1012]
adds.w r2, r2, r12, lsl#31
adc.w r3, r3, r12, lsr#1
str.w r2, [r0, #344]
ldr.w r12, [r1, #1016]
adds.w r3, r3, r12, lsl#10
adc.w r2, r14, r12, lsr#22
ldr.w r12, [r1, #1020]
adds.w r3, r3, r12, lsl#21
adc.w r2, r2, r12, lsr#11
str.w r3, [r0, #348]
ldr.w r12, [r1, #1024]
adds.w r2, r2, r12, lsl#0
adc.w r3, r14, r12, lsr#32
ldr.w r12, [r1, #1028]
adds.w r2, r2, r12, lsl#11
adc.w r3, r3, r12, lsr#21
ldr.w r12, [r1, #1032]
adds.w r2, r2, r12, lsl#22
adc.w r3, r3, r12, lsr#10
str.w r2, [r0, #352]
ldr.w r12, [r1, #1036]
adds.w r3, r3, r12, lsl#1
adc.w r2, r14, r12, lsr#31
ldr.w r12, [r1, #1040]
adds.w r3, r3, r12, lsl#12
adc.w r2, r2, r12, lsr#20
ldr.w r12, [r1, #1044]
adds.w r3, r3, r12, lsl#23
adc.w r2, r2, r12, lsr#9
str.w r3, [r0, #356]
ldr.w r12, [r1, #1048]
adds.w r2, r2, r12, lsl#2
adc.w r3, r14, r12, lsr#30
ldr.w r12, [r1, #1052]
adds.w r2, r2, r12, lsl#13
adc.w r3, r3, r12, lsr#19
ldr.w r12, [r1, #1056]
adds.w r2, r2, r12, lsl#24
adc.w r3, r3, r12, lsr#8
str.w r2, [r0, #360]
ldr.w r12, [r1, #1060]
adds.w r3, r3, r12, lsl#3
adc.w r2, r14, r12, lsr#29
ldr.w r12, [r1, #1064]
adds.w r3, r3, r12, lsl#14
adc.w r2, r2, r12, lsr#18
ldr.w r12, [r1, #1068]
adds.w r3, r3, r12, lsl#25
adc.w r2, r2, r12, lsr#7
str.w r3, [r0, #364]
ldr.w r12, [r1, #1072]
adds.w r2, r2, r12, lsl#4
adc.w r3, r14, r12, lsr#28
ldr.w r12, [r1, #1076]
adds.w r2, r2, r12, lsl#15
adc.w r3, r3, r12, lsr#17
ldr.w r12, [r1, #1080]
adds.w r2, r2, r12, lsl#26
adc.w r3, r3, r12, lsr#6
str.w r2, [r0, #368]
ldr.w r12, [r1, #1084]
adds.w r3, r3, r12, lsl#5
adc.w r2, r14, r12, lsr#27
ldr.w r12, [r1, #1088]
adds.w r3, r3, r12, lsl#16
adc.w r2, r2, r12, lsr#16
ldr.w r12, [r1, #1092]
adds.w r3, r3, r12, lsl#27
adc.w r2, r2, r12, lsr#5
str.w r3, [r0, #372]
ldr.w r12, [r1, #1096]
adds.w r2, r2, r12, lsl#6
adc.w r3, r14, r12, lsr#26
ldr.w r12, [r1, #1100]
adds.w r2, r2, r12, lsl#17
adc.w r3, r3, r12, lsr#15
ldr.w r12, [r1, #1104]
adds.w r2, r2, r12, lsl#28
adc.w r3, r3, r12, lsr#4
str.w r2, [r0, #376]
ldr.w r12, [r1, #1108]
adds.w r3, r3, r12, lsl#7
adc.w r2, r14, r12, lsr#25
ldr.w r12, [r1, #1112]
adds.w r3, r3, r12, lsl#18
adc.w r2, r2, r12, lsr#14
ldr.w r12, [r1, #1116]
adds.w r3, r3, r12, lsl#29
adc.w r2, r2, r12, lsr#3
str.w r3, [r0, #380]
ldr.w r12, [r1, #1120]
adds.w r2, r2, r12, lsl#8
adc.w r3, r14, r12, lsr#24
ldr.w r12, [r1, #1124]
adds.w r2, r2, r12, lsl#19
adc.w r3, r3, r12, lsr#13
ldr.w r12, [r1, #1128]
adds.w r2, r2, r12, lsl#30
adc.w r3, r3, r12, lsr#2
str.w r2, [r0, #384]
ldr.w r12, [r1, #1132]
adds.w r3, r3, r12, lsl#9
adc.w r2, r14, r12, lsr#23
ldr.w r12, [r1, #1136]
adds.w r3, r3, r12, lsl#20
adc.w r2, r2, r12, lsr#12
ldr.w r12, [r1, #1140]
adds.w r3, r3, r12, lsl#31
adc.w r2, r2, r12, lsr#1
str.w r3, [r0, #388]
ldr.w r12, [r1, #1144]
adds.w r2, r2, r12, lsl#10
adc.w r3, r14, r12, lsr#22
ldr.w r12, [r1, #1148]
adds.w r2, r2, r12, lsl#21
adc.w r3, r3, r12, lsr#11
str.w r2, [r0, #392]
ldr.w r12, [r1, #1152]
adds.w r3, r3, r12, lsl#0
adc.w r2, r14, r12, lsr#32
ldr.w r12, [r1, #1156]
adds.w r3, r3, r12, lsl#11
adc.w r2, r2, r12, lsr#21
ldr.w r12, [r1, #1160]
adds.w r3, r3, r12, lsl#22
adc.w r2, r2, r12, lsr#10
str.w r3, [r0, #396]
ldr.w r12, [r1, #1164]
adds.w r2, r2, r12, lsl#1
adc.w r3, r14, r12, lsr#31
ldr.w r12, [r1, #1168]
adds.w r2, r2, r12, lsl#12
adc.w r3, r3, r12, lsr#20
ldr.w r12, [r1, #1172]
adds.w r2, r2, r12, lsl#23
adc.w r3, r3, r12, lsr#9
str.w r2, [r0, #400]
ldr.w r12, [r1, #1176]
adds.w r3, r3, r12, lsl#2
adc.w r2, r14, r12, lsr#30
ldr.w r12, [r1, #1180]
adds.w r3, r3, r12, lsl#13
adc.w r2, r2, r12, lsr#19
ldr.w r12, [r1, #1184]
adds.w r3, r3, r12, lsl#24
adc.w r2, r2, r12, lsr#8
str.w r3, [r0, #404]
ldr.w r12, [r1, #1188]
adds.w r2, r2, r12, lsl#3
adc.w r3, r14, r12, lsr#29
ldr.w r12, [r1, #1192]
adds.w r2, r2, r12, lsl#14
adc.w r3, r3, r12, lsr#18
ldr.w r12, [r1, #1196]
adds.w r2, r2, r12, lsl#25
adc.w r3, r3, r12, lsr#7
str.w r2, [r0, #408]
ldr.w r12, [r1, #1200]
adds.w r3, r3, r12, lsl#4
adc.w r2, r14, r12, lsr#28
ldr.w r12, [r1, #1204]
adds.w r3, r3, r12, lsl#15
adc.w r2, r2, r12, lsr#17
ldr.w r12, [r1, #1208]
adds.w r3, r3, r12, lsl#26
adc.w r2, r2, r12, lsr#6
str.w r3, [r0, #412]
ldr.w r12, [r1, #1212]
adds.w r2, r2, r12, lsl#5
adc.w r3, r14, r12, lsr#27
ldr.w r12, [r1, #1216]
adds.w r2, r2, r12, lsl#16
adc.w r3, r3, r12, lsr#16
ldr.w r12, [r1, #1220]
adds.w r2, r2, r12, lsl#27
adc.w r3, r3, r12, lsr#5
str.w r2, [r0, #416]
ldr.w r12, [r1, #1224]
adds.w r3, r3, r12, lsl#6
adc.w r2, r14, r12, lsr#26
ldr.w r12, [r1, #1228]
adds.w r3, r3, r12, lsl#17
adc.w r2, r2, r12, lsr#15
ldr.w r12, [r1, #1232]
adds.w r3, r3, r12, lsl#28
adc.w r2, r2, r12, lsr#4
str.w r3, [r0, #420]
ldr.w r12, [r1, #1236]
adds.w r2, r2, r12, lsl#7
adc.w r3, r14, r12, lsr#25
ldr.w r12, [r1, #1240]
adds.w r2, r2, r12, lsl#18
adc.w r3, r3, r12, lsr#14
ldr.w r12, [r1, #1244]
adds.w r2, r2, r12, lsl#29
adc.w r3, r3, r12, lsr#3
str.w r2, [r0, #424]
ldr.w r12, [r1, #1248]
adds.w r3, r3, r12, lsl#8
adc.w r2, r14, r12, lsr#24
ldr.w r12, [r1, #1252]
adds.w r3, r3, r12, lsl#19
adc.w r2, r2, r12, lsr#13
ldr.w r12, [r1, #1256]
adds.w r3, r3, r12, lsl#30
adc.w r2, r2, r12, lsr#2
str.w r3, [r0, #428]
ldr.w r12, [r1, #1260]
adds.w r2, r2, r12, lsl#9
adc.w r3, r14, r12, lsr#23
ldr.w r12, [r1, #1264]
adds.w r2, r2, r12, lsl#20
adc.w r3, r3, r12, lsr#12
ldr.w r12, [r1, #1268]
adds.w r2, r2, r12, lsl#31
adc.w r3, r3, r12, lsr#1
str.w r2, [r0, #432]
ldr.w r12, [r1, #1272]
adds.w r3, r3, r12, lsl#10
adc.w r2, r14, r12, lsr#22
ldr.w r12, [r1, #1276]
adds.w r3, r3, r12, lsl#21
adc.w r2, r2, r12, lsr#11
str.w r3, [r0, #436]
ldr.w r12, [r1, #1280]
adds.w r2, r2, r12, lsl#0
adc.w r3, r14, r12, lsr#32
ldr.w r12, [r1, #1284]
adds.w r2, r2, r12, lsl#11
adc.w r3, r3, r12, lsr#21
ldr.w r12, [r1, #1288]
adds.w r2, r2, r12, lsl#22
adc.w r3, r3, r12, lsr#10
str.w r2, [r0, #440]
ldr.w r12, [r1, #1292]
adds.w r3, r3, r12, lsl#1
adc.w r2, r14, r12, lsr#31
ldr.w r12, [r1, #1296]
adds.w r3, r3, r12, lsl#12
adc.w r2, r2, r12, lsr#20
ldr.w r12, [r1, #1300]
adds.w r3, r3, r12, lsl#23
adc.w r2, r2, r12, lsr#9
str.w r3, [r0, #444]
ldr.w r12, [r1, #1304]
adds.w r2, r2, r12, lsl#2
adc.w r3, r14, r12, lsr#30
ldr.w r12, [r1, #1308]
adds.w r2, r2, r12, lsl#13
adc.w r3, r3, r12, lsr#19
ldr.w r12, [r1, #1312]
adds.w r2, r2, r12, lsl#24
adc.w r3, r3, r12, lsr#8
str.w r2, [r0, #448]
ldr.w r12, [r1, #1316]
adds.w r3, r3, r12, lsl#3
adc.w r2, r14, r12, lsr#29
ldr.w r12, [r1, #1320]
adds.w r3, r3, r12, lsl#14
adc.w r2, r2, r12, lsr#18
ldr.w r12, [r1, #1324]
adds.w r3, r3, r12, lsl#25
adc.w r2, r2, r12, lsr#7
str.w r3, [r0, #452]
ldr.w r12, [r1, #1328]
adds.w r2, r2, r12, lsl#4
adc.w r3, r14, r12, lsr#28
ldr.w r12, [r1, #1332]
adds.w r2, r2, r12, lsl#15
adc.w r3, r3, r12, lsr#17
ldr.w r12, [r1, #1336]
adds.w r2, r2, r12, lsl#26
adc.w r3, r3, r12, lsr#6
str.w r2, [r0, #456]
ldr.w r12, [r1, #1340]
adds.w r3, r3, r12, lsl#5
adc.w r2, r14, r12, lsr#27
ldr.w r12, [r1, #1344]
adds.w r3, r3, r12, lsl#16
adc.w r2, r2, r12, lsr#16
ldr.w r12, [r1, #1348]
adds.w r3, r3, r12, lsl#27
adc.w r2, r2, r12, lsr#5
str.w r3, [r0, #460]
ldr.w r12, [r1, #1352]
adds.w r2, r2, r12, lsl#6
adc.w r3, r14, r12, lsr#26
ldr.w r12, [r1, #1356]
adds.w r2, r2, r12, lsl#17
adc.w r3, r3, r12, lsr#15
ldr.w r12, [r1, #1360]
adds.w r2, r2, r12, lsl#28
adc.w r3, r3, r12, lsr#4
str.w r2, [r0, #464]
ldr.w r12, [r1, #1364]
adds.w r3, r3, r12, lsl#7
adc.w r2, r14, r12, lsr#25
ldr.w r12, [r1, #1368]
adds.w r3, r3, r12, lsl#18
adc.w r2, r2, r12, lsr#14
ldr.w r12, [r1, #1372]
adds.w r3, r3, r12, lsl#29
adc.w r2, r2, r12, lsr#3
str.w r3, [r0, #468]
ldr.w r12, [r1, #1376]
adds.w r2, r2, r12, lsl#8
adc.w r3, r14, r12, lsr#24
ldr.w r12, [r1, #1380]
adds.w r2, r2, r12, lsl#19
adc.w r3, r3, r12, lsr#13
ldr.w r12, [r1, #1384]
adds.w r2, r2, r12, lsl#30
adc.w r3, r3, r12, lsr#2
str.w r2, [r0, #472]
ldr.w r12, [r1, #1388]
adds.w r3, r3, r12, lsl#9
adc.w r2, r14, r12, lsr#23
ldr.w r12, [r1, #1392]
adds.w r3, r3, r12, lsl#20
adc.w r2, r2, r12, lsr#12
ldr.w r12, [r1, #1396]
adds.w r3, r3, r12, lsl#31
adc.w r2, r2, r12, lsr#1
str.w r3, [r0, #476]
ldr.w r12, [r1, #1400]
adds.w r2, r2, r12, lsl#10
adc.w r3, r14, r12, lsr#22
ldr.w r12, [r1, #1404]
adds.w r2, r2, r12, lsl#21
adc.w r3, r3, r12, lsr#11
str.w r2, [r0, #480]
ldr.w r12, [r1, #1408]
adds.w r3, r3, r12, lsl#0
adc.w r2, r14, r12, lsr#32
ldr.w r12, [r1, #1412]
adds.w r3, r3, r12, lsl#11
adc.w r2, r2, r12, lsr#21
ldr.w r12, [r1, #1416]
adds.w r3, r3, r12, lsl#22
adc.w r2, r2, r12, lsr#10
str.w r3, [r0, #484]
ldr.w r12, [r1, #1420]
adds.w r2, r2, r12, lsl#1
adc.w r3, r14, r12, lsr#31
ldr.w r12, [r1, #1424]
adds.w r2, r2, r12, lsl#12
adc.w r3, r3, r12, lsr#20
ldr.w r12, [r1, #1428]
adds.w r2, r2, r12, lsl#23
adc.w r3, r3, r12, lsr#9
str.w r2, [r0, #488]
ldr.w r12, [r1, #1432]
adds.w r3, r3, r12, lsl#2
adc.w r2, r14, r12, lsr#30
ldr.w r12, [r1, #1436]
adds.w r3, r3, r12, lsl#13
adc.w r2, r2, r12, lsr#19
ldr.w r12, [r1, #1440]
adds.w r3, r3, r12, lsl#24
adc.w r2, r2, r12, lsr#8
str.w r3, [r0, #492]
ldr.w r12, [r1, #1444]
adds.w r2, r2, r12, lsl#3
adc.w r3, r14, r12, lsr#29
ldr.w r12, [r1, #1448]
adds.w r2, r2, r12, lsl#14
adc.w r3, r3, r12, lsr#18
ldr.w r12, [r1, #1452]
adds.w r2, r2, r12, lsl#25
adc.w r3, r3, r12, lsr#7
str.w r2, [r0, #496]
ldr.w r12, [r1, #1456]
adds.w r3, r3, r12, lsl#4
adc.w r2, r14, r12, lsr#28
ldr.w r12, [r1, #1460]
adds.w r3, r3, r12, lsl#15
adc.w r2, r2, r12, lsr#17
ldr.w r12, [r1, #1464]
adds.w r3, r3, r12, lsl#26
adc.w r2, r2, r12, lsr#6
str.w r3, [r0, #500]
ldr.w r12, [r1, #1468]
adds.w r2, r2, r12, lsl#5
adc.w r3, r14, r12, lsr#27
ldr.w r12, [r1, #1472]
adds.w r2, r2, r12, lsl#16
adc.w r3, r3, r12, lsr#16
ldr.w r12, [r1, #1476]
adds.w r2, r2, r12, lsl#27
adc.w r3, r3, r12, lsr#5
str.w r2, [r0, #504]
ldr.w r12, [r1, #1480]
adds.w r3, r3, r12, lsl#6
adc.w r2, r14, r12, lsr#26
ldr.w r12, [r1, #1484]
adds.w r3, r3, r12, lsl#17
adc.w r2, r2, r12, lsr#15
ldr.w r12, [r1, #1488]
adds.w r3, r3, r12, lsl#28
adc.w r2, r2, r12, lsr#4
str.w r3, [r0, #508]
ldr.w r12, [r1, #1492]
adds.w r2, r2, r12, lsl#7
adc.w r3, r14, r12, lsr#25
ldr.w r12, [r1, #1496]
adds.w r2, r2, r12, lsl#18
adc.w r3, r3, r12, lsr#14
ldr.w r12, [r1, #1500]
adds.w r2, r2, r12, lsl#29
adc.w r3, r3, r12, lsr#3
str.w r2, [r0, #512]
ldr.w r12, [r1, #1504]
adds.w r3, r3, r12, lsl#8
adc.w r2, r14, r12, lsr#24
ldr.w r12, [r1, #1508]
adds.w r3, r3, r12, lsl#19
adc.w r2, r2, r12, lsr#13
ldr.w r12, [r1, #1512]
adds.w r3, r3, r12, lsl#30
adc.w r2, r2, r12, lsr#2
str.w r3, [r0, #516]
ldr.w r12, [r1, #1516]
adds.w r2, r2, r12, lsl#9
adc.w r3, r14, r12, lsr#23
ldr.w r12, [r1, #1520]
adds.w r2, r2, r12, lsl#20
adc.w r3, r3, r12, lsr#12
ldr.w r12, [r1, #1524]
adds.w r2, r2, r12, lsl#31
adc.w r3, r3, r12, lsr#1
str.w r2, [r0, #520]
ldr.w r12, [r1, #1528]
adds.w r3, r3, r12, lsl#10
adc.w r2, r14, r12, lsr#22
ldr.w r12, [r1, #1532]
adds.w r3, r3, r12, lsl#21
adc.w r2, r2, r12, lsr#11
str.w r3, [r0, #524]
pop.w {pc}
