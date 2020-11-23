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
	.file	"movementStruct.c"
	.text
.Ltext0:
	.section	.bss.initialized,"aw",%nobits
	.type	initialized, %object
	.size	initialized, 1
initialized:
	.space	1
	.section .rodata
	.align	2
.LC0:
	.ascii	"could not create queue!!\000"
	.align	2
.LC1:
	.ascii	"queue is already intialized!\000"
	.section	.text.setupQueue,"ax",%progbits
	.align	1
	.global	setupQueue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	setupQueue, %function
setupQueue:
.LFB148:
	.file 1 "C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\code\\ss_twr_init\\movementStruct\\movementStruct.c"
	.loc 1 7 20
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI0:
	.loc 1 8 7
	ldr	r3, .L5
	ldrb	r3, [r3]	@ zero_extendqisi2
	eor	r3, r3, #1
	uxtb	r3, r3
	.loc 1 8 6
	cmp	r3, #0
	beq	.L2
	.loc 1 9 18
	movs	r2, #0
	movs	r1, #24
	movs	r0, #20
	bl	xQueueGenericCreate
	mov	r3, r0
	.loc 1 9 16
	ldr	r2, .L5+4
	str	r3, [r2]
	ldr	r3, .L5+4
	ldr	r3, [r3]
	.loc 1 9 7
	cmp	r3, #0
	bne	.L3
	.loc 1 11 7
	ldr	r0, .L5+8
	bl	printf
	.loc 1 12 14
	movs	r3, #0
	b	.L4
.L3:
	.loc 1 15 17
	ldr	r3, .L5
	movs	r2, #1
	strb	r2, [r3]
	.loc 1 17 12
	movs	r3, #1
	b	.L4
.L2:
	.loc 1 19 5
	ldr	r0, .L5+12
	bl	printf
	.loc 1 20 12
	movs	r3, #1
.L4:
	.loc 1 22 1
	mov	r0, r3
	pop	{r3, pc}
.L6:
	.align	2
.L5:
	.word	initialized
	.word	xQueue
	.word	.LC0
	.word	.LC1
