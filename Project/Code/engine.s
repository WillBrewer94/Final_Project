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
	.file	"engine.c"
	.text
	.align	2
	.global	initializeGame
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, #0
	ldr	r4, .L2
	mov	lr, pc
	bx	r4
	ldr	r3, .L2+4
	mov	lr, pc
	bx	r3
	mov	r0, #0
	mov	lr, pc
	bx	r4
	ldr	r3, .L2+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+12
	mov	r2, #25600
	str	r2, [r3, #0]
	mov	r2, #30720
	str	r2, [r3, #4]
	mov	r2, #32768
	str	r2, [r3, #56]
	mov	r2, #16384
	str	r2, [r3, #52]
	mov	r2, #80
	str	r2, [r3, #32]
	mov	r2, #100
	str	r2, [r3, #36]
	mov	r2, #50
	str	r2, [r3, #48]
	mov	r2, #2048
	mov	r4, #0
	str	r2, [r3, #40]
	mov	r2, #1280
	str	r2, [r3, #44]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r4, [r3, #88]
	ldr	r3, .L2+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+20
	mov	r0, r4
	str	r4, [r3, #0]
	str	r4, [r3, #4]
	ldr	r3, .L2+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+32
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	fillScreen4
	.word	flipPage
	.word	initGraphics
	.word	player
	.word	hideSprites
	.word	.LANCHOR0
	.word	time
	.word	srand
	.word	state
	.size	initializeGame, .-initializeGame
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L5
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	animate
	.size	draw, .-draw
	.align	2
	.global	playerInput
	.type	playerInput, %function
playerInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L36
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L8
	ldr	r1, .L36+4
	ldr	r2, [r3, #12]
	ldr	r1, [r1, #0]
	cmp	r2, r1
	addlt	r2, r2, #1
	movge	r2, #0
	strlt	r2, [r3, #12]
	strge	r2, [r3, #8]
.L7:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L8:
	ldr	r0, .L36+8
	ldr	r1, [r0, #0]
	tst	r1, #1
	str	r2, [r3, #12]
	bne	.L27
.L31:
	ldr	r2, .L36+12
.L11:
	mov	ip, #67108864
	ldr	r1, [ip, #304]
	mvn	r1, r1
	ands	r1, r1, #32
	beq	.L12
	ldr	ip, [r2, #4]
	ldr	r1, [r3, #20]
	ldr	r4, [r2, #28]
	sub	ip, ip, #512
	sub	r1, r1, #1
	str	ip, [r2, #4]
	cmp	r4, #0
	mov	ip, #4096
	str	ip, [r2, #60]
	str	r1, [r3, #20]
	ldrgt	r1, .L36+12
	movgt	ip, #0
	strgt	ip, [r1, #28]
.L13:
	ldr	r1, [r0, #0]
	tst	r1, #2
	beq	.L14
	ldr	ip, .L36+16
	ldr	ip, [ip, #0]
	tst	ip, #2
	beq	.L34
.L14:
	mov	ip, #67108864
	ldr	ip, [ip, #304]
	tst	ip, #32
	bne	.L17
	tst	r1, #512
	bne	.L35
.L17:
	mov	r1, #67108864
	ldr	r1, [r1, #304]
	tst	r1, #16
	beq	.L19
	ldr	ip, [r2, #28]
	ldr	r1, [r0, #0]
.L20:
	cmp	ip, #0
	ble	.L18
.L23:
	tst	r1, #256
	beq	.L7
	ldr	r1, .L36+16
	ldr	r1, [r1, #0]
	tst	r1, #256
	bne	.L7
	ldr	r3, [r3, #16]
	cmp	r3, #0
	movgt	r3, #3840
	strgt	r3, [r2, #24]
	b	.L7
.L27:
	ldr	r2, .L36+16
	ldr	r2, [r2, #0]
	tst	r2, #1
	bne	.L31
	ldr	r1, [r3, #16]
	cmp	r1, #1
	bgt	.L31
	ldr	r2, .L36+12
	ldr	ip, [r2, #44]
	add	r1, r1, #1
	rsb	ip, ip, #0
	str	ip, [r2, #24]
	str	r1, [r3, #16]
	b	.L11
.L12:
	ldr	ip, [ip, #304]
	tst	ip, #16
	bne	.L13
	ldr	ip, [r3, #20]
	ldr	r5, [r2, #28]
	add	ip, ip, #1
	ldr	r4, [r2, #4]
	cmp	r5, #0
	str	ip, [r3, #20]
	ldrlt	ip, .L36+12
	add	r4, r4, #512
	str	r4, [r2, #4]
	str	r1, [r2, #60]
	strlt	r1, [ip, #28]
	b	.L13
.L19:
	ldr	r1, [r0, #0]
	tst	r1, #512
	beq	.L32
	ldr	r0, .L36+16
	ldr	r0, [r0, #0]
	tst	r0, #512
	bne	.L32
	mov	r0, #2992
	add	r0, r0, #8
	str	r0, [r2, #28]
	mov	r0, #1
	str	r0, [r3, #24]
	b	.L23
.L35:
	ldr	ip, .L36+16
	ldr	ip, [ip, #0]
	tst	ip, #512
	mvneq	r0, #2992
	subeq	r0, r0, #7
	streq	r0, [r2, #28]
	bne	.L17
.L18:
	mov	r0, #0
	str	r0, [r3, #24]
	b	.L23
.L34:
	mov	ip, #67108864
	ldr	ip, [ip, #304]
	tst	ip, #32
	mvneq	ip, #1792
	subeq	ip, ip, #7
	streq	ip, [r2, #28]
	mov	ip, #67108864
	ldr	ip, [ip, #304]
	tst	ip, #16
	moveq	ip, #1792
	addeq	ip, ip, #8
	streq	ip, [r2, #28]
	mov	ip, #1
	str	ip, [r3, #8]
	b	.L14
.L32:
	ldr	ip, [r2, #28]
	b	.L20
.L37:
	.align	2
.L36:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	oldButtons
	.word	player
	.word	buttons
	.size	playerInput, .-playerInput
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L49
	str	r4, [sp, #-4]!
	ldr	r2, [r3, #24]
	ldr	ip, [r3, #32]
	ldr	r0, [r3, #0]
	add	ip, ip, r2
	add	r0, ip, r0
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #28]
	mov	r4, r0, asr #8
	add	r1, r2, r1
	cmp	r4, #127
	str	ip, [r3, #24]
	stmia	r3, {r0, r1}	@ phole stm
	ble	.L39
	mov	ip, #32768
	str	ip, [r3, #0]
	ldr	ip, .L49+4
	mov	r0, #0
	str	r0, [r3, #24]
	str	r0, [ip, #16]
.L40:
	mov	r1, r1, asr #8
	cmp	r1, #0
	movle	r2, #0
	strle	r2, [r3, #4]
	strle	r2, [r3, #28]
	ble	.L44
	cmp	r1, #206
	movgt	r1, #52992
	strgt	r1, [r3, #4]
	cmp	r2, #0
	blt	.L48
	ldrne	r1, [r3, #36]
	rsbne	r2, r1, r2
	strne	r2, [r3, #28]
.L44:
	ldr	r3, [r3, #48]
	cmp	r2, r3
	bge	.L45
	rsb	r3, r3, #0
	cmp	r2, r3
	ble	.L45
	ldr	r3, .L49
	mov	r2, #0
	str	r2, [r3, #28]
.L46:
	ldr	r3, .L49+4
	mov	r2, #0
	str	r2, [r3, #24]
	b	.L47
.L45:
	cmp	r2, #0
	ble	.L46
.L47:
	ldmfd	sp!, {r4}
	b	playerInput
.L39:
	cmp	r4, #0
	movlt	r0, #0
	strlt	r0, [r3, #0]
	strlt	r0, [r3, #24]
	b	.L40
.L48:
	ldr	r1, [r3, #36]
	add	r2, r2, r1
	str	r2, [r3, #28]
	b	.L44
.L50:
	.align	2
.L49:
	.word	player
	.word	.LANCHOR0
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	dash
	.type	dash, %function
dash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	rsb	r0, r0, r0, asl #4
	ldr	r3, .L52
	mov	r0, r0, asl #3
	str	r0, [r3, #28]
	bx	lr
.L53:
	.align	2
.L52:
	.word	player
	.size	dash, .-dash
	.align	2
	.global	createEnemy
	.type	createEnemy, %function
createEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #40960
	stmfd	sp!, {r4, lr}
	str	r3, [r0, #0]
	ldr	r3, .L55
	mov	r4, r0
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+4
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #4
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #1
	mov	r1, #150
	mov	r3, #0
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r1, [r4, #32]
	str	r3, [r4, #88]
	mov	r1, #100
	mov	r3, #2048
	mov	r2, #32768
	mov	r0, r0, asl #8
	str	r1, [r4, #36]
	str	r3, [r4, #40]
	mov	r1, #50
	mov	r3, #2304
	str	r0, [r4, #4]
	str	r1, [r4, #48]
	str	r2, [r4, #56]
	str	r2, [r4, #52]
	str	r3, [r4, #44]
	mov	r0, r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	rand
	.word	-2004318071
	.size	createEnemy, .-createEnemy
	.align	2
	.global	spawner
	.type	spawner, %function
spawner:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, .L61
	sub	sp, sp, #180
	ldr	r3, [r4, #28]
	cmp	r3, #10
	beq	.L60
.L58:
	add	r3, r3, #1
	str	r3, [r4, #28]
.L57:
	add	sp, sp, #180
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L60:
	ldr	r2, [r4, #0]
	cmp	r2, #49
	bgt	.L58
	add	r5, sp, #84
	mov	r3, #0
	mov	r0, r5
	str	r3, [r4, #28]
	bl	createEnemy
	add	r1, sp, #96
	mov	r2, #80
	ldr	r3, .L61+4
	mov	r0, sp
	mov	lr, pc
	bx	r3
	ldmia	r5, {r1, r2, r3}
	add	r0, r4, #4
	ldr	ip, .L61+8
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #0]
	add	r3, r3, #1
	str	r3, [r4, #0]
	b	.L57
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.word	memcpy
	.word	addItem
	.size	spawner, .-spawner
	.align	2
	.global	enemyCollisions
	.type	enemyCollisions, %function
enemyCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L65
	ldr	r2, [r3, #0]
	ldr	r1, [r0, #0]
	mov	r2, r2, asr #8
	sub	r2, r2, #16
	cmp	r2, r1, asr #8
	bxne	lr
	ldr	r3, [r3, #4]
	ldr	r2, [r0, #4]
	mov	r3, r3, asr #8
	cmp	r3, r2, asr #8
	bxne	lr
	ldr	r3, .L65+4
	ldr	r2, [r3, #8]
	cmp	r2, #0
	ldrne	r2, [r3, #0]
	movne	r1, #1
	subne	r2, r2, #1
	strne	r1, [r0, #88]
	strne	r2, [r3, #0]
	bx	lr
.L66:
	.align	2
.L65:
	.word	player
	.word	.LANCHOR0
	.size	enemyCollisions, .-enemyCollisions
	.align	2
	.global	updateEnemies
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L80
	ldr	r4, [r3, #4]
	cmp	r4, #0
	beq	.L67
	ldr	r5, .L80+4
	ldr	r8, .L80+8
	ldr	r7, .L80+12
	mov	sl, #28672
	mov	r6, #0
	mov	r9, r5
	b	.L75
.L73:
	cmp	fp, r3
	blt	.L78
.L74:
	mov	r0, r4
	bl	enemyCollisions
	ldr	r4, [r4, #92]
	cmp	r4, #0
	beq	.L67
.L75:
	ldr	r3, [r4, #24]
	ldr	r1, [r4, #32]
	ldr	ip, [r4, #0]
	add	r1, r1, r3
	add	r2, r1, ip
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #28]
	mov	lr, r2, asr #8
	cmp	lr, #111
	add	fp, r3, r0
	str	r1, [r4, #24]
	str	r2, [r4, #0]
	strgt	r6, [r4, #24]
	strgt	sl, [r4, #0]
	cmp	r3, #0
	str	ip, [r4, #8]
	str	r0, [r4, #12]
	str	fp, [r4, #4]
	blt	.L79
	ldrne	r2, [r4, #36]
	rsbne	r3, r2, r3
	strne	r3, [r4, #28]
.L71:
	ldr	r2, [r4, #48]
	cmp	r2, r3
	ble	.L72
	rsb	r2, r2, #0
	cmp	r2, r3
	strlt	r6, [r4, #28]
.L72:
	ldr	r3, [r5, #4]
	cmp	fp, r3
	ble	.L73
	mov	lr, pc
	bx	r8
	smull	r2, r3, r7, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, asl #1
	rsb	r0, r3, r0
	ldr	r3, [r9, #4]
	sub	fp, fp, r0, asl #8
	cmp	fp, r3
	str	fp, [r4, #4]
	str	r6, [r4, #60]
	bge	.L74
.L78:
	mov	lr, pc
	bx	r8
	smull	r2, r3, r7, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, asl #1
	rsb	r0, r3, r0
	add	fp, fp, r0, asl #8
	mov	r3, #4096
	str	fp, [r4, #4]
	str	r3, [r4, #60]
	mov	r0, r4
	bl	enemyCollisions
	ldr	r4, [r4, #92]
	cmp	r4, #0
	bne	.L75
.L67:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L79:
	ldr	r2, [r4, #36]
	add	r3, r3, r2
	str	r3, [r4, #28]
	b	.L71
.L81:
	.align	2
.L80:
	.word	.LANCHOR0
	.word	player
	.word	rand
	.word	1431655766
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	updatePlayer
	bl	updateEnemies
	ldr	r3, .L83
	ldr	r3, [r3, #20]
	ldr	r2, .L83+4
	add	r1, r3, r3, lsr #31
	ldrh	r2, [r2, #4]
	mov	r0, r3, asl #16
	mov	r1, r1, asl #15
	mov	r3, #67108864
	mov	r0, r0, lsr #16
	mov	r1, r1, lsr #16
	strh	r0, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	update, .-update
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L90
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L88
.L86:
	ldr	r3, .L90+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L85
	ldr	r3, .L90+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L89
.L85:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L89:
	ldr	r3, .L90+12
	mov	lr, pc
	bx	r3
	b	.L85
.L88:
	bl	update
	ldr	r3, .L90+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+20
	mov	lr, pc
	bx	r3
	b	.L86
.L91:
	.align	2
.L90:
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	initializePause
	.word	waitForVblank
	.word	animate
	.size	game, .-game
	.global	__aeabi_idivmod
	.align	2
	.global	getRand
	.type	getRand, %function
getRand:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r5, r1
	ldr	r3, .L93
	mov	r4, r0
	mov	lr, pc
	bx	r3
	mov	r1, r5
	ldr	r3, .L93+4
	mov	lr, pc
	bx	r3
	add	r0, r1, r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	rand
	.word	__aeabi_idivmod
	.size	getRand, .-getRand
	.global	hOff
	.global	vOff
	.global	isOver
	.global	timer
	.global	isDash
	.global	jumpCount
	.global	coolDown
	.global	isAttack
	.global	frameCount
	.global	enemyTimer
	.global	enemyCount
	.global	head
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	player,92,4
	.comm	state,4,4
	.comm	sbb,4,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	coolDown, %object
	.size	coolDown, 4
coolDown:
	.word	20
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.word	20
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	enemyCount, %object
	.size	enemyCount, 4
enemyCount:
	.space	4
	.type	head, %object
	.size	head, 4
head:
	.space	4
	.type	isAttack, %object
	.size	isAttack, 4
isAttack:
	.space	4
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.type	jumpCount, %object
	.size	jumpCount, 4
jumpCount:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	isDash, %object
	.size	isDash, 4
isDash:
	.space	4
	.type	enemyTimer, %object
	.size	enemyTimer, 4
enemyTimer:
	.space	4
	.type	isOver, %object
	.size	isOver, 4
isOver:
	.space	4
	.type	timer, %object
	.size	timer, 4
timer:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
