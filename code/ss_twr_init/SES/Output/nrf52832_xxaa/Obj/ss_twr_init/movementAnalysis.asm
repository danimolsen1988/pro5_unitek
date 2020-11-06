	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"movementAnalysis.c"
	.text
.Ltext0:
	.global	tag
	.section	.bss.tag,"aw",%nobits
	.align	3
	.type	tag, %object
	.size	tag, 48
tag:
	.space	48
	.global	State
	.section	.bss.State,"aw",%nobits
	.type	State, %object
	.size	State, 1
State:
	.space	1
	.global	__aeabi_dcmplt
	.section .rodata
	.align	2
.LC0:
	.ascii	"_________________Signal_________________\015\012\000"
	.section	.text.analysis,"ax",%progbits
	.align	1
	.global	analysis
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	analysis, %function
analysis:
.LFB0:
	.file 1 "C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\code\\ss_twr_init\\movementAnalysis\\movementAnalysis.c"
	.loc 1 38 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI0:
	sub	sp, sp, #28
.LCFI1:
	vstr.64	d0, [sp]
	.loc 1 39 29
	ldr	r3, .L15+8
	vldr.64	d7, [r3, #24]
	ldr	r3, .L15+8
	vldr.64	d6, [r3, #32]
	ldr	r3, .L15+8
	vldr.64	d5, [r3, #40]
	vmov.f32	s6, s10
	vmov.f32	s7, s11
	vmov.f32	s4, s12
	vmov.f32	s5, s13
	vmov.f32	s2, s14
	vmov.f32	s3, s15
	vldr.64	d0, [sp]
	bl	ma_filter4
	vstr.64	d0, [sp, #16]
	.loc 1 43 21
	ldr	r3, .L15+8
	vldr.64	d7, [r3, #16]
	vmov.f32	s2, s14
	vmov.f32	s3, s15
	vldr.64	d0, [sp, #16]
	bl	central_difference
	vstr.64	d0, [sp, #8]
	.loc 1 48 22
	ldr	r3, .L15+8
	ldrd	r2, [r3, #32]
	.loc 1 48 17
	ldr	r1, .L15+8
	strd	r2, [r1, #40]
	.loc 1 49 22
	ldr	r3, .L15+8
	ldrd	r2, [r3, #24]
	.loc 1 49 17
	ldr	r1, .L15+8
	strd	r2, [r1, #32]
	.loc 1 50 17
	ldr	r1, .L15+8
	ldrd	r2, [sp]
	strd	r2, [r1, #24]
	.loc 1 51 21
	ldr	r3, .L15+8
	ldrd	r2, [r3, #8]
	.loc 1 51 16
	ldr	r1, .L15+8
	strd	r2, [r1, #16]
	.loc 1 52 21
	ldr	r3, .L15+8
	ldrd	r2, [r3]
	.loc 1 52 16
	ldr	r1, .L15+8
	strd	r2, [r1, #8]
	.loc 1 53 15
	ldr	r1, .L15+8
	ldrd	r2, [sp, #16]
	strd	r2, [r1]
	.loc 1 57 6
	mov	r2, #858993459
	ldr	r3, .L15+12
	ldrd	r0, [sp, #16]
	bl	__aeabi_dcmplt
.LVL0:
	mov	r3, r0
	cmp	r3, #0
	bne	.L11
	.loc 1 86 1
	b	.L14
.L11:
	.loc 1 58 8
	adr	r3, .L15
	ldrd	r2, [r3]
	ldrd	r0, [sp, #8]
	bl	__aeabi_dcmplt
.LVL1:
	mov	r3, r0
	cmp	r3, #0
	beq	.L13
	.loc 1 59 7
	ldr	r3, .L15+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L6
	cmp	r3, #2
	bgt	.L7
	cmp	r3, #0
	beq	.L8
	cmp	r3, #1
	beq	.L9
	b	.L7
.L8:
	.loc 1 63 17
	ldr	r3, .L15+16
	movs	r2, #1
	strb	r2, [r3]
	.loc 1 64 11
	b	.L2
.L9:
	.loc 1 68 17
	ldr	r3, .L15+16
	movs	r2, #2
	strb	r2, [r3]
	.loc 1 69 11
	b	.L2
.L6:
	.loc 1 73 11
	ldr	r0, .L15+20
	bl	printf
	.loc 1 74 17
	ldr	r3, .L15+16
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 75 11
	b	.L2
.L7:
	.loc 1 79 17
	ldr	r3, .L15+16
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 80 11
	b	.L2
.L13:
	.loc 1 84 14
	ldr	r3, .L15+16
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 86 1
	b	.L14
.L2:
.L14:
	nop
	add	sp, sp, #28
.LCFI2:
	@ sp needed
	ldr	pc, [sp], #4
.L16:
	.align	3
.L15:
	.word	1202590843
	.word	1065646817
	.word	tag
	.word	1072902963
	.word	State
	.word	.LC0
.LFE0:
	.size	analysis, .-analysis
	.section	.text.abs_val,"ax",%progbits
	.align	1
	.global	abs_val
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	abs_val, %function
abs_val:
.LFB1:
	.loc 1 92 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
.LCFI3:
	sub	sp, sp, #12
.LCFI4:
	vstr.64	d0, [sp]
	.loc 1 93 5
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, [sp]
	bl	__aeabi_dcmplt
.LVL2:
	mov	r3, r0
	cmp	r3, #0
	beq	.L22
	.loc 1 94 13
	ldr	r4, [sp]
	ldr	r3, [sp, #4]
	eor	r5, r3, #-2147483648
	b	.L20
.L22:
	.loc 1 96 11
	ldrd	r4, [sp]
.L20:
	vmov	d7, r4, r5
	.loc 1 97 1
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	add	sp, sp, #12
.LCFI5:
	@ sp needed
	pop	{r4, r5, pc}
.LFE1:
	.size	abs_val, .-abs_val
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.section	.text.ma_filter3,"ax",%progbits
	.align	1
	.global	ma_filter3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ma_filter3, %function
ma_filter3:
.LFB2:
	.loc 1 102 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI6:
	sub	sp, sp, #36
.LCFI7:
	vstr.64	d0, [sp, #16]
	vstr.64	d1, [sp, #8]
	vstr.64	d2, [sp]
	.loc 1 103 19
	ldrd	r2, [sp, #8]
	ldrd	r0, [sp, #16]
	bl	__aeabi_dadd
.LVL3:
	mov	r2, r0
	mov	r3, r1
	.loc 1 103 10
	ldrd	r0, [sp]
	bl	__aeabi_dadd
.LVL4:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #24]
	.loc 1 104 9
	mov	r2, #0
	ldr	r3, .L25
	ldrd	r0, [sp, #24]
	bl	__aeabi_ddiv
.LVL5:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #24]
	.loc 1 105 10
	ldrd	r2, [sp, #24]
	vmov	d7, r2, r3
	.loc 1 106 1
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	add	sp, sp, #36
.LCFI8:
	@ sp needed
	ldr	pc, [sp], #4
.L26:
	.align	2
.L25:
	.word	1074266112
.LFE2:
	.size	ma_filter3, .-ma_filter3
	.section	.text.ma_filter4,"ax",%progbits
	.align	1
	.global	ma_filter4
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ma_filter4, %function
ma_filter4:
.LFB3:
	.loc 1 110 1
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI9:
	sub	sp, sp, #44
.LCFI10:
	vstr.64	d0, [sp, #24]
	vstr.64	d1, [sp, #16]
	vstr.64	d2, [sp, #8]
	vstr.64	d3, [sp]
	.loc 1 111 19
	ldrd	r2, [sp, #16]
	ldrd	r0, [sp, #24]
	bl	__aeabi_dadd
.LVL6:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 111 21
	ldrd	r2, [sp, #8]
	bl	__aeabi_dadd
.LVL7:
	mov	r2, r0
	mov	r3, r1
	.loc 1 111 10
	ldrd	r0, [sp]
	bl	__aeabi_dadd
.LVL8:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #32]
	.loc 1 112 9
	mov	r2, #0
	ldr	r3, .L29
	ldrd	r0, [sp, #32]
	bl	__aeabi_ddiv
.LVL9:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #32]
	.loc 1 113 10
	ldrd	r2, [sp, #32]
	vmov	d7, r2, r3
	.loc 1 114 1
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	add	sp, sp, #44
.LCFI11:
	@ sp needed
	ldr	pc, [sp], #4
.L30:
	.align	2
.L29:
	.word	1074790400
.LFE3:
	.size	ma_filter4, .-ma_filter4
	.section	.text.ma_filter10,"ax",%progbits
	.align	1
	.global	ma_filter10
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ma_filter10, %function
ma_filter10:
.LFB4:
	.loc 1 118 1
	@ args = 16, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI12:
	sub	sp, sp, #76
.LCFI13:
	vstr.64	d0, [sp, #56]
	vstr.64	d1, [sp, #48]
	vstr.64	d2, [sp, #40]
	vstr.64	d3, [sp, #32]
	vstr.64	d4, [sp, #24]
	vstr.64	d5, [sp, #16]
	vstr.64	d6, [sp, #8]
	vstr.64	d7, [sp]
	.loc 1 119 19
	ldrd	r2, [sp, #48]
	ldrd	r0, [sp, #56]
	bl	__aeabi_dadd
.LVL10:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 119 21
	ldrd	r2, [sp, #40]
	bl	__aeabi_dadd
.LVL11:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 119 23
	ldrd	r2, [sp, #32]
	bl	__aeabi_dadd
.LVL12:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 119 25
	ldrd	r2, [sp, #24]
	bl	__aeabi_dadd
.LVL13:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 119 27
	ldrd	r2, [sp, #16]
	bl	__aeabi_dadd
.LVL14:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 119 29
	ldrd	r2, [sp, #8]
	bl	__aeabi_dadd
.LVL15:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 119 31
	ldrd	r2, [sp]
	bl	__aeabi_dadd
.LVL16:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 119 33
	ldrd	r2, [sp, #80]
	bl	__aeabi_dadd
.LVL17:
	mov	r2, r0
	mov	r3, r1
	.loc 1 119 10
	ldrd	r0, [sp, #88]
	bl	__aeabi_dadd
.LVL18:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #64]
	.loc 1 120 9
	mov	r2, #0
	ldr	r3, .L33
	ldrd	r0, [sp, #64]
	bl	__aeabi_ddiv
.LVL19:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #64]
	.loc 1 121 10
	ldrd	r2, [sp, #64]
	vmov	d7, r2, r3
	.loc 1 122 1
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	add	sp, sp, #76
.LCFI14:
	@ sp needed
	ldr	pc, [sp], #4
.L34:
	.align	2
.L33:
	.word	1076101120
.LFE4:
	.size	ma_filter10, .-ma_filter10
	.global	__aeabi_f2d
	.global	__aeabi_dmul
	.section	.text.central_difference,"ax",%progbits
	.align	1
	.global	central_difference
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	central_difference, %function
central_difference:
.LFB5:
	.loc 1 125 60
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
.LCFI15:
	sub	sp, sp, #36
.LCFI16:
	vstr.64	d0, [sp, #8]
	vstr.64	d1, [sp]
	.loc 1 126 9
	mov	r3, #1056964608
	str	r3, [sp, #28]	@ float
	.loc 1 127 9
	mov	r3, #-1090519040
	str	r3, [sp, #24]	@ float
	.loc 1 128 33
	ldr	r0, [sp, #28]	@ float
	bl	__aeabi_f2d
.LVL20:
	ldrd	r2, [sp, #8]
	bl	__aeabi_dmul
.LVL21:
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	.loc 1 128 50
	ldr	r0, [sp, #24]	@ float
	bl	__aeabi_f2d
.LVL22:
	ldrd	r2, [sp]
	bl	__aeabi_dmul
.LVL23:
	mov	r2, r0
	mov	r3, r1
	.loc 1 128 10
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
.LVL24:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #16]
	.loc 1 129 17
	vldr.64	d0, [sp, #16]
	bl	abs_val
	vstr.64	d0, [sp, #16]
	.loc 1 130 10
	ldrd	r2, [sp, #16]
	vmov	d7, r2, r3
	.loc 1 131 1
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	add	sp, sp, #36
.LCFI17:
	@ sp needed
	pop	{r4, r5, pc}
.LFE5:
	.size	central_difference, .-central_difference
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI3-.LFB1
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0xc
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI6-.LFB2
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI9-.LFB3
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI12-.LFB4
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x50
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI15-.LFB5
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0xc
	.align	2
.LEFDE10:
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/__crossworks.h"
	.file 3 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/stdio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x8ce
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF112
	.byte	0xc
	.4byte	.LASF113
	.4byte	.LASF114
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF52
	.byte	0x8
	.byte	0x2
	.byte	0x7c
	.byte	0x8
	.4byte	0x4d
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x7d
	.byte	0x7
	.4byte	0x4d
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x7e
	.byte	0x8
	.4byte	0x54
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x74
	.uleb128 0x7
	.4byte	0x74
	.uleb128 0x7
	.4byte	0x86
	.uleb128 0x7
	.4byte	0x8d
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x7a
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x9
	.4byte	0x7a
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x8
	.byte	0x4
	.4byte	0x25
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0xb1
	.uleb128 0x7
	.4byte	0xb1
	.uleb128 0x7
	.4byte	0xb7
	.uleb128 0x7
	.4byte	0x86
	.uleb128 0x7
	.4byte	0x8d
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x86
	.uleb128 0x8
	.byte	0x4
	.4byte	0x81
	.uleb128 0xa
	.byte	0x58
	.byte	0x2
	.byte	0x84
	.byte	0x9
	.4byte	0x267
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x86
	.byte	0xf
	.4byte	0xb7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x87
	.byte	0xf
	.4byte	0xb7
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x88
	.byte	0xf
	.4byte	0xb7
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x8a
	.byte	0xf
	.4byte	0xb7
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x8b
	.byte	0xf
	.4byte	0xb7
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x8c
	.byte	0xf
	.4byte	0xb7
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x8d
	.byte	0xf
	.4byte	0xb7
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x2
	.byte	0x8e
	.byte	0xf
	.4byte	0xb7
	.byte	0x1c
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x8f
	.byte	0xf
	.4byte	0xb7
	.byte	0x20
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x90
	.byte	0xf
	.4byte	0xb7
	.byte	0x24
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0x92
	.byte	0x8
	.4byte	0x7a
	.byte	0x28
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x2
	.byte	0x93
	.byte	0x8
	.4byte	0x7a
	.byte	0x29
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x2
	.byte	0x94
	.byte	0x8
	.4byte	0x7a
	.byte	0x2a
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x2
	.byte	0x95
	.byte	0x8
	.4byte	0x7a
	.byte	0x2b
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x2
	.byte	0x96
	.byte	0x8
	.4byte	0x7a
	.byte	0x2c
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x2
	.byte	0x97
	.byte	0x8
	.4byte	0x7a
	.byte	0x2d
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x2
	.byte	0x98
	.byte	0x8
	.4byte	0x7a
	.byte	0x2e
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x2
	.byte	0x99
	.byte	0x8
	.4byte	0x7a
	.byte	0x2f
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x2
	.byte	0x9a
	.byte	0x8
	.4byte	0x7a
	.byte	0x30
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x2
	.byte	0x9b
	.byte	0x8
	.4byte	0x7a
	.byte	0x31
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x2
	.byte	0x9c
	.byte	0x8
	.4byte	0x7a
	.byte	0x32
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x2
	.byte	0x9d
	.byte	0x8
	.4byte	0x7a
	.byte	0x33
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x2
	.byte	0x9e
	.byte	0x8
	.4byte	0x7a
	.byte	0x34
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x2
	.byte	0x9f
	.byte	0x8
	.4byte	0x7a
	.byte	0x35
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0x2
	.byte	0xa4
	.byte	0xf
	.4byte	0xb7
	.byte	0x38
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x2
	.byte	0xa5
	.byte	0xf
	.4byte	0xb7
	.byte	0x3c
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x2
	.byte	0xa6
	.byte	0xf
	.4byte	0xb7
	.byte	0x40
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x2
	.byte	0xa7
	.byte	0xf
	.4byte	0xb7
	.byte	0x44
	.uleb128 0x3
	.4byte	.LASF33
	.byte	0x2
	.byte	0xa8
	.byte	0xf
	.4byte	0xb7
	.byte	0x48
	.uleb128 0x3
	.4byte	.LASF34
	.byte	0x2
	.byte	0xa9
	.byte	0xf
	.4byte	0xb7
	.byte	0x4c
	.uleb128 0x3
	.4byte	.LASF35
	.byte	0x2
	.byte	0xaa
	.byte	0xf
	.4byte	0xb7
	.byte	0x50
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x2
	.byte	0xab
	.byte	0xf
	.4byte	0xb7
	.byte	0x54
	.byte	0
	.uleb128 0xb
	.4byte	.LASF46
	.byte	0x2
	.byte	0xac
	.byte	0x3
	.4byte	0xbd
	.uleb128 0x9
	.4byte	0x267
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF37
	.uleb128 0x9
	.4byte	0x278
	.uleb128 0xa
	.byte	0x20
	.byte	0x2
	.byte	0xc2
	.byte	0x9
	.4byte	0x2f6
	.uleb128 0x3
	.4byte	.LASF38
	.byte	0x2
	.byte	0xc4
	.byte	0x9
	.4byte	0x30a
	.byte	0
	.uleb128 0x3
	.4byte	.LASF39
	.byte	0x2
	.byte	0xc5
	.byte	0x9
	.4byte	0x31f
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF40
	.byte	0x2
	.byte	0xc6
	.byte	0x9
	.4byte	0x31f
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF41
	.byte	0x2
	.byte	0xc9
	.byte	0x9
	.4byte	0x339
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF42
	.byte	0x2
	.byte	0xca
	.byte	0xa
	.4byte	0x34e
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF43
	.byte	0x2
	.byte	0xcb
	.byte	0xa
	.4byte	0x34e
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF44
	.byte	0x2
	.byte	0xce
	.byte	0x9
	.4byte	0x354
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF45
	.byte	0x2
	.byte	0xcf
	.byte	0x9
	.4byte	0x35a
	.byte	0x1c
	.byte	0
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x30a
	.uleb128 0x7
	.4byte	0x4d
	.uleb128 0x7
	.4byte	0x4d
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x2f6
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x31f
	.uleb128 0x7
	.4byte	0x4d
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x310
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x339
	.uleb128 0x7
	.4byte	0x54
	.uleb128 0x7
	.4byte	0x4d
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x325
	.uleb128 0x6
	.4byte	0x54
	.4byte	0x34e
	.uleb128 0x7
	.4byte	0x54
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x33f
	.uleb128 0x8
	.byte	0x4
	.4byte	0x5b
	.uleb128 0x8
	.byte	0x4
	.4byte	0x93
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x2
	.byte	0xd0
	.byte	0x3
	.4byte	0x284
	.uleb128 0x9
	.4byte	0x360
	.uleb128 0xa
	.byte	0xc
	.byte	0x2
	.byte	0xd2
	.byte	0x9
	.4byte	0x3a2
	.uleb128 0x3
	.4byte	.LASF48
	.byte	0x2
	.byte	0xd3
	.byte	0xf
	.4byte	0xb7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF49
	.byte	0x2
	.byte	0xd4
	.byte	0x25
	.4byte	0x3a2
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF50
	.byte	0x2
	.byte	0xd5
	.byte	0x28
	.4byte	0x3a8
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x273
	.uleb128 0x8
	.byte	0x4
	.4byte	0x36c
	.uleb128 0xb
	.4byte	.LASF51
	.byte	0x2
	.byte	0xd6
	.byte	0x3
	.4byte	0x371
	.uleb128 0x9
	.4byte	0x3ae
	.uleb128 0x2
	.4byte	.LASF53
	.byte	0x14
	.byte	0x2
	.byte	0xda
	.byte	0x10
	.4byte	0x3da
	.uleb128 0x3
	.4byte	.LASF54
	.byte	0x2
	.byte	0xdb
	.byte	0x20
	.4byte	0x3da
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	0x3ea
	.4byte	0x3ea
	.uleb128 0xd
	.4byte	0x86
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x3ba
	.uleb128 0xe
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x104
	.byte	0x1a
	.4byte	0x3bf
	.uleb128 0xe
	.4byte	.LASF56
	.byte	0x2
	.2byte	0x10b
	.byte	0x24
	.4byte	0x3ba
	.uleb128 0xe
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x10e
	.byte	0x2c
	.4byte	0x36c
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x2
	.2byte	0x10f
	.byte	0x2c
	.4byte	0x36c
	.uleb128 0xc
	.4byte	0x27f
	.4byte	0x434
	.uleb128 0xd
	.4byte	0x86
	.byte	0x7f
	.byte	0
	.uleb128 0x9
	.4byte	0x424
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x111
	.byte	0x23
	.4byte	0x434
	.uleb128 0xc
	.4byte	0x81
	.4byte	0x451
	.uleb128 0xf
	.byte	0
	.uleb128 0x9
	.4byte	0x446
	.uleb128 0xe
	.4byte	.LASF60
	.byte	0x2
	.2byte	0x113
	.byte	0x13
	.4byte	0x451
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x114
	.byte	0x13
	.4byte	0x451
	.uleb128 0xe
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x115
	.byte	0x13
	.4byte	0x451
	.uleb128 0xe
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x116
	.byte	0x13
	.4byte	0x451
	.uleb128 0xe
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x118
	.byte	0x13
	.4byte	0x451
	.uleb128 0xe
	.4byte	.LASF65
	.byte	0x2
	.2byte	0x119
	.byte	0x13
	.4byte	0x451
	.uleb128 0xe
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x11a
	.byte	0x13
	.4byte	0x451
	.uleb128 0xe
	.4byte	.LASF67
	.byte	0x2
	.2byte	0x11b
	.byte	0x13
	.4byte	0x451
	.uleb128 0xe
	.4byte	.LASF68
	.byte	0x2
	.2byte	0x11c
	.byte	0x13
	.4byte	0x451
	.uleb128 0xe
	.4byte	.LASF69
	.byte	0x2
	.2byte	0x11d
	.byte	0x13
	.4byte	0x451
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x4e7
	.uleb128 0x7
	.4byte	0x4e7
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x4f2
	.uleb128 0x10
	.4byte	.LASF80
	.uleb128 0x9
	.4byte	0x4ed
	.uleb128 0xe
	.4byte	.LASF70
	.byte	0x2
	.2byte	0x133
	.byte	0xe
	.4byte	0x504
	.uleb128 0x8
	.byte	0x4
	.4byte	0x4d8
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x519
	.uleb128 0x7
	.4byte	0x519
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x4ed
	.uleb128 0xe
	.4byte	.LASF71
	.byte	0x2
	.2byte	0x134
	.byte	0xe
	.4byte	0x52c
	.uleb128 0x8
	.byte	0x4
	.4byte	0x50a
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF72
	.uleb128 0x11
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x14b
	.byte	0x18
	.4byte	0x546
	.uleb128 0x8
	.byte	0x4
	.4byte	0x54c
	.uleb128 0x6
	.4byte	0xb7
	.4byte	0x55b
	.uleb128 0x7
	.4byte	0x4d
	.byte	0
	.uleb128 0x12
	.4byte	.LASF74
	.byte	0x8
	.byte	0x2
	.2byte	0x14d
	.byte	0x10
	.4byte	0x586
	.uleb128 0x13
	.4byte	.LASF75
	.byte	0x2
	.2byte	0x14f
	.byte	0x1c
	.4byte	0x539
	.byte	0
	.uleb128 0x13
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x150
	.byte	0x21
	.4byte	0x586
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x55b
	.uleb128 0x11
	.4byte	.LASF77
	.byte	0x2
	.2byte	0x151
	.byte	0x3
	.4byte	0x55b
	.uleb128 0xe
	.4byte	.LASF78
	.byte	0x2
	.2byte	0x155
	.byte	0x1f
	.4byte	0x5a6
	.uleb128 0x8
	.byte	0x4
	.4byte	0x58c
	.uleb128 0x11
	.4byte	.LASF79
	.byte	0x3
	.2byte	0x311
	.byte	0x1b
	.4byte	0x5b9
	.uleb128 0x10
	.4byte	.LASF81
	.uleb128 0xe
	.4byte	.LASF82
	.byte	0x3
	.2byte	0x315
	.byte	0xe
	.4byte	0x5cb
	.uleb128 0x8
	.byte	0x4
	.4byte	0x5ac
	.uleb128 0xe
	.4byte	.LASF83
	.byte	0x3
	.2byte	0x316
	.byte	0xe
	.4byte	0x5cb
	.uleb128 0xe
	.4byte	.LASF84
	.byte	0x3
	.2byte	0x317
	.byte	0xe
	.4byte	0x5cb
	.uleb128 0x2
	.4byte	.LASF85
	.byte	0x30
	.byte	0x1
	.byte	0xb
	.byte	0x8
	.4byte	0x647
	.uleb128 0x3
	.4byte	.LASF86
	.byte	0x1
	.byte	0xd
	.byte	0xa
	.4byte	0x647
	.byte	0
	.uleb128 0x3
	.4byte	.LASF87
	.byte	0x1
	.byte	0xe
	.byte	0xa
	.4byte	0x647
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF88
	.byte	0x1
	.byte	0xf
	.byte	0xa
	.4byte	0x647
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF89
	.byte	0x1
	.byte	0x10
	.byte	0xa
	.4byte	0x647
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF90
	.byte	0x1
	.byte	0x11
	.byte	0xa
	.4byte	0x647
	.byte	0x20
	.uleb128 0x3
	.4byte	.LASF91
	.byte	0x1
	.byte	0x12
	.byte	0xa
	.4byte	0x647
	.byte	0x28
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.4byte	.LASF92
	.uleb128 0x14
	.ascii	"tag\000"
	.byte	0x1
	.byte	0x13
	.byte	0x3
	.4byte	0x5eb
	.uleb128 0x5
	.byte	0x3
	.4byte	tag
	.uleb128 0x15
	.byte	0x7
	.byte	0x1
	.4byte	0x278
	.byte	0x1
	.byte	0x16
	.byte	0xd
	.4byte	0x681
	.uleb128 0x16
	.4byte	.LASF93
	.byte	0
	.uleb128 0x16
	.4byte	.LASF94
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF95
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.4byte	.LASF96
	.byte	0x1
	.byte	0x1a
	.byte	0x3
	.4byte	0x660
	.uleb128 0x17
	.4byte	.LASF97
	.byte	0x1
	.byte	0x1b
	.byte	0xc
	.4byte	0x681
	.uleb128 0x5
	.byte	0x3
	.4byte	State
	.uleb128 0x18
	.4byte	.LASF103
	.byte	0x1
	.byte	0x7d
	.byte	0x8
	.4byte	0x647
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x705
	.uleb128 0x19
	.4byte	.LASF98
	.byte	0x1
	.byte	0x7d
	.byte	0x22
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.4byte	.LASF88
	.byte	0x1
	.byte	0x7d
	.byte	0x33
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.4byte	.LASF99
	.byte	0x1
	.byte	0x7e
	.byte	0x9
	.4byte	0x705
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF100
	.byte	0x1
	.byte	0x7f
	.byte	0x9
	.4byte	0x705
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LASF101
	.byte	0x1
	.byte	0x80
	.byte	0xa
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.4byte	.LASF102
	.uleb128 0x18
	.4byte	.LASF104
	.byte	0x1
	.byte	0x75
	.byte	0x8
	.4byte	0x647
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7ba
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x75
	.byte	0x1b
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.ascii	"b\000"
	.byte	0x1
	.byte	0x75
	.byte	0x25
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.ascii	"c\000"
	.byte	0x1
	.byte	0x75
	.byte	0x2f
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.ascii	"d\000"
	.byte	0x1
	.byte	0x75
	.byte	0x39
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.ascii	"e\000"
	.byte	0x1
	.byte	0x75
	.byte	0x43
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.ascii	"f\000"
	.byte	0x1
	.byte	0x75
	.byte	0x4d
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1b
	.ascii	"g\000"
	.byte	0x1
	.byte	0x75
	.byte	0x57
	.4byte	0x647
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1b
	.ascii	"h\000"
	.byte	0x1
	.byte	0x75
	.byte	0x61
	.4byte	0x647
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1b
	.ascii	"i\000"
	.byte	0x1
	.byte	0x75
	.byte	0x6b
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.ascii	"j\000"
	.byte	0x1
	.byte	0x75
	.byte	0x75
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.4byte	.LASF105
	.byte	0x1
	.byte	0x77
	.byte	0xa
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.4byte	.LASF106
	.byte	0x1
	.byte	0x6d
	.byte	0x8
	.4byte	0x647
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x818
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x6d
	.byte	0x1a
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.ascii	"b\000"
	.byte	0x1
	.byte	0x6d
	.byte	0x24
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.ascii	"c\000"
	.byte	0x1
	.byte	0x6d
	.byte	0x2e
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.ascii	"d\000"
	.byte	0x1
	.byte	0x6d
	.byte	0x38
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.4byte	.LASF105
	.byte	0x1
	.byte	0x6f
	.byte	0xa
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.4byte	.LASF107
	.byte	0x1
	.byte	0x65
	.byte	0x8
	.4byte	0x647
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x869
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x65
	.byte	0x1a
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.ascii	"b\000"
	.byte	0x1
	.byte	0x65
	.byte	0x24
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.ascii	"c\000"
	.byte	0x1
	.byte	0x65
	.byte	0x2e
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.4byte	.LASF105
	.byte	0x1
	.byte	0x67
	.byte	0xa
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.4byte	.LASF108
	.byte	0x1
	.byte	0x5b
	.byte	0x8
	.4byte	0x647
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x891
	.uleb128 0x1b
	.ascii	"y\000"
	.byte	0x1
	.byte	0x5b
	.byte	0x17
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF115
	.byte	0x1
	.byte	0x25
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x19
	.4byte	.LASF109
	.byte	0x1
	.byte	0x25
	.byte	0x16
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.4byte	.LASF110
	.byte	0x1
	.byte	0x27
	.byte	0xa
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF111
	.byte	0x1
	.byte	0x2b
	.byte	0xa
	.4byte	0x647
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x2134
	.uleb128 0x19
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xaf
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x8d2
	.4byte	0x64e
	.ascii	"tag\000"
	.4byte	0x66e
	.ascii	"First\000"
	.4byte	0x674
	.ascii	"Second\000"
	.4byte	0x67a
	.ascii	"Third\000"
	.4byte	0x68d
	.ascii	"State\000"
	.4byte	0x64e
	.ascii	"tag\000"
	.4byte	0x68d
	.ascii	"State\000"
	.4byte	0x69f
	.ascii	"central_difference\000"
	.4byte	0x70c
	.ascii	"ma_filter10\000"
	.4byte	0x7ba
	.ascii	"ma_filter4\000"
	.4byte	0x818
	.ascii	"ma_filter3\000"
	.4byte	0x869
	.ascii	"abs_val\000"
	.4byte	0x891
	.ascii	"analysis\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x156
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x8d2
	.4byte	0x4d
	.ascii	"int\000"
	.4byte	0x54
	.ascii	"long int\000"
	.4byte	0x25
	.ascii	"__mbstate_s\000"
	.4byte	0x7a
	.ascii	"char\000"
	.4byte	0x86
	.ascii	"unsigned int\000"
	.4byte	0x267
	.ascii	"__RAL_locale_data_t\000"
	.4byte	0x278
	.ascii	"unsigned char\000"
	.4byte	0x360
	.ascii	"__RAL_locale_codeset_t\000"
	.4byte	0x3ae
	.ascii	"__RAL_locale_t\000"
	.4byte	0x3bf
	.ascii	"__locale_s\000"
	.4byte	0x532
	.ascii	"short unsigned int\000"
	.4byte	0x539
	.ascii	"__RAL_error_decoder_fn_t\000"
	.4byte	0x55b
	.ascii	"__RAL_error_decoder_s\000"
	.4byte	0x58c
	.ascii	"__RAL_error_decoder_t\000"
	.4byte	0x5ac
	.ascii	"FILE\000"
	.4byte	0x647
	.ascii	"double\000"
	.4byte	0x5eb
	.ascii	"Movement\000"
	.4byte	0x681
	.ascii	"State_type\000"
	.4byte	0x705
	.ascii	"float\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x44
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF52:
	.ascii	"__mbstate_s\000"
.LASF41:
	.ascii	"__iswctype\000"
.LASF27:
	.ascii	"int_p_sign_posn\000"
.LASF36:
	.ascii	"date_time_format\000"
.LASF78:
	.ascii	"__RAL_error_decoder_head\000"
.LASF69:
	.ascii	"__RAL_data_empty_string\000"
.LASF26:
	.ascii	"int_n_sep_by_space\000"
.LASF108:
	.ascii	"abs_val\000"
.LASF53:
	.ascii	"__locale_s\000"
.LASF31:
	.ascii	"month_names\000"
.LASF1:
	.ascii	"__wchar\000"
.LASF61:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
.LASF20:
	.ascii	"n_sep_by_space\000"
.LASF95:
	.ascii	"Third\000"
.LASF40:
	.ascii	"__tolower\000"
.LASF106:
	.ascii	"ma_filter4\000"
.LASF22:
	.ascii	"n_sign_posn\000"
.LASF35:
	.ascii	"time_format\000"
.LASF46:
	.ascii	"__RAL_locale_data_t\000"
.LASF111:
	.ascii	"velocity\000"
.LASF58:
	.ascii	"__RAL_codeset_utf8\000"
.LASF62:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF17:
	.ascii	"p_cs_precedes\000"
.LASF104:
	.ascii	"ma_filter10\000"
.LASF28:
	.ascii	"int_n_sign_posn\000"
.LASF99:
	.ascii	"coef1\000"
.LASF100:
	.ascii	"coef2\000"
.LASF64:
	.ascii	"__RAL_data_utf8_period\000"
.LASF25:
	.ascii	"int_p_sep_by_space\000"
.LASF74:
	.ascii	"__RAL_error_decoder_s\000"
.LASF77:
	.ascii	"__RAL_error_decoder_t\000"
.LASF10:
	.ascii	"mon_decimal_point\000"
.LASF5:
	.ascii	"decimal_point\000"
.LASF102:
	.ascii	"float\000"
.LASF103:
	.ascii	"central_difference\000"
.LASF15:
	.ascii	"int_frac_digits\000"
.LASF84:
	.ascii	"stderr\000"
.LASF50:
	.ascii	"codeset\000"
.LASF18:
	.ascii	"p_sep_by_space\000"
.LASF54:
	.ascii	"__category\000"
.LASF7:
	.ascii	"grouping\000"
.LASF97:
	.ascii	"State\000"
.LASF39:
	.ascii	"__toupper\000"
.LASF2:
	.ascii	"long int\000"
.LASF86:
	.ascii	"old_avg\000"
.LASF101:
	.ascii	"cd_velocity\000"
.LASF114:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\SES\000"
.LASF87:
	.ascii	"old_avg2\000"
.LASF43:
	.ascii	"__towlower\000"
.LASF88:
	.ascii	"old_avg3\000"
.LASF14:
	.ascii	"negative_sign\000"
.LASF75:
	.ascii	"decode\000"
.LASF48:
	.ascii	"name\000"
.LASF63:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF21:
	.ascii	"p_sign_posn\000"
.LASF73:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF90:
	.ascii	"old_dist2\000"
.LASF89:
	.ascii	"old_dist1\000"
.LASF70:
	.ascii	"__user_set_time_of_day\000"
.LASF37:
	.ascii	"unsigned char\000"
.LASF56:
	.ascii	"__RAL_c_locale\000"
.LASF57:
	.ascii	"__RAL_codeset_ascii\000"
.LASF9:
	.ascii	"currency_symbol\000"
.LASF12:
	.ascii	"mon_grouping\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF29:
	.ascii	"day_names\000"
.LASF109:
	.ascii	"distance\000"
.LASF98:
	.ascii	"avg_dist\000"
.LASF33:
	.ascii	"am_pm_indicator\000"
.LASF42:
	.ascii	"__towupper\000"
.LASF8:
	.ascii	"int_curr_symbol\000"
.LASF67:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF113:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\movementAnalysis\\movementAnalysis"
	.ascii	".c\000"
.LASF107:
	.ascii	"ma_filter3\000"
.LASF3:
	.ascii	"char\000"
.LASF71:
	.ascii	"__user_get_time_of_day\000"
.LASF19:
	.ascii	"n_cs_precedes\000"
.LASF112:
	.ascii	"GNU C99 9.3.1 20200408 (release) -fmessage-length=0"
	.ascii	" -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -"
	.ascii	"mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-acce"
	.ascii	"ss -std=gnu99 -g2 -gpubnames -fomit-frame-pointer -"
	.ascii	"fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections"
	.ascii	" -fdata-sections -fshort-enums -fno-common\000"
.LASF66:
	.ascii	"__RAL_data_utf8_space\000"
.LASF49:
	.ascii	"data\000"
.LASF79:
	.ascii	"FILE\000"
.LASF72:
	.ascii	"short unsigned int\000"
.LASF16:
	.ascii	"frac_digits\000"
.LASF59:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF94:
	.ascii	"Second\000"
.LASF55:
	.ascii	"__RAL_global_locale\000"
.LASF92:
	.ascii	"double\000"
.LASF93:
	.ascii	"First\000"
.LASF80:
	.ascii	"timeval\000"
.LASF60:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF81:
	.ascii	"__RAL_FILE\000"
.LASF32:
	.ascii	"abbrev_month_names\000"
.LASF47:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF82:
	.ascii	"stdin\000"
.LASF13:
	.ascii	"positive_sign\000"
.LASF85:
	.ascii	"Movement\000"
.LASF45:
	.ascii	"__mbtowc\000"
.LASF51:
	.ascii	"__RAL_locale_t\000"
.LASF34:
	.ascii	"date_format\000"
.LASF105:
	.ascii	"total\000"
.LASF65:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF11:
	.ascii	"mon_thousands_sep\000"
.LASF6:
	.ascii	"thousands_sep\000"
.LASF24:
	.ascii	"int_n_cs_precedes\000"
.LASF38:
	.ascii	"__isctype\000"
.LASF0:
	.ascii	"__state\000"
.LASF115:
	.ascii	"analysis\000"
.LASF110:
	.ascii	"average_distance\000"
.LASF96:
	.ascii	"State_type\000"
.LASF68:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF23:
	.ascii	"int_p_cs_precedes\000"
.LASF91:
	.ascii	"old_dist3\000"
.LASF30:
	.ascii	"abbrev_day_names\000"
.LASF44:
	.ascii	"__wctomb\000"
.LASF83:
	.ascii	"stdout\000"
.LASF76:
	.ascii	"next\000"
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
