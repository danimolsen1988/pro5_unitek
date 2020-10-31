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
	.file	"calibration.c"
	.text
.Ltext0:
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.global	__aeabi_dsub
	.global	__aeabi_dcmpge
	.global	__aeabi_dcmple
	.global	__aeabi_d2iz
	.section	.text.calibrate_device,"ax",%progbits
	.align	1
	.global	calibrate_device
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	calibrate_device, %function
calibrate_device:
.LFB0:
	.file 1 "C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\code\\ss_twr_init\\Calibration\\calibration.c"
	.loc 1 13 55
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI0:
	sub	sp, sp, #52
.LCFI1:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 16 10
	mov	r2, #0
	mov	r3, #0
	strd	r2, [sp, #40]
	.loc 1 17 10
	mov	r2, #0
	mov	r3, #0
	strd	r2, [sp, #24]
.LBB2:
	.loc 1 18 11
	movs	r3, #0
	str	r3, [sp, #36]
	.loc 1 18 3
	b	.L2
.L3:
	.loc 1 19 29 discriminator 3
	ldr	r3, [sp, #36]
	lsls	r3, r3, #3
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	ldrd	r2, [r3]
	.loc 1 19 18 discriminator 3
	ldrd	r0, [sp, #40]
	bl	__aeabi_dadd
.LVL0:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #40]
	.loc 1 18 27 discriminator 3
	ldr	r3, [sp, #36]
	adds	r3, r3, #1
	str	r3, [sp, #36]
.L2:
	.loc 1 18 3 discriminator 1
	ldr	r3, [sp, #36]
	cmp	r3, #200
	ble	.L3
.LBE2:
	.loc 1 21 16
	mov	r2, #0
	ldr	r3, .L9+24
	ldrd	r0, [sp, #40]
	bl	__aeabi_ddiv
.LVL1:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #40]
	.loc 1 23 8
	mov	r2, #0
	ldr	r3, .L9+28
	ldrd	r0, [sp, #40]
	bl	__aeabi_dsub
.LVL2:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #24]
	.loc 1 24 5
	adr	r3, .L9
	ldrd	r2, [r3]
	ldrd	r0, [sp, #24]
	bl	__aeabi_dcmpge
.LVL3:
	mov	r3, r0
	cmp	r3, #0
	bne	.L4
	.loc 1 24 19 discriminator 1
	adr	r3, .L9+8
	ldrd	r2, [r3]
	ldrd	r0, [sp, #24]
	bl	__aeabi_dcmple
.LVL4:
	mov	r3, r0
	cmp	r3, #0
	beq	.L8
.L4:
.LBB3:
	.loc 1 26 12
	adr	r3, .L9+16
	ldrd	r2, [r3]
	ldrd	r0, [sp, #24]
	bl	__aeabi_ddiv
.LVL5:
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #16]
	.loc 1 27 26
	ldrd	r0, [sp, #16]
	bl	__aeabi_d2iz
.LVL6:
	mov	r2, r0
	.loc 1 27 9
	ldr	r3, [sp]
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 30 5
	ldr	r3, [sp, #12]
	uxth	r3, r3
	mov	r0, r3
	bl	dwt_setrxantennadelay
	.loc 1 31 5
	ldr	r3, [sp, #12]
	uxth	r3, r3
	mov	r0, r3
	bl	dwt_settxantennadelay
	.loc 1 33 12
	ldr	r3, [sp, #12]
	b	.L7
.L8:
.LBE3:
	.loc 1 35 10
	ldr	r3, [sp]
.L7:
	.loc 1 36 1
	mov	r0, r3
	add	sp, sp, #52
.LCFI2:
	@ sp needed
	ldr	pc, [sp], #4
.L10:
	.align	3
.L9:
	.word	-1717986918
	.word	1068079513
	.word	-1717986918
	.word	-1079404135
	.word	1239699360
	.word	1064515026
	.word	1080623104
	.word	1072693248
.LFE0:
	.size	calibrate_device, .-calibrate_device
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
	.uleb128 0x38
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE0:
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/__crossworks.h"
	.file 3 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/stdio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x6a4
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF95
	.byte	0xc
	.4byte	.LASF96
	.4byte	.LASF97
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	0x25
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.4byte	.LASF56
	.byte	0x8
	.byte	0x2
	.byte	0x7c
	.byte	0x8
	.4byte	0x8a
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0x2
	.byte	0x7d
	.byte	0x7
	.4byte	0x5b
	.byte	0
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x2
	.byte	0x7e
	.byte	0x8
	.4byte	0x4d
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	0x5b
	.4byte	0xa3
	.uleb128 0x8
	.4byte	0xa3
	.uleb128 0x8
	.4byte	0x54
	.uleb128 0x8
	.4byte	0xb5
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.uleb128 0x3
	.4byte	0xa9
	.uleb128 0x9
	.byte	0x4
	.4byte	0x62
	.uleb128 0x7
	.4byte	0x5b
	.4byte	0xd9
	.uleb128 0x8
	.4byte	0xd9
	.uleb128 0x8
	.4byte	0xdf
	.uleb128 0x8
	.4byte	0x54
	.uleb128 0x8
	.4byte	0xb5
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x54
	.uleb128 0x9
	.byte	0x4
	.4byte	0xb0
	.uleb128 0xa
	.byte	0x58
	.byte	0x2
	.byte	0x84
	.byte	0x9
	.4byte	0x28f
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x2
	.byte	0x86
	.byte	0xf
	.4byte	0xdf
	.byte	0
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x2
	.byte	0x87
	.byte	0xf
	.4byte	0xdf
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x2
	.byte	0x88
	.byte	0xf
	.4byte	0xdf
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF13
	.byte	0x2
	.byte	0x8a
	.byte	0xf
	.4byte	0xdf
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0x2
	.byte	0x8b
	.byte	0xf
	.4byte	0xdf
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x2
	.byte	0x8c
	.byte	0xf
	.4byte	0xdf
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x2
	.byte	0x8d
	.byte	0xf
	.4byte	0xdf
	.byte	0x18
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x2
	.byte	0x8e
	.byte	0xf
	.4byte	0xdf
	.byte	0x1c
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x2
	.byte	0x8f
	.byte	0xf
	.4byte	0xdf
	.byte	0x20
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x2
	.byte	0x90
	.byte	0xf
	.4byte	0xdf
	.byte	0x24
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x2
	.byte	0x92
	.byte	0x8
	.4byte	0xa9
	.byte	0x28
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x2
	.byte	0x93
	.byte	0x8
	.4byte	0xa9
	.byte	0x29
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x2
	.byte	0x94
	.byte	0x8
	.4byte	0xa9
	.byte	0x2a
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x2
	.byte	0x95
	.byte	0x8
	.4byte	0xa9
	.byte	0x2b
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x2
	.byte	0x96
	.byte	0x8
	.4byte	0xa9
	.byte	0x2c
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0x2
	.byte	0x97
	.byte	0x8
	.4byte	0xa9
	.byte	0x2d
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x2
	.byte	0x98
	.byte	0x8
	.4byte	0xa9
	.byte	0x2e
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x2
	.byte	0x99
	.byte	0x8
	.4byte	0xa9
	.byte	0x2f
	.uleb128 0x6
	.4byte	.LASF28
	.byte	0x2
	.byte	0x9a
	.byte	0x8
	.4byte	0xa9
	.byte	0x30
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0x2
	.byte	0x9b
	.byte	0x8
	.4byte	0xa9
	.byte	0x31
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x2
	.byte	0x9c
	.byte	0x8
	.4byte	0xa9
	.byte	0x32
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0x2
	.byte	0x9d
	.byte	0x8
	.4byte	0xa9
	.byte	0x33
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0x2
	.byte	0x9e
	.byte	0x8
	.4byte	0xa9
	.byte	0x34
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x2
	.byte	0x9f
	.byte	0x8
	.4byte	0xa9
	.byte	0x35
	.uleb128 0x6
	.4byte	.LASF34
	.byte	0x2
	.byte	0xa4
	.byte	0xf
	.4byte	0xdf
	.byte	0x38
	.uleb128 0x6
	.4byte	.LASF35
	.byte	0x2
	.byte	0xa5
	.byte	0xf
	.4byte	0xdf
	.byte	0x3c
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x2
	.byte	0xa6
	.byte	0xf
	.4byte	0xdf
	.byte	0x40
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x2
	.byte	0xa7
	.byte	0xf
	.4byte	0xdf
	.byte	0x44
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x2
	.byte	0xa8
	.byte	0xf
	.4byte	0xdf
	.byte	0x48
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x2
	.byte	0xa9
	.byte	0xf
	.4byte	0xdf
	.byte	0x4c
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x2
	.byte	0xaa
	.byte	0xf
	.4byte	0xdf
	.byte	0x50
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x2
	.byte	0xab
	.byte	0xf
	.4byte	0xdf
	.byte	0x54
	.byte	0
	.uleb128 0xb
	.4byte	.LASF50
	.byte	0x2
	.byte	0xac
	.byte	0x3
	.4byte	0xe5
	.uleb128 0x3
	.4byte	0x28f
	.uleb128 0xa
	.byte	0x20
	.byte	0x2
	.byte	0xc2
	.byte	0x9
	.4byte	0x312
	.uleb128 0x6
	.4byte	.LASF42
	.byte	0x2
	.byte	0xc4
	.byte	0x9
	.4byte	0x326
	.byte	0
	.uleb128 0x6
	.4byte	.LASF43
	.byte	0x2
	.byte	0xc5
	.byte	0x9
	.4byte	0x33b
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF44
	.byte	0x2
	.byte	0xc6
	.byte	0x9
	.4byte	0x33b
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0x2
	.byte	0xc9
	.byte	0x9
	.4byte	0x355
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF46
	.byte	0x2
	.byte	0xca
	.byte	0xa
	.4byte	0x36a
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF47
	.byte	0x2
	.byte	0xcb
	.byte	0xa
	.4byte	0x36a
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF48
	.byte	0x2
	.byte	0xce
	.byte	0x9
	.4byte	0x370
	.byte	0x18
	.uleb128 0x6
	.4byte	.LASF49
	.byte	0x2
	.byte	0xcf
	.byte	0x9
	.4byte	0x376
	.byte	0x1c
	.byte	0
	.uleb128 0x7
	.4byte	0x5b
	.4byte	0x326
	.uleb128 0x8
	.4byte	0x5b
	.uleb128 0x8
	.4byte	0x5b
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x312
	.uleb128 0x7
	.4byte	0x5b
	.4byte	0x33b
	.uleb128 0x8
	.4byte	0x5b
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x32c
	.uleb128 0x7
	.4byte	0x5b
	.4byte	0x355
	.uleb128 0x8
	.4byte	0x4d
	.uleb128 0x8
	.4byte	0x5b
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x341
	.uleb128 0x7
	.4byte	0x4d
	.4byte	0x36a
	.uleb128 0x8
	.4byte	0x4d
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x35b
	.uleb128 0x9
	.byte	0x4
	.4byte	0x8a
	.uleb128 0x9
	.byte	0x4
	.4byte	0xbb
	.uleb128 0xb
	.4byte	.LASF51
	.byte	0x2
	.byte	0xd0
	.byte	0x3
	.4byte	0x2a0
	.uleb128 0x3
	.4byte	0x37c
	.uleb128 0xa
	.byte	0xc
	.byte	0x2
	.byte	0xd2
	.byte	0x9
	.4byte	0x3be
	.uleb128 0x6
	.4byte	.LASF52
	.byte	0x2
	.byte	0xd3
	.byte	0xf
	.4byte	0xdf
	.byte	0
	.uleb128 0x6
	.4byte	.LASF53
	.byte	0x2
	.byte	0xd4
	.byte	0x25
	.4byte	0x3be
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF54
	.byte	0x2
	.byte	0xd5
	.byte	0x28
	.4byte	0x3c4
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x29b
	.uleb128 0x9
	.byte	0x4
	.4byte	0x388
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x2
	.byte	0xd6
	.byte	0x3
	.4byte	0x38d
	.uleb128 0x3
	.4byte	0x3ca
	.uleb128 0x5
	.4byte	.LASF57
	.byte	0x14
	.byte	0x2
	.byte	0xda
	.byte	0x10
	.4byte	0x3f6
	.uleb128 0x6
	.4byte	.LASF58
	.byte	0x2
	.byte	0xdb
	.byte	0x20
	.4byte	0x3f6
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	0x406
	.4byte	0x406
	.uleb128 0xd
	.4byte	0x54
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x3d6
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x104
	.byte	0x1a
	.4byte	0x3db
	.uleb128 0xe
	.4byte	.LASF60
	.byte	0x2
	.2byte	0x10b
	.byte	0x24
	.4byte	0x3d6
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x10e
	.byte	0x2c
	.4byte	0x388
	.uleb128 0xe
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x10f
	.byte	0x2c
	.4byte	0x388
	.uleb128 0xc
	.4byte	0x2c
	.4byte	0x450
	.uleb128 0xd
	.4byte	0x54
	.byte	0x7f
	.byte	0
	.uleb128 0x3
	.4byte	0x440
	.uleb128 0xe
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x111
	.byte	0x23
	.4byte	0x450
	.uleb128 0xc
	.4byte	0xb0
	.4byte	0x46d
	.uleb128 0xf
	.byte	0
	.uleb128 0x3
	.4byte	0x462
	.uleb128 0xe
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x113
	.byte	0x13
	.4byte	0x46d
	.uleb128 0xe
	.4byte	.LASF65
	.byte	0x2
	.2byte	0x114
	.byte	0x13
	.4byte	0x46d
	.uleb128 0xe
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x115
	.byte	0x13
	.4byte	0x46d
	.uleb128 0xe
	.4byte	.LASF67
	.byte	0x2
	.2byte	0x116
	.byte	0x13
	.4byte	0x46d
	.uleb128 0xe
	.4byte	.LASF68
	.byte	0x2
	.2byte	0x118
	.byte	0x13
	.4byte	0x46d
	.uleb128 0xe
	.4byte	.LASF69
	.byte	0x2
	.2byte	0x119
	.byte	0x13
	.4byte	0x46d
	.uleb128 0xe
	.4byte	.LASF70
	.byte	0x2
	.2byte	0x11a
	.byte	0x13
	.4byte	0x46d
	.uleb128 0xe
	.4byte	.LASF71
	.byte	0x2
	.2byte	0x11b
	.byte	0x13
	.4byte	0x46d
	.uleb128 0xe
	.4byte	.LASF72
	.byte	0x2
	.2byte	0x11c
	.byte	0x13
	.4byte	0x46d
	.uleb128 0xe
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x11d
	.byte	0x13
	.4byte	0x46d
	.uleb128 0x7
	.4byte	0x5b
	.4byte	0x503
	.uleb128 0x8
	.4byte	0x503
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x50e
	.uleb128 0x10
	.4byte	.LASF83
	.uleb128 0x3
	.4byte	0x509
	.uleb128 0xe
	.4byte	.LASF74
	.byte	0x2
	.2byte	0x133
	.byte	0xe
	.4byte	0x520
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4f4
	.uleb128 0x7
	.4byte	0x5b
	.4byte	0x535
	.uleb128 0x8
	.4byte	0x535
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x509
	.uleb128 0xe
	.4byte	.LASF75
	.byte	0x2
	.2byte	0x134
	.byte	0xe
	.4byte	0x548
	.uleb128 0x9
	.byte	0x4
	.4byte	0x526
	.uleb128 0x11
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x14b
	.byte	0x18
	.4byte	0x55b
	.uleb128 0x9
	.byte	0x4
	.4byte	0x561
	.uleb128 0x7
	.4byte	0xdf
	.4byte	0x570
	.uleb128 0x8
	.4byte	0x5b
	.byte	0
	.uleb128 0x12
	.4byte	.LASF77
	.byte	0x8
	.byte	0x2
	.2byte	0x14d
	.byte	0x10
	.4byte	0x59b
	.uleb128 0x13
	.4byte	.LASF78
	.byte	0x2
	.2byte	0x14f
	.byte	0x1c
	.4byte	0x54e
	.byte	0
	.uleb128 0x13
	.4byte	.LASF79
	.byte	0x2
	.2byte	0x150
	.byte	0x21
	.4byte	0x59b
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x570
	.uleb128 0x11
	.4byte	.LASF80
	.byte	0x2
	.2byte	0x151
	.byte	0x3
	.4byte	0x570
	.uleb128 0xe
	.4byte	.LASF81
	.byte	0x2
	.2byte	0x155
	.byte	0x1f
	.4byte	0x5bb
	.uleb128 0x9
	.byte	0x4
	.4byte	0x5a1
	.uleb128 0x11
	.4byte	.LASF82
	.byte	0x3
	.2byte	0x311
	.byte	0x1b
	.4byte	0x5ce
	.uleb128 0x10
	.4byte	.LASF84
	.uleb128 0xe
	.4byte	.LASF85
	.byte	0x3
	.2byte	0x315
	.byte	0xe
	.4byte	0x5e0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x5c1
	.uleb128 0xe
	.4byte	.LASF86
	.byte	0x3
	.2byte	0x316
	.byte	0xe
	.4byte	0x5e0
	.uleb128 0xe
	.4byte	.LASF87
	.byte	0x3
	.2byte	0x317
	.byte	0xe
	.4byte	0x5e0
	.uleb128 0x14
	.4byte	.LASF98
	.byte	0x1
	.byte	0xd
	.byte	0x5
	.4byte	0x5b
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x69a
	.uleb128 0x15
	.4byte	.LASF88
	.byte	0x1
	.byte	0xd
	.byte	0x1d
	.4byte	0x69a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x15
	.4byte	.LASF89
	.byte	0x1
	.byte	0xd
	.byte	0x30
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.4byte	.LASF90
	.byte	0x1
	.byte	0x10
	.byte	0xa
	.4byte	0x6a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x16
	.4byte	.LASF91
	.byte	0x1
	.byte	0x11
	.byte	0xa
	.4byte	0x6a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x671
	.uleb128 0x18
	.ascii	"i\000"
	.byte	0x1
	.byte	0x12
	.byte	0xb
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x16
	.4byte	.LASF92
	.byte	0x1
	.byte	0x1a
	.byte	0xc
	.4byte	0x6a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.4byte	.LASF93
	.byte	0x1
	.byte	0x1b
	.byte	0x9
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x6a0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF94
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
	.uleb128 0x3
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x6
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
	.uleb128 0x15
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x23
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x6a8
	.4byte	0x600
	.ascii	"calibrate_device\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x164
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x6a8
	.4byte	0x25
	.ascii	"unsigned char\000"
	.4byte	0x31
	.ascii	"short unsigned int\000"
	.4byte	0x38
	.ascii	"long unsigned int\000"
	.4byte	0x3f
	.ascii	"signed char\000"
	.4byte	0x46
	.ascii	"short int\000"
	.4byte	0x4d
	.ascii	"long int\000"
	.4byte	0x54
	.ascii	"unsigned int\000"
	.4byte	0x5b
	.ascii	"int\000"
	.4byte	0x62
	.ascii	"__mbstate_s\000"
	.4byte	0xa9
	.ascii	"char\000"
	.4byte	0x28f
	.ascii	"__RAL_locale_data_t\000"
	.4byte	0x37c
	.ascii	"__RAL_locale_codeset_t\000"
	.4byte	0x3ca
	.ascii	"__RAL_locale_t\000"
	.4byte	0x3db
	.ascii	"__locale_s\000"
	.4byte	0x54e
	.ascii	"__RAL_error_decoder_fn_t\000"
	.4byte	0x570
	.ascii	"__RAL_error_decoder_s\000"
	.4byte	0x5a1
	.ascii	"__RAL_error_decoder_t\000"
	.4byte	0x5c1
	.ascii	"FILE\000"
	.4byte	0x6a0
	.ascii	"double\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF56:
	.ascii	"__mbstate_s\000"
.LASF45:
	.ascii	"__iswctype\000"
.LASF32:
	.ascii	"int_p_sign_posn\000"
.LASF41:
	.ascii	"date_time_format\000"
.LASF81:
	.ascii	"__RAL_error_decoder_head\000"
.LASF91:
	.ascii	"diff\000"
.LASF73:
	.ascii	"__RAL_data_empty_string\000"
.LASF31:
	.ascii	"int_n_sep_by_space\000"
.LASF4:
	.ascii	"short int\000"
.LASF57:
	.ascii	"__locale_s\000"
.LASF36:
	.ascii	"month_names\000"
.LASF8:
	.ascii	"__wchar\000"
.LASF65:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
.LASF25:
	.ascii	"n_sep_by_space\000"
.LASF44:
	.ascii	"__tolower\000"
.LASF27:
	.ascii	"n_sign_posn\000"
.LASF40:
	.ascii	"time_format\000"
.LASF89:
	.ascii	"delay\000"
.LASF50:
	.ascii	"__RAL_locale_data_t\000"
.LASF62:
	.ascii	"__RAL_codeset_utf8\000"
.LASF66:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF22:
	.ascii	"p_cs_precedes\000"
.LASF33:
	.ascii	"int_n_sign_posn\000"
.LASF68:
	.ascii	"__RAL_data_utf8_period\000"
.LASF30:
	.ascii	"int_p_sep_by_space\000"
.LASF77:
	.ascii	"__RAL_error_decoder_s\000"
.LASF80:
	.ascii	"__RAL_error_decoder_t\000"
.LASF15:
	.ascii	"mon_decimal_point\000"
.LASF10:
	.ascii	"decimal_point\000"
.LASF20:
	.ascii	"int_frac_digits\000"
.LASF87:
	.ascii	"stderr\000"
.LASF54:
	.ascii	"codeset\000"
.LASF23:
	.ascii	"p_sep_by_space\000"
.LASF58:
	.ascii	"__category\000"
.LASF12:
	.ascii	"grouping\000"
.LASF96:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\Calibration\\calibration.c\000"
.LASF43:
	.ascii	"__toupper\000"
.LASF5:
	.ascii	"long int\000"
.LASF97:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\SES\000"
.LASF90:
	.ascii	"avg_distance\000"
.LASF47:
	.ascii	"__towlower\000"
.LASF93:
	.ascii	"new_dly\000"
.LASF19:
	.ascii	"negative_sign\000"
.LASF78:
	.ascii	"decode\000"
.LASF52:
	.ascii	"name\000"
.LASF67:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF26:
	.ascii	"p_sign_posn\000"
.LASF76:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF74:
	.ascii	"__user_set_time_of_day\000"
.LASF0:
	.ascii	"unsigned char\000"
.LASF60:
	.ascii	"__RAL_c_locale\000"
.LASF61:
	.ascii	"__RAL_codeset_ascii\000"
.LASF14:
	.ascii	"currency_symbol\000"
.LASF3:
	.ascii	"signed char\000"
.LASF17:
	.ascii	"mon_grouping\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF34:
	.ascii	"day_names\000"
.LASF92:
	.ascii	"test\000"
.LASF38:
	.ascii	"am_pm_indicator\000"
.LASF46:
	.ascii	"__towupper\000"
.LASF13:
	.ascii	"int_curr_symbol\000"
.LASF71:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF1:
	.ascii	"short unsigned int\000"
.LASF9:
	.ascii	"char\000"
.LASF88:
	.ascii	"distance\000"
.LASF75:
	.ascii	"__user_get_time_of_day\000"
.LASF59:
	.ascii	"__RAL_global_locale\000"
.LASF24:
	.ascii	"n_cs_precedes\000"
.LASF95:
	.ascii	"GNU C99 9.3.1 20200408 (release) -fmessage-length=0"
	.ascii	" -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -"
	.ascii	"mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-acce"
	.ascii	"ss -std=gnu99 -g2 -gpubnames -fomit-frame-pointer -"
	.ascii	"fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections"
	.ascii	" -fdata-sections -fshort-enums -fno-common\000"
.LASF70:
	.ascii	"__RAL_data_utf8_space\000"
.LASF98:
	.ascii	"calibrate_device\000"
.LASF53:
	.ascii	"data\000"
.LASF82:
	.ascii	"FILE\000"
.LASF21:
	.ascii	"frac_digits\000"
.LASF63:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF2:
	.ascii	"long unsigned int\000"
.LASF94:
	.ascii	"double\000"
.LASF83:
	.ascii	"timeval\000"
.LASF64:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF84:
	.ascii	"__RAL_FILE\000"
.LASF37:
	.ascii	"abbrev_month_names\000"
.LASF51:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF85:
	.ascii	"stdin\000"
.LASF18:
	.ascii	"positive_sign\000"
.LASF49:
	.ascii	"__mbtowc\000"
.LASF55:
	.ascii	"__RAL_locale_t\000"
.LASF39:
	.ascii	"date_format\000"
.LASF69:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF16:
	.ascii	"mon_thousands_sep\000"
.LASF11:
	.ascii	"thousands_sep\000"
.LASF29:
	.ascii	"int_n_cs_precedes\000"
.LASF42:
	.ascii	"__isctype\000"
.LASF7:
	.ascii	"__state\000"
.LASF72:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF28:
	.ascii	"int_p_cs_precedes\000"
.LASF35:
	.ascii	"abbrev_day_names\000"
.LASF48:
	.ascii	"__wctomb\000"
.LASF86:
	.ascii	"stdout\000"
.LASF79:
	.ascii	"next\000"
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
