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
	.section	.bss.delayTimerInitialized,"aw",%nobits
	.type	delayTimerInitialized, %object
	.size	delayTimerInitialized, 1
delayTimerInitialized:
	.space	1
	.section	.bss.delaySample,"aw",%nobits
	.type	delaySample, %object
	.size	delaySample, 1
delaySample:
	.space	1
	.section	.bss.delay_timer_id_data,"aw",%nobits
	.align	2
	.type	delay_timer_id_data, %object
	.size	delay_timer_id_data, 32
delay_timer_id_data:
	.space	32
	.section	.rodata.delay_timer_id,"a"
	.align	2
	.type	delay_timer_id, %object
	.size	delay_timer_id, 4
delay_timer_id:
	.word	delay_timer_id_data
	.global	__aeabi_dcmplt
	.section	.text.analysis,"ax",%progbits
	.align	1
	.global	analysis
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	analysis, %function
analysis:
.LFB207:
	.file 1 "C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\code\\ss_twr_init\\movementAnalysis\\movementAnalysis.c"
	.loc 1 19 1
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI0:
	sub	sp, sp, #44
.LCFI1:
	str	r0, [sp, #12]
	vstr.64	d0, [sp]
	.loc 1 20 29
	ldr	r3, [sp, #12]
	vldr.64	d7, [r3, #56]
	ldr	r3, [sp, #12]
	vldr.64	d6, [r3, #64]
	ldr	r3, [sp, #12]
	vldr.64	d5, [r3, #72]
	vmov.f32	s6, s10
	vmov.f32	s7, s11
	vmov.f32	s4, s12
	vmov.f32	s5, s13
	vmov.f32	s2, s14
	vmov.f32	s3, s15
	vldr.64	d0, [sp]
	bl	ma_filter4
	vstr.64	d0, [sp, #32]
	.loc 1 21 21
	ldr	r3, [sp, #12]
	vldr.64	d7, [r3, #48]
	vmov.f32	s2, s14
	vmov.f32	s3, s15
	vldr.64	d0, [sp, #32]
	bl	central_difference
	vstr.64	d0, [sp, #24]
	.loc 1 23 23
	ldr	r3, [sp, #12]
	ldrd	r2, [r3, #64]
	.loc 1 23 18
	ldr	r1, [sp, #12]
	strd	r2, [r1, #72]
	.loc 1 24 23
	ldr	r3, [sp, #12]
	ldrd	r2, [r3, #56]
	.loc 1 24 18
	ldr	r1, [sp, #12]
	strd	r2, [r1, #64]
	.loc 1 25 18
	ldr	r1, [sp, #12]
	ldrd	r2, [sp]
	strd	r2, [r1, #56]
	.loc 1 26 22
	ldr	r3, [sp, #12]
	ldrd	r2, [r3, #40]
	.loc 1 26 17
	ldr	r1, [sp, #12]
	strd	r2, [r1, #48]
	.loc 1 27 22
	ldr	r3, [sp, #12]
	ldrd	r2, [r3, #32]
	.loc 1 27 17
	ldr	r1, [sp, #12]
	strd	r2, [r1, #40]
	.loc 1 28 16
	ldr	r1, [sp, #12]
	ldrd	r2, [sp, #32]
	strd	r2, [r1, #32]
	.loc 1 30 19
	ldr	r3, .L14+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 30 6
	cmp	r3, #0
	beq	.L2
	.loc 1 31 12
	movs	r3, #0
	b	.L1
.L2:
	.loc 1 34 6
	mov	r2, #858993459
	ldr	r3, .L14+12
	ldrd	r0, [sp, #32]
	bl	__aeabi_dcmplt
.LVL0:
	mov	r3, r0
	cmp	r3, #0
	beq	.L12
	.loc 1 35 8
	adr	r3, .L14
	ldrd	r2, [r3]
	ldrd	r0, [sp, #24]
	bl	__aeabi_dcmplt
.LVL1:
	mov	r3, r0
	cmp	r3, #0
	beq	.L13
.LBB2:
	.loc 1 36 10
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #80]
	.loc 1 36 13
	adds	r2, r3, #1
	ldr	r3, [sp, #12]
	str	r2, [r3, #80]
	.loc 1 37 16
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #80]
	.loc 1 37 12
	cmp	r3, #3
	bne	.L8
	.loc 1 38 18
	ldr	r3, [sp, #12]
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 39 18
	movs	r3, #1
	b	.L1
.L8:
	.loc 1 42 18
	ldr	r3, .L14+16
	movs	r2, #0
	movs	r1, #205
	mov	r0, r3
	bl	app_timer_start
	str	r0, [sp, #20]
.LBB3:
	.loc 1 43 7
	ldr	r3, [sp, #20]
	str	r3, [sp, #16]
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L9
	.loc 1 43 7 is_stmt 0 discriminator 1
	ldr	r0, [sp, #16]
	bl	app_error_handler_bare
.L9:
.LBE3:
	.loc 1 44 19 is_stmt 1
	ldr	r3, .L14+8
	movs	r2, #1
	strb	r2, [r3]
	.loc 1 45 14
	movs	r3, #0
	b	.L1
.L13:
.LBE2:
	.loc 1 48 16
	ldr	r3, [sp, #12]
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 49 16
	movs	r3, #0
	b	.L1
.L12:
.L1:
	.loc 1 53 1
	mov	r0, r3
	add	sp, sp, #44
.LCFI2:
	@ sp needed
	ldr	pc, [sp], #4
.L15:
	.align	3
.L14:
	.word	1202590843
	.word	1065646817
	.word	delaySample
	.word	1072902963
	.word	delay_timer_id_data
.LFE207:
	.size	analysis, .-analysis
	.section	.text.delayTimerhandler,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	delayTimerhandler, %function
delayTimerhandler:
.LFB208:
	.loc 1 58 49
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI3:
	str	r0, [sp, #4]
	.loc 1 59 15
	ldr	r3, .L17
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 60 1
	nop
	add	sp, sp, #8
.LCFI4:
	@ sp needed
	bx	lr
.L18:
	.align	2
.L17:
	.word	delaySample
.LFE208:
	.size	delayTimerhandler, .-delayTimerhandler
	.section	.text.createDelayTimer,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	createDelayTimer, %function
createDelayTimer:
.LFB209:
	.loc 1 67 55
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI5:
	sub	sp, sp, #20
.LCFI6:
	str	r0, [sp, #4]
	.loc 1 69 14
	add	r3, sp, #4
	ldr	r2, .L22
	movs	r1, #0
	mov	r0, r3
	bl	app_timer_create
	str	r0, [sp, #12]
.LBB4:
	.loc 1 72 3
	ldr	r3, [sp, #12]
	str	r3, [sp, #8]
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L21
	.loc 1 72 3 is_stmt 0 discriminator 1
	ldr	r0, [sp, #8]
	bl	app_error_handler_bare
.L21:
.LBE4:
	.loc 1 73 1 is_stmt 1
	nop
	add	sp, sp, #20
.LCFI7:
	@ sp needed
	ldr	pc, [sp], #4
.L23:
	.align	2
.L22:
	.word	delayTimerhandler
.LFE209:
	.size	createDelayTimer, .-createDelayTimer
	.section .rodata
	.align	2
.LC0:
	.ascii	"delay timer is already intialized!\000"
	.section	.text.setupDelayTimer,"ax",%progbits
	.align	1
	.global	setupDelayTimer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	setupDelayTimer, %function
setupDelayTimer:
.LFB210:
	.loc 1 78 31
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI8:
	.loc 1 79 7
	ldr	r3, .L28
	ldrb	r3, [r3]	@ zero_extendqisi2
	eor	r3, r3, #1
	uxtb	r3, r3
	.loc 1 79 6
	cmp	r3, #0
	beq	.L25
	.loc 1 80 5
	ldr	r3, .L28+4
	mov	r0, r3
	bl	createDelayTimer
	.loc 1 81 27
	ldr	r3, .L28
	movs	r2, #1
	strb	r2, [r3]
	.loc 1 85 1
	b	.L27
.L25:
	.loc 1 83 5
	ldr	r0, .L28+8
	bl	printf
.L27:
	.loc 1 85 1
	nop
	pop	{r3, pc}
.L29:
	.align	2
.L28:
	.word	delayTimerInitialized
	.word	delay_timer_id_data
	.word	.LC0
.LFE210:
	.size	setupDelayTimer, .-setupDelayTimer
	.section	.text.abs_val,"ax",%progbits
	.align	1
	.global	abs_val
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	abs_val, %function
abs_val:
.LFB211:
	.loc 1 94 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
.LCFI9:
	sub	sp, sp, #12
.LCFI10:
	vstr.64	d0, [sp]
	.loc 1 95 5
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, [sp]
	bl	__aeabi_dcmplt
.LVL2:
	mov	r3, r0
	cmp	r3, #0
	beq	.L35
	.loc 1 96 13
	ldr	r4, [sp]
	ldr	r3, [sp, #4]
	eor	r5, r3, #-2147483648
	b	.L33
.L35:
	.loc 1 98 11
	ldrd	r4, [sp]
.L33:
	vmov	d7, r4, r5
	.loc 1 99 1
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	add	sp, sp, #12
.LCFI11:
	@ sp needed
	pop	{r4, r5, pc}
.LFE211:
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
.LFB212:
	.loc 1 107 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI12:
	sub	sp, sp, #36
.LCFI13:
	vstr.64	d0, [sp, #16]
	vstr.64	d1, [sp, #8]
	vstr.64	d2, [sp]
	.loc 1 108 19
	ldrd	r2, [sp, #8]
	ldrd	r0, [sp, #16]
	bl	__aeabi_dadd
.LVL3:
	mov	r2, r0
	mov	r3, r1
	.loc 1 108 10
	ldrd	r0, [sp]
	bl	__aeabi_dadd
.LVL4:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #24]
	.loc 1 109 9
	mov	r2, #0
	ldr	r3, .L38
	ldrd	r0, [sp, #24]
	bl	__aeabi_ddiv
.LVL5:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #24]
	.loc 1 110 10
	ldrd	r2, [sp, #24]
	vmov	d7, r2, r3
	.loc 1 111 1
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	add	sp, sp, #36
.LCFI14:
	@ sp needed
	ldr	pc, [sp], #4
.L39:
	.align	2
.L38:
	.word	1074266112
.LFE212:
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
.LFB213:
	.loc 1 119 1
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI15:
	sub	sp, sp, #44
.LCFI16:
	vstr.64	d0, [sp, #24]
	vstr.64	d1, [sp, #16]
	vstr.64	d2, [sp, #8]
	vstr.64	d3, [sp]
	.loc 1 120 19
	ldrd	r2, [sp, #16]
	ldrd	r0, [sp, #24]
	bl	__aeabi_dadd
.LVL6:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 120 21
	ldrd	r2, [sp, #8]
	bl	__aeabi_dadd
.LVL7:
	mov	r2, r0
	mov	r3, r1
	.loc 1 120 10
	ldrd	r0, [sp]
	bl	__aeabi_dadd
.LVL8:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #32]
	.loc 1 121 9
	mov	r2, #0
	ldr	r3, .L42
	ldrd	r0, [sp, #32]
	bl	__aeabi_ddiv
.LVL9:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #32]
	.loc 1 122 10
	ldrd	r2, [sp, #32]
	vmov	d7, r2, r3
	.loc 1 123 1
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	add	sp, sp, #44
.LCFI17:
	@ sp needed
	ldr	pc, [sp], #4
.L43:
	.align	2
.L42:
	.word	1074790400
.LFE213:
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
.LFB214:
	.loc 1 131 1
	@ args = 16, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI18:
	sub	sp, sp, #76
.LCFI19:
	vstr.64	d0, [sp, #56]
	vstr.64	d1, [sp, #48]
	vstr.64	d2, [sp, #40]
	vstr.64	d3, [sp, #32]
	vstr.64	d4, [sp, #24]
	vstr.64	d5, [sp, #16]
	vstr.64	d6, [sp, #8]
	vstr.64	d7, [sp]
	.loc 1 132 19
	ldrd	r2, [sp, #48]
	ldrd	r0, [sp, #56]
	bl	__aeabi_dadd
.LVL10:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 132 21
	ldrd	r2, [sp, #40]
	bl	__aeabi_dadd
.LVL11:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 132 23
	ldrd	r2, [sp, #32]
	bl	__aeabi_dadd
.LVL12:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 132 25
	ldrd	r2, [sp, #24]
	bl	__aeabi_dadd
.LVL13:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 132 27
	ldrd	r2, [sp, #16]
	bl	__aeabi_dadd
.LVL14:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 132 29
	ldrd	r2, [sp, #8]
	bl	__aeabi_dadd
.LVL15:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 132 31
	ldrd	r2, [sp]
	bl	__aeabi_dadd
.LVL16:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	.loc 1 132 33
	ldrd	r2, [sp, #80]
	bl	__aeabi_dadd
.LVL17:
	mov	r2, r0
	mov	r3, r1
	.loc 1 132 10
	ldrd	r0, [sp, #88]
	bl	__aeabi_dadd
.LVL18:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #64]
	.loc 1 133 9
	mov	r2, #0
	ldr	r3, .L46
	ldrd	r0, [sp, #64]
	bl	__aeabi_ddiv
.LVL19:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #64]
	.loc 1 134 10
	ldrd	r2, [sp, #64]
	vmov	d7, r2, r3
	.loc 1 135 1
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	add	sp, sp, #76
.LCFI20:
	@ sp needed
	ldr	pc, [sp], #4
.L47:
	.align	2
.L46:
	.word	1076101120
.LFE214:
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
.LFB215:
	.loc 1 143 60
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
.LCFI21:
	sub	sp, sp, #36
.LCFI22:
	vstr.64	d0, [sp, #8]
	vstr.64	d1, [sp]
	.loc 1 144 9
	mov	r3, #1056964608
	str	r3, [sp, #28]	@ float
	.loc 1 145 9
	mov	r3, #-1090519040
	str	r3, [sp, #24]	@ float
	.loc 1 146 33
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
	.loc 1 146 50
	ldr	r0, [sp, #24]	@ float
	bl	__aeabi_f2d
.LVL22:
	ldrd	r2, [sp]
	bl	__aeabi_dmul
.LVL23:
	mov	r2, r0
	mov	r3, r1
	.loc 1 146 10
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
.LVL24:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #16]
	.loc 1 147 17
	vldr.64	d0, [sp, #16]
	bl	abs_val
	vstr.64	d0, [sp, #16]
	.loc 1 148 10
	ldrd	r2, [sp, #16]
	vmov	d7, r2, r3
	.loc 1 149 1
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	add	sp, sp, #36
.LCFI23:
	@ sp needed
	pop	{r4, r5, pc}
.LFE215:
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
	.4byte	.LFB207
	.4byte	.LFE207-.LFB207
	.byte	0x4
	.4byte	.LCFI0-.LFB207
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x30
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
	.4byte	.LFB208
	.4byte	.LFE208-.LFB208
	.byte	0x4
	.4byte	.LCFI3-.LFB208
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB209
	.4byte	.LFE209-.LFB209
	.byte	0x4
	.4byte	.LCFI5-.LFB209
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB210
	.4byte	.LFE210-.LFB210
	.byte	0x4
	.4byte	.LCFI8-.LFB210
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB211
	.4byte	.LFE211-.LFB211
	.byte	0x4
	.4byte	.LCFI9-.LFB211
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0xc
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB212
	.4byte	.LFE212-.LFB212
	.byte	0x4
	.4byte	.LCFI12-.LFB212
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB213
	.4byte	.LFE213-.LFB213
	.byte	0x4
	.4byte	.LCFI15-.LFB213
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB214
	.4byte	.LFE214-.LFB214
	.byte	0x4
	.4byte	.LCFI18-.LFB214
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x50
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB215
	.4byte	.LFE215-.LFB215
	.byte	0x4
	.4byte	.LCFI21-.LFB215
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0xc
	.align	2
.LEFDE16:
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/__crossworks.h"
	.file 3 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/stdio.h"
	.file 4 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/stdint.h"
	.file 5 "C:/Users/Keld/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/CMSIS_5/CMSIS/Core/Include/core_cm4.h"
	.file 6 "../../../nRF5_SDK_14.2.0/components/toolchain/system_nrf52.h"
	.file 7 "../../../nRF5_SDK_14.2.0/components/libraries/util/sdk_errors.h"
	.file 8 "../../../nRF5_SDK_14.2.0/components/libraries/util/app_util.h"
	.file 9 "../../../nRF5_SDK_14.2.0/components/libraries/timer/app_timer.h"
	.file 10 "c:\\users\\keld\\documents\\github\\pro5_unitek\\code\\ss_twr_init\\movementstruct\\movementstruct.h"
	.file 11 "C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\code\\ss_twr_init\\movementAnalysis\\movementAnalysis.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xb38
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF145
	.byte	0xc
	.4byte	.LASF146
	.4byte	.LASF147
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x8
	.byte	0x2
	.byte	0x7c
	.byte	0x8
	.4byte	0x4f
	.uleb128 0x4
	.4byte	.LASF0
	.byte	0x2
	.byte	0x7d
	.byte	0x7
	.4byte	0x4f
	.byte	0
	.uleb128 0x4
	.4byte	.LASF1
	.byte	0x2
	.byte	0x7e
	.byte	0x8
	.4byte	0x56
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x7
	.4byte	0x4f
	.4byte	0x76
	.uleb128 0x8
	.4byte	0x76
	.uleb128 0x8
	.4byte	0x88
	.uleb128 0x8
	.4byte	0x8f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x7c
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0xa
	.4byte	0x7c
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x9
	.byte	0x4
	.4byte	0x27
	.uleb128 0x7
	.4byte	0x4f
	.4byte	0xb3
	.uleb128 0x8
	.4byte	0xb3
	.uleb128 0x8
	.4byte	0xb9
	.uleb128 0x8
	.4byte	0x88
	.uleb128 0x8
	.4byte	0x8f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x88
	.uleb128 0x9
	.byte	0x4
	.4byte	0x83
	.uleb128 0xb
	.byte	0x58
	.byte	0x2
	.byte	0x84
	.byte	0x9
	.4byte	0x269
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x86
	.byte	0xf
	.4byte	0xb9
	.byte	0
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x2
	.byte	0x87
	.byte	0xf
	.4byte	0xb9
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x2
	.byte	0x88
	.byte	0xf
	.4byte	0xb9
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x2
	.byte	0x8a
	.byte	0xf
	.4byte	0xb9
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x2
	.byte	0x8b
	.byte	0xf
	.4byte	0xb9
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x8c
	.byte	0xf
	.4byte	0xb9
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x2
	.byte	0x8d
	.byte	0xf
	.4byte	0xb9
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x2
	.byte	0x8e
	.byte	0xf
	.4byte	0xb9
	.byte	0x1c
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x2
	.byte	0x8f
	.byte	0xf
	.4byte	0xb9
	.byte	0x20
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x2
	.byte	0x90
	.byte	0xf
	.4byte	0xb9
	.byte	0x24
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x2
	.byte	0x92
	.byte	0x8
	.4byte	0x7c
	.byte	0x28
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x2
	.byte	0x93
	.byte	0x8
	.4byte	0x7c
	.byte	0x29
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x2
	.byte	0x94
	.byte	0x8
	.4byte	0x7c
	.byte	0x2a
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x2
	.byte	0x95
	.byte	0x8
	.4byte	0x7c
	.byte	0x2b
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x2
	.byte	0x96
	.byte	0x8
	.4byte	0x7c
	.byte	0x2c
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x2
	.byte	0x97
	.byte	0x8
	.4byte	0x7c
	.byte	0x2d
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x2
	.byte	0x98
	.byte	0x8
	.4byte	0x7c
	.byte	0x2e
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x2
	.byte	0x99
	.byte	0x8
	.4byte	0x7c
	.byte	0x2f
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x2
	.byte	0x9a
	.byte	0x8
	.4byte	0x7c
	.byte	0x30
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x2
	.byte	0x9b
	.byte	0x8
	.4byte	0x7c
	.byte	0x31
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x2
	.byte	0x9c
	.byte	0x8
	.4byte	0x7c
	.byte	0x32
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x2
	.byte	0x9d
	.byte	0x8
	.4byte	0x7c
	.byte	0x33
	.uleb128 0x4
	.4byte	.LASF27
	.byte	0x2
	.byte	0x9e
	.byte	0x8
	.4byte	0x7c
	.byte	0x34
	.uleb128 0x4
	.4byte	.LASF28
	.byte	0x2
	.byte	0x9f
	.byte	0x8
	.4byte	0x7c
	.byte	0x35
	.uleb128 0x4
	.4byte	.LASF29
	.byte	0x2
	.byte	0xa4
	.byte	0xf
	.4byte	0xb9
	.byte	0x38
	.uleb128 0x4
	.4byte	.LASF30
	.byte	0x2
	.byte	0xa5
	.byte	0xf
	.4byte	0xb9
	.byte	0x3c
	.uleb128 0x4
	.4byte	.LASF31
	.byte	0x2
	.byte	0xa6
	.byte	0xf
	.4byte	0xb9
	.byte	0x40
	.uleb128 0x4
	.4byte	.LASF32
	.byte	0x2
	.byte	0xa7
	.byte	0xf
	.4byte	0xb9
	.byte	0x44
	.uleb128 0x4
	.4byte	.LASF33
	.byte	0x2
	.byte	0xa8
	.byte	0xf
	.4byte	0xb9
	.byte	0x48
	.uleb128 0x4
	.4byte	.LASF34
	.byte	0x2
	.byte	0xa9
	.byte	0xf
	.4byte	0xb9
	.byte	0x4c
	.uleb128 0x4
	.4byte	.LASF35
	.byte	0x2
	.byte	0xaa
	.byte	0xf
	.4byte	0xb9
	.byte	0x50
	.uleb128 0x4
	.4byte	.LASF36
	.byte	0x2
	.byte	0xab
	.byte	0xf
	.4byte	0xb9
	.byte	0x54
	.byte	0
	.uleb128 0xc
	.4byte	.LASF46
	.byte	0x2
	.byte	0xac
	.byte	0x3
	.4byte	0xbf
	.uleb128 0xa
	.4byte	0x269
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF37
	.uleb128 0xa
	.4byte	0x27a
	.uleb128 0xb
	.byte	0x20
	.byte	0x2
	.byte	0xc2
	.byte	0x9
	.4byte	0x2f8
	.uleb128 0x4
	.4byte	.LASF38
	.byte	0x2
	.byte	0xc4
	.byte	0x9
	.4byte	0x30c
	.byte	0
	.uleb128 0x4
	.4byte	.LASF39
	.byte	0x2
	.byte	0xc5
	.byte	0x9
	.4byte	0x321
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF40
	.byte	0x2
	.byte	0xc6
	.byte	0x9
	.4byte	0x321
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF41
	.byte	0x2
	.byte	0xc9
	.byte	0x9
	.4byte	0x33b
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF42
	.byte	0x2
	.byte	0xca
	.byte	0xa
	.4byte	0x350
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF43
	.byte	0x2
	.byte	0xcb
	.byte	0xa
	.4byte	0x350
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF44
	.byte	0x2
	.byte	0xce
	.byte	0x9
	.4byte	0x356
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF45
	.byte	0x2
	.byte	0xcf
	.byte	0x9
	.4byte	0x35c
	.byte	0x1c
	.byte	0
	.uleb128 0x7
	.4byte	0x4f
	.4byte	0x30c
	.uleb128 0x8
	.4byte	0x4f
	.uleb128 0x8
	.4byte	0x4f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x2f8
	.uleb128 0x7
	.4byte	0x4f
	.4byte	0x321
	.uleb128 0x8
	.4byte	0x4f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x312
	.uleb128 0x7
	.4byte	0x4f
	.4byte	0x33b
	.uleb128 0x8
	.4byte	0x56
	.uleb128 0x8
	.4byte	0x4f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x327
	.uleb128 0x7
	.4byte	0x56
	.4byte	0x350
	.uleb128 0x8
	.4byte	0x56
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x341
	.uleb128 0x9
	.byte	0x4
	.4byte	0x5d
	.uleb128 0x9
	.byte	0x4
	.4byte	0x95
	.uleb128 0xc
	.4byte	.LASF47
	.byte	0x2
	.byte	0xd0
	.byte	0x3
	.4byte	0x286
	.uleb128 0xa
	.4byte	0x362
	.uleb128 0xb
	.byte	0xc
	.byte	0x2
	.byte	0xd2
	.byte	0x9
	.4byte	0x3a4
	.uleb128 0x4
	.4byte	.LASF48
	.byte	0x2
	.byte	0xd3
	.byte	0xf
	.4byte	0xb9
	.byte	0
	.uleb128 0x4
	.4byte	.LASF49
	.byte	0x2
	.byte	0xd4
	.byte	0x25
	.4byte	0x3a4
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF50
	.byte	0x2
	.byte	0xd5
	.byte	0x28
	.4byte	0x3aa
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x275
	.uleb128 0x9
	.byte	0x4
	.4byte	0x36e
	.uleb128 0xc
	.4byte	.LASF51
	.byte	0x2
	.byte	0xd6
	.byte	0x3
	.4byte	0x373
	.uleb128 0xa
	.4byte	0x3b0
	.uleb128 0x3
	.4byte	.LASF53
	.byte	0x14
	.byte	0x2
	.byte	0xda
	.byte	0x10
	.4byte	0x3dc
	.uleb128 0x4
	.4byte	.LASF54
	.byte	0x2
	.byte	0xdb
	.byte	0x20
	.4byte	0x3dc
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0x3ec
	.4byte	0x3ec
	.uleb128 0xe
	.4byte	0x88
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x3bc
	.uleb128 0xf
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x104
	.byte	0x1a
	.4byte	0x3c1
	.uleb128 0xf
	.4byte	.LASF56
	.byte	0x2
	.2byte	0x10b
	.byte	0x24
	.4byte	0x3bc
	.uleb128 0xf
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x10e
	.byte	0x2c
	.4byte	0x36e
	.uleb128 0xf
	.4byte	.LASF58
	.byte	0x2
	.2byte	0x10f
	.byte	0x2c
	.4byte	0x36e
	.uleb128 0xd
	.4byte	0x281
	.4byte	0x436
	.uleb128 0xe
	.4byte	0x88
	.byte	0x7f
	.byte	0
	.uleb128 0xa
	.4byte	0x426
	.uleb128 0xf
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x111
	.byte	0x23
	.4byte	0x436
	.uleb128 0xd
	.4byte	0x83
	.4byte	0x453
	.uleb128 0x10
	.byte	0
	.uleb128 0xa
	.4byte	0x448
	.uleb128 0xf
	.4byte	.LASF60
	.byte	0x2
	.2byte	0x113
	.byte	0x13
	.4byte	0x453
	.uleb128 0xf
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x114
	.byte	0x13
	.4byte	0x453
	.uleb128 0xf
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x115
	.byte	0x13
	.4byte	0x453
	.uleb128 0xf
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x116
	.byte	0x13
	.4byte	0x453
	.uleb128 0xf
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x118
	.byte	0x13
	.4byte	0x453
	.uleb128 0xf
	.4byte	.LASF65
	.byte	0x2
	.2byte	0x119
	.byte	0x13
	.4byte	0x453
	.uleb128 0xf
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x11a
	.byte	0x13
	.4byte	0x453
	.uleb128 0xf
	.4byte	.LASF67
	.byte	0x2
	.2byte	0x11b
	.byte	0x13
	.4byte	0x453
	.uleb128 0xf
	.4byte	.LASF68
	.byte	0x2
	.2byte	0x11c
	.byte	0x13
	.4byte	0x453
	.uleb128 0xf
	.4byte	.LASF69
	.byte	0x2
	.2byte	0x11d
	.byte	0x13
	.4byte	0x453
	.uleb128 0x7
	.4byte	0x4f
	.4byte	0x4e9
	.uleb128 0x8
	.4byte	0x4e9
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4f4
	.uleb128 0x11
	.4byte	.LASF80
	.uleb128 0xa
	.4byte	0x4ef
	.uleb128 0xf
	.4byte	.LASF70
	.byte	0x2
	.2byte	0x133
	.byte	0xe
	.4byte	0x506
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4da
	.uleb128 0x7
	.4byte	0x4f
	.4byte	0x51b
	.uleb128 0x8
	.4byte	0x51b
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4ef
	.uleb128 0xf
	.4byte	.LASF71
	.byte	0x2
	.2byte	0x134
	.byte	0xe
	.4byte	0x52e
	.uleb128 0x9
	.byte	0x4
	.4byte	0x50c
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.4byte	.LASF72
	.uleb128 0x12
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x14b
	.byte	0x18
	.4byte	0x548
	.uleb128 0x9
	.byte	0x4
	.4byte	0x54e
	.uleb128 0x7
	.4byte	0xb9
	.4byte	0x55d
	.uleb128 0x8
	.4byte	0x4f
	.byte	0
	.uleb128 0x13
	.4byte	.LASF74
	.byte	0x8
	.byte	0x2
	.2byte	0x14d
	.byte	0x10
	.4byte	0x588
	.uleb128 0x14
	.4byte	.LASF75
	.byte	0x2
	.2byte	0x14f
	.byte	0x1c
	.4byte	0x53b
	.byte	0
	.uleb128 0x14
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x150
	.byte	0x21
	.4byte	0x588
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x55d
	.uleb128 0x12
	.4byte	.LASF77
	.byte	0x2
	.2byte	0x151
	.byte	0x3
	.4byte	0x55d
	.uleb128 0xf
	.4byte	.LASF78
	.byte	0x2
	.2byte	0x155
	.byte	0x1f
	.4byte	0x5a8
	.uleb128 0x9
	.byte	0x4
	.4byte	0x58e
	.uleb128 0x12
	.4byte	.LASF79
	.byte	0x3
	.2byte	0x311
	.byte	0x1b
	.4byte	0x5bb
	.uleb128 0x11
	.4byte	.LASF81
	.uleb128 0xf
	.4byte	.LASF82
	.byte	0x3
	.2byte	0x315
	.byte	0xe
	.4byte	0x5cd
	.uleb128 0x9
	.byte	0x4
	.4byte	0x5ae
	.uleb128 0xf
	.4byte	.LASF83
	.byte	0x3
	.2byte	0x316
	.byte	0xe
	.4byte	0x5cd
	.uleb128 0xf
	.4byte	.LASF84
	.byte	0x3
	.2byte	0x317
	.byte	0xe
	.4byte	0x5cd
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.4byte	.LASF85
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF86
	.uleb128 0xc
	.4byte	.LASF87
	.byte	0x4
	.byte	0x36
	.byte	0x1c
	.4byte	0x4f
	.uleb128 0x15
	.4byte	0x5fb
	.uleb128 0xc
	.4byte	.LASF88
	.byte	0x4
	.byte	0x37
	.byte	0x1c
	.4byte	0x88
	.uleb128 0xa
	.4byte	0x60c
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF89
	.uleb128 0xc
	.4byte	.LASF90
	.byte	0x4
	.byte	0x45
	.byte	0x1c
	.4byte	0x630
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF91
	.uleb128 0xd
	.4byte	0x60c
	.4byte	0x647
	.uleb128 0xe
	.4byte	0x88
	.byte	0x7
	.byte	0
	.uleb128 0xf
	.4byte	.LASF92
	.byte	0x5
	.2byte	0x804
	.byte	0x19
	.4byte	0x607
	.uleb128 0x16
	.4byte	.LASF93
	.byte	0x6
	.byte	0x21
	.byte	0x11
	.4byte	0x60c
	.uleb128 0xc
	.4byte	.LASF94
	.byte	0x7
	.byte	0x9d
	.byte	0x12
	.4byte	0x60c
	.uleb128 0x16
	.4byte	.LASF95
	.byte	0x8
	.byte	0x4b
	.byte	0x11
	.4byte	0x60c
	.uleb128 0x16
	.4byte	.LASF96
	.byte	0x8
	.byte	0x4c
	.byte	0x11
	.4byte	0x60c
	.uleb128 0x3
	.4byte	.LASF97
	.byte	0x20
	.byte	0x9
	.byte	0x71
	.byte	0x10
	.4byte	0x69f
	.uleb128 0x4
	.4byte	.LASF49
	.byte	0x9
	.byte	0x71
	.byte	0x27
	.4byte	0x637
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF97
	.byte	0x9
	.byte	0x71
	.byte	0x60
	.4byte	0x684
	.uleb128 0xc
	.4byte	.LASF98
	.byte	0x9
	.byte	0x75
	.byte	0x17
	.4byte	0x6bc
	.uleb128 0xa
	.4byte	0x6ab
	.uleb128 0x9
	.byte	0x4
	.4byte	0x69f
	.uleb128 0x17
	.byte	0x7
	.byte	0x1
	.4byte	0x27a
	.byte	0x9
	.byte	0x8d
	.byte	0x1
	.4byte	0x6dd
	.uleb128 0x18
	.4byte	.LASF99
	.byte	0
	.uleb128 0x18
	.4byte	.LASF100
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF101
	.uleb128 0x17
	.byte	0x7
	.byte	0x1
	.4byte	0x27a
	.byte	0xa
	.byte	0xf
	.byte	0xe
	.4byte	0x705
	.uleb128 0x18
	.4byte	.LASF102
	.byte	0
	.uleb128 0x18
	.4byte	.LASF103
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF104
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.4byte	.LASF105
	.byte	0xa
	.byte	0x13
	.byte	0x3
	.4byte	0x6e4
	.uleb128 0x3
	.4byte	.LASF106
	.byte	0x18
	.byte	0xa
	.byte	0x1e
	.byte	0x10
	.4byte	0x745
	.uleb128 0x4
	.4byte	.LASF107
	.byte	0xa
	.byte	0x1f
	.byte	0xe
	.4byte	0x705
	.byte	0
	.uleb128 0x19
	.ascii	"id\000"
	.byte	0xa
	.byte	0x20
	.byte	0xc
	.4byte	0x624
	.byte	0x8
	.uleb128 0x19
	.ascii	"tof\000"
	.byte	0xa
	.byte	0x21
	.byte	0xa
	.4byte	0x745
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF108
	.uleb128 0xc
	.4byte	.LASF109
	.byte	0xa
	.byte	0x22
	.byte	0x2
	.4byte	0x711
	.uleb128 0x3
	.4byte	.LASF110
	.byte	0x58
	.byte	0xa
	.byte	0x30
	.byte	0x9
	.4byte	0x7d9
	.uleb128 0x4
	.4byte	.LASF106
	.byte	0xa
	.byte	0x31
	.byte	0xc
	.4byte	0x74c
	.byte	0
	.uleb128 0x4
	.4byte	.LASF111
	.byte	0xa
	.byte	0x32
	.byte	0xa
	.4byte	0x7d9
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF112
	.byte	0xa
	.byte	0x33
	.byte	0xa
	.4byte	0x745
	.byte	0x20
	.uleb128 0x4
	.4byte	.LASF113
	.byte	0xa
	.byte	0x34
	.byte	0xa
	.4byte	0x745
	.byte	0x28
	.uleb128 0x4
	.4byte	.LASF114
	.byte	0xa
	.byte	0x35
	.byte	0xa
	.4byte	0x745
	.byte	0x30
	.uleb128 0x4
	.4byte	.LASF115
	.byte	0xa
	.byte	0x36
	.byte	0xa
	.4byte	0x745
	.byte	0x38
	.uleb128 0x4
	.4byte	.LASF116
	.byte	0xa
	.byte	0x37
	.byte	0xa
	.4byte	0x745
	.byte	0x40
	.uleb128 0x4
	.4byte	.LASF117
	.byte	0xa
	.byte	0x38
	.byte	0xa
	.4byte	0x745
	.byte	0x48
	.uleb128 0x19
	.ascii	"i\000"
	.byte	0xa
	.byte	0x39
	.byte	0x7
	.4byte	0x4f
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.byte	0x1
	.byte	0x2
	.4byte	.LASF118
	.uleb128 0xc
	.4byte	.LASF119
	.byte	0xa
	.byte	0x3c
	.byte	0x17
	.4byte	0x758
	.uleb128 0x1a
	.4byte	.LASF120
	.byte	0xb
	.byte	0x12
	.byte	0xd
	.4byte	0x7d9
	.uleb128 0x5
	.byte	0x3
	.4byte	delayTimerInitialized
	.uleb128 0x1a
	.4byte	.LASF121
	.byte	0xb
	.byte	0x13
	.byte	0xd
	.4byte	0x7d9
	.uleb128 0x5
	.byte	0x3
	.4byte	delaySample
	.uleb128 0x1a
	.4byte	.LASF122
	.byte	0x1
	.byte	0x8
	.byte	0x1
	.4byte	0x69f
	.uleb128 0x5
	.byte	0x3
	.4byte	delay_timer_id_data
	.uleb128 0x1a
	.4byte	.LASF123
	.byte	0x1
	.byte	0x8
	.byte	0x1
	.4byte	0x6b7
	.uleb128 0x5
	.byte	0x3
	.4byte	delay_timer_id
	.uleb128 0x1b
	.4byte	.LASF129
	.byte	0x1
	.byte	0x8f
	.byte	0x8
	.4byte	0x745
	.4byte	.LFB215
	.4byte	.LFE215-.LFB215
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x89a
	.uleb128 0x1c
	.4byte	.LASF124
	.byte	0x1
	.byte	0x8f
	.byte	0x22
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.4byte	.LASF114
	.byte	0x1
	.byte	0x8f
	.byte	0x33
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.4byte	.LASF125
	.byte	0x1
	.byte	0x90
	.byte	0x9
	.4byte	0x89a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF126
	.byte	0x1
	.byte	0x91
	.byte	0x9
	.4byte	0x89a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LASF127
	.byte	0x1
	.byte	0x92
	.byte	0xa
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.4byte	.LASF128
	.uleb128 0x1b
	.4byte	.LASF130
	.byte	0x1
	.byte	0x82
	.byte	0x8
	.4byte	0x745
	.4byte	.LFB214
	.4byte	.LFE214-.LFB214
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x94f
	.uleb128 0x1d
	.ascii	"a\000"
	.byte	0x1
	.byte	0x82
	.byte	0x1b
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii	"b\000"
	.byte	0x1
	.byte	0x82
	.byte	0x25
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.ascii	"c\000"
	.byte	0x1
	.byte	0x82
	.byte	0x2f
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.ascii	"d\000"
	.byte	0x1
	.byte	0x82
	.byte	0x39
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1d
	.ascii	"e\000"
	.byte	0x1
	.byte	0x82
	.byte	0x43
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.ascii	"f\000"
	.byte	0x1
	.byte	0x82
	.byte	0x4d
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1d
	.ascii	"g\000"
	.byte	0x1
	.byte	0x82
	.byte	0x57
	.4byte	0x745
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1d
	.ascii	"h\000"
	.byte	0x1
	.byte	0x82
	.byte	0x61
	.4byte	0x745
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1d
	.ascii	"i\000"
	.byte	0x1
	.byte	0x82
	.byte	0x6b
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.ascii	"j\000"
	.byte	0x1
	.byte	0x82
	.byte	0x75
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.4byte	.LASF131
	.byte	0x1
	.byte	0x84
	.byte	0xa
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF132
	.byte	0x1
	.byte	0x76
	.byte	0x8
	.4byte	0x745
	.4byte	.LFB213
	.4byte	.LFE213-.LFB213
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9ad
	.uleb128 0x1d
	.ascii	"a\000"
	.byte	0x1
	.byte	0x76
	.byte	0x1a
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii	"b\000"
	.byte	0x1
	.byte	0x76
	.byte	0x24
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.ascii	"c\000"
	.byte	0x1
	.byte	0x76
	.byte	0x2e
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.ascii	"d\000"
	.byte	0x1
	.byte	0x76
	.byte	0x38
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.4byte	.LASF131
	.byte	0x1
	.byte	0x78
	.byte	0xa
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF133
	.byte	0x1
	.byte	0x6a
	.byte	0x8
	.4byte	0x745
	.4byte	.LFB212
	.4byte	.LFE212-.LFB212
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9fe
	.uleb128 0x1d
	.ascii	"a\000"
	.byte	0x1
	.byte	0x6a
	.byte	0x1a
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii	"b\000"
	.byte	0x1
	.byte	0x6a
	.byte	0x24
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.ascii	"c\000"
	.byte	0x1
	.byte	0x6a
	.byte	0x2e
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.4byte	.LASF131
	.byte	0x1
	.byte	0x6c
	.byte	0xa
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF134
	.byte	0x1
	.byte	0x5d
	.byte	0x8
	.4byte	0x745
	.4byte	.LFB211
	.4byte	.LFE211-.LFB211
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa26
	.uleb128 0x1d
	.ascii	"y\000"
	.byte	0x1
	.byte	0x5d
	.byte	0x17
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF148
	.byte	0x1
	.byte	0x4e
	.byte	0xd
	.4byte	.LFB210
	.4byte	.LFE210-.LFB210
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.4byte	.LASF138
	.byte	0x1
	.byte	0x43
	.byte	0xd
	.4byte	.LFB209
	.4byte	.LFE209-.LFB209
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa86
	.uleb128 0x1c
	.4byte	.LASF135
	.byte	0x1
	.byte	0x43
	.byte	0x2d
	.4byte	0x6ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF136
	.byte	0x1
	.byte	0x44
	.byte	0xe
	.4byte	0x660
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x20
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x1a
	.4byte	.LASF137
	.byte	0x1
	.byte	0x48
	.byte	0x3
	.4byte	0x618
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x21
	.4byte	.LASF139
	.byte	0x1
	.byte	0x3a
	.byte	0xd
	.4byte	.LFB208
	.4byte	.LFE208-.LFB208
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xaac
	.uleb128 0x1c
	.4byte	.LASF140
	.byte	0x1
	.byte	0x3a
	.byte	0x26
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF141
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.4byte	0x7d9
	.4byte	.LFB207
	.4byte	.LFE207-.LFB207
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb35
	.uleb128 0x1d
	.ascii	"tag\000"
	.byte	0x1
	.byte	0x12
	.byte	0x15
	.4byte	0xb35
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.4byte	.LASF142
	.byte	0x1
	.byte	0x12
	.byte	0x21
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.4byte	.LASF143
	.byte	0x1
	.byte	0x14
	.byte	0xa
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF144
	.byte	0x1
	.byte	0x15
	.byte	0xa
	.4byte	0x745
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x1a
	.4byte	.LASF136
	.byte	0x1
	.byte	0x29
	.byte	0x12
	.4byte	0x660
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x1a
	.4byte	.LASF137
	.byte	0x1
	.byte	0x2b
	.byte	0x7
	.4byte	0x618
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x7e0
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x13b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xb3c
	.4byte	0x6d0
	.ascii	"APP_TIMER_MODE_SINGLE_SHOT\000"
	.4byte	0x6d6
	.ascii	"APP_TIMER_MODE_REPEATED\000"
	.4byte	0x7ec
	.ascii	"delayTimerInitialized\000"
	.4byte	0x7fe
	.ascii	"delaySample\000"
	.4byte	0x810
	.ascii	"delay_timer_id_data\000"
	.4byte	0x822
	.ascii	"delay_timer_id\000"
	.4byte	0x834
	.ascii	"central_difference\000"
	.4byte	0x8a1
	.ascii	"ma_filter10\000"
	.4byte	0x94f
	.ascii	"ma_filter4\000"
	.4byte	0x9ad
	.ascii	"ma_filter3\000"
	.4byte	0x9fe
	.ascii	"abs_val\000"
	.4byte	0xa26
	.ascii	"setupDelayTimer\000"
	.4byte	0xa38
	.ascii	"createDelayTimer\000"
	.4byte	0xa86
	.ascii	"delayTimerhandler\000"
	.4byte	0xaac
	.ascii	"analysis\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x249
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xb3c
	.4byte	0x4f
	.ascii	"int\000"
	.4byte	0x56
	.ascii	"long int\000"
	.4byte	0x27
	.ascii	"__mbstate_s\000"
	.4byte	0x7c
	.ascii	"char\000"
	.4byte	0x88
	.ascii	"unsigned int\000"
	.4byte	0x269
	.ascii	"__RAL_locale_data_t\000"
	.4byte	0x27a
	.ascii	"unsigned char\000"
	.4byte	0x362
	.ascii	"__RAL_locale_codeset_t\000"
	.4byte	0x3b0
	.ascii	"__RAL_locale_t\000"
	.4byte	0x3c1
	.ascii	"__locale_s\000"
	.4byte	0x534
	.ascii	"short unsigned int\000"
	.4byte	0x53b
	.ascii	"__RAL_error_decoder_fn_t\000"
	.4byte	0x55d
	.ascii	"__RAL_error_decoder_s\000"
	.4byte	0x58e
	.ascii	"__RAL_error_decoder_t\000"
	.4byte	0x5ae
	.ascii	"FILE\000"
	.4byte	0x5ed
	.ascii	"signed char\000"
	.4byte	0x5f4
	.ascii	"short int\000"
	.4byte	0x5fb
	.ascii	"int32_t\000"
	.4byte	0x60c
	.ascii	"uint32_t\000"
	.4byte	0x61d
	.ascii	"long long int\000"
	.4byte	0x630
	.ascii	"long long unsigned int\000"
	.4byte	0x624
	.ascii	"uint64_t\000"
	.4byte	0x660
	.ascii	"ret_code_t\000"
	.4byte	0x684
	.ascii	"app_timer_t\000"
	.4byte	0x69f
	.ascii	"app_timer_t\000"
	.4byte	0x6ab
	.ascii	"app_timer_id_t\000"
	.4byte	0x6dd
	.ascii	"long unsigned int\000"
	.4byte	0x705
	.ascii	"event_type\000"
	.4byte	0x745
	.ascii	"double\000"
	.4byte	0x711
	.ascii	"message\000"
	.4byte	0x74c
	.ascii	"xMessage\000"
	.4byte	0x7d9
	.ascii	"_Bool\000"
	.4byte	0x758
	.ascii	"tags_s\000"
	.4byte	0x7e0
	.ascii	"tags\000"
	.4byte	0x89a
	.ascii	"float\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x5c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB207
	.4byte	.LFE207-.LFB207
	.4byte	.LFB208
	.4byte	.LFE208-.LFB208
	.4byte	.LFB209
	.4byte	.LFE209-.LFB209
	.4byte	.LFB210
	.4byte	.LFE210-.LFB210
	.4byte	.LFB211
	.4byte	.LFE211-.LFB211
	.4byte	.LFB212
	.4byte	.LFE212-.LFB212
	.4byte	.LFB213
	.4byte	.LFE213-.LFB213
	.4byte	.LFB214
	.4byte	.LFE214-.LFB214
	.4byte	.LFB215
	.4byte	.LFE215-.LFB215
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB207
	.4byte	.LFE207
	.4byte	.LFB208
	.4byte	.LFE208
	.4byte	.LFB209
	.4byte	.LFE209
	.4byte	.LFB210
	.4byte	.LFE210
	.4byte	.LFB211
	.4byte	.LFE211
	.4byte	.LFB212
	.4byte	.LFE212
	.4byte	.LFB213
	.4byte	.LFE213
	.4byte	.LFB214
	.4byte	.LFE214
	.4byte	.LFB215
	.4byte	.LFE215
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF9:
	.ascii	"currency_symbol\000"
.LASF66:
	.ascii	"__RAL_data_utf8_space\000"
.LASF36:
	.ascii	"date_time_format\000"
.LASF146:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\movementAnalysis\\movementAnalysis"
	.ascii	".c\000"
.LASF113:
	.ascii	"old_avg2\000"
.LASF114:
	.ascii	"old_avg3\000"
.LASF57:
	.ascii	"__RAL_codeset_ascii\000"
.LASF73:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF26:
	.ascii	"int_n_sep_by_space\000"
.LASF17:
	.ascii	"p_cs_precedes\000"
.LASF68:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF98:
	.ascii	"app_timer_id_t\000"
.LASF91:
	.ascii	"long long unsigned int\000"
.LASF112:
	.ascii	"old_avg\000"
.LASF49:
	.ascii	"data\000"
.LASF53:
	.ascii	"__locale_s\000"
.LASF71:
	.ascii	"__user_get_time_of_day\000"
.LASF92:
	.ascii	"ITM_RxBuffer\000"
.LASF34:
	.ascii	"date_format\000"
.LASF76:
	.ascii	"next\000"
.LASF32:
	.ascii	"abbrev_month_names\000"
.LASF89:
	.ascii	"long long int\000"
.LASF85:
	.ascii	"signed char\000"
.LASF55:
	.ascii	"__RAL_global_locale\000"
.LASF50:
	.ascii	"codeset\000"
.LASF42:
	.ascii	"__towupper\000"
.LASF2:
	.ascii	"long int\000"
.LASF65:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF8:
	.ascii	"int_curr_symbol\000"
.LASF108:
	.ascii	"double\000"
.LASF13:
	.ascii	"positive_sign\000"
.LASF23:
	.ascii	"int_p_cs_precedes\000"
.LASF119:
	.ascii	"tags\000"
.LASF1:
	.ascii	"__wchar\000"
.LASF124:
	.ascii	"avg_dist\000"
.LASF6:
	.ascii	"thousands_sep\000"
.LASF116:
	.ascii	"old_dist2\000"
.LASF12:
	.ascii	"mon_grouping\000"
.LASF133:
	.ascii	"ma_filter3\000"
.LASF132:
	.ascii	"ma_filter4\000"
.LASF111:
	.ascii	"taken\000"
.LASF137:
	.ascii	"LOCAL_ERR_CODE\000"
.LASF127:
	.ascii	"cd_velocity\000"
.LASF130:
	.ascii	"ma_filter10\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF10:
	.ascii	"mon_decimal_point\000"
.LASF129:
	.ascii	"central_difference\000"
.LASF33:
	.ascii	"am_pm_indicator\000"
.LASF134:
	.ascii	"abs_val\000"
.LASF64:
	.ascii	"__RAL_data_utf8_period\000"
.LASF7:
	.ascii	"grouping\000"
.LASF61:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
.LASF101:
	.ascii	"long unsigned int\000"
.LASF43:
	.ascii	"__towlower\000"
.LASF69:
	.ascii	"__RAL_data_empty_string\000"
.LASF80:
	.ascii	"timeval\000"
.LASF54:
	.ascii	"__category\000"
.LASF96:
	.ascii	"__StackLimit\000"
.LASF39:
	.ascii	"__toupper\000"
.LASF20:
	.ascii	"n_sep_by_space\000"
.LASF107:
	.ascii	"event\000"
.LASF14:
	.ascii	"negative_sign\000"
.LASF72:
	.ascii	"short unsigned int\000"
.LASF48:
	.ascii	"name\000"
.LASF135:
	.ascii	"timer_id\000"
.LASF82:
	.ascii	"stdin\000"
.LASF121:
	.ascii	"delaySample\000"
.LASF29:
	.ascii	"day_names\000"
.LASF143:
	.ascii	"average_distance\000"
.LASF86:
	.ascii	"short int\000"
.LASF24:
	.ascii	"int_n_cs_precedes\000"
.LASF83:
	.ascii	"stdout\000"
.LASF51:
	.ascii	"__RAL_locale_t\000"
.LASF35:
	.ascii	"time_format\000"
.LASF141:
	.ascii	"analysis\000"
.LASF21:
	.ascii	"p_sign_posn\000"
.LASF94:
	.ascii	"ret_code_t\000"
.LASF59:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF136:
	.ascii	"err_code\000"
.LASF140:
	.ascii	"p_context\000"
.LASF115:
	.ascii	"old_dist1\000"
.LASF75:
	.ascii	"decode\000"
.LASF117:
	.ascii	"old_dist3\000"
.LASF90:
	.ascii	"uint64_t\000"
.LASF45:
	.ascii	"__mbtowc\000"
.LASF30:
	.ascii	"abbrev_day_names\000"
.LASF106:
	.ascii	"message\000"
.LASF19:
	.ascii	"n_cs_precedes\000"
.LASF40:
	.ascii	"__tolower\000"
.LASF99:
	.ascii	"APP_TIMER_MODE_SINGLE_SHOT\000"
.LASF70:
	.ascii	"__user_set_time_of_day\000"
.LASF93:
	.ascii	"SystemCoreClock\000"
.LASF144:
	.ascii	"velocity\000"
.LASF100:
	.ascii	"APP_TIMER_MODE_REPEATED\000"
.LASF0:
	.ascii	"__state\000"
.LASF95:
	.ascii	"__StackTop\000"
.LASF118:
	.ascii	"_Bool\000"
.LASF87:
	.ascii	"int32_t\000"
.LASF37:
	.ascii	"unsigned char\000"
.LASF60:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF102:
	.ascii	"UPDATE_TAG\000"
.LASF41:
	.ascii	"__iswctype\000"
.LASF16:
	.ascii	"frac_digits\000"
.LASF109:
	.ascii	"xMessage\000"
.LASF110:
	.ascii	"tags_s\000"
.LASF78:
	.ascii	"__RAL_error_decoder_head\000"
.LASF79:
	.ascii	"FILE\000"
.LASF125:
	.ascii	"coef1\000"
.LASF126:
	.ascii	"coef2\000"
.LASF11:
	.ascii	"mon_thousands_sep\000"
.LASF46:
	.ascii	"__RAL_locale_data_t\000"
.LASF22:
	.ascii	"n_sign_posn\000"
.LASF88:
	.ascii	"uint32_t\000"
.LASF27:
	.ascii	"int_p_sign_posn\000"
.LASF128:
	.ascii	"float\000"
.LASF120:
	.ascii	"delayTimerInitialized\000"
.LASF3:
	.ascii	"char\000"
.LASF18:
	.ascii	"p_sep_by_space\000"
.LASF142:
	.ascii	"distance\000"
.LASF103:
	.ascii	"DELETE_TAG\000"
.LASF148:
	.ascii	"setupDelayTimer\000"
.LASF56:
	.ascii	"__RAL_c_locale\000"
.LASF25:
	.ascii	"int_p_sep_by_space\000"
.LASF47:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF131:
	.ascii	"total\000"
.LASF138:
	.ascii	"createDelayTimer\000"
.LASF28:
	.ascii	"int_n_sign_posn\000"
.LASF84:
	.ascii	"stderr\000"
.LASF62:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF38:
	.ascii	"__isctype\000"
.LASF74:
	.ascii	"__RAL_error_decoder_s\000"
.LASF77:
	.ascii	"__RAL_error_decoder_t\000"
.LASF52:
	.ascii	"__mbstate_s\000"
.LASF105:
	.ascii	"event_type\000"
.LASF58:
	.ascii	"__RAL_codeset_utf8\000"
.LASF15:
	.ascii	"int_frac_digits\000"
.LASF31:
	.ascii	"month_names\000"
.LASF97:
	.ascii	"app_timer_t\000"
.LASF147:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\SES\000"
.LASF122:
	.ascii	"delay_timer_id_data\000"
.LASF145:
	.ascii	"GNU C99 9.3.1 20200408 (release) -fmessage-length=0"
	.ascii	" -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -"
	.ascii	"mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-acce"
	.ascii	"ss -std=gnu99 -g2 -gpubnames -fomit-frame-pointer -"
	.ascii	"fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections"
	.ascii	" -fdata-sections -fshort-enums -fno-common\000"
.LASF81:
	.ascii	"__RAL_FILE\000"
.LASF104:
	.ascii	"NEW_TAG\000"
.LASF123:
	.ascii	"delay_timer_id\000"
.LASF67:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF63:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF139:
	.ascii	"delayTimerhandler\000"
.LASF44:
	.ascii	"__wctomb\000"
.LASF5:
	.ascii	"decimal_point\000"
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
