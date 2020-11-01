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
	.file	"ss_init_main.c"
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
	.section	.data.tx_poll_msg,"aw"
	.align	2
	.type	tx_poll_msg, %object
	.size	tx_poll_msg, 14
tx_poll_msg:
	.ascii	"A\210\000\312\336\377\377\000\000\000\000\340\000\000"
	.section	.data.rx_resp_msg,"aw"
	.align	2
	.type	rx_resp_msg, %object
	.size	rx_resp_msg, 22
rx_resp_msg:
	.ascii	"A\210\000\312\336\377\377\000\000\000\000\341\000\000"
	.ascii	"\000\000\000\000\000\000\000\000"
	.section	.bss.frame_seq_nb,"aw",%nobits
	.type	frame_seq_nb, %object
	.size	frame_seq_nb, 1
frame_seq_nb:
	.space	1
	.section	.bss.rx_buffer,"aw",%nobits
	.align	2
	.type	rx_buffer, %object
	.size	rx_buffer, 22
rx_buffer:
	.space	22
	.section	.bss.status_reg,"aw",%nobits
	.align	2
	.type	status_reg, %object
	.size	status_reg, 4
status_reg:
	.space	4
	.section	.bss.tof,"aw",%nobits
	.align	3
	.type	tof, %object
	.size	tof, 8
tof:
	.space	8
	.section	.bss.tag_addr_32,"aw",%nobits
	.align	2
	.type	tag_addr_32, %object
	.size	tag_addr_32, 4
tag_addr_32:
	.space	4
	.section	.bss.tx_count,"aw",%nobits
	.align	2
	.type	tx_count, %object
	.size	tx_count, 4
tx_count:
	.space	4
	.section	.bss.rx_count,"aw",%nobits
	.align	2
	.type	rx_count, %object
	.size	rx_count, 4
rx_count:
	.space	4
	.section	.bss.distance,"aw",%nobits
	.align	3
	.type	distance, %object
	.size	distance, 8
distance:
	.space	8
	.section .rodata
	.align	2
.LC0:
	.ascii	"Transmission # : %d\015\012\000"
	.align	2
.LC1:
	.ascii	"Reception # : %d\015\012\000"
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_d2f
	.global	__aeabi_f2d
	.align	2
.LC2:
	.ascii	"Distance : %f\015\012\000"
	.section	.text.ss_init_run,"ax",%progbits
	.align	1
	.global	ss_init_run
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ss_init_run, %function
ss_init_run:
.LFB218:
	.file 1 "C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\code\\ss_twr_init\\ss_init_main.c"
	.loc 1 99 1
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI0:
	sub	sp, sp, #44
