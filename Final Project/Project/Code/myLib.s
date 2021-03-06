	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #0]
	mov	r0, r0, asl #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	cmp	r3, #0
	ldrh	ip, [sp, #8]
	blt	.L4
	ldr	r4, .L12
	rsb	r0, r0, r0, asl #4
	ldr	r4, [r4, #0]
	add	r1, r1, r0, asl #4
	add	r5, r4, r1, asl #1
	mov	r4, #0
.L6:
	cmp	r2, #0
	movge	r0, r5
	movge	r1, #0
	blt	.L8
.L7:
	add	r1, r1, #1
	cmp	r2, r1
	strh	ip, [r0], #2	@ movhi
	bge	.L7
.L8:
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #480
	bge	.L6
.L4:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	add	r3, r1, r0, asl #4
	ldr	r0, .L17
	add	r3, r3, r3, lsr #31
	ldr	ip, [r0, #0]
	bic	r3, r3, #1
	tst	r1, #1
	ldrh	r1, [ip, r3]
	andne	r1, r1, #255
	biceq	r1, r1, #255
	orrne	r2, r1, r2, asl #8
	orreq	r2, r1, r2
	strneh	r2, [ip, r3]	@ movhi
	streqh	r2, [ip, r3]	@ movhi
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L20
	sub	sp, sp, #8
	add	r3, sp, #8
	ldr	r2, [r1, #4]
	orr	r0, r0, r0, asl #8
	strh	r0, [r3, #-2]!	@ movhi
	ldr	ip, [r1, #0]
	mov	r1, #-2130706432
	add	r0, r2, #36
	add	r1, r1, #19200
	str	r3, [r2, #36]
	str	ip, [r0, #4]
	str	r1, [r0, #8]
	add	sp, sp, #8
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawBackgroundImage4
	.type	drawBackgroundImage4, %function
drawBackgroundImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L23
	ldr	r1, [r3, #4]
	ldr	ip, [r3, #0]
	mov	r3, #-2147483648
	add	r2, r1, #36
	add	r3, r3, #19200
	str	r0, [r1, #36]
	str	ip, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.size	drawBackgroundImage4, .-drawBackgroundImage4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #28
	ldrb	r4, [sp, #64]	@ zero_extendqisi2
	subs	fp, r2, #0
	orr	r2, r4, r4, asl #8
	str	r1, [sp, #0]
	strh	r2, [sp, #22]	@ movhi
	ble	.L25
	sub	r2, r3, #1
	add	r2, r2, r2, lsr #31
	mov	r6, r0
	mov	r1, r2, asr #1
	ldr	r2, [sp, #0]
	add	r0, r3, r3, lsr #31
	rsb	r5, r6, r6, asl #4
	add	r5, r2, r5, asl #4
	mov	r0, r0, asr #1
	sub	r2, r2, #1
	ldr	ip, [sp, #0]
	orr	r0, r0, #-2130706432
	orr	r1, r1, #-2130706432
	add	r2, r2, r3
	ldr	r8, .L37
	and	sl, ip, #1
	str	r0, [sp, #4]
	str	r1, [sp, #12]
	add	r5, r5, #1
	mov	r7, #0
	and	r9, r3, #1
	str	r2, [sp, #8]
	b	.L31
.L35:
	cmp	r9, #0
	bne	.L34
	mov	r0, r6
	ldr	r1, [sp, #0]
	mov	r2, r4
	bl	setPixel4
	mov	r0, r6
	ldr	r1, [sp, #8]
	mov	r2, r4
	bl	setPixel4
	ldr	r0, [r8, #0]
	add	r1, r5, r5, lsr #31
	ldr	r2, [r8, #4]
	bic	r1, r1, #1
	add	r1, r0, r1
	ldr	r0, [sp, #12]
	add	r3, r2, #36
	add	ip, sp, #22
	str	ip, [r2, #36]
	str	r1, [r3, #4]
	str	r0, [r3, #8]
.L32:
	add	r7, r7, #1
	cmp	fp, r7
	add	r6, r6, #1
	add	r5, r5, #240
	ble	.L25
.L31:
	cmp	sl, #0
	bne	.L35
	cmp	r9, #0
	bne	.L36
	sub	r1, r5, #1
	ldr	r0, [r8, #0]
	add	r1, r1, r1, lsr #31
	ldr	r2, [r8, #4]
	bic	r1, r1, #1
	add	r1, r0, r1
	add	r7, r7, #1
	ldr	r0, [sp, #4]
	add	r3, r2, #36
	add	ip, sp, #22
	cmp	fp, r7
	str	ip, [r2, #36]
	add	r6, r6, #1
	str	r1, [r3, #4]
	add	r5, r5, #240
	str	r0, [r3, #8]
	bgt	.L31
.L25:
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L34:
	mov	r0, r6
	ldr	r1, [sp, #0]
	mov	r2, r4
	bl	setPixel4
	ldr	r0, [r8, #0]
	add	r1, r5, r5, lsr #31
	ldr	r2, [r8, #4]
	bic	r1, r1, #1
	add	r1, r0, r1
	add	r0, sp, #22
	add	r3, r2, #36
	str	r0, [r2, #36]
	ldr	r2, [sp, #4]
	str	r1, [r3, #4]
	str	r2, [r3, #8]
	b	.L32
.L36:
	mov	r0, r6
	ldr	r1, [sp, #8]
	mov	r2, r4
	bl	setPixel4
	b	.L32
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	cmp	r3, #0
	ldr	r7, [sp, #24]
	ble	.L39
	ldr	r5, .L43
	add	r8, r7, r7, lsr #31
	ldr	r4, [r5, #4]
	rsb	r1, r1, r1, asl #4
	mov	r8, r8, asr #1
	mov	ip, #0
	ldr	sl, [r5, #0]
	add	r2, r2, r1, asl #4
	add	r4, r4, #36
	orr	r8, r8, #-2147483648
	mov	r1, ip
.L41:
	add	r6, ip, ip, lsr #31
	add	r5, r2, r2, lsr #31
	bic	r6, r6, #1
	bic	r5, r5, #1
	add	r1, r1, #1
	add	r6, r0, r6
	add	r5, sl, r5
	cmp	r1, r3
	str	r6, [r4, #0]
	add	ip, ip, r7
	str	r5, [r4, #4]
	add	r2, r2, #240
	str	r8, [r4, #8]
	bne	.L41
.L39:
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #0]
	tst	r2, #16
	ldrne	r1, .L48
	ldreq	r1, .L48
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r2, r2, #16
	orreq	r2, r2, #16
	strneh	r2, [r3, #0]	@ movhi
	streqh	r2, [r3, #0]	@ movhi
	strne	r0, [r1, #0]
	streq	r0, [r1, #0]
	bx	lr
.L49:
	.align	2
.L48:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L51
	str	r4, [sp, #-4]!
	ldr	ip, [ip, #4]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2147483648
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4}
	bx	lr
.L52:
	.align	2
.L51:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L54
	ldr	r1, [r3, #4]
	mov	r3, #-2147483648
	add	r2, r1, #36
	str	r0, [r1, #36]
	add	r3, r3, #256
	mov	r1, #83886080
	str	r1, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.size	loadPalette, .-loadPalette
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L57:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L57
	mov	r2, #67108864
.L59:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L59
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	loadMap
	.type	loadMap, %function
loadMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, fp}
	mov	ip, r1, asl #1
	add	ip, ip, #14
	mov	r4, sp
	mov	ip, ip, lsr #3
	sub	r4, r4, ip, asl #3
	add	fp, sp, #12
	cmp	r1, #0
	mov	sp, r4
	mov	r5, sp
	beq	.L63
	mov	r2, r2, asl #28
	mov	ip, #0
	mov	r6, r2, lsr #16
	mov	r2, ip
.L64:
	ldrh	r4, [r0, ip]
	add	r2, r2, #1
	mov	r4, r4, asl #20
	orr	r4, r6, r4, lsr #20
	cmp	r2, r1
	strh	r4, [r5, ip]	@ movhi
	add	ip, ip, #2
	blt	.L64
.L63:
	ldr	r2, .L66
	ldr	r0, [r2, #4]
	mov	r3, r3, asl #11
	add	r2, r0, #36
	add	r3, r3, #100663296
	orr	r1, r1, #-2147483648
	str	r5, [r0, #36]
	str	r3, [r2, #4]
	str	r1, [r2, #8]
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, r6, fp}
	bx	lr
.L67:
	.align	2
.L66:
	.word	.LANCHOR0
	.size	loadMap, .-loadMap
	.align	2
	.global	addItem
	.type	addItem, %function
addItem:
	@ Function supports interworking.
	@ args = 104, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	stmfd	sp!, {r4, r5, r6, lr}
	add	r4, sp, #20
	stmia	r4, {r1, r2, r3}
	mov	r5, r0
	ldr	r3, .L69
	mov	r0, #104
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+4
	mov	r1, r4
	mov	r2, #100
	mov	r6, r0
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #0]
	str	r6, [r5, #0]
	str	r3, [r6, #100]
	ldmfd	sp!, {r4, r5, r6, lr}
	add	sp, sp, #16
	bx	lr
.L70:
	.align	2
.L69:
	.word	malloc
	.word	memcpy
	.size	addItem, .-addItem
	.align	2
	.global	deleteNode
	.type	deleteNode, %function
deleteNode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, r1
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r4, r0
	bne	.L74
	b	.L80
.L79:
	cmp	r1, r3
	beq	.L78
	mov	r4, r3
.L74:
	ldr	r3, [r4, #100]
	cmp	r3, #0
	bne	.L79
.L71:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L78:
	ldr	r3, [r1, #100]
	mov	r0, r1
	str	r3, [r4, #100]
	ldr	r3, .L81
	mov	lr, pc
	bx	r3
	b	.L71
.L80:
	ldr	r5, [r0, #100]
	cmp	r5, #0
	beq	.L71
	mov	r1, r5
	mov	r2, #100
	ldr	r3, .L81+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #100]
	mov	r0, r5
	str	r3, [r4, #100]
	ldr	r3, .L81
	mov	lr, pc
	bx	r3
	b	.L71
.L82:
	.align	2
.L81:
	.word	free
	.word	memcpy
	.size	deleteNode, .-deleteNode
	.global	videoBuffer
	.global	frontBuffer
	.global	backBuffer
	.global	dma
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"
