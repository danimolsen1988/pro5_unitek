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
	.file	"movementAnalyzer.c"
	.text
.Ltext0:
	.section	.rodata.spi,"a"
	.align	2
	.type	spi, %object
	.size	spi, 8
spi:
	.word	1073758208
	.byte	4
	.byte	0
	.byte	0
	.space	1
	.section	.bss.spi_xfer_done,"aw",%nobits
	.type	spi_xfer_done, %object
	.size	spi_xfer_done, 1
spi_xfer_done:
	.space	1
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
	.section	.bss.tag,"aw",%nobits
	.align	3
	.type	tag, %object
	.size	tag, 264
tag:
	.space	264
	.global	default_tag
	.section	.rodata.default_tag,"a"
	.align	3
	.type	default_tag, %object
	.size	default_tag, 88
default_tag:
	.space	88
	.section	.bss.distance,"aw",%nobits
	.align	3
	.type	distance, %object
	.size	distance, 8
distance:
	.space	8
	.section	.text.movementAnalyzer_initiator,"ax",%progbits
	.align	1
	.global	movementAnalyzer_initiator
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	movementAnalyzer_initiator, %function
movementAnalyzer_initiator:
.LFB268:
	.file 1 "C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\code\\ss_twr_init\\movementAnalyzer\\movementAnalyzer.c"
	.loc 1 69 54
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI0:
	sub	sp, sp, #12
