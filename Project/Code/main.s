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
	.file	"main.c"
	.text
	.align	2
	.global	initializeStart
	.type	initializeStart, %function
initializeStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r3, #1040
	mov	r2, #67108864
	add	r3, r3, #4
	ldr	r5, .L2
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, .L2+4
	ldr	r3, .L2+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L2+12
	mov	r0, r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L2+16
	mov	lr, pc
	bx	r3
	mov	r0, r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L2+20
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	splashBitmap
	.word	splashPal
	.word	loadPalette
	.word	drawBackgroundImage4
	.word	flipPage
	.word	state
	.size	initializeStart, .-initializeStart
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L4
	ldr	r3, .L8+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L7
.L4:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L7:
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	b	.L4
.L9:
	.align	2
.L8:
	.word	oldButtons
	.word	buttons
	.word	initializeGame
	.size	start, .-start
	.align	2
	.global	initializePause
	.type	initializePause, %function
initializePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1040
	add	r3, r3, #4
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L11
	mov	r2, #4
	str	r2, [r3, #0]
	bx	lr
.L12:
	.align	2
.L11:
	.word	state
	.size	initializePause, .-initializePause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L16
	ldr	r4, .L16+4
	ldr	r5, .L16+8
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r0, .L16
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+12
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L16+16
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L15
.L13:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L15:
	mov	r0, r4
	ldr	r6, .L16+20
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	lr, pc
	bx	r6
	mov	r2, #4864	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, .L16+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+28
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L13
.L17:
	.align	2
.L16:
	.word	pauseBitmap
	.word	drawBackgroundImage4
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	fillScreen4
	.word	initGraphics
	.word	state
	.size	pause, .-pause
	.align	2
	.global	initializeWin
	.type	initializeWin, %function
initializeWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1040
	add	r3, r3, #4
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L19
	mov	r2, #3
	str	r2, [r3, #0]
	bx	lr
.L20:
	.align	2
.L19:
	.word	state
	.size	initializeWin, .-initializeWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L24
	ldr	r4, .L24+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L24+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L24
	mov	lr, pc
	bx	r4
	ldr	r3, .L24+12
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L21
	ldr	r3, .L24+16
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L23
.L21:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L23:
	ldr	r3, .L24+20
	mov	lr, pc
	bx	r3
	b	.L21
.L25:
	.align	2
.L24:
	.word	winBitmap
	.word	drawBackgroundImage4
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	initializeGame
	.size	win, .-win
	.align	2
	.global	initializeLose
	.type	initializeLose, %function
initializeLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1040
	add	r3, r3, #4
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L27
	mov	r2, #2
	str	r2, [r3, #0]
	bx	lr
.L28:
	.align	2
.L27:
	.word	state
	.size	initializeLose, .-initializeLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L32
	ldr	r4, .L32+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L32+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L32
	mov	lr, pc
	bx	r4
	ldr	r3, .L32+12
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L29
	ldr	r3, .L32+16
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L31
.L29:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L31:
	ldr	r3, .L32+20
	mov	lr, pc
	bx	r3
	b	.L29
.L33:
	.align	2
.L32:
	.word	loseBitmap
	.word	drawBackgroundImage4
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	initializeGame
	.size	lose, .-lose
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bl	initializeStart
	ldr	r4, .L46
	ldr	r7, .L46+4
	ldr	r6, .L46+8
	ldr	r8, .L46+12
	mov	r5, #67108864
.L45:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L36:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L36
.L42:
	.word	.L37
	.word	.L38
	.word	.L39
	.word	.L40
	.word	.L41
.L41:
	bl	pause
	b	.L45
.L40:
	bl	win
	b	.L45
.L39:
	bl	lose
	b	.L45
.L38:
	mov	lr, pc
	bx	r8
	b	.L45
.L37:
	bl	start
	b	.L45
.L47:
	.align	2
.L46:
	.word	buttons
	.word	state
	.word	oldButtons
	.word	game
	.size	main, .-main
	.ident	"GCC: (devkitARM release 31) 4.5.0"