.LFE148:
	.size	setupQueue, .-setupQueue
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
	.4byte	.LFB148
	.4byte	.LFE148-.LFB148
	.byte	0x4
	.4byte	.LCFI0-.LFB148
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE0:
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/__crossworks.h"
	.file 3 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/stdint.h"
	.file 4 "C:/Users/Keld/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/CMSIS_5/CMSIS/Core/Include/core_cm4.h"
	.file 5 "../../../nRF5_SDK_14.2.0/components/toolchain/system_nrf52.h"
	.file 6 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/stdio.h"
	.file 7 "../../../nRF5_SDK_14.2.0/components/libraries/util/app_util.h"
	.file 8 "../../../nRF5_SDK_14.2.0/external/freertos/source/include/queue.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x6b5
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF101
	.byte	0xc
	.4byte	.LASF102
	.4byte	.LASF103
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
	.4byte	.LASF89
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
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.4byte	.LASF79
	.uleb128 0xc
	.4byte	.LASF80
	.byte	0x3
	.byte	0x2a
	.byte	0x1c
	.4byte	0x27a
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF81
	.uleb128 0xc
	.4byte	.LASF82
	.byte	0x3
	.byte	0x36
	.byte	0x1c
	.4byte	0x4f
	.uleb128 0x15
	.4byte	0x5c8
	.uleb128 0xc
	.4byte	.LASF83
	.byte	0x3
	.byte	0x37
	.byte	0x1c
	.4byte	0x88
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF84
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF85
	.uleb128 0xf
	.4byte	.LASF86
	.byte	0x4
	.2byte	0x804
	.byte	0x19
	.4byte	0x5d4
	.uleb128 0x16
	.4byte	.LASF87
	.byte	0x5
	.byte	0x21
	.byte	0x11
	.4byte	0x5d9
	.uleb128 0x12
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x311
	.byte	0x1b
	.4byte	0x619
	.uleb128 0x11
	.4byte	.LASF90
	.uleb128 0xf
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x315
	.byte	0xe
	.4byte	0x62b
	.uleb128 0x9
	.byte	0x4
	.4byte	0x60c
	.uleb128 0xf
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x316
	.byte	0xe
	.4byte	0x62b
	.uleb128 0xf
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x317
	.byte	0xe
	.4byte	0x62b
	.uleb128 0x16
	.4byte	.LASF94
	.byte	0x7
	.byte	0x4b
	.byte	0x11
	.4byte	0x5d9
	.uleb128 0x16
	.4byte	.LASF95
	.byte	0x7
	.byte	0x4c
	.byte	0x11
	.4byte	0x5d9
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF96
	.uleb128 0xc
	.4byte	.LASF97
	.byte	0x8
	.byte	0x58
	.byte	0x10
	.4byte	0x25
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF98
	.uleb128 0x6
	.byte	0x1
	.byte	0x2
	.4byte	.LASF99
	.uleb128 0x17
	.4byte	.LASF104
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.4byte	0x67d
	.uleb128 0x5
	.byte	0x3
	.4byte	initialized
	.uleb128 0x16
	.4byte	.LASF100
	.byte	0x1
	.byte	0x4
	.byte	0x15
	.4byte	0x66a
	.uleb128 0x18
	.4byte	.LASF105
	.byte	0x1
	.byte	0x7
	.byte	0x7
	.4byte	0x67d
	.4byte	.LFB148
	.4byte	.LFE148-.LFB148
	.uleb128 0x1
	.byte	0x9c
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
	.uleb128 0x18
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x2d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x6b9
	.4byte	0x684
	.ascii	"initialized\000"
	.4byte	0x6a2
	.ascii	"setupQueue\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x1d2
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x6b9
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
	.ascii	"signed char\000"
	.4byte	0x5b5
	.ascii	"uint8_t\000"
	.4byte	0x5c1
	.ascii	"short int\000"
	.4byte	0x5c8
	.ascii	"int32_t\000"
	.4byte	0x5d9
	.ascii	"uint32_t\000"
	.4byte	0x5e5
	.ascii	"long long int\000"
	.4byte	0x5ec
	.ascii	"long long unsigned int\000"
	.4byte	0x60c
	.ascii	"FILE\000"
	.4byte	0x663
	.ascii	"long unsigned int\000"
	.4byte	0x66a
	.ascii	"QueueHandle_t\000"
	.4byte	0x676
	.ascii	"double\000"
	.4byte	0x67d
	.ascii	"_Bool\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB148
	.4byte	.LFE148-.LFB148
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB148
	.4byte	.LFE148
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF18:
	.ascii	"p_sep_by_space\000"
.LASF52:
	.ascii	"__mbstate_s\000"
.LASF57:
	.ascii	"__RAL_codeset_ascii\000"
.LASF9:
	.ascii	"currency_symbol\000"
.LASF36:
	.ascii	"date_time_format\000"
.LASF13:
	.ascii	"positive_sign\000"
.LASF26:
	.ascii	"int_n_sep_by_space\000"
.LASF81:
	.ascii	"short int\000"
.LASF53:
	.ascii	"__locale_s\000"
.LASF1:
	.ascii	"__wchar\000"
.LASF20:
	.ascii	"n_sep_by_space\000"
.LASF59:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF40:
	.ascii	"__tolower\000"
.LASF22:
	.ascii	"n_sign_posn\000"
.LASF84:
	.ascii	"long long int\000"
.LASF46:
	.ascii	"__RAL_locale_data_t\000"
.LASF68:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF58:
	.ascii	"__RAL_codeset_utf8\000"
.LASF62:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF17:
	.ascii	"p_cs_precedes\000"
.LASF80:
	.ascii	"uint8_t\000"
.LASF28:
	.ascii	"int_n_sign_posn\000"
.LASF83:
	.ascii	"uint32_t\000"
.LASF25:
	.ascii	"int_p_sep_by_space\000"
.LASF74:
	.ascii	"__RAL_error_decoder_s\000"
.LASF77:
	.ascii	"__RAL_error_decoder_t\000"
.LASF35:
	.ascii	"time_format\000"
.LASF5:
	.ascii	"decimal_point\000"
.LASF31:
	.ascii	"month_names\000"
.LASF93:
	.ascii	"stderr\000"
.LASF50:
	.ascii	"codeset\000"
.LASF32:
	.ascii	"abbrev_month_names\000"
.LASF54:
	.ascii	"__category\000"
