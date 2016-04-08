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
	.file	"display.c"
	.text
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L5
	mov	r3, #0
.L2:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L2
	bx	lr
.L6:
	.align	2
.L5:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldrb	r4, [r0, #1]	@ zero_extendqisi2
	ldr	lr, [r0, #52]
	add	r3, r0, #60
	ldmda	r3, {r3, ip}
	orr	ip, ip, r3
	ldr	r3, .L9
	ldr	r2, [r0, #88]
	mov	r1, r1, asl #3
	orr	lr, r4, lr
	ldr	r7, [r0, #4]
	add	r5, r0, #80
	ldmia	r5, {r5, r6}	@ phole ldm
	strh	lr, [r3, r1]	@ movhi
	cmp	r2, #0
	ldrneh	r2, [r3, r1]
	mov	r7, r7, asl #15
	add	r5, r5, r6, asl #4
	add	r0, r3, r1
	orr	ip, ip, r7, lsr #23
	orrne	r2, r2, #512
	mov	r5, r5, asl #2
	strneh	r2, [r3, r1]	@ movhi
	strh	ip, [r0, #2]	@ movhi
	strh	r5, [r0, #4]	@ movhi
	ldr	r1, .L9
	mov	r0, #3
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L9+4
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	shadowOAM
	.word	DMANow
	.size	updateOAM, .-updateOAM
	.align	2
	.global	animatePlayer
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L22
	add	r2, r4, #72
	ldmia	r2, {r2, r3}	@ phole ldm
	ands	r3, r3, #3
	str	r2, [r4, #80]
	bne	.L12
	ldr	r1, [r4, #84]
	cmp	r1, #3
	str	r3, [r4, #76]
	beq	.L21
	cmp	r1, #9
	beq	.L14
.L15:
	add	r1, r1, #1
	str	r1, [r4, #84]
.L12:
	ldr	r3, .L22+4
	ldr	r2, [r3, #0]
	cmp	r2, #0
	beq	.L17
.L16:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	mov	r1, #0
	tst	r2, #32
	ldr	r2, .L22
	str	r1, [r4, #72]
	moveq	r1, #1
	streq	r1, [r2, #72]
	moveq	r1, #4096
	streq	r1, [r2, #60]
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #16
	moveq	r2, #1
	streq	r2, [r4, #72]
	moveq	r2, #0
	streq	r2, [r4, #60]
	ldr	r2, .L22+8
	ldr	r2, [r2, #0]
	tst	r2, #1
	beq	.L20
	ldr	r1, .L22+12
	ldr	r1, [r1, #0]
	ands	r1, r1, #1
	moveq	r0, #2
	streq	r0, [r4, #72]
	streq	r1, [r3, #0]
	streq	r1, [r4, #84]
.L20:
	tst	r2, #2
	beq	.L17
	ldr	r2, .L22+12
	ldr	r2, [r2, #0]
	ands	r2, r2, #2
	moveq	r1, #3
	streq	r1, [r4, #72]
	streq	r2, [r3, #0]
	streq	r2, [r4, #84]
.L17:
	ldr	r0, .L22
	mov	r1, #0
	bl	updateOAM
	ldr	r3, [r4, #76]
	add	r3, r3, #1
	str	r3, [r4, #76]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L21:
	cmp	r2, #3
	bne	.L15
.L14:
	mov	r2, #0
	ldr	r3, .L22+4
	str	r2, [r4, #84]
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L16
.L23:
	.align	2
.L22:
	.word	player
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	animateEnemies
	.type	animateEnemies, %function
animateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r3, .L28
	ldr	r4, [r3, #0]
	cmp	r4, #0
	beq	.L24
	mov	r5, #2
	mov	r7, #13
	mov	r6, #0
.L26:
	str	r7, [r4, #80]
	str	r6, [r4, #84]
	mov	r0, r4
	mov	r1, r5
	bl	updateOAM
	ldr	r4, [r4, #92]
	cmp	r4, #0
	add	r5, r5, #1
	bne	.L26
.L24:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	head
	.size	animateEnemies, .-animateEnemies
	.align	2
	.global	animateUI
	.type	animateUI, %function
animateUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L31
	stmfd	sp!, {r3, lr}
	mov	lr, #16384	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	lr, #49152
	strh	lr, [ip, #10]	@ movhi
	mov	lr, #18	@ movhi
	mov	r1, ip
	strh	lr, [ip, #12]	@ movhi
	mov	r0, #3
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L31+4
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	shadowOAM
	.word	DMANow
	.size	animateUI, .-animateUI
	.align	2
	.global	animate
	.type	animate, %function
animate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	animatePlayer
	bl	animateEnemies
	ldmfd	sp!, {r4, lr}
	b	animateUI
	.size	animate, .-animate
	.align	2
	.global	initGraphics
	.type	initGraphics, %function
initGraphics:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r1, #24064	@ movhi
	mov	r3, #67108864
	mov	r2, #21504
	strh	r1, [r3, #8]	@ movhi
	add	r2, r2, #4
	mov	r1, #4864	@ movhi
	mov	r5, #100663296
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r0, .L35
	ldr	r3, .L35+4
	ldr	r4, .L35+8
	mov	lr, pc
	bx	r3
	mov	r2, r5
	mov	r0, #3
	ldr	r1, .L35+12
	mov	r3, #160
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r0, #3
	ldr	r1, .L35+16
	mov	r3, #3072
	mov	lr, pc
	bx	r4
	mov	r3, #5760
	add	r2, r5, #16384
	mov	r0, #3
	ldr	r1, .L35+20
	add	r3, r3, #32
	mov	lr, pc
	bx	r4
	add	r2, r5, #40960
	mov	r0, #3
	ldr	r1, .L35+24
	mov	r3, #3072
	mov	lr, pc
	bx	r4
	add	r2, r5, #65536
	mov	r0, #3
	ldr	r1, .L35+28
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L35+32
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	tilemap_ground_v1Pal
	.word	loadPalette
	.word	DMANow
	.word	tilemap_ground_v1Tiles
	.word	tilemap_ground_v1Map
	.word	tilemap_mountainsv1Tiles
	.word	tilemap_mountainsv1Map
	.word	sprite_sheet_v1Tiles
	.word	sprite_sheet_v1Pal
	.size	initGraphics, .-initGraphics
	.global	aniIsFinish
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	aniIsFinish, %object
	.size	aniIsFinish, 4
aniIsFinish:
	.word	1
	.ident	"GCC: (devkitARM release 31) 4.5.0"