.LCFI1:
	.loc 1 105 31
	ldr	r3, .L8+24
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, .L8+28
	strb	r2, [r3, #2]
	.loc 1 106 3
	movs	r2, #128
	movs	r1, #0
	movs	r0, #15
	bl	dwt_write32bitoffsetreg
	.loc 1 107 3
	movs	r2, #0
	ldr	r1, .L8+28
	movs	r0, #14
	bl	dwt_writetxdata
	.loc 1 108 3
	movs	r2, #1
	movs	r1, #0
	movs	r0, #14
	bl	dwt_writetxfctrl
	.loc 1 112 3
	movs	r0, #2
	bl	dwt_starttx
	.loc 1 113 11
	ldr	r3, .L8+32
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L8+32
	str	r3, [r2]
	.loc 1 114 3
	ldr	r3, .L8+32
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, .L8+36
	bl	printf
	.loc 1 118 9
	nop
.L2:
	.loc 1 118 26 discriminator 1
	movs	r1, #0
	movs	r0, #15
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 118 24 discriminator 1
	ldr	r2, .L8+40
	str	r3, [r2]
	ldr	r3, .L8+40
	ldr	r2, [r3]
	.loc 1 118 59 discriminator 1
	ldr	r3, .L8+44
	ands	r3, r3, r2
	.loc 1 118 9 discriminator 1
	cmp	r3, #0
	beq	.L2
	.loc 1 132 15
	ldr	r3, .L8+24
	ldrb	r3, [r3]	@ zero_extendqisi2
	adds	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L8+24
	strb	r2, [r3]
	.loc 1 134 18
	ldr	r3, .L8+40
	ldr	r3, [r3]
	and	r3, r3, #16384
	.loc 1 134 6
	cmp	r3, #0
	beq	.L3
.LBB2:
	.loc 1 139 5
	mov	r2, #16384
	movs	r1, #0
	movs	r0, #15
	bl	dwt_write32bitoffsetreg
	.loc 1 142 17
	movs	r1, #0
	movs	r0, #16
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 142 15
	and	r3, r3, #127
	str	r3, [sp, #32]
	.loc 1 144 8
	ldr	r3, [sp, #32]
	cmp	r3, #22
	bhi	.L4
	.loc 1 146 7
	ldr	r3, [sp, #32]
	uxth	r3, r3
	movs	r2, #0
	mov	r1, r3
	ldr	r0, .L8+48
	bl	dwt_readrxdata
.L4:
.LBB3:
	.loc 1 149 13
	movs	r3, #1
	str	r3, [sp, #36]
	.loc 1 149 5
	b	.L5
.L6:
	.loc 1 151 34 discriminator 3
	ldr	r3, .L8+52
	ldr	r3, [r3]
	lsls	r3, r3, #8
	.loc 1 151 93 discriminator 3
	ldr	r2, [sp, #36]
	rsb	r2, r2, #11
	.loc 1 151 51 discriminator 3
	ldr	r1, .L8+48
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	.loc 1 151 40 discriminator 3
	add	r3, r3, r2
	.loc 1 151 19 discriminator 3
	ldr	r2, .L8+52
	str	r3, [r2]
	.loc 1 149 48 discriminator 3
	ldr	r3, [sp, #36]
	adds	r3, r3, #1
	str	r3, [sp, #36]
.L5:
	.loc 1 149 5 discriminator 1
	ldr	r3, [sp, #36]
	cmp	r3, #4
	ble	.L6
.LBE3:
	.loc 1 161 31
	ldr	r3, .L8+48
	movs	r2, #0
	strb	r2, [r3, #2]
	.loc 1 162 9
	movs	r2, #7
	ldr	r1, .L8+56
	ldr	r0, .L8+48
	bl	memcmp
	mov	r3, r0
	.loc 1 162 8
	cmp	r3, #0
	bne	.L7
.LBB4:
	.loc 1 164 15
	ldr	r3, .L8+60
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L8+60
	str	r3, [r2]
	.loc 1 165 7
	ldr	r3, .L8+60
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, .L8+64
	bl	printf
	.loc 1 171 20
	bl	dwt_readtxtimestamplo32
	str	r0, [sp, #28]
	.loc 1 172 20
	bl	dwt_readrxtimestamplo32
	str	r0, [sp, #24]
	.loc 1 175 26
	bl	dwt_readcarrierintegrator
	mov	r3, r0
	.loc 1 175 54
	mov	r0, r3
	bl	__aeabi_i2d
.LVL0:
	adr	r3, .L8
	ldrd	r2, [r3]
	bl	__aeabi_dmul
.LVL1:
	mov	r2, r0
	mov	r3, r1
	.loc 1 175 24
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2f
.LVL2:
	mov	r3, r0	@ float
	str	r3, [sp, #20]	@ float
	.loc 1 178 7
	add	r3, sp, #8
	mov	r1, r3
	ldr	r0, .L8+68
	bl	resp_msg_get_ts
	.loc 1 179 7
	add	r3, sp, #4
	mov	r1, r3
	ldr	r0, .L8+72
	bl	resp_msg_get_ts
	.loc 1 182 29
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #28]
	subs	r3, r2, r3
	.loc 1 182 16
	str	r3, [sp, #16]
	.loc 1 183 29
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #8]
	subs	r3, r2, r3
	.loc 1 183 16
	str	r3, [sp, #12]
	.loc 1 185 24
	ldr	r3, [sp, #16]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	.loc 1 185 35
	ldr	r3, [sp, #12]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s13, s15
	.loc 1 185 43
	vmov.f32	s12, #1.0e+0
	vldr.32	s15, [sp, #20]
	vsub.f32	s15, s12, s15
	.loc 1 185 35
	vmul.f32	s15, s13, s15
	.loc 1 185 24
	vsub.f32	s15, s14, s15
	.loc 1 185 64
	vmov.f32	s14, #2.0e+0
	vdiv.f32	s13, s15, s14
	vmov	r0, s13
	bl	__aeabi_f2d
.LVL3:
	.loc 1 185 72
	adr	r3, .L8+8
	ldrd	r2, [r3]
	bl	__aeabi_dmul
.LVL4:
	mov	r2, r0
	mov	r3, r1
	.loc 1 185 11
	ldr	r1, .L8+76
	strd	r2, [r1]
	.loc 1 201 19
	ldr	r3, .L8+76
	ldrd	r0, [r3]
	adr	r3, .L8+16
	ldrd	r2, [r3]
	bl	__aeabi_dmul
.LVL5:
	mov	r2, r0
	mov	r3, r1
	.loc 1 201 14
	ldr	r1, .L8+80
	strd	r2, [r1]
	.loc 1 202 5
	ldr	r3, .L8+80
	ldrd	r2, [r3]
	ldr	r0, .L8+84
	bl	printf
	b	.L7
.L3:
.LBE4:
.LBE2:
	.loc 1 209 5
	ldr	r2, .L8+88
	movs	r1, #0
	movs	r0, #15
	bl	dwt_write32bitoffsetreg
	.loc 1 212 5
	bl	dwt_rxreset
.L7:
	.loc 1 219 1
	nop
	mov	r0, r3
	add	sp, sp, #44
.LCFI2:
	@ sp needed
	ldr	pc, [sp], #4
.L9:
	.align	3
.L8:
	.word	330382100
	.word	-1107054277
	.word	1003374842
	.word	1035023640
	.word	318767104
	.word	1102175513
	.word	frame_seq_nb
	.word	tx_poll_msg
	.word	tx_count
	.word	.LC0
	.word	status_reg
	.word	606588928
	.word	rx_buffer
	.word	tag_addr_32
	.word	rx_resp_msg
	.word	rx_count
	.word	.LC1
	.word	rx_buffer+12
	.word	rx_buffer+16
	.word	tof
	.word	distance
	.word	.LC2
	.word	606572544
.LFE218:
	.size	ss_init_run, .-ss_init_run
	.section	.text.resp_msg_get_ts,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	resp_msg_get_ts, %function
resp_msg_get_ts:
.LFB219:
	.loc 1 233 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI3:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 235 7
	ldr	r3, [sp]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 236 10
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 236 3
	b	.L11
.L12:
	.loc 1 238 9 discriminator 3
	ldr	r3, [sp]
	ldr	r3, [r3]
	.loc 1 238 20 discriminator 3
	ldr	r2, [sp, #12]
	ldr	r1, [sp, #4]
	add	r2, r2, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	mov	r1, r2
	.loc 1 238 30 discriminator 3
	ldr	r2, [sp, #12]
	lsls	r2, r2, #3
	.loc 1 238 24 discriminator 3
	lsl	r2, r1, r2
	.loc 1 238 9 discriminator 3
	add	r2, r2, r3
	ldr	r3, [sp]
	str	r2, [r3]
	.loc 1 236 37 discriminator 3
	ldr	r3, [sp, #12]
	adds	r3, r3, #1
	str	r3, [sp, #12]
.L11:
	.loc 1 236 3 discriminator 1
	ldr	r3, [sp, #12]
	cmp	r3, #3
	ble	.L12
	.loc 1 240 1
	nop
	nop
	add	sp, sp, #16
.LCFI4:
	@ sp needed
	bx	lr
.LFE219:
	.size	resp_msg_get_ts, .-resp_msg_get_ts
	.section	.text.ss_initiator_task_function,"ax",%progbits
	.align	1
	.global	ss_initiator_task_function
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ss_initiator_task_function, %function
ss_initiator_task_function:
.LFB220:
	.loc 1 248 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI5:
	sub	sp, sp, #12
.LCFI6:
	str	r0, [sp, #4]
	.loc 1 253 3
	movs	r0, #1
	bl	dwt_setleds
.L14:
	.loc 1 257 5 discriminator 1
	bl	ss_init_run
	.loc 1 259 5 discriminator 1
	movs	r0, #100
	bl	vTaskDelay
	.loc 1 257 5 discriminator 1
	b	.L14
.LFE220:
	.size	ss_initiator_task_function, .-ss_initiator_task_function
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
	.4byte	.LFB218
	.4byte	.LFE218-.LFB218
	.byte	0x4
	.4byte	.LCFI0-.LFB218
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
	.4byte	.LFB219
	.4byte	.LFE219-.LFB219
	.byte	0x4
	.4byte	.LCFI3-.LFB219
	.byte	0xe
	.uleb128 0x10
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
	.4byte	.LFB220
	.4byte	.LFE220-.LFB220
	.byte	0x4
	.4byte	.LCFI5-.LFB220
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE4:
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/__crossworks.h"
	.file 3 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/stdio.h"
	.file 4 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 5.10b/include/stdint.h"
	.file 5 "../../../nRF5_SDK_14.2.0/components/device/nrf52.h"
	.file 6 "C:/Users/Keld/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/CMSIS_5/CMSIS/Core/Include/core_cm4.h"
	.file 7 "../../../nRF5_SDK_14.2.0/components/toolchain/system_nrf52.h"
	.file 8 "../../../nRF5_SDK_14.2.0/components/libraries/util/app_util.h"
	.file 9 "../../../deca_driver/deca_device_api.h"
	.file 10 "../../../nRF5_SDK_14.2.0/components/drivers_nrf/hal/nrf_spi.h"
	.file 11 "../../../nRF5_SDK_14.2.0/components/drivers_nrf/spi_master/nrf_drv_spi.h"
	.file 12 "../../../nRF5_SDK_14.2.0/components/libraries/experimental_log/src/nrf_log_internal.h"
	.file 13 "../../../deca_driver/port/port_platform.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x10c3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF237
	.byte	0xc
	.4byte	.LASF238
	.4byte	.LASF239
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
	.4byte	0x5b
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x6
	.4byte	0x4f
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x8
	.4byte	0x4f
	.4byte	0x7b
	.uleb128 0x9
	.4byte	0x7b
	.uleb128 0x9
	.4byte	0x8d
	.uleb128 0x9
	.4byte	0x94
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x81
	.uleb128 0x7
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0xb
	.4byte	0x81
	.uleb128 0x7
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0xa
	.byte	0x4
	.4byte	0x27
	.uleb128 0x8
	.4byte	0x4f
	.4byte	0xb8
	.uleb128 0x9
	.4byte	0xb8
	.uleb128 0x9
	.4byte	0xbe
	.uleb128 0x9
	.4byte	0x8d
	.uleb128 0x9
	.4byte	0x94
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x8d
	.uleb128 0xa
	.byte	0x4
	.4byte	0x88
	.uleb128 0xc
	.byte	0x58
	.byte	0x2
	.byte	0x84
	.byte	0x9
	.4byte	0x26e
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x86
	.byte	0xf
	.4byte	0xbe
	.byte	0
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x2
	.byte	0x87
	.byte	0xf
	.4byte	0xbe
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x2
	.byte	0x88
	.byte	0xf
	.4byte	0xbe
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x2
	.byte	0x8a
	.byte	0xf
	.4byte	0xbe
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x2
	.byte	0x8b
	.byte	0xf
	.4byte	0xbe
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x8c
	.byte	0xf
	.4byte	0xbe
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x2
	.byte	0x8d
	.byte	0xf
	.4byte	0xbe
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x2
	.byte	0x8e
	.byte	0xf
	.4byte	0xbe
	.byte	0x1c
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x2
	.byte	0x8f
	.byte	0xf
	.4byte	0xbe
	.byte	0x20
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x2
	.byte	0x90
	.byte	0xf
	.4byte	0xbe
	.byte	0x24
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x2
	.byte	0x92
	.byte	0x8
	.4byte	0x81
	.byte	0x28
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x2
	.byte	0x93
	.byte	0x8
	.4byte	0x81
	.byte	0x29
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x2
	.byte	0x94
	.byte	0x8
	.4byte	0x81
	.byte	0x2a
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x2
	.byte	0x95
	.byte	0x8
	.4byte	0x81
	.byte	0x2b
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x2
	.byte	0x96
	.byte	0x8
	.4byte	0x81
	.byte	0x2c
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x2
	.byte	0x97
	.byte	0x8
	.4byte	0x81
	.byte	0x2d
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x2
	.byte	0x98
	.byte	0x8
	.4byte	0x81
	.byte	0x2e
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x2
	.byte	0x99
	.byte	0x8
	.4byte	0x81
	.byte	0x2f
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x2
	.byte	0x9a
	.byte	0x8
	.4byte	0x81
	.byte	0x30
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x2
	.byte	0x9b
	.byte	0x8
	.4byte	0x81
	.byte	0x31
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x2
	.byte	0x9c
	.byte	0x8
	.4byte	0x81
	.byte	0x32
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x2
	.byte	0x9d
	.byte	0x8
	.4byte	0x81
	.byte	0x33
	.uleb128 0x4
	.4byte	.LASF27
	.byte	0x2
	.byte	0x9e
	.byte	0x8
	.4byte	0x81
	.byte	0x34
	.uleb128 0x4
	.4byte	.LASF28
	.byte	0x2
	.byte	0x9f
	.byte	0x8
	.4byte	0x81
	.byte	0x35
	.uleb128 0x4
	.4byte	.LASF29
	.byte	0x2
	.byte	0xa4
	.byte	0xf
	.4byte	0xbe
	.byte	0x38
	.uleb128 0x4
	.4byte	.LASF30
	.byte	0x2
	.byte	0xa5
	.byte	0xf
	.4byte	0xbe
	.byte	0x3c
	.uleb128 0x4
	.4byte	.LASF31
	.byte	0x2
	.byte	0xa6
	.byte	0xf
	.4byte	0xbe
	.byte	0x40
	.uleb128 0x4
	.4byte	.LASF32
	.byte	0x2
	.byte	0xa7
	.byte	0xf
	.4byte	0xbe
	.byte	0x44
	.uleb128 0x4
	.4byte	.LASF33
	.byte	0x2
	.byte	0xa8
	.byte	0xf
	.4byte	0xbe
	.byte	0x48
	.uleb128 0x4
	.4byte	.LASF34
	.byte	0x2
	.byte	0xa9
	.byte	0xf
	.4byte	0xbe
	.byte	0x4c
	.uleb128 0x4
	.4byte	.LASF35
	.byte	0x2
	.byte	0xaa
	.byte	0xf
	.4byte	0xbe
	.byte	0x50
	.uleb128 0x4
	.4byte	.LASF36
	.byte	0x2
	.byte	0xab
	.byte	0xf
	.4byte	0xbe
	.byte	0x54
	.byte	0
	.uleb128 0xd
	.4byte	.LASF46
	.byte	0x2
	.byte	0xac
	.byte	0x3
	.4byte	0xc4
	.uleb128 0xb
	.4byte	0x26e
	.uleb128 0x7
	.byte	0x1
	.byte	0x8
	.4byte	.LASF37
	.uleb128 0xb
	.4byte	0x27f
	.uleb128 0xc
	.byte	0x20
	.byte	0x2
	.byte	0xc2
	.byte	0x9
	.4byte	0x2fd
	.uleb128 0x4
	.4byte	.LASF38
	.byte	0x2
	.byte	0xc4
	.byte	0x9
	.4byte	0x311
	.byte	0
	.uleb128 0x4
	.4byte	.LASF39
	.byte	0x2
	.byte	0xc5
	.byte	0x9
	.4byte	0x326
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF40
	.byte	0x2
	.byte	0xc6
	.byte	0x9
	.4byte	0x326
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF41
	.byte	0x2
	.byte	0xc9
	.byte	0x9
	.4byte	0x340
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF42
	.byte	0x2
	.byte	0xca
	.byte	0xa
	.4byte	0x355
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF43
	.byte	0x2
	.byte	0xcb
	.byte	0xa
	.4byte	0x355
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF44
	.byte	0x2
	.byte	0xce
	.byte	0x9
	.4byte	0x35b
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF45
	.byte	0x2
	.byte	0xcf
	.byte	0x9
	.4byte	0x361
	.byte	0x1c
	.byte	0
	.uleb128 0x8
	.4byte	0x4f
	.4byte	0x311
	.uleb128 0x9
	.4byte	0x4f
	.uleb128 0x9
	.4byte	0x4f
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x2fd
	.uleb128 0x8
	.4byte	0x4f
	.4byte	0x326
	.uleb128 0x9
	.4byte	0x4f
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x317
	.uleb128 0x8
	.4byte	0x4f
	.4byte	0x340
	.uleb128 0x9
	.4byte	0x5b
	.uleb128 0x9
	.4byte	0x4f
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x32c
	.uleb128 0x8
	.4byte	0x5b
	.4byte	0x355
	.uleb128 0x9
	.4byte	0x5b
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x346
	.uleb128 0xa
	.byte	0x4
	.4byte	0x62
	.uleb128 0xa
	.byte	0x4
	.4byte	0x9a
	.uleb128 0xd
	.4byte	.LASF47
	.byte	0x2
	.byte	0xd0
	.byte	0x3
	.4byte	0x28b
	.uleb128 0xb
	.4byte	0x367
	.uleb128 0xc
	.byte	0xc
	.byte	0x2
	.byte	0xd2
	.byte	0x9
	.4byte	0x3a9
	.uleb128 0x4
	.4byte	.LASF48
	.byte	0x2
	.byte	0xd3
	.byte	0xf
	.4byte	0xbe
	.byte	0
	.uleb128 0x4
	.4byte	.LASF49
	.byte	0x2
	.byte	0xd4
	.byte	0x25
	.4byte	0x3a9
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF50
	.byte	0x2
	.byte	0xd5
	.byte	0x28
	.4byte	0x3af
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x27a
	.uleb128 0xa
	.byte	0x4
	.4byte	0x373
	.uleb128 0xd
	.4byte	.LASF51
	.byte	0x2
	.byte	0xd6
	.byte	0x3
	.4byte	0x378
	.uleb128 0xb
	.4byte	0x3b5
	.uleb128 0x3
	.4byte	.LASF53
	.byte	0x14
	.byte	0x2
	.byte	0xda
	.byte	0x10
	.4byte	0x3e1
	.uleb128 0x4
	.4byte	.LASF54
	.byte	0x2
	.byte	0xdb
	.byte	0x20
	.4byte	0x3e1
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	0x3f1
	.4byte	0x3f1
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x3c1
	.uleb128 0x10
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x104
	.byte	0x1a
	.4byte	0x3c6
	.uleb128 0x10
	.4byte	.LASF56
	.byte	0x2
	.2byte	0x10b
	.byte	0x24
	.4byte	0x3c1
	.uleb128 0x10
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x10e
	.byte	0x2c
	.4byte	0x373
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x2
	.2byte	0x10f
	.byte	0x2c
	.4byte	0x373
	.uleb128 0xe
	.4byte	0x286
	.4byte	0x43b
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x7f
	.byte	0
	.uleb128 0xb
	.4byte	0x42b
	.uleb128 0x10
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x111
	.byte	0x23
	.4byte	0x43b
	.uleb128 0xe
	.4byte	0x88
	.4byte	0x458
	.uleb128 0x11
	.byte	0
	.uleb128 0xb
	.4byte	0x44d
	.uleb128 0x10
	.4byte	.LASF60
	.byte	0x2
	.2byte	0x113
	.byte	0x13
	.4byte	0x458
	.uleb128 0x10
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x114
	.byte	0x13
	.4byte	0x458
	.uleb128 0x10
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x115
	.byte	0x13
	.4byte	0x458
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x116
	.byte	0x13
	.4byte	0x458
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x118
	.byte	0x13
	.4byte	0x458
	.uleb128 0x10
	.4byte	.LASF65
	.byte	0x2
	.2byte	0x119
	.byte	0x13
	.4byte	0x458
	.uleb128 0x10
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x11a
	.byte	0x13
	.4byte	0x458
	.uleb128 0x10
	.4byte	.LASF67
	.byte	0x2
	.2byte	0x11b
	.byte	0x13
	.4byte	0x458
	.uleb128 0x10
	.4byte	.LASF68
	.byte	0x2
	.2byte	0x11c
	.byte	0x13
	.4byte	0x458
	.uleb128 0x10
	.4byte	.LASF69
	.byte	0x2
	.2byte	0x11d
	.byte	0x13
	.4byte	0x458
	.uleb128 0x8
	.4byte	0x4f
	.4byte	0x4ee
	.uleb128 0x9
	.4byte	0x4ee
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x4f9
	.uleb128 0x12
	.4byte	.LASF80
	.uleb128 0xb
	.4byte	0x4f4
	.uleb128 0x10
	.4byte	.LASF70
	.byte	0x2
	.2byte	0x133
	.byte	0xe
	.4byte	0x50b
	.uleb128 0xa
	.byte	0x4
	.4byte	0x4df
	.uleb128 0x8
	.4byte	0x4f
	.4byte	0x520
	.uleb128 0x9
	.4byte	0x520
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x4f4
	.uleb128 0x10
	.4byte	.LASF71
	.byte	0x2
	.2byte	0x134
	.byte	0xe
	.4byte	0x533
	.uleb128 0xa
	.byte	0x4
	.4byte	0x511
	.uleb128 0x7
	.byte	0x2
	.byte	0x7
	.4byte	.LASF72
	.uleb128 0x13
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x14b
	.byte	0x18
	.4byte	0x54d
	.uleb128 0xa
	.byte	0x4
	.4byte	0x553
	.uleb128 0x8
	.4byte	0xbe
	.4byte	0x562
	.uleb128 0x9
	.4byte	0x4f
	.byte	0
	.uleb128 0x14
	.4byte	.LASF74
	.byte	0x8
	.byte	0x2
	.2byte	0x14d
	.byte	0x10
	.4byte	0x58d
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x2
	.2byte	0x14f
	.byte	0x1c
	.4byte	0x540
	.byte	0
	.uleb128 0x15
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x150
	.byte	0x21
	.4byte	0x58d
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x562
	.uleb128 0x13
	.4byte	.LASF77
	.byte	0x2
	.2byte	0x151
	.byte	0x3
	.4byte	0x562
	.uleb128 0x10
	.4byte	.LASF78
	.byte	0x2
	.2byte	0x155
	.byte	0x1f
	.4byte	0x5ad
	.uleb128 0xa
	.byte	0x4
	.4byte	0x593
	.uleb128 0x13
	.4byte	.LASF79
	.byte	0x3
	.2byte	0x311
	.byte	0x1b
	.4byte	0x5c0
	.uleb128 0x12
	.4byte	.LASF81
	.uleb128 0x10
	.4byte	.LASF82
	.byte	0x3
	.2byte	0x315
	.byte	0xe
	.4byte	0x5d2
	.uleb128 0xa
	.byte	0x4
	.4byte	0x5b3
	.uleb128 0x10
	.4byte	.LASF83
	.byte	0x3
	.2byte	0x316
	.byte	0xe
	.4byte	0x5d2
	.uleb128 0x10
	.4byte	.LASF84
	.byte	0x3
	.2byte	0x317
	.byte	0xe
	.4byte	0x5d2
	.uleb128 0x7
	.byte	0x1
	.byte	0x6
	.4byte	.LASF85
	.uleb128 0xd
	.4byte	.LASF86
	.byte	0x4
	.byte	0x2a
	.byte	0x1c
	.4byte	0x27f
	.uleb128 0x7
	.byte	0x2
	.byte	0x5
	.4byte	.LASF87
	.uleb128 0xd
	.4byte	.LASF88
	.byte	0x4
	.byte	0x30
	.byte	0x1c
	.4byte	0x539
	.uleb128 0xd
	.4byte	.LASF89
	.byte	0x4
	.byte	0x36
	.byte	0x1c
	.4byte	0x4f
	.uleb128 0x6
	.4byte	0x618
	.uleb128 0xd
	.4byte	.LASF90
	.byte	0x4
	.byte	0x37
	.byte	0x1c
	.4byte	0x8d
	.uleb128 0x6
	.4byte	0x629
	.uleb128 0xb
	.4byte	0x635
	.uleb128 0x7
	.byte	0x8
	.byte	0x5
	.4byte	.LASF91
	.uleb128 0x7
	.byte	0x8
	.byte	0x7
	.4byte	.LASF92
	.uleb128 0x16
	.byte	0x5
	.byte	0x1
	.4byte	0x5f2
	.byte	0x5
	.byte	0x4a
	.byte	0xe
	.4byte	0x776
	.uleb128 0x17
	.4byte	.LASF93
	.sleb128 -15
	.uleb128 0x17
	.4byte	.LASF94
	.sleb128 -14
	.uleb128 0x17
	.4byte	.LASF95
	.sleb128 -13
	.uleb128 0x17
	.4byte	.LASF96
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF97
	.sleb128 -11
	.uleb128 0x17
	.4byte	.LASF98
	.sleb128 -10
	.uleb128 0x17
	.4byte	.LASF99
	.sleb128 -5
	.uleb128 0x17
	.4byte	.LASF100
	.sleb128 -4
	.uleb128 0x17
	.4byte	.LASF101
	.sleb128 -2
	.uleb128 0x17
	.4byte	.LASF102
	.sleb128 -1
	.uleb128 0x18
	.4byte	.LASF103
	.byte	0
	.uleb128 0x18
	.4byte	.LASF104
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF105
	.byte	0x2
	.uleb128 0x18
	.4byte	.LASF106
	.byte	0x3
	.uleb128 0x18
	.4byte	.LASF107
	.byte	0x4
	.uleb128 0x18
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF109
	.byte	0x6
	.uleb128 0x18
	.4byte	.LASF110
	.byte	0x7
	.uleb128 0x18
	.4byte	.LASF111
	.byte	0x8
	.uleb128 0x18
	.4byte	.LASF112
	.byte	0x9
	.uleb128 0x18
	.4byte	.LASF113
	.byte	0xa
	.uleb128 0x18
	.4byte	.LASF114
	.byte	0xb
	.uleb128 0x18
	.4byte	.LASF115
	.byte	0xc
	.uleb128 0x18
	.4byte	.LASF116
	.byte	0xd
	.uleb128 0x18
	.4byte	.LASF117
	.byte	0xe
	.uleb128 0x18
	.4byte	.LASF118
	.byte	0xf
	.uleb128 0x18
	.4byte	.LASF119
	.byte	0x10
	.uleb128 0x18
	.4byte	.LASF120
	.byte	0x11
	.uleb128 0x18
	.4byte	.LASF121
	.byte	0x12
	.uleb128 0x18
	.4byte	.LASF122
	.byte	0x13
	.uleb128 0x18
	.4byte	.LASF123
	.byte	0x14
	.uleb128 0x18
	.4byte	.LASF124
	.byte	0x15
	.uleb128 0x18
	.4byte	.LASF125
	.byte	0x16
	.uleb128 0x18
	.4byte	.LASF126
	.byte	0x17
	.uleb128 0x18
	.4byte	.LASF127
	.byte	0x18
	.uleb128 0x18
	.4byte	.LASF128
	.byte	0x19
	.uleb128 0x18
	.4byte	.LASF129
	.byte	0x1a
	.uleb128 0x18
	.4byte	.LASF130
	.byte	0x1b
	.uleb128 0x18
	.4byte	.LASF131
	.byte	0x1c
	.uleb128 0x18
	.4byte	.LASF132
	.byte	0x1d
	.uleb128 0x18
	.4byte	.LASF133
	.byte	0x20
	.uleb128 0x18
	.4byte	.LASF134
	.byte	0x21
	.uleb128 0x18
	.4byte	.LASF135
	.byte	0x22
	.uleb128 0x18
	.4byte	.LASF136
	.byte	0x23
	.uleb128 0x18
	.4byte	.LASF137
	.byte	0x24
	.uleb128 0x18
	.4byte	.LASF138
	.byte	0x25
	.uleb128 0x18
	.4byte	.LASF139
	.byte	0x26
	.byte	0
	.uleb128 0xd
	.4byte	.LASF140
	.byte	0x5
	.byte	0x7e
	.byte	0x3
	.4byte	0x64d
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0x792
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.4byte	0x782
	.uleb128 0x6
	.4byte	0x792
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0x7ac
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.4byte	0x79c
	.uleb128 0x6
	.4byte	0x7ac
	.uleb128 0x6
	.4byte	0x7ac
	.uleb128 0x10
	.4byte	.LASF141
	.byte	0x6
	.2byte	0x804
	.byte	0x19
	.4byte	0x624
	.uleb128 0x19
	.4byte	.LASF142
	.byte	0x7
	.byte	0x21
	.byte	0x11
	.4byte	0x629
	.uleb128 0xc
	.byte	0xc
	.byte	0x5
	.byte	0xf3
	.byte	0x9
	.4byte	0x805
	.uleb128 0x1a
	.ascii	"SCK\000"
	.byte	0x5
	.byte	0xf4
	.byte	0x12
	.4byte	0x635
	.byte	0
	.uleb128 0x4
	.4byte	.LASF143
	.byte	0x5
	.byte	0xf5
	.byte	0x12
	.4byte	0x635
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF144
	.byte	0x5
	.byte	0xf6
	.byte	0x12
	.4byte	0x635
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.4byte	.LASF145
	.byte	0x5
	.byte	0xf7
	.byte	0x3
	.4byte	0x7d4
	.uleb128 0xc
	.byte	0x10
	.byte	0x5
	.byte	0xf9
	.byte	0x9
	.4byte	0x84f
	.uleb128 0x1a
	.ascii	"PTR\000"
	.byte	0x5
	.byte	0xfa
	.byte	0x12
	.4byte	0x635
	.byte	0
	.uleb128 0x4
	.4byte	.LASF146
	.byte	0x5
	.byte	0xfb
	.byte	0x12
	.4byte	0x635
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF147
	.byte	0x5
	.byte	0xfc
	.byte	0x12
	.4byte	0x63a
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF148
	.byte	0x5
	.byte	0xfd
	.byte	0x12
	.4byte	0x635
	.byte	0xc
	.byte	0
	.uleb128 0xd
	.4byte	.LASF149
	.byte	0x5
	.byte	0xfe
	.byte	0x3
	.4byte	0x811
	.uleb128 0x1b
	.byte	0x10
	.byte	0x5
	.2byte	0x100
	.byte	0x9
	.4byte	0x89e
	.uleb128 0x1c
	.ascii	"PTR\000"
	.byte	0x5
	.2byte	0x101
	.byte	0x12
	.4byte	0x635
	.byte	0
	.uleb128 0x15
	.4byte	.LASF146
	.byte	0x5
	.2byte	0x102
	.byte	0x12
	.4byte	0x635
	.byte	0x4
	.uleb128 0x15
	.4byte	.LASF147
	.byte	0x5
	.2byte	0x103
	.byte	0x12
	.4byte	0x63a
	.byte	0x8
	.uleb128 0x15
	.4byte	.LASF148
	.byte	0x5
	.2byte	0x104
	.byte	0x12
	.4byte	0x635
	.byte	0xc
	.byte	0
	.uleb128 0x13
	.4byte	.LASF150
	.byte	0x5
	.2byte	0x105
	.byte	0x3
	.4byte	0x85b
	.uleb128 0x1b
	.byte	0xc
	.byte	0x5
	.2byte	0x13e
	.byte	0x9
	.4byte	0x8e0
	.uleb128 0x1c
	.ascii	"SCK\000"
	.byte	0x5
	.2byte	0x13f
	.byte	0x12
	.4byte	0x635
	.byte	0
	.uleb128 0x15
	.4byte	.LASF143
	.byte	0x5
	.2byte	0x140
	.byte	0x12
	.4byte	0x635
	.byte	0x4
	.uleb128 0x15
	.4byte	.LASF144
	.byte	0x5
	.2byte	0x141
	.byte	0x12
	.4byte	0x635
	.byte	0x8
	.byte	0
	.uleb128 0x13
	.4byte	.LASF151
	.byte	0x5
	.2byte	0x142
	.byte	0x3
	.4byte	0x8ab
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0x8fd
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x3f
	.byte	0
	.uleb128 0xb
	.4byte	0x8ed
	.uleb128 0x6
	.4byte	0x8fd
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0x917
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.4byte	0x907
	.uleb128 0x6
	.4byte	0x917
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0x931
	.uleb128 0xf
	.4byte	0x8d
	.byte	0xa
	.byte	0
	.uleb128 0xb
	.4byte	0x921
	.uleb128 0x6
	.4byte	0x931
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0x94b
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x37
	.byte	0
	.uleb128 0xb
	.4byte	0x93b
	.uleb128 0x6
	.4byte	0x94b
	.uleb128 0x1d
	.2byte	0x5c4
	.byte	0x5
	.2byte	0x33b
	.byte	0x9
	.4byte	0xb49
	.uleb128 0x15
	.4byte	.LASF152
	.byte	0x5
	.2byte	0x33c
	.byte	0x12
	.4byte	0x7b1
	.byte	0
	.uleb128 0x15
	.4byte	.LASF153
	.byte	0x5
	.2byte	0x33d
	.byte	0x12
	.4byte	0x635
	.byte	0x10
	.uleb128 0x15
	.4byte	.LASF154
	.byte	0x5
	.2byte	0x33e
	.byte	0x12
	.4byte	0x635
	.byte	0x14
	.uleb128 0x15
	.4byte	.LASF155
	.byte	0x5
	.2byte	0x33f
	.byte	0x12
	.4byte	0x63a
	.byte	0x18
	.uleb128 0x15
	.4byte	.LASF156
	.byte	0x5
	.2byte	0x340
	.byte	0x12
	.4byte	0x635
	.byte	0x1c
	.uleb128 0x15
	.4byte	.LASF157
	.byte	0x5
	.2byte	0x341
	.byte	0x12
	.4byte	0x635
	.byte	0x20
	.uleb128 0x15
	.4byte	.LASF158
	.byte	0x5
	.2byte	0x342
	.byte	0x12
	.4byte	0x950
	.byte	0x24
	.uleb128 0x1e
	.4byte	.LASF159
	.byte	0x5
	.2byte	0x343
	.byte	0x12
	.4byte	0x635
	.2byte	0x104
	.uleb128 0x1e
	.4byte	.LASF160
	.byte	0x5
	.2byte	0x344
	.byte	0x12
	.4byte	0x797
	.2byte	0x108
	.uleb128 0x1e
	.4byte	.LASF161
	.byte	0x5
	.2byte	0x345
	.byte	0x12
	.4byte	0x635
	.2byte	0x110
	.uleb128 0x1e
	.4byte	.LASF162
	.byte	0x5
	.2byte	0x346
	.byte	0x12
	.4byte	0x63a
	.2byte	0x114
	.uleb128 0x1e
	.4byte	.LASF163
	.byte	0x5
	.2byte	0x347
	.byte	0x12
	.4byte	0x635
	.2byte	0x118
	.uleb128 0x1e
	.4byte	.LASF164
	.byte	0x5
	.2byte	0x348
	.byte	0x12
	.4byte	0x63a
	.2byte	0x11c
	.uleb128 0x1e
	.4byte	.LASF165
	.byte	0x5
	.2byte	0x349
	.byte	0x12
	.4byte	0x635
	.2byte	0x120
	.uleb128 0x1e
	.4byte	.LASF166
	.byte	0x5
	.2byte	0x34a
	.byte	0x12
	.4byte	0xb5e
	.2byte	0x124
	.uleb128 0x1e
	.4byte	.LASF167
	.byte	0x5
	.2byte	0x34b
	.byte	0x12
	.4byte	0x635
	.2byte	0x14c
	.uleb128 0x1e
	.4byte	.LASF168
	.byte	0x5
	.2byte	0x34c
	.byte	0x12
	.4byte	0xb78
	.2byte	0x150
	.uleb128 0x1e
	.4byte	.LASF169
	.byte	0x5
	.2byte	0x34d
	.byte	0x12
	.4byte	0x635
	.2byte	0x200
	.uleb128 0x1e
	.4byte	.LASF170
	.byte	0x5
	.2byte	0x34e
	.byte	0x12
	.4byte	0x902
	.2byte	0x204
	.uleb128 0x1e
	.4byte	.LASF171
	.byte	0x5
	.2byte	0x34f
	.byte	0x12
	.4byte	0x635
	.2byte	0x304
	.uleb128 0x1e
	.4byte	.LASF172
	.byte	0x5
	.2byte	0x350
	.byte	0x12
	.4byte	0x635
	.2byte	0x308
	.uleb128 0x1e
	.4byte	.LASF173
	.byte	0x5
	.2byte	0x351
	.byte	0x12
	.4byte	0xb92
	.2byte	0x30c
	.uleb128 0x1e
	.4byte	.LASF174
	.byte	0x5
	.2byte	0x352
	.byte	0x12
	.4byte	0x635
	.2byte	0x500
	.uleb128 0x1e
	.4byte	.LASF175
	.byte	0x5
	.2byte	0x353
	.byte	0x12
	.4byte	0x63a
	.2byte	0x504
	.uleb128 0x1e
	.4byte	.LASF176
	.byte	0x5
	.2byte	0x354
	.byte	0x12
	.4byte	0x805
	.2byte	0x508
	.uleb128 0x1e
	.4byte	.LASF177
	.byte	0x5
	.2byte	0x355
	.byte	0x12
	.4byte	0x7b6
	.2byte	0x514
	.uleb128 0x1e
	.4byte	.LASF178
	.byte	0x5
	.2byte	0x356
	.byte	0x12
	.4byte	0x635
	.2byte	0x524
	.uleb128 0x1e
	.4byte	.LASF179
	.byte	0x5
	.2byte	0x357
	.byte	0x12
	.4byte	0x91c
	.2byte	0x528
	.uleb128 0x1f
	.ascii	"RXD\000"
	.byte	0x5
	.2byte	0x358
	.byte	0x11
	.4byte	0x84f
	.2byte	0x534
	.uleb128 0x1f
	.ascii	"TXD\000"
	.byte	0x5
	.2byte	0x359
	.byte	0x11
	.4byte	0x89e
	.2byte	0x544
	.uleb128 0x1e
	.4byte	.LASF180
	.byte	0x5
	.2byte	0x35a
	.byte	0x12
	.4byte	0x635
	.2byte	0x554
	.uleb128 0x1e
	.4byte	.LASF181
	.byte	0x5
	.2byte	0x35b
	.byte	0x12
	.4byte	0xbb1
	.2byte	0x558
	.uleb128 0x1f
	.ascii	"ORC\000"
	.byte	0x5
	.2byte	0x35c
	.byte	0x12
	.4byte	0x635
	.2byte	0x5c0
	.byte	0
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0xb59
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x9
	.byte	0
	.uleb128 0xb
	.4byte	0xb49
	.uleb128 0x6
	.4byte	0xb59
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0xb73
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x2b
	.byte	0
	.uleb128 0xb
	.4byte	0xb63
	.uleb128 0x6
	.4byte	0xb73
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0xb8d
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x7c
	.byte	0
	.uleb128 0xb
	.4byte	0xb7d
	.uleb128 0x6
	.4byte	0xb8d
	.uleb128 0x6
	.4byte	0xb8d
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0xbac
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x19
	.byte	0
	.uleb128 0xb
	.4byte	0xb9c
	.uleb128 0x6
	.4byte	0xbac
	.uleb128 0x13
	.4byte	.LASF182
	.byte	0x5
	.2byte	0x35e
	.byte	0x3
	.4byte	0x955
	.uleb128 0x1d
	.2byte	0x558
	.byte	0x5
	.2byte	0x404
	.byte	0x9
	.4byte	0xcbe
	.uleb128 0x15
	.4byte	.LASF152
	.byte	0x5
	.2byte	0x405
	.byte	0x12
	.4byte	0xcd3
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF183
	.byte	0x5
	.2byte	0x406
	.byte	0x12
	.4byte	0x635
	.2byte	0x108
	.uleb128 0x1e
	.4byte	.LASF155
	.byte	0x5
	.2byte	0x407
	.byte	0x12
	.4byte	0xced
	.2byte	0x10c
	.uleb128 0x1e
	.4byte	.LASF171
	.byte	0x5
	.2byte	0x408
	.byte	0x12
	.4byte	0x635
	.2byte	0x304
	.uleb128 0x1e
	.4byte	.LASF172
	.byte	0x5
	.2byte	0x409
	.byte	0x12
	.4byte	0x635
	.2byte	0x308
	.uleb128 0x1e
	.4byte	.LASF158
	.byte	0x5
	.2byte	0x40a
	.byte	0x12
	.4byte	0xb97
	.2byte	0x30c
	.uleb128 0x1e
	.4byte	.LASF174
	.byte	0x5
	.2byte	0x40b
	.byte	0x12
	.4byte	0x635
	.2byte	0x500
	.uleb128 0x1e
	.4byte	.LASF160
	.byte	0x5
	.2byte	0x40c
	.byte	0x12
	.4byte	0x63a
	.2byte	0x504
	.uleb128 0x1e
	.4byte	.LASF176
	.byte	0x5
	.2byte	0x40d
	.byte	0x11
	.4byte	0x8e0
	.2byte	0x508
	.uleb128 0x1e
	.4byte	.LASF162
	.byte	0x5
	.2byte	0x40e
	.byte	0x12
	.4byte	0x63a
	.2byte	0x514
	.uleb128 0x1f
	.ascii	"RXD\000"
	.byte	0x5
	.2byte	0x40f
	.byte	0x12
	.4byte	0x63a
	.2byte	0x518
	.uleb128 0x1f
	.ascii	"TXD\000"
	.byte	0x5
	.2byte	0x410
	.byte	0x12
	.4byte	0x635
	.2byte	0x51c
	.uleb128 0x1e
	.4byte	.LASF164
	.byte	0x5
	.2byte	0x411
	.byte	0x12
	.4byte	0x63a
	.2byte	0x520
	.uleb128 0x1e
	.4byte	.LASF178
	.byte	0x5
	.2byte	0x412
	.byte	0x12
	.4byte	0x635
	.2byte	0x524
	.uleb128 0x1e
	.4byte	.LASF166
	.byte	0x5
	.2byte	0x413
	.byte	0x12
	.4byte	0x936
	.2byte	0x528
	.uleb128 0x1e
	.4byte	.LASF180
	.byte	0x5
	.2byte	0x414
	.byte	0x12
	.4byte	0x635
	.2byte	0x554
	.byte	0
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0xcce
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x41
	.byte	0
	.uleb128 0xb
	.4byte	0xcbe
	.uleb128 0x6
	.4byte	0xcce
	.uleb128 0xe
	.4byte	0x63a
	.4byte	0xce8
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x7d
	.byte	0
	.uleb128 0xb
	.4byte	0xcd8
	.uleb128 0x6
	.4byte	0xce8
	.uleb128 0x13
	.4byte	.LASF184
	.byte	0x5
	.2byte	0x415
	.byte	0x3
	.4byte	0xbc3
	.uleb128 0x19
	.4byte	.LASF185
	.byte	0x8
	.byte	0x4b
	.byte	0x11
	.4byte	0x629
	.uleb128 0x19
	.4byte	.LASF186
	.byte	0x8
	.byte	0x4c
	.byte	0x11
	.4byte	0x629
	.uleb128 0x7
	.byte	0x4
	.byte	0x7
	.4byte	.LASF187
	.uleb128 0xd
	.4byte	.LASF188
	.byte	0x9
	.byte	0x18
	.byte	0x17
	.4byte	0x27f
	.uleb128 0xd
	.4byte	.LASF189
	.byte	0x9
	.byte	0x26
	.byte	0x17
	.4byte	0xd17
	.uleb128 0xd
	.4byte	.LASF190
	.byte	0x9
	.byte	0x3b
	.byte	0x15
	.4byte	0x5b
	.uleb128 0x16
	.byte	0x5
	.byte	0x4
	.4byte	0x4f
	.byte	0xa
	.byte	0x5d
	.byte	0x1
	.4byte	0xd91
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
	.4byte	0x27f
	.byte	0xa
	.byte	0x6d
	.byte	0x1
	.4byte	0xdb8
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
	.4byte	0x27f
	.byte	0xa
	.byte	0x78
	.byte	0x1
	.4byte	0xdd3
	.uleb128 0x18
	.4byte	.LASF202
	.byte	0
	.uleb128 0x18
	.4byte	.LASF203
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.byte	0xb
	.byte	0x85
	.byte	0x9
	.4byte	0xe11
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
	.4byte	0x776
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF205
	.byte	0xb
	.byte	0x89
	.byte	0xf
	.4byte	0x5f9
	.byte	0x5
	.uleb128 0x4
	.4byte	.LASF206
	.byte	0xb
	.byte	0x8a
	.byte	0xf
	.4byte	0xe11
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.byte	0x2
	.4byte	.LASF207
	.uleb128 0x6
	.4byte	0xe11
	.uleb128 0xd
	.4byte	.LASF208
	.byte	0xb
	.byte	0x8b
	.byte	0x3
	.4byte	0xdd3
	.uleb128 0xb
	.4byte	0xe1d
	.uleb128 0x1b
	.byte	0xc
	.byte	0xc
	.2byte	0x12b
	.byte	0x9
	.4byte	0xe71
	.uleb128 0x15
	.4byte	.LASF209
	.byte	0xc
	.2byte	0x12d
	.byte	0x12
	.4byte	0x60c
	.byte	0
	.uleb128 0x15
	.4byte	.LASF210
	.byte	0xc
	.2byte	0x12e
	.byte	0x12
	.4byte	0x60c
	.byte	0x2
	.uleb128 0x15
	.4byte	.LASF211
	.byte	0xc
	.2byte	0x12f
	.byte	0x12
	.4byte	0x629
	.byte	0x4
	.uleb128 0x15
	.4byte	.LASF212
	.byte	0xc
	.2byte	0x130
	.byte	0x12
	.4byte	0x629
	.byte	0x8
	.byte	0
	.uleb128 0x13
	.4byte	.LASF213
	.byte	0xc
	.2byte	0x131
	.byte	0x3
	.4byte	0xe2e
	.uleb128 0x10
	.4byte	.LASF214
	.byte	0xc
	.2byte	0x13b
	.byte	0x26
	.4byte	0xe71
	.uleb128 0x21
	.ascii	"spi\000"
	.byte	0xd
	.byte	0x39
	.byte	0x1c
	.4byte	0xe29
	.uleb128 0x5
	.byte	0x3
	.4byte	spi
	.uleb128 0x22
	.4byte	.LASF215
	.byte	0xd
	.byte	0x3a
	.byte	0x16
	.4byte	0xe18
	.uleb128 0x5
	.byte	0x3
	.4byte	spi_xfer_done
	.uleb128 0xe
	.4byte	0xd1e
	.4byte	0xebf
	.uleb128 0xf
	.4byte	0x8d
	.byte	0xd
	.byte	0
	.uleb128 0x22
	.4byte	.LASF216
	.byte	0x1
	.byte	0x26
	.byte	0xe
	.4byte	0xeaf
	.uleb128 0x5
	.byte	0x3
	.4byte	tx_poll_msg
	.uleb128 0xe
	.4byte	0xd1e
	.4byte	0xee1
	.uleb128 0xf
	.4byte	0x8d
	.byte	0x15
	.byte	0
	.uleb128 0x22
	.4byte	.LASF217
	.byte	0x1
	.byte	0x27
	.byte	0xe
	.4byte	0xed1
	.uleb128 0x5
	.byte	0x3
	.4byte	rx_resp_msg
	.uleb128 0x22
	.4byte	.LASF218
	.byte	0x1
	.byte	0x32
	.byte	0xe
	.4byte	0xd1e
	.uleb128 0x5
	.byte	0x3
	.4byte	frame_seq_nb
	.uleb128 0x22
	.4byte	.LASF219
	.byte	0x1
	.byte	0x37
	.byte	0xe
	.4byte	0xed1
	.uleb128 0x5
	.byte	0x3
	.4byte	rx_buffer
	.uleb128 0x22
	.4byte	.LASF220
	.byte	0x1
	.byte	0x3a
	.byte	0xf
	.4byte	0xd2a
	.uleb128 0x5
	.byte	0x3
	.4byte	status_reg
	.uleb128 0x21
	.ascii	"tof\000"
	.byte	0x1
	.byte	0x44
	.byte	0xf
	.4byte	0xf3b
	.uleb128 0x5
	.byte	0x3
	.4byte	tof
	.uleb128 0x7
	.byte	0x8
	.byte	0x4
	.4byte	.LASF221
	.uleb128 0x22
	.4byte	.LASF222
	.byte	0x1
	.byte	0x45
	.byte	0x1a
	.4byte	0xd17
	.uleb128 0x5
	.byte	0x3
	.4byte	tag_addr_32
	.uleb128 0x22
	.4byte	.LASF223
	.byte	0x1
	.byte	0x4c
	.byte	0x15
	.4byte	0x56
	.uleb128 0x5
	.byte	0x3
	.4byte	tx_count
	.uleb128 0x22
	.4byte	.LASF224
	.byte	0x1
	.byte	0x4d
	.byte	0x15
	.4byte	0x56
	.uleb128 0x5
	.byte	0x3
	.4byte	rx_count
	.uleb128 0x22
	.4byte	.LASF225
	.byte	0x1
	.byte	0x55
	.byte	0xf
	.4byte	0xf3b
	.uleb128 0x5
	.byte	0x3
	.4byte	distance
	.uleb128 0x23
	.4byte	.LASF240
	.byte	0x1
	.byte	0xf7
	.byte	0x6
	.4byte	.LFB220
	.4byte	.LFE220-.LFB220
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfb0
	.uleb128 0x24
	.4byte	.LASF226
	.byte	0x1
	.byte	0xf7
	.byte	0x29
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x25
	.4byte	.LASF241
	.byte	0x1
	.byte	0xe8
	.byte	0xd
	.4byte	.LFB219
	.4byte	.LFE219-.LFB219
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xff1
	.uleb128 0x24
	.4byte	.LASF227
	.byte	0x1
	.byte	0xe8
	.byte	0x24
	.4byte	0xff1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x26
	.ascii	"ts\000"
	.byte	0x1
	.byte	0xe8
	.byte	0x36
	.4byte	0xff7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x21
	.ascii	"i\000"
	.byte	0x1
	.byte	0xea
	.byte	0x7
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xd1e
	.uleb128 0xa
	.byte	0x4
	.4byte	0xd2a
	.uleb128 0x27
	.4byte	.LASF242
	.byte	0x1
	.byte	0x62
	.byte	0x5
	.4byte	0x4f
	.4byte	.LFB218
	.4byte	.LFE218-.LFB218
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10bf
	.uleb128 0x28
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x22
	.4byte	.LASF228
	.byte	0x1
	.byte	0x88
	.byte	0xc
	.4byte	0xd2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x29
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x104a
	.uleb128 0x21
	.ascii	"i\000"
	.byte	0x1
	.byte	0x95
	.byte	0xd
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x28
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x22
	.4byte	.LASF229
	.byte	0x1
	.byte	0xa6
	.byte	0xe
	.4byte	0xd2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x22
	.4byte	.LASF230
	.byte	0x1
	.byte	0xa6
	.byte	0x1a
	.4byte	0xd2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.4byte	.LASF231
	.byte	0x1
	.byte	0xa6
	.byte	0x26
	.4byte	0xd2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x22
	.4byte	.LASF232
	.byte	0x1
	.byte	0xa6
	.byte	0x32
	.4byte	0xd2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x22
	.4byte	.LASF233
	.byte	0x1
	.byte	0xa7
	.byte	0xd
	.4byte	0xd36
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x22
	.4byte	.LASF234
	.byte	0x1
	.byte	0xa7
	.byte	0x17
	.4byte	0xd36
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x22
	.4byte	.LASF235
	.byte	0x1
	.byte	0xa8
	.byte	0xd
	.4byte	0x10bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.byte	0x4
	.4byte	.LASF236
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x5a6
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x10c7
	.4byte	0x65b
	.ascii	"Reset_IRQn\000"
	.4byte	0x661
	.ascii	"NonMaskableInt_IRQn\000"
	.4byte	0x667
	.ascii	"HardFault_IRQn\000"
	.4byte	0x66d
	.ascii	"MemoryManagement_IRQn\000"
	.4byte	0x673
	.ascii	"BusFault_IRQn\000"
	.4byte	0x679
	.ascii	"UsageFault_IRQn\000"
	.4byte	0x67f
	.ascii	"SVCall_IRQn\000"
	.4byte	0x685
	.ascii	"DebugMonitor_IRQn\000"
	.4byte	0x68b
	.ascii	"PendSV_IRQn\000"
	.4byte	0x691
	.ascii	"SysTick_IRQn\000"
	.4byte	0x697
	.ascii	"POWER_CLOCK_IRQn\000"
	.4byte	0x69d
	.ascii	"RADIO_IRQn\000"
	.4byte	0x6a3
	.ascii	"UARTE0_UART0_IRQn\000"
	.4byte	0x6a9
	.ascii	"SPIM0_SPIS0_TWIM0_TWIS0_SPI0_TWI0_IRQn\000"
	.4byte	0x6af
	.ascii	"SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQn\000"
	.4byte	0x6b5
	.ascii	"NFCT_IRQn\000"
	.4byte	0x6bb
	.ascii	"GPIOTE_IRQn\000"
	.4byte	0x6c1
	.ascii	"SAADC_IRQn\000"
	.4byte	0x6c7
	.ascii	"TIMER0_IRQn\000"
	.4byte	0x6cd
	.ascii	"TIMER1_IRQn\000"
	.4byte	0x6d3
	.ascii	"TIMER2_IRQn\000"
	.4byte	0x6d9
	.ascii	"RTC0_IRQn\000"
	.4byte	0x6df
	.ascii	"TEMP_IRQn\000"
	.4byte	0x6e5
	.ascii	"RNG_IRQn\000"
	.4byte	0x6eb
	.ascii	"ECB_IRQn\000"
	.4byte	0x6f1
	.ascii	"CCM_AAR_IRQn\000"
	.4byte	0x6f7
	.ascii	"WDT_IRQn\000"
	.4byte	0x6fd
	.ascii	"RTC1_IRQn\000"
	.4byte	0x703
	.ascii	"QDEC_IRQn\000"
	.4byte	0x709
	.ascii	"COMP_LPCOMP_IRQn\000"
	.4byte	0x70f
	.ascii	"SWI0_EGU0_IRQn\000"
	.4byte	0x715
	.ascii	"SWI1_EGU1_IRQn\000"
	.4byte	0x71b
	.ascii	"SWI2_EGU2_IRQn\000"
	.4byte	0x721
	.ascii	"SWI3_EGU3_IRQn\000"
	.4byte	0x727
	.ascii	"SWI4_EGU4_IRQn\000"
	.4byte	0x72d
	.ascii	"SWI5_EGU5_IRQn\000"
	.4byte	0x733
	.ascii	"TIMER3_IRQn\000"
	.4byte	0x739
	.ascii	"TIMER4_IRQn\000"
	.4byte	0x73f
	.ascii	"PWM0_IRQn\000"
	.4byte	0x745
	.ascii	"PDM_IRQn\000"
	.4byte	0x74b
	.ascii	"MWU_IRQn\000"
	.4byte	0x751
	.ascii	"PWM1_IRQn\000"
	.4byte	0x757
	.ascii	"PWM2_IRQn\000"
	.4byte	0x75d
	.ascii	"SPIM2_SPIS2_SPI2_IRQn\000"
	.4byte	0x763
	.ascii	"RTC2_IRQn\000"
	.4byte	0x769
	.ascii	"I2S_IRQn\000"
	.4byte	0x76f
	.ascii	"FPU_IRQn\000"
	.4byte	0xd50
	.ascii	"NRF_SPI_FREQ_125K\000"
	.4byte	0xd59
	.ascii	"NRF_SPI_FREQ_250K\000"
	.4byte	0xd62
	.ascii	"NRF_SPI_FREQ_500K\000"
	.4byte	0xd6b
	.ascii	"NRF_SPI_FREQ_1M\000"
	.4byte	0xd74
	.ascii	"NRF_SPI_FREQ_2M\000"
	.4byte	0xd7d
	.ascii	"NRF_SPI_FREQ_4M\000"
	.4byte	0xd86
	.ascii	"NRF_SPI_FREQ_8M\000"
	.4byte	0xd9f
	.ascii	"NRF_SPI_MODE_0\000"
	.4byte	0xda5
	.ascii	"NRF_SPI_MODE_1\000"
	.4byte	0xdab
	.ascii	"NRF_SPI_MODE_2\000"
	.4byte	0xdb1
	.ascii	"NRF_SPI_MODE_3\000"
	.4byte	0xdc6
	.ascii	"NRF_SPI_BIT_ORDER_MSB_FIRST\000"
	.4byte	0xdcc
	.ascii	"NRF_SPI_BIT_ORDER_LSB_FIRST\000"
	.4byte	0xe8b
	.ascii	"spi\000"
	.4byte	0xe9d
	.ascii	"spi_xfer_done\000"
	.4byte	0xebf
	.ascii	"tx_poll_msg\000"
	.4byte	0xee1
	.ascii	"rx_resp_msg\000"
	.4byte	0xef3
	.ascii	"frame_seq_nb\000"
	.4byte	0xf05
	.ascii	"rx_buffer\000"
	.4byte	0xf17
	.ascii	"status_reg\000"
	.4byte	0xf29
	.ascii	"tof\000"
	.4byte	0xf42
	.ascii	"tag_addr_32\000"
	.4byte	0xf54
	.ascii	"tx_count\000"
	.4byte	0xf66
	.ascii	"rx_count\000"
	.4byte	0xf78
	.ascii	"distance\000"
	.4byte	0xe9d
	.ascii	"spi_xfer_done\000"
	.4byte	0xf05
	.ascii	"rx_buffer\000"
	.4byte	0xf29
	.ascii	"tof\000"
	.4byte	0xf42
	.ascii	"tag_addr_32\000"
	.4byte	0xf78
	.ascii	"distance\000"
	.4byte	0xf8a
	.ascii	"ss_initiator_task_function\000"
	.4byte	0xfb0
	.ascii	"resp_msg_get_ts\000"
	.4byte	0xffd
	.ascii	"ss_init_run\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x2a4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x10c7
	.4byte	0x4f
	.ascii	"int\000"
	.4byte	0x5b
	.ascii	"long int\000"
	.4byte	0x27
	.ascii	"__mbstate_s\000"
	.4byte	0x81
	.ascii	"char\000"
	.4byte	0x8d
	.ascii	"unsigned int\000"
	.4byte	0x26e
	.ascii	"__RAL_locale_data_t\000"
	.4byte	0x27f
	.ascii	"unsigned char\000"
	.4byte	0x367
	.ascii	"__RAL_locale_codeset_t\000"
	.4byte	0x3b5
	.ascii	"__RAL_locale_t\000"
	.4byte	0x3c6
	.ascii	"__locale_s\000"
	.4byte	0x539
	.ascii	"short unsigned int\000"
	.4byte	0x540
	.ascii	"__RAL_error_decoder_fn_t\000"
	.4byte	0x562
	.ascii	"__RAL_error_decoder_s\000"
	.4byte	0x593
	.ascii	"__RAL_error_decoder_t\000"
	.4byte	0x5b3
	.ascii	"FILE\000"
	.4byte	0x5f2
	.ascii	"signed char\000"
	.4byte	0x5f9
	.ascii	"uint8_t\000"
	.4byte	0x605
	.ascii	"short int\000"
	.4byte	0x60c
	.ascii	"uint16_t\000"
	.4byte	0x618
	.ascii	"int32_t\000"
	.4byte	0x629
	.ascii	"uint32_t\000"
	.4byte	0x63f
	.ascii	"long long int\000"
	.4byte	0x646
	.ascii	"long long unsigned int\000"
	.4byte	0x776
	.ascii	"IRQn_Type\000"
	.4byte	0x805
	.ascii	"SPIM_PSEL_Type\000"
	.4byte	0x84f
	.ascii	"SPIM_RXD_Type\000"
	.4byte	0x89e
	.ascii	"SPIM_TXD_Type\000"
	.4byte	0x8e0
	.ascii	"SPI_PSEL_Type\000"
	.4byte	0xbb6
	.ascii	"NRF_SPIM_Type\000"
	.4byte	0xcf2
	.ascii	"NRF_SPI_Type\000"
	.4byte	0xd17
	.ascii	"long unsigned int\000"
	.4byte	0xd1e
	.ascii	"uint8\000"
	.4byte	0xd2a
	.ascii	"uint32\000"
	.4byte	0xd36
	.ascii	"int32\000"
	.4byte	0xe11
	.ascii	"_Bool\000"
	.4byte	0xe1d
	.ascii	"nrf_drv_spi_t\000"
	.4byte	0xe71
	.ascii	"nrf_log_module_dynamic_data_t\000"
	.4byte	0xf3b
	.ascii	"double\000"
	.4byte	0x10bf
	.ascii	"float\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB218
	.4byte	.LFE218-.LFB218
	.4byte	.LFB219
	.4byte	.LFE219-.LFB219
	.4byte	.LFB220
	.4byte	.LFE220-.LFB220
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB218
	.4byte	.LFE218
	.4byte	.LFB219
	.4byte	.LFE219
	.4byte	.LFB220
	.4byte	.LFE220
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF163:
	.ascii	"EVENTS_END\000"
.LASF154:
	.ascii	"TASKS_STOP\000"
.LASF169:
	.ascii	"SHORTS\000"
.LASF145:
	.ascii	"SPIM_PSEL_Type\000"
.LASF180:
	.ascii	"CONFIG\000"
.LASF220:
	.ascii	"status_reg\000"
.LASF66:
	.ascii	"__RAL_data_utf8_space\000"
.LASF36:
	.ascii	"date_time_format\000"
.LASF133:
	.ascii	"MWU_IRQn\000"
.LASF76:
	.ascii	"next\000"
.LASF57:
	.ascii	"__RAL_codeset_ascii\000"
.LASF73:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF93:
	.ascii	"Reset_IRQn\000"
.LASF122:
	.ascii	"COMP_LPCOMP_IRQn\000"
.LASF68:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF132:
	.ascii	"PDM_IRQn\000"
.LASF183:
	.ascii	"EVENTS_READY\000"
.LASF149:
	.ascii	"SPIM_RXD_Type\000"
.LASF92:
	.ascii	"long long unsigned int\000"
.LASF184:
	.ascii	"NRF_SPI_Type\000"
.LASF137:
	.ascii	"RTC2_IRQn\000"
.LASF121:
	.ascii	"QDEC_IRQn\000"
.LASF111:
	.ascii	"TIMER0_IRQn\000"
.LASF144:
	.ascii	"MISO\000"
.LASF53:
	.ascii	"__locale_s\000"
.LASF71:
	.ascii	"__user_get_time_of_day\000"
.LASF7:
	.ascii	"grouping\000"
.LASF127:
	.ascii	"SWI4_EGU4_IRQn\000"
.LASF141:
	.ascii	"ITM_RxBuffer\000"
.LASF238:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\ss_init_main.c\000"
.LASF34:
	.ascii	"date_format\000"
.LASF107:
	.ascii	"SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQn\000"
.LASF215:
	.ascii	"spi_xfer_done\000"
.LASF32:
	.ascii	"abbrev_month_names\000"
.LASF91:
	.ascii	"long long int\000"
.LASF85:
	.ascii	"signed char\000"
.LASF55:
	.ascii	"__RAL_global_locale\000"
.LASF209:
	.ascii	"module_id\000"
.LASF50:
	.ascii	"codeset\000"
.LASF204:
	.ascii	"p_registers\000"
.LASF42:
	.ascii	"__towupper\000"
.LASF171:
	.ascii	"INTENSET\000"
.LASF177:
	.ascii	"RESERVED11\000"
.LASF179:
	.ascii	"RESERVED12\000"
.LASF228:
	.ascii	"frame_len\000"
.LASF130:
	.ascii	"TIMER4_IRQn\000"
.LASF2:
	.ascii	"long int\000"
.LASF174:
	.ascii	"ENABLE\000"
.LASF146:
	.ascii	"MAXCNT\000"
.LASF65:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF134:
	.ascii	"PWM1_IRQn\000"
.LASF8:
	.ascii	"int_curr_symbol\000"
.LASF188:
	.ascii	"uint8\000"
.LASF124:
	.ascii	"SWI1_EGU1_IRQn\000"
.LASF104:
	.ascii	"RADIO_IRQn\000"
.LASF123:
	.ascii	"SWI0_EGU0_IRQn\000"
.LASF88:
	.ascii	"uint16_t\000"
.LASF221:
	.ascii	"double\000"
.LASF190:
	.ascii	"int32\000"
.LASF13:
	.ascii	"positive_sign\000"
.LASF23:
	.ascii	"int_p_cs_precedes\000"
.LASF30:
	.ascii	"abbrev_day_names\000"
.LASF1:
	.ascii	"__wchar\000"
.LASF197:
	.ascii	"NRF_SPI_FREQ_8M\000"
.LASF189:
	.ascii	"uint32\000"
.LASF95:
	.ascii	"HardFault_IRQn\000"
.LASF114:
	.ascii	"RTC0_IRQn\000"
.LASF229:
	.ascii	"poll_tx_ts\000"
.LASF6:
	.ascii	"thousands_sep\000"
.LASF33:
	.ascii	"am_pm_indicator\000"
.LASF159:
	.ascii	"EVENTS_STOPPED\000"
.LASF12:
	.ascii	"mon_grouping\000"
.LASF126:
	.ascii	"SWI3_EGU3_IRQn\000"
.LASF22:
	.ascii	"n_sign_posn\000"
.LASF222:
	.ascii	"tag_addr_32\000"
.LASF226:
	.ascii	"pvParameter\000"
.LASF82:
	.ascii	"stdin\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF25:
	.ascii	"int_p_sep_by_space\000"
.LASF10:
	.ascii	"mon_decimal_point\000"
.LASF135:
	.ascii	"PWM2_IRQn\000"
.LASF194:
	.ascii	"NRF_SPI_FREQ_1M\000"
.LASF64:
	.ascii	"__RAL_data_utf8_period\000"
.LASF96:
	.ascii	"MemoryManagement_IRQn\000"
.LASF192:
	.ascii	"NRF_SPI_FREQ_250K\000"
.LASF61:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
.LASF187:
	.ascii	"long unsigned int\000"
.LASF43:
	.ascii	"__towlower\000"
.LASF157:
	.ascii	"TASKS_RESUME\000"
.LASF80:
	.ascii	"timeval\000"
.LASF205:
	.ascii	"drv_inst_idx\000"
.LASF186:
	.ascii	"__StackLimit\000"
.LASF39:
	.ascii	"__toupper\000"
.LASF20:
	.ascii	"n_sep_by_space\000"
.LASF49:
	.ascii	"data\000"
.LASF14:
	.ascii	"negative_sign\000"
.LASF99:
	.ascii	"SVCall_IRQn\000"
.LASF72:
	.ascii	"short unsigned int\000"
.LASF48:
	.ascii	"name\000"
.LASF156:
	.ascii	"TASKS_SUSPEND\000"
.LASF125:
	.ascii	"SWI2_EGU2_IRQn\000"
.LASF223:
	.ascii	"tx_count\000"
.LASF117:
	.ascii	"ECB_IRQn\000"
.LASF29:
	.ascii	"day_names\000"
.LASF87:
	.ascii	"short int\000"
.LASF24:
	.ascii	"int_n_cs_precedes\000"
.LASF234:
	.ascii	"rtd_resp\000"
.LASF83:
	.ascii	"stdout\000"
.LASF115:
	.ascii	"TEMP_IRQn\000"
.LASF102:
	.ascii	"SysTick_IRQn\000"
.LASF98:
	.ascii	"UsageFault_IRQn\000"
.LASF195:
	.ascii	"NRF_SPI_FREQ_2M\000"
.LASF239:
	.ascii	"C:\\Users\\Keld\\Documents\\GitHub\\pro5_unitek\\co"
	.ascii	"de\\ss_twr_init\\SES\000"
.LASF109:
	.ascii	"GPIOTE_IRQn\000"
.LASF51:
	.ascii	"__RAL_locale_t\000"
.LASF150:
	.ascii	"SPIM_TXD_Type\000"
.LASF35:
	.ascii	"time_format\000"
.LASF143:
	.ascii	"MOSI\000"
.LASF208:
	.ascii	"nrf_drv_spi_t\000"
.LASF21:
	.ascii	"p_sign_posn\000"
.LASF17:
	.ascii	"p_cs_precedes\000"
.LASF69:
	.ascii	"__RAL_data_empty_string\000"
.LASF59:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF233:
	.ascii	"rtd_init\000"
.LASF9:
	.ascii	"currency_symbol\000"
.LASF198:
	.ascii	"NRF_SPI_MODE_0\000"
.LASF199:
	.ascii	"NRF_SPI_MODE_1\000"
.LASF200:
	.ascii	"NRF_SPI_MODE_2\000"
.LASF201:
	.ascii	"NRF_SPI_MODE_3\000"
.LASF213:
	.ascii	"nrf_log_module_dynamic_data_t\000"
.LASF112:
	.ascii	"TIMER1_IRQn\000"
.LASF75:
	.ascii	"decode\000"
.LASF167:
	.ascii	"EVENTS_STARTED\000"
.LASF45:
	.ascii	"__mbtowc\000"
.LASF216:
	.ascii	"tx_poll_msg\000"
.LASF203:
	.ascii	"NRF_SPI_BIT_ORDER_LSB_FIRST\000"
.LASF212:
	.ascii	"filter_lvls\000"
.LASF19:
	.ascii	"n_cs_precedes\000"
.LASF227:
	.ascii	"ts_field\000"
.LASF40:
	.ascii	"__tolower\000"
.LASF217:
	.ascii	"rx_resp_msg\000"
.LASF70:
	.ascii	"__user_set_time_of_day\000"
.LASF110:
	.ascii	"SAADC_IRQn\000"
.LASF142:
	.ascii	"SystemCoreClock\000"
.LASF230:
	.ascii	"resp_rx_ts\000"
.LASF108:
	.ascii	"NFCT_IRQn\000"
.LASF224:
	.ascii	"rx_count\000"
.LASF153:
	.ascii	"TASKS_START\000"
.LASF152:
	.ascii	"RESERVED0\000"
.LASF155:
	.ascii	"RESERVED1\000"
.LASF158:
	.ascii	"RESERVED2\000"
.LASF160:
	.ascii	"RESERVED3\000"
.LASF162:
	.ascii	"RESERVED4\000"
.LASF164:
	.ascii	"RESERVED5\000"
.LASF166:
	.ascii	"RESERVED6\000"
.LASF168:
	.ascii	"RESERVED7\000"
.LASF170:
	.ascii	"RESERVED8\000"
.LASF173:
	.ascii	"RESERVED9\000"
.LASF185:
	.ascii	"__StackTop\000"
.LASF207:
	.ascii	"_Bool\000"
.LASF89:
	.ascii	"int32_t\000"
.LASF113:
	.ascii	"TIMER2_IRQn\000"
.LASF103:
	.ascii	"POWER_CLOCK_IRQn\000"
.LASF60:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF191:
	.ascii	"NRF_SPI_FREQ_125K\000"
.LASF41:
	.ascii	"__iswctype\000"
.LASF16:
	.ascii	"frac_digits\000"
.LASF116:
	.ascii	"RNG_IRQn\000"
.LASF232:
	.ascii	"resp_tx_ts\000"
.LASF240:
	.ascii	"ss_initiator_task_function\000"
.LASF74:
	.ascii	"__RAL_error_decoder_s\000"
.LASF78:
	.ascii	"__RAL_error_decoder_head\000"
.LASF242:
	.ascii	"ss_init_run\000"
.LASF202:
	.ascii	"NRF_SPI_BIT_ORDER_MSB_FIRST\000"
.LASF79:
	.ascii	"FILE\000"
.LASF11:
	.ascii	"mon_thousands_sep\000"
.LASF219:
	.ascii	"rx_buffer\000"
.LASF46:
	.ascii	"__RAL_locale_data_t\000"
.LASF178:
	.ascii	"FREQUENCY\000"
.LASF196:
	.ascii	"NRF_SPI_FREQ_4M\000"
.LASF101:
	.ascii	"PendSV_IRQn\000"
.LASF138:
	.ascii	"I2S_IRQn\000"
.LASF27:
	.ascii	"int_p_sign_posn\000"
.LASF236:
	.ascii	"float\000"
.LASF3:
	.ascii	"char\000"
.LASF136:
	.ascii	"SPIM2_SPIS2_SPI2_IRQn\000"
.LASF206:
	.ascii	"use_easy_dma\000"
.LASF97:
	.ascii	"BusFault_IRQn\000"
.LASF105:
	.ascii	"UARTE0_UART0_IRQn\000"
.LASF18:
	.ascii	"p_sep_by_space\000"
.LASF225:
	.ascii	"distance\000"
.LASF140:
	.ascii	"IRQn_Type\000"
.LASF214:
	.ascii	"m_nrf_log_app_logs_data_dynamic\000"
.LASF94:
	.ascii	"NonMaskableInt_IRQn\000"
.LASF56:
	.ascii	"__RAL_c_locale\000"
.LASF119:
	.ascii	"WDT_IRQn\000"
.LASF129:
	.ascii	"TIMER3_IRQn\000"
.LASF235:
	.ascii	"clockOffsetRatio\000"
.LASF151:
	.ascii	"SPI_PSEL_Type\000"
.LASF210:
	.ascii	"order_idx\000"
.LASF147:
	.ascii	"AMOUNT\000"
.LASF47:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF37:
	.ascii	"unsigned char\000"
.LASF231:
	.ascii	"poll_rx_ts\000"
.LASF100:
	.ascii	"DebugMonitor_IRQn\000"
.LASF54:
	.ascii	"__category\000"
.LASF211:
	.ascii	"filter\000"
.LASF175:
	.ascii	"RESERVED10\000"
.LASF90:
	.ascii	"uint32_t\000"
.LASF84:
	.ascii	"stderr\000"
.LASF181:
	.ascii	"RESERVED13\000"
.LASF62:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF38:
	.ascii	"__isctype\000"
.LASF28:
	.ascii	"int_n_sign_posn\000"
.LASF106:
	.ascii	"SPIM0_SPIS0_TWIM0_TWIS0_SPI0_TWI0_IRQn\000"
.LASF176:
	.ascii	"PSEL\000"
.LASF241:
	.ascii	"resp_msg_get_ts\000"
.LASF77:
	.ascii	"__RAL_error_decoder_t\000"
.LASF52:
	.ascii	"__mbstate_s\000"
.LASF86:
	.ascii	"uint8_t\000"
.LASF165:
	.ascii	"EVENTS_ENDTX\000"
.LASF118:
	.ascii	"CCM_AAR_IRQn\000"
.LASF58:
	.ascii	"__RAL_codeset_utf8\000"
.LASF15:
	.ascii	"int_frac_digits\000"
.LASF161:
	.ascii	"EVENTS_ENDRX\000"
.LASF193:
	.ascii	"NRF_SPI_FREQ_500K\000"
.LASF31:
	.ascii	"month_names\000"
.LASF131:
	.ascii	"PWM0_IRQn\000"
.LASF139:
	.ascii	"FPU_IRQn\000"
.LASF26:
	.ascii	"int_n_sep_by_space\000"
.LASF182:
	.ascii	"NRF_SPIM_Type\000"
.LASF237:
	.ascii	"GNU C99 9.3.1 20200408 (release) -fmessage-length=0"
	.ascii	" -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -"
	.ascii	"mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-acce"
	.ascii	"ss -std=gnu99 -g2 -gpubnames -fomit-frame-pointer -"
	.ascii	"fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections"
	.ascii	" -fdata-sections -fshort-enums -fno-common\000"
.LASF81:
	.ascii	"__RAL_FILE\000"
.LASF67:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF0:
	.ascii	"__state\000"
.LASF218:
	.ascii	"frame_seq_nb\000"
.LASF63:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF120:
	.ascii	"RTC1_IRQn\000"
.LASF44:
	.ascii	"__wctomb\000"
.LASF172:
	.ascii	"INTENCLR\000"
.LASF5:
	.ascii	"decimal_point\000"
.LASF128:
	.ascii	"SWI5_EGU5_IRQn\000"
.LASF148:
	.ascii	"LIST\000"
	.ident	"GCC: (GNU) 9.3.1 20200408 (release)"