.LASF7:
	.ascii	"grouping\000"
.LASF43:
	.ascii	"__towlower\000"
.LASF2:
	.ascii	"long int\000"
.LASF103:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\SES\000"
.LASF69:
	.ascii	"__RAL_data_empty_string\000"
.LASF61:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
.LASF94:
	.ascii	"__StackTop\000"
.LASF102:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\movementStruct\\movementStruct.c\000"
.LASF97:
	.ascii	"QueueHandle_t\000"
.LASF56:
	.ascii	"__RAL_c_locale\000"
.LASF14:
	.ascii	"negative_sign\000"
.LASF75:
	.ascii	"decode\000"
.LASF48:
	.ascii	"name\000"
.LASF21:
	.ascii	"p_sign_posn\000"
.LASF73:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF70:
	.ascii	"__user_set_time_of_day\000"
.LASF37:
	.ascii	"unsigned char\000"
.LASF78:
	.ascii	"__RAL_error_decoder_head\000"
.LASF66:
	.ascii	"__RAL_data_utf8_space\000"
.LASF79:
	.ascii	"signed char\000"
.LASF85:
	.ascii	"long long unsigned int\000"
.LASF100:
	.ascii	"xQueue\000"
.LASF12:
	.ascii	"mon_grouping\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF29:
	.ascii	"day_names\000"
.LASF96:
	.ascii	"long unsigned int\000"
.LASF33:
	.ascii	"am_pm_indicator\000"
.LASF42:
	.ascii	"__towupper\000"
.LASF8:
	.ascii	"int_curr_symbol\000"
.LASF67:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF15:
	.ascii	"int_frac_digits\000"
.LASF10:
	.ascii	"mon_decimal_point\000"
.LASF6:
	.ascii	"thousands_sep\000"
.LASF30:
	.ascii	"abbrev_day_names\000"
.LASF3:
	.ascii	"char\000"
.LASF71:
	.ascii	"__user_get_time_of_day\000"
.LASF82:
	.ascii	"int32_t\000"
.LASF19:
	.ascii	"n_cs_precedes\000"
.LASF101:
	.ascii	"GNU C99 9.3.1 20200408 (release) -fmessage-length=0"
	.ascii	" -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -"
	.ascii	"mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-acce"
	.ascii	"ss -std=gnu99 -g2 -gpubnames -fomit-frame-pointer -"
	.ascii	"fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections"
	.ascii	" -fdata-sections -fshort-enums -fno-common\000"
.LASF99:
	.ascii	"_Bool\000"
.LASF87:
	.ascii	"SystemCoreClock\000"
.LASF49:
	.ascii	"data\000"
.LASF88:
	.ascii	"FILE\000"
.LASF72:
	.ascii	"short unsigned int\000"
.LASF16:
	.ascii	"frac_digits\000"
.LASF63:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF55:
	.ascii	"__RAL_global_locale\000"
.LASF27:
	.ascii	"int_p_sign_posn\000"
.LASF98:
	.ascii	"double\000"
.LASF105:
	.ascii	"setupQueue\000"
.LASF89:
	.ascii	"timeval\000"
.LASF60:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF90:
	.ascii	"__RAL_FILE\000"
.LASF47:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF91:
	.ascii	"stdin\000"
.LASF64:
	.ascii	"__RAL_data_utf8_period\000"
.LASF45:
	.ascii	"__mbtowc\000"
.LASF51:
	.ascii	"__RAL_locale_t\000"
.LASF34:
	.ascii	"date_format\000"
.LASF39:
	.ascii	"__toupper\000"
.LASF65:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF11:
	.ascii	"mon_thousands_sep\000"
.LASF95:
	.ascii	"__StackLimit\000"
.LASF24:
	.ascii	"int_n_cs_precedes\000"
.LASF86:
	.ascii	"ITM_RxBuffer\000"
.LASF38:
	.ascii	"__isctype\000"
.LASF0:
	.ascii	"__state\000"
.LASF104:
	.ascii	"initialized\000"
.LASF23:
	.ascii	"int_p_cs_precedes\000"
.LASF41:
	.ascii	"__iswctype\000"
.LASF44:
	.ascii	"__wctomb\000"
.LASF92:
	.ascii	"stdout\000"
.LASF76:
	.ascii	"next\000"
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