.LCFI1:
	str	r0, [sp, #4]
	.loc 1 71 3
	movs	r0, #0
	bl	dwt_setleds
.L2:
	.loc 1 75 5 discriminator 1
	bl	movementAnalyzer
	.loc 1 76 5 discriminator 1
	mov	r0, #1000
	bl	vTaskDelay
	.loc 1 75 5 discriminator 1
	b	.L2
.LFE268:
	.size	movementAnalyzer_initiator, .-movementAnalyzer_initiator
	.section .rodata
	.align	2
.LC0:
	.ascii	"new tag added id: %d\015\012\000"
	.align	2
.LC1:
	.ascii	"taglist is full!\015\012\000"
	.align	2
.LC2:
	.ascii	"updatedtag! id: %d\015\012\000"
	.align	2
.LC3:
	.ascii	"update, id not on list! id: %d\015\012\000"
	.align	2
.LC4:
	.ascii	"tag deleted! id: %d\015\012\000"
	.align	2
.LC5:
	.ascii	"DELETE tag is not on list! id: %d\015\012\000"
	.align	2
.LC6:
	.ascii	"something went very wrong in movementAnalyzer - swi"
	.ascii	"tch\015\012\000"
	.align	2
.LC7:
	.ascii	"queue is empty\015\012\000"
	.section	.text.movementAnalyzer,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	movementAnalyzer, %function
movementAnalyzer:
.LFB269:
	.loc 1 287 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
.LCFI2:
	sub	sp, sp, #52
.LCFI3:
	.loc 1 289 7
	mov	r3, #-1
	str	r3, [sp, #44]
	.loc 1 294 14
	ldr	r3, .L19
	ldr	r3, [r3]
	.loc 1 294 5
	cmp	r3, #0
	beq	.L4
	.loc 1 295 8
	ldr	r3, .L19
	ldr	r0, [r3]
	add	r1, sp, #16
	movs	r3, #0
	movs	r2, #100
	bl	xQueueGenericReceive
	mov	r3, r0
	.loc 1 295 7
	cmp	r3, #1
	bne	.L17
	.loc 1 297 21
	ldrb	r3, [sp, #16]	@ zero_extendqisi2
	.loc 1 297 7
	cmp	r3, #2
	beq	.L6
	cmp	r3, #2
	bgt	.L7
	cmp	r3, #0
	beq	.L8
	cmp	r3, #1
	beq	.L9
	b	.L7
.L6:
	.loc 1 300 14
	mov	r4, sp
	add	r3, sp, #24
	ldm	r3, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	add	r3, sp, #16
	ldm	r3, {r2, r3}
	ldr	r0, .L19+4
	bl	newTag
	mov	r3, r0
	.loc 1 300 13
	cmp	r3, #0
	beq	.L10
	.loc 1 301 59
	ldrd	r2, [sp, #24]
	.loc 1 301 13
	mov	r3, r2
	mov	r1, r3
	ldr	r0, .L19+8
	bl	printf
	.loc 1 306 11
	b	.L16
.L10:
	.loc 1 303 13
	ldr	r0, .L19+12
	bl	printf
	.loc 1 306 11
	b	.L16
.L8:
	.loc 1 309 25
	ldrd	r2, [sp, #24]
	ldr	r0, .L19+4
	bl	tagOnList
	str	r0, [sp, #44]
	.loc 1 309 15
	ldr	r3, [sp, #44]
	cmp	r3, #-1
	beq	.L12
	.loc 1 310 21
	ldr	r3, [sp, #44]
	movs	r2, #88
	mul	r3, r2, r3
	ldr	r2, .L19+4
	adds	r5, r3, r2
	mov	r4, sp
	add	r3, sp, #24
	ldm	r3, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	add	r3, sp, #16
	ldm	r3, {r2, r3}
	mov	r0, r5
	bl	updateTag
	mov	r3, r0
	.loc 1 310 19
	cmp	r3, #0
	bne	.L18
	.loc 1 311 73
	ldr	r2, .L19+4
	ldr	r3, [sp, #44]
	movs	r1, #88
	mul	r3, r1, r3
	add	r3, r3, r2
	adds	r3, r3, #8
	ldrd	r2, [r3]
	.loc 1 311 17
	mov	r3, r2
	mov	r1, r3
	ldr	r0, .L19+16
	bl	printf
	.loc 1 317 11
	b	.L18
.L12:
	.loc 1 314 70
	ldrd	r2, [sp, #24]
	.loc 1 314 13
	mov	r3, r2
	mov	r1, r3
	ldr	r0, .L19+20
	bl	printf
	.loc 1 317 11
	b	.L18
.L9:
	.loc 1 320 14
	ldrd	r2, [sp, #24]
	ldr	r0, .L19+4
	bl	deleteTag
	mov	r3, r0
	.loc 1 320 13
	cmp	r3, #0
	beq	.L14
	.loc 1 321 58
	ldrd	r2, [sp, #24]
	.loc 1 321 13
	mov	r3, r2
	mov	r1, r3
	ldr	r0, .L19+24
	bl	printf
	.loc 1 325 11
	b	.L16
.L14:
	.loc 1 323 72
	ldrd	r2, [sp, #24]
	.loc 1 323 13
	mov	r3, r2
	mov	r1, r3
	ldr	r0, .L19+28
	bl	printf
	.loc 1 325 11
	b	.L16
.L7:
	.loc 1 328 11
	ldr	r0, .L19+32
	bl	printf
	b	.L16
.L4:
	.loc 1 332 5
	ldr	r0, .L19+36
	bl	printf
	b	.L16
.L17:
	.loc 1 330 5
	nop
	b	.L16
.L18:
	.loc 1 317 11
	nop
.L16:
	.loc 1 335 1
	nop
	mov	r0, r3
	add	sp, sp, #52
.LCFI4:
	@ sp needed
	pop	{r4, r5, pc}
.L20:
	.align	2
.L19:
	.word	xQueue
	.word	tag
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
.LFE269:
	.size	movementAnalyzer, .-movementAnalyzer
	.section	.text.tagOnList,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	tagOnList, %function
tagOnList:
.LFB270:
	.loc 1 345 47
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI5:
	str	r0, [sp, #12]
	strd	r2, [sp]
.LBB2:
	.loc 1 347 11
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 347 3
	b	.L22
.L25:
	.loc 1 348 18
	ldr	r3, [sp, #20]
	movs	r2, #88
	mul	r3, r2, r3
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	.loc 1 348 29
	ldrd	r2, [r3, #8]
	.loc 1 348 7
	ldrd	r0, [sp]
	cmp	r1, r3
	it	eq
	cmpeq	r0, r2
	bne	.L23
	.loc 1 348 34 discriminator 1
	ldrd	r2, [sp]
	orrs	r3, r2, r3
	beq	.L23
	.loc 1 349 14
	ldr	r3, [sp, #20]
	b	.L24
.L23:
	.loc 1 347 35 discriminator 2
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
.L22:
	.loc 1 347 3 discriminator 1
	ldr	r3, [sp, #20]
	cmp	r3, #2
	ble	.L25
.LBE2:
	.loc 1 352 10
	mov	r3, #-1
.L24:
	.loc 1 353 1
	mov	r0, r3
	add	sp, sp, #24
.LCFI6:
	@ sp needed
	bx	lr
.LFE270:
	.size	tagOnList, .-tagOnList
	.section	.text.deleteTag,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	deleteTag, %function
deleteTag:
.LFB271:
	.loc 1 356 49
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI7:
	sub	sp, sp, #28
.LCFI8:
	str	r0, [sp, #12]
	strd	r2, [sp]
.LBB3:
	.loc 1 358 11
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 358 3
	b	.L27
.L30:
	.loc 1 359 11
	ldr	r3, [sp, #20]
	movs	r2, #88
	mul	r3, r2, r3
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	.loc 1 359 22
	ldrd	r2, [r3, #8]
	.loc 1 359 7
	ldrd	r0, [sp]
	cmp	r1, r3
	it	eq
	cmpeq	r0, r2
	bne	.L28
	.loc 1 360 10
	ldr	r3, [sp, #20]
	movs	r2, #88
	mul	r3, r2, r3
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	.loc 1 360 14
	ldr	r2, .L31
	mov	r0, r3
	mov	r1, r2
	movs	r3, #88
	mov	r2, r3
	bl	memcpy
	.loc 1 361 14
	movs	r3, #1
	b	.L29
.L28:
	.loc 1 358 35 discriminator 2
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
.L27:
	.loc 1 358 3 discriminator 1
	ldr	r3, [sp, #20]
	cmp	r3, #2
	ble	.L30
.LBE3:
	.loc 1 364 10
	movs	r3, #0
.L29:
	.loc 1 365 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI9:
	@ sp needed
	ldr	pc, [sp], #4
.L32:
	.align	2
.L31:
	.word	default_tag
.LFE271:
	.size	deleteTag, .-deleteTag
	.section .rodata
	.align	2
.LC8:
	.ascii	"access granted! deleted tag id:%d \015\012\000"
	.section	.text.newTag,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	newTag, %function
newTag:
.LFB272:
	.loc 1 368 49
	@ args = 24, pretend = 8, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #8
.LCFI10:
	push	{r4, r5, lr}
.LCFI11:
	sub	sp, sp, #20
.LCFI12:
	str	r0, [sp, #4]
	add	r1, sp, #32
	stm	r1, {r2, r3}
.LBB4:
	.loc 1 370 11
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 370 3
	b	.L34
.L38:
	.loc 1 371 12
	ldr	r3, [sp, #12]
	movs	r2, #88
	mul	r3, r2, r3
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	.loc 1 371 15
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	.loc 1 371 8
	eor	r3, r3, #1
	uxtb	r3, r3
	.loc 1 371 7
	cmp	r3, #0
	beq	.L35
	.loc 1 372 10
	ldr	r3, [sp, #12]
	movs	r2, #88
	mul	r3, r2, r3
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	.loc 1 372 20
	movs	r2, #1
	strb	r2, [r3, #24]
	.loc 1 373 10
	ldr	r3, [sp, #12]
	movs	r2, #88
	mul	r3, r2, r3
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	.loc 1 373 22
	mov	r5, r3
	add	r4, sp, #32
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldm	r4, {r0, r1}
	stm	r5, {r0, r1}
	.loc 1 374 26
	ldr	r3, [sp, #12]
	movs	r2, #88
	mul	r3, r2, r3
	.loc 1 374 10
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	mov	r0, r3
	bl	tagAnalysis
	mov	r3, r0
	.loc 1 374 9
	cmp	r3, #0
	beq	.L36
	.loc 1 375 69
	ldrd	r2, [sp, #40]
	.loc 1 375 9
	mov	r3, r2
	mov	r1, r3
	ldr	r0, .L39
	bl	printf
	.loc 1 376 23
	ldr	r3, [sp, #12]
	movs	r2, #88
	mul	r3, r2, r3
	.loc 1 376 9
	ldr	r2, [sp, #4]
	adds	r1, r2, r3
	ldrd	r2, [sp, #40]
	mov	r0, r1
	bl	deleteTag
.L36:
	.loc 1 378 14
	movs	r3, #1
	b	.L37
.L35:
	.loc 1 370 35 discriminator 2
	ldr	r3, [sp, #12]
	adds	r3, r3, #1
	str	r3, [sp, #12]
.L34:
	.loc 1 370 3 discriminator 1
	ldr	r3, [sp, #12]
	cmp	r3, #2
	ble	.L38
.LBE4:
	.loc 1 381 10
	movs	r3, #0
.L37:
	.loc 1 382 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI13:
	@ sp needed
	pop	{r4, r5, lr}
.LCFI14:
	add	sp, sp, #8
.LCFI15:
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LC8
.LFE272:
	.size	newTag, .-newTag
	.section	.text.updateTag,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	updateTag, %function
updateTag:
.LFB273:
	.loc 1 384 51
	@ args = 24, pretend = 8, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #8
.LCFI16:
	push	{r4, r5, lr}
.LCFI17:
	sub	sp, sp, #12
.LCFI18:
	str	r0, [sp, #4]
	add	r1, sp, #24
	stm	r1, {r2, r3}
	.loc 1 385 16
	ldr	r3, [sp, #4]
	mov	r5, r3
	add	r4, sp, #24
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldm	r4, {r0, r1}
	stm	r5, {r0, r1}
	.loc 1 386 6
	ldr	r0, [sp, #4]
	bl	tagAnalysis
	mov	r3, r0
	.loc 1 386 5
	cmp	r3, #0
	beq	.L42
	.loc 1 387 65
	ldrd	r2, [sp, #32]
	.loc 1 387 5
	mov	r3, r2
	mov	r1, r3
	ldr	r0, .L44
	bl	printf
	.loc 1 388 5
	ldrd	r2, [sp, #32]
	ldr	r0, [sp, #4]
	bl	deleteTag
	.loc 1 389 12
	movs	r3, #1
	b	.L43
.L42:
	.loc 1 391 10
	movs	r3, #0
.L43:
	.loc 1 392 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI19:
	@ sp needed
	pop	{r4, r5, lr}
.LCFI20:
	add	sp, sp, #8
.LCFI21:
	bx	lr
.L45:
	.align	2
.L44:
	.word	.LC8
.LFE273:
	.size	updateTag, .-updateTag
	.global	__aeabi_dmul
	.section .rodata
	.align	2
.LC9:
	.ascii	"Distance : %f\015\012\000"
	.global	__aeabi_dcmpgt
	.section	.text.tagAnalysis,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	tagAnalysis, %function
tagAnalysis:
.LFB274:
	.loc 1 394 41
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI22:
	sub	sp, sp, #12
.LCFI23:
	str	r0, [sp, #4]
	.loc 1 395 8
	ldr	r3, [sp, #4]
	ldrd	r2, [r3, #8]
	mov	r0, r2
	mov	r1, r3
	bl	onIgnorelist
	mov	r3, r0
	.loc 1 395 7
	cmp	r3, #0
	beq	.L47
	.loc 1 398 18
	mov	r3, #-1
	b	.L48
.L47:
	.loc 1 401 28
	ldr	r3, [sp, #4]
	ldrd	r0, [r3, #16]
	.loc 1 401 32
	adr	r3, .L54+12
	ldrd	r2, [r3]
	bl	__aeabi_dmul
.LVL0:
	mov	r2, r0
	mov	r3, r1
	.loc 1 401 14
	ldr	r1, .L54
	strd	r2, [r1]
	.loc 1 402 5
	ldr	r3, .L54
	ldrd	r2, [r3]
	ldr	r0, .L54+4
	bl	printf
	.loc 1 403 17
	ldr	r3, .L54
	ldrd	r0, [r3]
	.loc 1 403 7
	mov	r2, #0
	ldr	r3, .L54+8
	bl	__aeabi_dcmpgt
.LVL1:
	mov	r3, r0
	cmp	r3, #0
	beq	.L53
	.loc 1 404 7
	ldr	r3, [sp, #4]
	ldrd	r2, [r3, #8]
	mov	r0, r2
	mov	r1, r3
	bl	putOnIgnorelist
	.loc 1 405 14
	mvn	r3, #1
	b	.L48
.L53:
	.loc 1 408 13
	ldr	r3, .L54
	vldr.64	d7, [r3]
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	ldr	r0, [sp, #4]
	bl	analysis
	mov	r3, r0
	.loc 1 408 12
	cmp	r3, #0
	beq	.L51
	.loc 1 410 13
	movs	r3, #1
	b	.L48
.L51:
	.loc 1 412 12
	movs	r3, #0
.L48:
	.loc 1 414 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI24:
	@ sp needed
	ldr	pc, [sp], #4
.L55:
	.align	3
.L54:
	.word	distance
	.word	.LC9
	.word	1076101120
	.word	318767104
	.word	1102175513
.LFE274:
	.size	tagAnalysis, .-tagAnalysis
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
	.4byte	.LFB268
	.4byte	.LFE268-.LFB268
	.byte	0x4
	.4byte	.LCFI0-.LFB268
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB269
	.4byte	.LFE269-.LFB269
	.byte	0x4
	.4byte	.LCFI2-.LFB269
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0xc
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB270
	.4byte	.LFE270-.LFB270
	.byte	0x4
	.4byte	.LCFI5-.LFB270
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB271
	.4byte	.LFE271-.LFB271
	.byte	0x4
	.4byte	.LCFI7-.LFB271
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB272
	.4byte	.LFE272-.LFB272
	.byte	0x4
	.4byte	.LCFI10-.LFB272
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x14
	.byte	0x84
	.uleb128 0x5
	.byte	0x85
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xce
	.byte	0xc5
	.byte	0xc4
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB273
	.4byte	.LFE273-.LFB273
	.byte	0x4
	.4byte	.LCFI16-.LFB273
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x14
	.byte	0x84
	.uleb128 0x5
	.byte	0x85
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xce
	.byte	0xc5
	.byte	0xc4
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB274
	.4byte	.LFE274-.LFB274
	.byte	0x4
	.4byte	.LCFI22-.LFB274
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE12:
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/__crossworks.h"
	.file 3 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/stdio.h"
	.file 4 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/stdint.h"
	.file 5 "../../../nRF5_SDK_14.2.0/components/device/nrf52.h"
	.file 6 "C:/Users/Keld/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/CMSIS_5/CMSIS/Core/Include/core_cm4.h"
	.file 7 "../../../nRF5_SDK_14.2.0/components/toolchain/system_nrf52.h"
	.file 8 "../../../nRF5_SDK_14.2.0/components/libraries/util/app_util.h"
	.file 9 "../../../nRF5_SDK_14.2.0/external/freertos/portable/CMSIS/nrf52/portmacro_cmsis.h"
	.file 10 "../../../nRF5_SDK_14.2.0/components/drivers_nrf/hal/nrf_spi.h"
	.file 11 "../../../nRF5_SDK_14.2.0/components/drivers_nrf/spi_master/nrf_drv_spi.h"
	.file 12 "../../../nRF5_SDK_14.2.0/components/libraries/experimental_log/src/nrf_log_internal.h"
	.file 13 "../../../nRF5_SDK_14.2.0/external/freertos/source/include/queue.h"
	.file 14 "c:\\users\\keld\\documents\\github\\pro5_unitek\\code\\ss_twr_init\\movementstruct\\movementstruct.h"
	.file 15 "../../../deca_driver/port/port_platform.h"
	.file 16 "c:\\users\\keld\\documents\\github\\pro5_unitek\\code\\ss_twr_init\\movementanalysis\\movementanalysis.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x11f5
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF247
	.byte	0xc
	.4byte	.LASF248
	.4byte	.LASF249
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
	.uleb128 0xc
	.4byte	.LASF86
	.byte	0x4
	.byte	0x2a
	.byte	0x1c
	.4byte	0x27a
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF87
	.uleb128 0xc
	.4byte	.LASF88
	.byte	0x4
	.byte	0x30
	.byte	0x1c
	.4byte	0x534
	.uleb128 0xc
	.4byte	.LASF89
	.byte	0x4
	.byte	0x36
	.byte	0x1c
	.4byte	0x4f
	.uleb128 0x15
	.4byte	0x613
	.uleb128 0xc
	.4byte	.LASF90
	.byte	0x4
	.byte	0x37
	.byte	0x1c
	.4byte	0x88
	.uleb128 0x15
	.4byte	0x624
	.uleb128 0xa
	.4byte	0x630
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF91
	.uleb128 0xc
	.4byte	.LASF92
	.byte	0x4
	.byte	0x45
	.byte	0x1c
	.4byte	0x64d
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF93
	.uleb128 0x16
	.byte	0x5
	.byte	0x1
	.4byte	0x5ed
	.byte	0x5
	.byte	0x4a
	.byte	0xe
	.4byte	0x77d
	.uleb128 0x17
	.4byte	.LASF94
	.sleb128 -15
	.uleb128 0x17
	.4byte	.LASF95
	.sleb128 -14
	.uleb128 0x17
	.4byte	.LASF96
	.sleb128 -13
	.uleb128 0x17
	.4byte	.LASF97
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF98
	.sleb128 -11
	.uleb128 0x17
	.4byte	.LASF99
	.sleb128 -10
	.uleb128 0x17
	.4byte	.LASF100
	.sleb128 -5
	.uleb128 0x17
	.4byte	.LASF101
	.sleb128 -4
	.uleb128 0x17
	.4byte	.LASF102
	.sleb128 -2
	.uleb128 0x17
	.4byte	.LASF103
	.sleb128 -1
	.uleb128 0x18
	.4byte	.LASF104
	.byte	0
	.uleb128 0x18
	.4byte	.LASF105
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF106
	.byte	0x2
	.uleb128 0x18
	.4byte	.LASF107
	.byte	0x3
	.uleb128 0x18
	.4byte	.LASF108
	.byte	0x4
	.uleb128 0x18
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF110
	.byte	0x6
	.uleb128 0x18
	.4byte	.LASF111
	.byte	0x7
	.uleb128 0x18
	.4byte	.LASF112
	.byte	0x8
	.uleb128 0x18
	.4byte	.LASF113
	.byte	0x9
	.uleb128 0x18
	.4byte	.LASF114
	.byte	0xa
	.uleb128 0x18
	.4byte	.LASF115
	.byte	0xb
	.uleb128 0x18
	.4byte	.LASF116
	.byte	0xc
	.uleb128 0x18
	.4byte	.LASF117
	.byte	0xd
	.uleb128 0x18
	.4byte	.LASF118
	.byte	0xe
	.uleb128 0x18
	.4byte	.LASF119
	.byte	0xf
	.uleb128 0x18
	.4byte	.LASF120
	.byte	0x10
	.uleb128 0x18
	.4byte	.LASF121
	.byte	0x11
	.uleb128 0x18
	.4byte	.LASF122
	.byte	0x12
	.uleb128 0x18
	.4byte	.LASF123
	.byte	0x13
	.uleb128 0x18
	.4byte	.LASF124
	.byte	0x14
	.uleb128 0x18
	.4byte	.LASF125
	.byte	0x15
	.uleb128 0x18
	.4byte	.LASF126
	.byte	0x16
	.uleb128 0x18
	.4byte	.LASF127
	.byte	0x17
	.uleb128 0x18
	.4byte	.LASF128
	.byte	0x18
	.uleb128 0x18
	.4byte	.LASF129
	.byte	0x19
	.uleb128 0x18
	.4byte	.LASF130
	.byte	0x1a
	.uleb128 0x18
	.4byte	.LASF131
	.byte	0x1b
	.uleb128 0x18
	.4byte	.LASF132
	.byte	0x1c
	.uleb128 0x18
	.4byte	.LASF133
	.byte	0x1d
	.uleb128 0x18
	.4byte	.LASF134
	.byte	0x20
	.uleb128 0x18
	.4byte	.LASF135
	.byte	0x21
	.uleb128 0x18
	.4byte	.LASF136
	.byte	0x22
	.uleb128 0x18
	.4byte	.LASF137
	.byte	0x23
	.uleb128 0x18
	.4byte	.LASF138
	.byte	0x24
	.uleb128 0x18
	.4byte	.LASF139
	.byte	0x25
	.uleb128 0x18
	.4byte	.LASF140
	.byte	0x26
	.byte	0
	.uleb128 0xc
	.4byte	.LASF141
	.byte	0x5
	.byte	0x7e
	.byte	0x3
	.4byte	0x654
	.uleb128 0xd
	.4byte	0x635
	.4byte	0x799
	.uleb128 0xe
	.4byte	0x88
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.4byte	0x789
	.uleb128 0x15
	.4byte	0x799
	.uleb128 0xd
	.4byte	0x635
	.4byte	0x7b3
	.uleb128 0xe
	.4byte	0x88
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.4byte	0x7a3
	.uleb128 0x15
	.4byte	0x7b3
	.uleb128 0x15
	.4byte	0x7b3
	.uleb128 0xf
	.4byte	.LASF142
	.byte	0x6
	.2byte	0x804
	.byte	0x19
	.4byte	0x61f
	.uleb128 0x19
	.4byte	.LASF143
	.byte	0x7
	.byte	0x21
	.byte	0x11
	.4byte	0x624
	.uleb128 0xb
	.byte	0xc
	.byte	0x5
	.byte	0xf3
	.byte	0x9
	.4byte	0x80c
	.uleb128 0x1a
	.ascii	"SCK\000"
	.byte	0x5
	.byte	0xf4
	.byte	0x12
	.4byte	0x630
	.byte	0
	.uleb128 0x4
	.4byte	.LASF144
	.byte	0x5
	.byte	0xf5
	.byte	0x12
	.4byte	0x630
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF145
	.byte	0x5
	.byte	0xf6
	.byte	0x12
	.4byte	0x630
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.4byte	.LASF146
	.byte	0x5
	.byte	0xf7
	.byte	0x3
	.4byte	0x7db
	.uleb128 0xb
	.byte	0x10
	.byte	0x5
	.byte	0xf9
	.byte	0x9
	.4byte	0x856
	.uleb128 0x1a
	.ascii	"PTR\000"
	.byte	0x5
	.byte	0xfa
	.byte	0x12
	.4byte	0x630
	.byte	0
	.uleb128 0x4
	.4byte	.LASF147
	.byte	0x5
	.byte	0xfb
	.byte	0x12
	.4byte	0x630
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF148
	.byte	0x5
	.byte	0xfc
	.byte	0x12
	.4byte	0x635
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF149
	.byte	0x5
	.byte	0xfd
	.byte	0x12
	.4byte	0x630
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.4byte	.LASF150
	.byte	0x5
	.byte	0xfe
	.byte	0x3
	.4byte	0x818
	.uleb128 0x1b
	.byte	0x10
	.byte	0x5
	.2byte	0x100
	.byte	0x9
	.4byte	0x8a5
	.uleb128 0x1c
	.ascii	"PTR\000"
	.byte	0x5
	.2byte	0x101
	.byte	0x12
	.4byte	0x630
	.byte	0
	.uleb128 0x14
	.4byte	.LASF147
	.byte	0x5
	.2byte	0x102
	.byte	0x12
	.4byte	0x630
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF148
	.byte	0x5
	.2byte	0x103
	.byte	0x12
	.4byte	0x635
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF149
	.byte	0x5
	.2byte	0x104
	.byte	0x12
	.4byte	0x630
	.byte	0xc
	.byte	0
	.uleb128 0x12
	.4byte	.LASF151
	.byte	0x5
	.2byte	0x105
	.byte	0x3
	.4byte	0x862
	.uleb128 0x1b
	.byte	0xc
	.byte	0x5
	.2byte	0x13e
	.byte	0x9
	.4byte	0x8e7
	.uleb128 0x1c
	.ascii	"SCK\000"
	.byte	0x5
	.2byte	0x13f
	.byte	0x12
	.4byte	0x630
	.byte	0
	.uleb128 0x14
	.4byte	.LASF144
	.byte	0x5
	.2byte	0x140
	.byte	0x12
	.4byte	0x630
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF145
	.byte	0x5
	.2byte	0x141
	.byte	0x12
	.4byte	0x630
	.byte	0x8
	.byte	0
	.uleb128 0x12
	.4byte	.LASF152
	.byte	0x5
	.2byte	0x142
	.byte	0x3
	.4byte	0x8b2
	.uleb128 0xd
	.4byte	0x635
	.4byte	0x904
	.uleb128 0xe
	.4byte	0x88
	.byte	0x3f
	.byte	0
	.uleb128 0xa
	.4byte	0x8f4
	.uleb128 0x15
	.4byte	0x904
	.uleb128 0xd
	.4byte	0x635
	.4byte	0x91e
	.uleb128 0xe
	.4byte	0x88
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.4byte	0x90e
	.uleb128 0x15
	.4byte	0x91e
	.uleb128 0xd
	.4byte	0x635
	.4byte	0x938
	.uleb128 0xe
	.4byte	0x88
	.byte	0xa
	.byte	0
	.uleb128 0xa
	.4byte	0x928
	.uleb128 0x15
	.4byte	0x938
	.uleb128 0xd
	.4byte	0x635
	.4byte	0x952
	.uleb128 0xe
	.4byte	0x88
	.byte	0x37
	.byte	0
	.uleb128 0xa
	.4byte	0x942
	.uleb128 0x15
	.4byte	0x952
	.uleb128 0x1d
	.2byte	0x5c4
	.byte	0x5
	.2byte	0x33b
	.byte	0x9
	.4byte	0xb50
	.uleb128 0x14
	.4byte	.LASF153
	.byte	0x5
	.2byte	0x33c
	.byte	0x12
	.4byte	0x7b8
	.byte	0
	.uleb128 0x14
	.4byte	.LASF154
	.byte	0x5
	.2byte	0x33d
	.byte	0x12
	.4byte	0x630
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF155
	.byte	0x5
	.2byte	0x33e
	.byte	0x12
	.4byte	0x630
	.byte	0x14
	.uleb128 0x14
	.4byte	.LASF156
	.byte	0x5
	.2byte	0x33f
	.byte	0x12
	.4byte	0x635
	.byte	0x18
	.uleb128 0x14
	.4byte	.LASF157
	.byte	0x5
	.2byte	0x340
	.byte	0x12
	.4byte	0x630
	.byte	0x1c
	.uleb128 0x14
	.4byte	.LASF158
	.byte	0x5
	.2byte	0x341
	.byte	0x12
	.4byte	0x630
	.byte	0x20
	.uleb128 0x14
	.4byte	.LASF159
	.byte	0x5
	.2byte	0x342
	.byte	0x12
	.4byte	0x957
	.byte	0x24
	.uleb128 0x1e
	.4byte	.LASF160
	.byte	0x5
	.2byte	0x343
	.byte	0x12
	.4byte	0x630
	.2byte	0x104
	.uleb128 0x1e
	.4byte	.LASF161
	.byte	0x5
	.2byte	0x344
	.byte	0x12
	.4byte	0x79e
	.2byte	0x108
	.uleb128 0x1e
	.4byte	.LASF162
	.byte	0x5
	.2byte	0x345
	.byte	0x12
	.4byte	0x630
	.2byte	0x110
	.uleb128 0x1e
	.4byte	.LASF163
	.byte	0x5
	.2byte	0x346
	.byte	0x12
	.4byte	0x635
	.2byte	0x114
	.uleb128 0x1e
	.4byte	.LASF164
	.byte	0x5
	.2byte	0x347
	.byte	0x12
	.4byte	0x630
	.2byte	0x118
	.uleb128 0x1e
	.4byte	.LASF165
	.byte	0x5
	.2byte	0x348
	.byte	0x12
	.4byte	0x635
	.2byte	0x11c
	.uleb128 0x1e
	.4byte	.LASF166
	.byte	0x5
	.2byte	0x349
	.byte	0x12
	.4byte	0x630
	.2byte	0x120
	.uleb128 0x1e
	.4byte	.LASF167
	.byte	0x5
	.2byte	0x34a
	.byte	0x12
	.4byte	0xb65
	.2byte	0x124
	.uleb128 0x1e
	.4byte	.LASF168
	.byte	0x5
	.2byte	0x34b
	.byte	0x12
	.4byte	0x630
	.2byte	0x14c
	.uleb128 0x1e
	.4byte	.LASF169
	.byte	0x5
	.2byte	0x34c
	.byte	0x12
	.4byte	0xb7f
	.2byte	0x150
	.uleb128 0x1e
	.4byte	.LASF170
	.byte	0x5
	.2byte	0x34d
	.byte	0x12
	.4byte	0x630
	.2byte	0x200
	.uleb128 0x1e
	.4byte	.LASF171
	.byte	0x5
	.2byte	0x34e
	.byte	0x12
	.4byte	0x909
	.2byte	0x204
	.uleb128 0x1e
	.4byte	.LASF172
	.byte	0x5
	.2byte	0x34f
	.byte	0x12
	.4byte	0x630
	.2byte	0x304
	.uleb128 0x1e
	.4byte	.LASF173
	.byte	0x5
	.2byte	0x350
	.byte	0x12
	.4byte	0x630
	.2byte	0x308
	.uleb128 0x1e
	.4byte	.LASF174
	.byte	0x5
	.2byte	0x351
	.byte	0x12
	.4byte	0xb99
	.2byte	0x30c
	.uleb128 0x1e
	.4byte	.LASF175
	.byte	0x5
	.2byte	0x352
	.byte	0x12
	.4byte	0x630
	.2byte	0x500
	.uleb128 0x1e
	.4byte	.LASF176
	.byte	0x5
	.2byte	0x353
	.byte	0x12
	.4byte	0x635
	.2byte	0x504
	.uleb128 0x1e
	.4byte	.LASF177
	.byte	0x5
	.2byte	0x354
	.byte	0x12
	.4byte	0x80c
	.2byte	0x508
	.uleb128 0x1e
	.4byte	.LASF178
	.byte	0x5
	.2byte	0x355
	.byte	0x12
	.4byte	0x7bd
	.2byte	0x514
	.uleb128 0x1e
	.4byte	.LASF179
	.byte	0x5
	.2byte	0x356
	.byte	0x12
	.4byte	0x630
	.2byte	0x524
	.uleb128 0x1e
	.4byte	.LASF180
	.byte	0x5
	.2byte	0x357
	.byte	0x12
	.4byte	0x923
	.2byte	0x528
	.uleb128 0x1f
	.ascii	"RXD\000"
	.byte	0x5
	.2byte	0x358
	.byte	0x11
	.4byte	0x856
	.2byte	0x534
	.uleb128 0x1f
	.ascii	"TXD\000"
	.byte	0x5
	.2byte	0x359
	.byte	0x11
	.4byte	0x8a5
	.2byte	0x544
	.uleb128 0x1e
	.4byte	.LASF181
	.byte	0x5
	.2byte	0x35a
	.byte	0x12
	.4byte	0x630
	.2byte	0x554
	.uleb128 0x1e
	.4byte	.LASF182
	.byte	0x5
	.2byte	0x35b
	.byte	0x12
	.4byte	0xbb8
	.2byte	0x558
	.uleb128 0x1f
	.ascii	"ORC\000"
	.byte	0x5
	.2byte	0x35c
	.byte	0x12
	.4byte	0x630
	.2byte	0x5c0
	.byte	0
	.uleb128 0xd
	.4byte	0x635
	.4byte	0xb60
	.uleb128 0xe
	.4byte	0x88
	.byte	0x9
	.byte	0
	.uleb128 0xa
	.4byte	0xb50
	.uleb128 0x15
	.4byte	0xb60
	.uleb128 0xd
	.4byte	0x635
	.4byte	0xb7a
	.uleb128 0xe
	.4byte	0x88
	.byte	0x2b
	.byte	0
	.uleb128 0xa
	.4byte	0xb6a
	.uleb128 0x15
	.4byte	0xb7a
	.uleb128 0xd
	.4byte	0x635
	.4byte	0xb94
	.uleb128 0xe
	.4byte	0x88
	.byte	0x7c
	.byte	0
	.uleb128 0xa
	.4byte	0xb84
	.uleb128 0x15
	.4byte	0xb94
	.uleb128 0x15
	.4byte	0xb94
	.uleb128 0xd
	.4byte	0x635
	.4byte	0xbb3
	.uleb128 0xe
	.4byte	0x88
	.byte	0x19
	.byte	0
	.uleb128 0xa
	.4byte	0xba3
	.uleb128 0x15
	.4byte	0xbb3
	.uleb128 0x12
	.4byte	.LASF183
	.byte	0x5
	.2byte	0x35e
	.byte	0x3
	.4byte	0x95c
	.uleb128 0x1d
	.2byte	0x558
	.byte	0x5
	.2byte	0x404
	.byte	0x9
	.4byte	0xcc5
	.uleb128 0x14
	.4byte	.LASF153
	.byte	0x5
	.2byte	0x405
	.byte	0x12
	.4byte	0xcda
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF184
	.byte	0x5
	.2byte	0x406
	.byte	0x12
	.4byte	0x630
	.2byte	0x108
	.uleb128 0x1e
	.4byte	.LASF156
	.byte	0x5
	.2byte	0x407
	.byte	0x12
	.4byte	0xcf4
	.2byte	0x10c
	.uleb128 0x1e
	.4byte	.LASF172
	.byte	0x5
	.2byte	0x408
	.byte	0x12
	.4byte	0x630
	.2byte	0x304
	.uleb128 0x1e
	.4byte	.LASF173
	.byte	0x5
	.2byte	0x409
	.byte	0x12
	.4byte	0x630
	.2byte	0x308
	.uleb128 0x1e
	.4byte	.LASF159
	.byte	0x5
	.2byte	0x40a
	.byte	0x12
	.4byte	0xb9e
	.2byte	0x30c
	.uleb128 0x1e
	.4byte	.LASF175
	.byte	0x5
	.2byte	0x40b
	.byte	0x12
	.4byte	0x630
	.2byte	0x500
	.uleb128 0x1e
	.4byte	.LASF161
	.byte	0x5
	.2byte	0x40c
	.byte	0x12
	.4byte	0x635
	.2byte	0x504
	.uleb128 0x1e
	.4byte	.LASF177
	.byte	0x5
	.2byte	0x40d
	.byte	0x11
	.4byte	0x8e7
	.2byte	0x508
	.uleb128 0x1e
	.4byte	.LASF163
	.byte	0x5
	.2byte	0x40e
	.byte	0x12
	.4byte	0x635
	.2byte	0x514
	.uleb128 0x1f
	.ascii	"RXD\000"
	.byte	0x5
	.2byte	0x40f
	.byte	0x12
	.4byte	0x635
	.2byte	0x518
	.uleb128 0x1f
	.ascii	"TXD\000"
	.byte	0x5
	.2byte	0x410
	.byte	0x12
	.4byte	0x630
	.2byte	0x51c
	.uleb128 0x1e
	.4byte	.LASF165
	.byte	0x5
	.2byte	0x411
	.byte	0x12
	.4byte	0x635
	.2byte	0x520
	.uleb128 0x1e
	.4byte	.LASF179
	.byte	0x5
	.2byte	0x412
	.byte	0x12
	.4byte	0x630
	.2byte	0x524
	.uleb128 0x1e
	.4byte	.LASF167
	.byte	0x5
	.2byte	0x413
	.byte	0x12
	.4byte	0x93d
	.2byte	0x528
	.uleb128 0x1e
	.4byte	.LASF181
	.byte	0x5
	.2byte	0x414
	.byte	0x12
	.4byte	0x630
	.2byte	0x554
	.byte	0
	.uleb128 0xd
	.4byte	0x635
	.4byte	0xcd5
	.uleb128 0xe
	.4byte	0x88
	.byte	0x41
	.byte	0
	.uleb128 0xa
	.4byte	0xcc5
	.uleb128 0x15
	.4byte	0xcd5
	.uleb128 0xd
	.4byte	0x635
	.4byte	0xcef
	.uleb128 0xe
	.4byte	0x88
	.byte	0x7d
	.byte	0
	.uleb128 0xa
	.4byte	0xcdf
	.uleb128 0x15
	.4byte	0xcef
	.uleb128 0x12
	.4byte	.LASF185
	.byte	0x5
	.2byte	0x415
	.byte	0x3
	.4byte	0xbca
	.uleb128 0x19
	.4byte	.LASF186
	.byte	0x8
	.byte	0x4b
	.byte	0x11
	.4byte	0x624
	.uleb128 0x19
	.4byte	.LASF187
	.byte	0x8
	.byte	0x4c
	.byte	0x11
	.4byte	0x624
	.uleb128 0xc
	.4byte	.LASF188
	.byte	0x9
	.byte	0x63
	.byte	0xe
	.4byte	0x56
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF189
	.uleb128 0xc
	.4byte	.LASF190
	.byte	0x9
	.byte	0x6a
	.byte	0x16
	.4byte	0x624
	.uleb128 0x16
	.byte	0x5
	.byte	0x4
	.4byte	0x4f
	.byte	0xa
	.byte	0x5d
	.byte	0x1
	.4byte	0xd8c
	.uleb128 0x20
	.4byte	.LASF191
	.4byte	0x2000000
	.uleb128 0x20
	.4byte	.LASF192
	.4byte	0x4000000
	.uleb128 0x20
	.4byte	.LASF193
	.4byte	0x8000000
	.uleb128 0x20
	.4byte	.LASF194
	.4byte	0x10000000
	.uleb128 0x20
	.4byte	.LASF195
	.4byte	0x20000000
	.uleb128 0x20
	.4byte	.LASF196
	.4byte	0x40000000
	.uleb128 0x17
	.4byte	.LASF197
	.sleb128 -2147483648
	.byte	0
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x27a
	.byte	0xa
	.byte	0x6d
	.byte	0x1
	.4byte	0xdb3
	.uleb128 0x18
	.4byte	.LASF198
	.byte	0
	.uleb128 0x18
	.4byte	.LASF199
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF200
	.byte	0x2
	.uleb128 0x18
	.4byte	.LASF201
	.byte	0x3
	.byte	0
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x27a
	.byte	0xa
	.byte	0x78
	.byte	0x1
	.4byte	0xdce
	.uleb128 0x18
	.4byte	.LASF202
	.byte	0
	.uleb128 0x18
	.4byte	.LASF203
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.byte	0xb
	.byte	0x85
	.byte	0x9
	.4byte	0xe0c
	.uleb128 0x4
	.4byte	.LASF204
	.byte	0xb
	.byte	0x87
	.byte	0xf
	.4byte	0x25
	.byte	0
	.uleb128 0x1a
	.ascii	"irq\000"
	.byte	0xb
	.byte	0x88
	.byte	0xf
	.4byte	0x77d
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF205
	.byte	0xb
	.byte	0x89
	.byte	0xf
	.4byte	0x5f4
	.byte	0x5
	.uleb128 0x4
	.4byte	.LASF206
	.byte	0xb
	.byte	0x8a
	.byte	0xf
	.4byte	0xe0c
	.byte	0x6
	.byte	0
	.uleb128 0x6
	.byte	0x1
	.byte	0x2
	.4byte	.LASF207
	.uleb128 0x15
	.4byte	0xe0c
	.uleb128 0xc
	.4byte	.LASF208
	.byte	0xb
	.byte	0x8b
	.byte	0x3
	.4byte	0xdce
	.uleb128 0xa
	.4byte	0xe18
	.uleb128 0x1b
	.byte	0xc
	.byte	0xc
	.2byte	0x12b
	.byte	0x9
	.4byte	0xe6c
	.uleb128 0x14
	.4byte	.LASF209
	.byte	0xc
	.2byte	0x12d
	.byte	0x12
	.4byte	0x607
	.byte	0
	.uleb128 0x14
	.4byte	.LASF210
	.byte	0xc
	.2byte	0x12e
	.byte	0x12
	.4byte	0x607
	.byte	0x2
	.uleb128 0x14
	.4byte	.LASF211
	.byte	0xc
	.2byte	0x12f
	.byte	0x12
	.4byte	0x624
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF212
	.byte	0xc
	.2byte	0x130
	.byte	0x12
	.4byte	0x624
	.byte	0x8
	.byte	0
	.uleb128 0x12
	.4byte	.LASF213
	.byte	0xc
	.2byte	0x131
	.byte	0x3
	.4byte	0xe29
	.uleb128 0xf
	.4byte	.LASF214
	.byte	0xc
	.2byte	0x13b
	.byte	0x26
	.4byte	0xe6c
	.uleb128 0x21
	.ascii	"spi\000"
	.byte	0xf
	.byte	0x3a
	.byte	0x1c
	.4byte	0xe24
	.uleb128 0x5
	.byte	0x3
	.4byte	spi
	.uleb128 0x22
	.4byte	.LASF215
	.byte	0xf
	.byte	0x3b
	.byte	0x16
	.4byte	0xe13
	.uleb128 0x5
	.byte	0x3
	.4byte	spi_xfer_done
	.uleb128 0xc
	.4byte	.LASF216
	.byte	0xd
	.byte	0x58
	.byte	0x10
	.4byte	0x25
	.uleb128 0x16
	.byte	0x7
	.byte	0x1
	.4byte	0x27a
	.byte	0xe
	.byte	0xf
	.byte	0xe
	.4byte	0xed7
	.uleb128 0x18
	.4byte	.LASF217
	.byte	0
	.uleb128 0x18
	.4byte	.LASF218
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF219
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.4byte	.LASF220
	.byte	0xe
	.byte	0x13
	.byte	0x3
	.4byte	0xeb6
	.uleb128 0x3
	.4byte	.LASF221
	.byte	0x18
	.byte	0xe
	.byte	0x1e
	.byte	0x10
	.4byte	0xf17
	.uleb128 0x4
	.4byte	.LASF222
	.byte	0xe
	.byte	0x1f
	.byte	0xe
	.4byte	0xed7
	.byte	0
	.uleb128 0x1a
	.ascii	"id\000"
	.byte	0xe
	.byte	0x20
	.byte	0xc
	.4byte	0x641
	.byte	0x8
	.uleb128 0x1a
	.ascii	"tof\000"
	.byte	0xe
	.byte	0x21
	.byte	0xa
	.4byte	0xf17
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF223
	.uleb128 0xc
	.4byte	.LASF224
	.byte	0xe
	.byte	0x22
	.byte	0x2
	.4byte	0xee3
	.uleb128 0x3
	.4byte	.LASF225
	.byte	0x58
	.byte	0xe
	.byte	0x30
	.byte	0x9
	.4byte	0xfab
	.uleb128 0x4
	.4byte	.LASF221
	.byte	0xe
	.byte	0x31
	.byte	0xc
	.4byte	0xf1e
	.byte	0
	.uleb128 0x4
	.4byte	.LASF226
	.byte	0xe
	.byte	0x32
	.byte	0xa
	.4byte	0xe0c
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF227
	.byte	0xe
	.byte	0x33
	.byte	0xa
	.4byte	0xf17
	.byte	0x20
	.uleb128 0x4
	.4byte	.LASF228
	.byte	0xe
	.byte	0x34
	.byte	0xa
	.4byte	0xf17
	.byte	0x28
	.uleb128 0x4
	.4byte	.LASF229
	.byte	0xe
	.byte	0x35
	.byte	0xa
	.4byte	0xf17
	.byte	0x30
	.uleb128 0x4
	.4byte	.LASF230
	.byte	0xe
	.byte	0x36
	.byte	0xa
	.4byte	0xf17
	.byte	0x38
	.uleb128 0x4
	.4byte	.LASF231
	.byte	0xe
	.byte	0x37
	.byte	0xa
	.4byte	0xf17
	.byte	0x40
	.uleb128 0x4
	.4byte	.LASF232
	.byte	0xe
	.byte	0x38
	.byte	0xa
	.4byte	0xf17
	.byte	0x48
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0xe
	.byte	0x39
	.byte	0x7
	.4byte	0x4f
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF233
	.byte	0xe
	.byte	0x3c
	.byte	0x17
	.4byte	0xf2a
	.uleb128 0xa
	.4byte	0xfab
	.uleb128 0x22
	.4byte	.LASF234
	.byte	0x10
	.byte	0x12
	.byte	0xd
	.4byte	0xe0c
	.uleb128 0x5
	.byte	0x3
	.4byte	delayTimerInitialized
	.uleb128 0x22
	.4byte	.LASF235
	.byte	0x10
	.byte	0x13
	.byte	0xd
	.4byte	0xe0c
	.uleb128 0x5
	.byte	0x3
	.4byte	delaySample
	.uleb128 0xd
	.4byte	0xfab
	.4byte	0xff0
	.uleb128 0xe
	.4byte	0x88
	.byte	0x2
	.byte	0
	.uleb128 0x21
	.ascii	"tag\000"
	.byte	0x1
	.byte	0x21
	.byte	0xd
	.4byte	0xfe0
	.uleb128 0x5
	.byte	0x3
	.4byte	tag
	.uleb128 0x23
	.4byte	.LASF236
	.byte	0x1
	.byte	0x22
	.byte	0xc
	.4byte	0xfb7
	.uleb128 0x5
	.byte	0x3
	.4byte	default_tag
	.uleb128 0x19
	.4byte	.LASF237
	.byte	0x1
	.byte	0x25
	.byte	0x15
	.4byte	0xeaa
	.uleb128 0x22
	.4byte	.LASF238
	.byte	0x1
	.byte	0x3c
	.byte	0x11
	.4byte	0xf17
	.uleb128 0x5
	.byte	0x3
	.4byte	distance
	.uleb128 0x24
	.4byte	.LASF239
	.byte	0x1
	.2byte	0x18a
	.byte	0x11
	.4byte	0x624
	.4byte	.LFB274
	.4byte	.LFE274-.LFB274
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x105e
	.uleb128 0x25
	.ascii	"tag\000"
	.byte	0x1
	.2byte	0x18a
	.byte	0x24
	.4byte	0x105e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0xfab
	.uleb128 0x24
	.4byte	.LASF240
	.byte	0x1
	.2byte	0x180
	.byte	0xc
	.4byte	0x4f
	.4byte	.LFB273
	.4byte	.LFE273-.LFB273
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10a0
	.uleb128 0x25
	.ascii	"tag\000"
	.byte	0x1
	.2byte	0x180
	.byte	0x1c
	.4byte	0x105e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x26
	.4byte	.LASF221
	.byte	0x1
	.2byte	0x180
	.byte	0x2a
	.4byte	0xf1e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x24
	.4byte	.LASF241
	.byte	0x1
	.2byte	0x170
	.byte	0xe
	.4byte	0xe0c
	.4byte	.LFB272
	.4byte	.LFE272-.LFB272
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10f4
	.uleb128 0x25
	.ascii	"tag\000"
	.byte	0x1
	.2byte	0x170
	.byte	0x1b
	.4byte	0x105e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x26
	.4byte	.LASF221
	.byte	0x1
	.2byte	0x170
	.byte	0x28
	.4byte	0xf1e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x27
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x28
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x172
	.byte	0xb
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LASF242
	.byte	0x1
	.2byte	0x164
	.byte	0xe
	.4byte	0xe0c
	.4byte	.LFB271
	.4byte	.LFE271-.LFB271
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1147
	.uleb128 0x25
	.ascii	"tag\000"
	.byte	0x1
	.2byte	0x164
	.byte	0x1f
	.4byte	0x105e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x25
	.ascii	"id\000"
	.byte	0x1
	.2byte	0x164
	.byte	0x2d
	.4byte	0x641
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x27
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x28
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x166
	.byte	0xb
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x29
	.4byte	.LASF243
	.byte	0x1
	.2byte	0x159
	.byte	0xc
	.4byte	0x4f
	.4byte	.LFB270
	.4byte	.LFE270-.LFB270
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x119a
	.uleb128 0x25
	.ascii	"tag\000"
	.byte	0x1
	.2byte	0x159
	.byte	0x1d
	.4byte	0x105e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x25
	.ascii	"id\000"
	.byte	0x1
	.2byte	0x159
	.byte	0x2b
	.4byte	0x641
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x27
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x28
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x15b
	.byte	0xb
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LASF244
	.byte	0x1
	.2byte	0x11e
	.byte	0xc
	.4byte	0x4f
	.4byte	.LFB269
	.4byte	.LFE269-.LFB269
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11d6
	.uleb128 0x2a
	.4byte	.LASF221
	.byte	0x1
	.2byte	0x120
	.byte	0xc
	.4byte	0xf1e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2a
	.4byte	.LASF245
	.byte	0x1
	.2byte	0x121
	.byte	0x7
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF250
	.byte	0x1
	.byte	0x45
	.byte	0x6
	.4byte	.LFB268
	.4byte	.LFE268-.LFB268
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2c
	.4byte	.LASF246
	.byte	0x1
	.byte	0x45
	.byte	0x29
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
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
	.uleb128 0x17
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x1d
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x1e
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x5b2
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x11f9
	.4byte	0x662
	.ascii	"Reset_IRQn\000"
	.4byte	0x668
	.ascii	"NonMaskableInt_IRQn\000"
	.4byte	0x66e
	.ascii	"HardFault_IRQn\000"
	.4byte	0x674
	.ascii	"MemoryManagement_IRQn\000"
	.4byte	0x67a
	.ascii	"BusFault_IRQn\000"
	.4byte	0x680
	.ascii	"UsageFault_IRQn\000"
	.4byte	0x686
	.ascii	"SVCall_IRQn\000"
	.4byte	0x68c
	.ascii	"DebugMonitor_IRQn\000"
	.4byte	0x692
	.ascii	"PendSV_IRQn\000"
	.4byte	0x698
	.ascii	"SysTick_IRQn\000"
	.4byte	0x69e
	.ascii	"POWER_CLOCK_IRQn\000"
	.4byte	0x6a4
	.ascii	"RADIO_IRQn\000"
	.4byte	0x6aa
	.ascii	"UARTE0_UART0_IRQn\000"
	.4byte	0x6b0
	.ascii	"SPIM0_SPIS0_TWIM0_TWIS0_SPI0_TWI0_IRQn\000"
	.4byte	0x6b6
	.ascii	"SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQn\000"
	.4byte	0x6bc
	.ascii	"NFCT_IRQn\000"
	.4byte	0x6c2
	.ascii	"GPIOTE_IRQn\000"
	.4byte	0x6c8
	.ascii	"SAADC_IRQn\000"
	.4byte	0x6ce
	.ascii	"TIMER0_IRQn\000"
	.4byte	0x6d4
	.ascii	"TIMER1_IRQn\000"
	.4byte	0x6da
	.ascii	"TIMER2_IRQn\000"
	.4byte	0x6e0
	.ascii	"RTC0_IRQn\000"
	.4byte	0x6e6
	.ascii	"TEMP_IRQn\000"
	.4byte	0x6ec
	.ascii	"RNG_IRQn\000"
	.4byte	0x6f2
	.ascii	"ECB_IRQn\000"
	.4byte	0x6f8
	.ascii	"CCM_AAR_IRQn\000"
	.4byte	0x6fe
	.ascii	"WDT_IRQn\000"
	.4byte	0x704
	.ascii	"RTC1_IRQn\000"
	.4byte	0x70a
	.ascii	"QDEC_IRQn\000"
	.4byte	0x710
	.ascii	"COMP_LPCOMP_IRQn\000"
	.4byte	0x716
	.ascii	"SWI0_EGU0_IRQn\000"
	.4byte	0x71c
	.ascii	"SWI1_EGU1_IRQn\000"
	.4byte	0x722
	.ascii	"SWI2_EGU2_IRQn\000"
	.4byte	0x728
	.ascii	"SWI3_EGU3_IRQn\000"
	.4byte	0x72e
	.ascii	"SWI4_EGU4_IRQn\000"
	.4byte	0x734
	.ascii	"SWI5_EGU5_IRQn\000"
	.4byte	0x73a
	.ascii	"TIMER3_IRQn\000"
	.4byte	0x740
	.ascii	"TIMER4_IRQn\000"
	.4byte	0x746
	.ascii	"PWM0_IRQn\000"
	.4byte	0x74c
	.ascii	"PDM_IRQn\000"
	.4byte	0x752
	.ascii	"MWU_IRQn\000"
	.4byte	0x758
	.ascii	"PWM1_IRQn\000"
	.4byte	0x75e
	.ascii	"PWM2_IRQn\000"
	.4byte	0x764
	.ascii	"SPIM2_SPIS2_SPI2_IRQn\000"
	.4byte	0x76a
	.ascii	"RTC2_IRQn\000"
	.4byte	0x770
	.ascii	"I2S_IRQn\000"
	.4byte	0x776
	.ascii	"FPU_IRQn\000"
	.4byte	0xd4b
	.ascii	"NRF_SPI_FREQ_125K\000"
	.4byte	0xd54
	.ascii	"NRF_SPI_FREQ_250K\000"
	.4byte	0xd5d
	.ascii	"NRF_SPI_FREQ_500K\000"
	.4byte	0xd66
	.ascii	"NRF_SPI_FREQ_1M\000"
	.4byte	0xd6f
	.ascii	"NRF_SPI_FREQ_2M\000"
	.4byte	0xd78
	.ascii	"NRF_SPI_FREQ_4M\000"
	.4byte	0xd81
	.ascii	"NRF_SPI_FREQ_8M\000"
	.4byte	0xd9a
	.ascii	"NRF_SPI_MODE_0\000"
	.4byte	0xda0
	.ascii	"NRF_SPI_MODE_1\000"
	.4byte	0xda6
	.ascii	"NRF_SPI_MODE_2\000"
	.4byte	0xdac
	.ascii	"NRF_SPI_MODE_3\000"
	.4byte	0xdc1
	.ascii	"NRF_SPI_BIT_ORDER_MSB_FIRST\000"
	.4byte	0xdc7
	.ascii	"NRF_SPI_BIT_ORDER_LSB_FIRST\000"
	.4byte	0xe86
	.ascii	"spi\000"
	.4byte	0xe98
	.ascii	"spi_xfer_done\000"
	.4byte	0xec4
	.ascii	"UPDATE_TAG\000"
	.4byte	0xeca
	.ascii	"DELETE_TAG\000"
	.4byte	0xed0
	.ascii	"NEW_TAG\000"
	.4byte	0xfbc
	.ascii	"delayTimerInitialized\000"
	.4byte	0xfce
	.ascii	"delaySample\000"
	.4byte	0xff0
	.ascii	"tag\000"
	.4byte	0x1002
	.ascii	"default_tag\000"
	.4byte	0x1020
	.ascii	"distance\000"
	.4byte	0xe98
	.ascii	"spi_xfer_done\000"
	.4byte	0x1020
	.ascii	"distance\000"
	.4byte	0x1002
	.ascii	"default_tag\000"
	.4byte	0x1032
	.ascii	"tagAnalysis\000"
	.4byte	0x1064
	.ascii	"updateTag\000"
	.4byte	0x10a0
	.ascii	"newTag\000"
	.4byte	0x10f4
	.ascii	"deleteTag\000"
	.4byte	0x1147
	.ascii	"tagOnList\000"
	.4byte	0x119a
	.ascii	"movementAnalyzer\000"
	.4byte	0x11d6
	.ascii	"movementAnalyzer_initiator\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x2f4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x11f9
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
	.ascii	"uint8_t\000"
	.4byte	0x600
	.ascii	"short int\000"
	.4byte	0x607
	.ascii	"uint16_t\000"
	.4byte	0x613
	.ascii	"int32_t\000"
	.4byte	0x624
	.ascii	"uint32_t\000"
	.4byte	0x63a
	.ascii	"long long int\000"
	.4byte	0x64d
	.ascii	"long long unsigned int\000"
	.4byte	0x641
	.ascii	"uint64_t\000"
	.4byte	0x77d
	.ascii	"IRQn_Type\000"
	.4byte	0x80c
	.ascii	"SPIM_PSEL_Type\000"
	.4byte	0x856
	.ascii	"SPIM_RXD_Type\000"
	.4byte	0x8a5
	.ascii	"SPIM_TXD_Type\000"
	.4byte	0x8e7
	.ascii	"SPI_PSEL_Type\000"
	.4byte	0xbbd
	.ascii	"NRF_SPIM_Type\000"
	.4byte	0xcf9
	.ascii	"NRF_SPI_Type\000"
	.4byte	0xd1e
	.ascii	"BaseType_t\000"
	.4byte	0xd2a
	.ascii	"long unsigned int\000"
	.4byte	0xd31
	.ascii	"TickType_t\000"
	.4byte	0xe0c
	.ascii	"_Bool\000"
	.4byte	0xe18
	.ascii	"nrf_drv_spi_t\000"
	.4byte	0xe6c
	.ascii	"nrf_log_module_dynamic_data_t\000"
	.4byte	0xeaa
	.ascii	"QueueHandle_t\000"
	.4byte	0xed7
	.ascii	"event_type\000"
	.4byte	0xf17
	.ascii	"double\000"
	.4byte	0xee3
	.ascii	"message\000"
	.4byte	0xf1e
	.ascii	"xMessage\000"
	.4byte	0xf2a
	.ascii	"tags_s\000"
	.4byte	0xfab
	.ascii	"tags\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x4c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB268
	.4byte	.LFE268-.LFB268
	.4byte	.LFB269
	.4byte	.LFE269-.LFB269
	.4byte	.LFB270
	.4byte	.LFE270-.LFB270
	.4byte	.LFB271
	.4byte	.LFE271-.LFB271
	.4byte	.LFB272
	.4byte	.LFE272-.LFB272
	.4byte	.LFB273
	.4byte	.LFE273-.LFB273
	.4byte	.LFB274
	.4byte	.LFE274-.LFB274
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB268
	.4byte	.LFE268
	.4byte	.LFB269
	.4byte	.LFE269
	.4byte	.LFB270
	.4byte	.LFE270
	.4byte	.LFB271
	.4byte	.LFE271
	.4byte	.LFB272
	.4byte	.LFE272
	.4byte	.LFB273
	.4byte	.LFE273
	.4byte	.LFB274
	.4byte	.LFE274
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF242:
	.ascii	"deleteTag\000"
.LASF166:
	.ascii	"EVENTS_ENDTX\000"
.LASF53:
	.ascii	"__locale_s\000"
.LASF246:
	.ascii	"pvParameter\000"
.LASF42:
	.ascii	"__towupper\000"
.LASF47:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF227:
	.ascii	"old_avg\000"
.LASF119:
	.ascii	"CCM_AAR_IRQn\000"
.LASF89:
	.ascii	"int32_t\000"
.LASF188:
	.ascii	"BaseType_t\000"
.LASF35:
	.ascii	"time_format\000"
.LASF64:
	.ascii	"__RAL_data_utf8_period\000"
.LASF139:
	.ascii	"I2S_IRQn\000"
.LASF108:
	.ascii	"SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQn\000"
.LASF31:
	.ascii	"month_names\000"
.LASF158:
	.ascii	"TASKS_RESUME\000"
.LASF65:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF247:
	.ascii	"GNU C99 9.3.1 20200408 (release) -fmessage-length=0"
	.ascii	" -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -"
	.ascii	"mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-acce"
	.ascii	"ss -std=gnu99 -g2 -gpubnames -fomit-frame-pointer -"
	.ascii	"fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections"
	.ascii	" -fdata-sections -fshort-enums -fno-common\000"
.LASF8:
	.ascii	"int_curr_symbol\000"
.LASF34:
	.ascii	"date_format\000"
.LASF173:
	.ascii	"INTENCLR\000"
.LASF19:
	.ascii	"n_cs_precedes\000"
.LASF225:
	.ascii	"tags_s\000"
.LASF40:
	.ascii	"__tolower\000"
.LASF187:
	.ascii	"__StackLimit\000"
.LASF193:
	.ascii	"NRF_SPI_FREQ_500K\000"
.LASF15:
	.ascii	"int_frac_digits\000"
.LASF114:
	.ascii	"TIMER2_IRQn\000"
.LASF239:
	.ascii	"tagAnalysis\000"
.LASF13:
	.ascii	"positive_sign\000"
.LASF107:
	.ascii	"SPIM0_SPIS0_TWIM0_TWIS0_SPI0_TWI0_IRQn\000"
.LASF10:
	.ascii	"mon_decimal_point\000"
.LASF2:
	.ascii	"long int\000"
.LASF138:
	.ascii	"RTC2_IRQn\000"
.LASF151:
	.ascii	"SPIM_TXD_Type\000"
.LASF74:
	.ascii	"__RAL_error_decoder_s\000"
.LASF77:
	.ascii	"__RAL_error_decoder_t\000"
.LASF219:
	.ascii	"NEW_TAG\000"
.LASF55:
	.ascii	"__RAL_global_locale\000"
.LASF73:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF213:
	.ascii	"nrf_log_module_dynamic_data_t\000"
.LASF111:
	.ascii	"SAADC_IRQn\000"
.LASF24:
	.ascii	"int_n_cs_precedes\000"
.LASF168:
	.ascii	"EVENTS_STARTED\000"
.LASF160:
	.ascii	"EVENTS_STOPPED\000"
.LASF103:
	.ascii	"SysTick_IRQn\000"
.LASF45:
	.ascii	"__mbtowc\000"
.LASF205:
	.ascii	"drv_inst_idx\000"
.LASF216:
	.ascii	"QueueHandle_t\000"
.LASF85:
	.ascii	"signed char\000"
.LASF86:
	.ascii	"uint8_t\000"
.LASF109:
	.ascii	"NFCT_IRQn\000"
.LASF132:
	.ascii	"PWM0_IRQn\000"
.LASF44:
	.ascii	"__wctomb\000"
.LASF220:
	.ascii	"event_type\000"
.LASF228:
	.ascii	"old_avg2\000"
.LASF229:
	.ascii	"old_avg3\000"
.LASF137:
	.ascii	"SPIM2_SPIS2_SPI2_IRQn\000"
.LASF153:
	.ascii	"RESERVED0\000"
.LASF156:
	.ascii	"RESERVED1\000"
.LASF37:
	.ascii	"unsigned char\000"
.LASF161:
	.ascii	"RESERVED3\000"
.LASF163:
	.ascii	"RESERVED4\000"
.LASF165:
	.ascii	"RESERVED5\000"
.LASF167:
	.ascii	"RESERVED6\000"
.LASF169:
	.ascii	"RESERVED7\000"
.LASF171:
	.ascii	"RESERVED8\000"
.LASF174:
	.ascii	"RESERVED9\000"
.LASF194:
	.ascii	"NRF_SPI_FREQ_1M\000"
.LASF20:
	.ascii	"n_sep_by_space\000"
.LASF157:
	.ascii	"TASKS_SUSPEND\000"
.LASF214:
	.ascii	"m_nrf_log_app_logs_data_dynamic\000"
.LASF66:
	.ascii	"__RAL_data_utf8_space\000"
.LASF244:
	.ascii	"movementAnalyzer\000"
.LASF206:
	.ascii	"use_easy_dma\000"
.LASF207:
	.ascii	"_Bool\000"
.LASF170:
	.ascii	"SHORTS\000"
.LASF159:
	.ascii	"RESERVED2\000"
.LASF99:
	.ascii	"UsageFault_IRQn\000"
.LASF3:
	.ascii	"char\000"
.LASF198:
	.ascii	"NRF_SPI_MODE_0\000"
.LASF199:
	.ascii	"NRF_SPI_MODE_1\000"
.LASF200:
	.ascii	"NRF_SPI_MODE_2\000"
.LASF201:
	.ascii	"NRF_SPI_MODE_3\000"
.LASF234:
	.ascii	"delayTimerInitialized\000"
.LASF22:
	.ascii	"n_sign_posn\000"
.LASF80:
	.ascii	"timeval\000"
.LASF238:
	.ascii	"distance\000"
.LASF63:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF11:
	.ascii	"mon_thousands_sep\000"
.LASF154:
	.ascii	"TASKS_START\000"
.LASF43:
	.ascii	"__towlower\000"
.LASF82:
	.ascii	"stdin\000"
.LASF14:
	.ascii	"negative_sign\000"
.LASF147:
	.ascii	"MAXCNT\000"
.LASF23:
	.ascii	"int_p_cs_precedes\000"
.LASF75:
	.ascii	"decode\000"
.LASF241:
	.ascii	"newTag\000"
.LASF129:
	.ascii	"SWI5_EGU5_IRQn\000"
.LASF110:
	.ascii	"GPIOTE_IRQn\000"
.LASF57:
	.ascii	"__RAL_codeset_ascii\000"
.LASF183:
	.ascii	"NRF_SPIM_Type\000"
.LASF51:
	.ascii	"__RAL_locale_t\000"
.LASF172:
	.ascii	"INTENSET\000"
.LASF32:
	.ascii	"abbrev_month_names\000"
.LASF50:
	.ascii	"codeset\000"
.LASF195:
	.ascii	"NRF_SPI_FREQ_2M\000"
.LASF245:
	.ascii	"index\000"
.LASF124:
	.ascii	"SWI0_EGU0_IRQn\000"
.LASF95:
	.ascii	"NonMaskableInt_IRQn\000"
.LASF203:
	.ascii	"NRF_SPI_BIT_ORDER_LSB_FIRST\000"
.LASF181:
	.ascii	"CONFIG\000"
.LASF1:
	.ascii	"__wchar\000"
.LASF189:
	.ascii	"long unsigned int\000"
.LASF78:
	.ascii	"__RAL_error_decoder_head\000"
.LASF46:
	.ascii	"__RAL_locale_data_t\000"
.LASF97:
	.ascii	"MemoryManagement_IRQn\000"
.LASF62:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF143:
	.ascii	"SystemCoreClock\000"
.LASF128:
	.ascii	"SWI4_EGU4_IRQn\000"
.LASF145:
	.ascii	"MISO\000"
.LASF141:
	.ascii	"IRQn_Type\000"
.LASF186:
	.ascii	"__StackTop\000"
.LASF136:
	.ascii	"PWM2_IRQn\000"
.LASF215:
	.ascii	"spi_xfer_done\000"
.LASF33:
	.ascii	"am_pm_indicator\000"
.LASF18:
	.ascii	"p_sep_by_space\000"
.LASF196:
	.ascii	"NRF_SPI_FREQ_4M\000"
.LASF120:
	.ascii	"WDT_IRQn\000"
.LASF162:
	.ascii	"EVENTS_ENDRX\000"
.LASF224:
	.ascii	"xMessage\000"
.LASF209:
	.ascii	"module_id\000"
.LASF26:
	.ascii	"int_n_sep_by_space\000"
.LASF98:
	.ascii	"BusFault_IRQn\000"
.LASF70:
	.ascii	"__user_set_time_of_day\000"
.LASF117:
	.ascii	"RNG_IRQn\000"
.LASF113:
	.ascii	"TIMER1_IRQn\000"
.LASF91:
	.ascii	"long long int\000"
.LASF52:
	.ascii	"__mbstate_s\000"
.LASF177:
	.ascii	"PSEL\000"
.LASF230:
	.ascii	"old_dist1\000"
.LASF231:
	.ascii	"old_dist2\000"
.LASF232:
	.ascii	"old_dist3\000"
.LASF105:
	.ascii	"RADIO_IRQn\000"
.LASF223:
	.ascii	"double\000"
.LASF100:
	.ascii	"SVCall_IRQn\000"
.LASF54:
	.ascii	"__category\000"
.LASF121:
	.ascii	"RTC1_IRQn\000"
.LASF140:
	.ascii	"FPU_IRQn\000"
.LASF116:
	.ascii	"TEMP_IRQn\000"
.LASF36:
	.ascii	"date_time_format\000"
.LASF222:
	.ascii	"event\000"
.LASF112:
	.ascii	"TIMER0_IRQn\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF21:
	.ascii	"p_sign_posn\000"
.LASF197:
	.ascii	"NRF_SPI_FREQ_8M\000"
.LASF71:
	.ascii	"__user_get_time_of_day\000"
.LASF192:
	.ascii	"NRF_SPI_FREQ_250K\000"
.LASF58:
	.ascii	"__RAL_codeset_utf8\000"
.LASF155:
	.ascii	"TASKS_STOP\000"
.LASF56:
	.ascii	"__RAL_c_locale\000"
.LASF236:
	.ascii	"default_tag\000"
.LASF118:
	.ascii	"ECB_IRQn\000"
.LASF122:
	.ascii	"QDEC_IRQn\000"
.LASF5:
	.ascii	"decimal_point\000"
.LASF212:
	.ascii	"filter_lvls\000"
.LASF235:
	.ascii	"delaySample\000"
.LASF202:
	.ascii	"NRF_SPI_BIT_ORDER_MSB_FIRST\000"
.LASF81:
	.ascii	"__RAL_FILE\000"
.LASF144:
	.ascii	"MOSI\000"
.LASF237:
	.ascii	"xQueue\000"
.LASF208:
	.ascii	"nrf_drv_spi_t\000"
.LASF191:
	.ascii	"NRF_SPI_FREQ_125K\000"
.LASF79:
	.ascii	"FILE\000"
.LASF131:
	.ascii	"TIMER4_IRQn\000"
.LASF164:
	.ascii	"EVENTS_END\000"
.LASF67:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF146:
	.ascii	"SPIM_PSEL_Type\000"
.LASF38:
	.ascii	"__isctype\000"
.LASF93:
	.ascii	"long long unsigned int\000"
.LASF250:
	.ascii	"movementAnalyzer_initiator\000"
.LASF25:
	.ascii	"int_p_sep_by_space\000"
.LASF88:
	.ascii	"uint16_t\000"
.LASF176:
	.ascii	"RESERVED10\000"
.LASF94:
	.ascii	"Reset_IRQn\000"
.LASF180:
	.ascii	"RESERVED12\000"
.LASF182:
	.ascii	"RESERVED13\000"
.LASF249:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\SES\000"
.LASF130:
	.ascii	"TIMER3_IRQn\000"
.LASF133:
	.ascii	"PDM_IRQn\000"
.LASF190:
	.ascii	"TickType_t\000"
.LASF104:
	.ascii	"POWER_CLOCK_IRQn\000"
.LASF243:
	.ascii	"tagOnList\000"
.LASF248:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\movementAnalyzer\\movementAnalyzer"
	.ascii	".c\000"
.LASF30:
	.ascii	"abbrev_day_names\000"
.LASF59:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF6:
	.ascii	"thousands_sep\000"
.LASF106:
	.ascii	"UARTE0_UART0_IRQn\000"
.LASF101:
	.ascii	"DebugMonitor_IRQn\000"
.LASF39:
	.ascii	"__toupper\000"
.LASF48:
	.ascii	"name\000"
.LASF123:
	.ascii	"COMP_LPCOMP_IRQn\000"
.LASF185:
	.ascii	"NRF_SPI_Type\000"
.LASF16:
	.ascii	"frac_digits\000"
.LASF9:
	.ascii	"currency_symbol\000"
.LASF84:
	.ascii	"stderr\000"
.LASF87:
	.ascii	"short int\000"
.LASF92:
	.ascii	"uint64_t\000"
.LASF135:
	.ascii	"PWM1_IRQn\000"
.LASF0:
	.ascii	"__state\000"
.LASF127:
	.ascii	"SWI3_EGU3_IRQn\000"
.LASF12:
	.ascii	"mon_grouping\000"
.LASF175:
	.ascii	"ENABLE\000"
.LASF184:
	.ascii	"EVENTS_READY\000"
.LASF226:
	.ascii	"taken\000"
.LASF29:
	.ascii	"day_names\000"
.LASF211:
	.ascii	"filter\000"
.LASF68:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF218:
	.ascii	"DELETE_TAG\000"
.LASF27:
	.ascii	"int_p_sign_posn\000"
.LASF142:
	.ascii	"ITM_RxBuffer\000"
.LASF148:
	.ascii	"AMOUNT\000"
.LASF41:
	.ascii	"__iswctype\000"
.LASF150:
	.ascii	"SPIM_RXD_Type\000"
.LASF60:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF179:
	.ascii	"FREQUENCY\000"
.LASF90:
	.ascii	"uint32_t\000"
.LASF240:
	.ascii	"updateTag\000"
.LASF28:
	.ascii	"int_n_sign_posn\000"
.LASF126:
	.ascii	"SWI2_EGU2_IRQn\000"
.LASF69:
	.ascii	"__RAL_data_empty_string\000"
.LASF115:
	.ascii	"RTC0_IRQn\000"
.LASF149:
	.ascii	"LIST\000"
.LASF17:
	.ascii	"p_cs_precedes\000"
.LASF72:
	.ascii	"short unsigned int\000"
.LASF83:
	.ascii	"stdout\000"
.LASF152:
	.ascii	"SPI_PSEL_Type\000"
.LASF221:
	.ascii	"message\000"
.LASF178:
	.ascii	"RESERVED11\000"
.LASF102:
	.ascii	"PendSV_IRQn\000"
.LASF204:
	.ascii	"p_registers\000"
.LASF210:
	.ascii	"order_idx\000"
.LASF233:
	.ascii	"tags\000"
.LASF7:
	.ascii	"grouping\000"
.LASF96:
	.ascii	"HardFault_IRQn\000"
.LASF217:
	.ascii	"UPDATE_TAG\000"
.LASF76:
	.ascii	"next\000"
.LASF49:
	.ascii	"data\000"
.LASF134:
	.ascii	"MWU_IRQn\000"
.LASF125:
	.ascii	"SWI1_EGU1_IRQn\000"
.LASF61:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
