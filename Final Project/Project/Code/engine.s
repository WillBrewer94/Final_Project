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
	mov	r2, #32
	str	r2, [r3, #64]
	mov	r2, #16
	str	r2, [r3, #68]
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
	str	r4, [r3, #96]
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
	ldr	r3, .L42
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L8
	ldr	r1, .L42+4
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
	ldr	r1, .L42+8
	ldr	r0, [r1, #0]
	tst	r0, #1
	str	r2, [r3, #12]
	bne	.L34
.L38:
	ldr	r2, .L42+12
.L11:
	mov	r0, #67108864
	ldr	ip, [r0, #304]
	tst	ip, #32
	bne	.L12
	ldr	r0, .L42+4
	ldr	ip, [r0, #4]
	cmp	ip, #0
	ble	.L13
	ldr	r4, [r2, #4]
	mov	r5, r4, asr #8
	cmp	r5, #19
	suble	ip, ip, #2
	strle	ip, [r0, #4]
	ble	.L15
.L14:
	sub	r4, r4, #768
	str	r4, [r2, #4]
.L15:
	ldr	r0, [r2, #28]
	cmp	r0, #0
	mov	r0, #4096
	str	r0, [r2, #60]
	ldrgt	r0, .L42+12
	movgt	ip, #0
	strgt	ip, [r0, #28]
.L16:
	ldr	r0, [r1, #0]
	tst	r0, #2
	beq	.L20
	ldr	r0, .L42+16
	ldr	r0, [r0, #0]
	tst	r0, #2
	beq	.L41
.L20:
	mov	r0, #67108864
	ldr	r0, [r0, #304]
	tst	r0, #32
	bne	.L23
	ldr	r0, [r1, #0]
	tst	r0, #512
	beq	.L23
	ldr	r0, .L42+16
	ldr	r0, [r0, #0]
	tst	r0, #512
	mvneq	r1, #2992
	subeq	r1, r1, #7
	streq	r1, [r2, #28]
	bne	.L23
.L24:
	mov	r2, #0
	str	r2, [r3, #20]
	b	.L29
.L34:
	ldr	r2, .L42+16
	ldr	r2, [r2, #0]
	tst	r2, #1
	bne	.L38
	ldr	r0, [r3, #16]
	cmp	r0, #1
	bgt	.L38
	ldr	r2, .L42+12
	ldr	ip, [r2, #44]
	add	r0, r0, #1
	rsb	ip, ip, #0
	str	ip, [r2, #24]
	str	r0, [r3, #16]
	b	.L11
.L12:
	ldr	r0, [r0, #304]
	tst	r0, #16
	bne	.L16
	ldr	r0, .L42+4
	ldr	ip, [r0, #4]
	cmp	ip, #272
	ldrge	r4, [r2, #4]
	bge	.L18
	ldr	r4, [r2, #4]
	ldr	r5, [r2, #64]
	add	r5, r5, r4, asr #8
	cmp	r5, #220
	addgt	ip, ip, #2
	strgt	ip, [r0, #4]
	bgt	.L19
.L18:
	add	r4, r4, #768
	str	r4, [r2, #4]
.L19:
	ldr	ip, [r2, #28]
	mov	r0, #0
	cmp	ip, r0
	ldrlt	ip, .L42+12
	str	r0, [r2, #60]
	strlt	r0, [ip, #28]
	b	.L16
.L23:
	mov	r0, #67108864
	ldr	r0, [r0, #304]
	tst	r0, #16
	bne	.L39
	ldr	r1, [r1, #0]
	tst	r1, #512
	beq	.L39
	ldr	r1, .L42+16
	ldr	r1, [r1, #0]
	tst	r1, #512
	bne	.L39
	mov	r1, #2992
	add	r1, r1, #8
	str	r1, [r2, #28]
	mov	r2, #1
	str	r2, [r3, #20]
	b	.L29
.L39:
	ldr	r2, [r2, #28]
	cmp	r2, #0
	ble	.L24
.L29:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	mvn	r2, r2
	ands	r2, r2, #256
	movne	r2, #1
	strne	r2, [r3, #24]
	streq	r2, [r3, #24]
	b	.L7
.L41:
	mov	r0, #67108864
	ldr	r0, [r0, #304]
	tst	r0, #32
	mvneq	r0, #1488
	subeq	r0, r0, #11
	streq	r0, [r2, #28]
	mov	r0, #67108864
	ldr	r0, [r0, #304]
	tst	r0, #16
	moveq	r0, #1488
	addeq	r0, r0, #12
	streq	r0, [r2, #28]
	mov	r0, #1
	str	r0, [r3, #8]
	b	.L20
.L13:
	ldr	r4, [r2, #4]
	b	.L14
.L43:
	.align	2
.L42:
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
	ldr	r3, .L55
	stmfd	sp!, {r4, r5, r6}
	ldr	r2, [r3, #24]
	ldr	ip, [r3, #32]
	ldr	r4, .L55+4
	ldr	r0, [r3, #0]
	add	ip, ip, r2
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #28]
	add	r0, ip, r0
	ldmib	r4, {r5, r6}	@ phole ldm
	add	r1, r2, r1
	mov	r4, r0, asr #8
	add	r6, r0, r6, asl #8
	add	r5, r1, r5, asl #8
	cmp	r4, #127
	str	ip, [r3, #24]
	stmia	r3, {r0, r1}	@ phole stm
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	ble	.L45
	mov	ip, #32768
	str	ip, [r3, #0]
	ldr	ip, .L55+8
	mov	r0, #0
	str	r0, [r3, #24]
	str	r0, [ip, #16]
.L46:
	mov	r1, r1, asr #8
	cmp	r1, #0
	movle	r2, #0
	strle	r2, [r3, #4]
	strle	r2, [r3, #28]
	ble	.L50
	cmp	r1, #206
	movgt	r1, #52992
	strgt	r1, [r3, #4]
	cmp	r2, #0
	blt	.L54
	ldrne	r1, [r3, #36]
	rsbne	r2, r1, r2
	strne	r2, [r3, #28]
.L50:
	ldr	r3, [r3, #48]
	cmp	r2, r3
	bge	.L51
	rsb	r3, r3, #0
	cmp	r2, r3
	ble	.L51
	ldr	r3, .L55
	mov	r2, #0
	str	r2, [r3, #28]
.L52:
	ldr	r3, .L55+8
	mov	r2, #0
	str	r2, [r3, #20]
	b	.L53
.L51:
	cmp	r2, #0
	ble	.L52
.L53:
	ldmfd	sp!, {r4, r5, r6}
	b	playerInput
.L45:
	cmp	r4, #0
	movlt	r0, #0
	strlt	r0, [r3, #0]
	strlt	r0, [r3, #24]
	b	.L46
.L54:
	ldr	r1, [r3, #36]
	add	r2, r2, r1
	str	r2, [r3, #28]
	b	.L50
.L56:
	.align	2
.L55:
	.word	player
	.word	.LANCHOR1
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
	ldr	r3, .L58
	mov	r0, r0, asl #3
	str	r0, [r3, #28]
	bx	lr
.L59:
	.align	2
.L58:
	.word	player
	.size	dash, .-dash
	.align	2
	.global	createEnemy
	.type	createEnemy, %function
createEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L63
	mov	r4, r0
	mov	lr, pc
	bx	r3
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r3, r3, r0, lsr #31
	cmp	r3, #1
	mov	r3, #25600
	str	r3, [r4, #16]
	moveq	r3, #0
	movne	r3, #131072
	streq	r3, [r4, #20]
	strne	r3, [r4, #20]
	mov	r1, #150
	mov	r3, #0
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r1, [r4, #32]
	str	r3, [r4, #96]
	mov	r1, #100
	mov	r3, #2048
	mov	r2, #32768
	str	r1, [r4, #36]
	str	r3, [r4, #40]
	mov	r1, #50
	mov	r3, #2304
	str	r1, [r4, #48]
	str	r2, [r4, #56]
	str	r2, [r4, #52]
	str	r3, [r4, #44]
	mov	r0, r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	rand
	.size	createEnemy, .-createEnemy
	.align	2
	.global	spawner
	.type	spawner, %function
spawner:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, .L69
	sub	sp, sp, #196
	ldr	r3, [r4, #28]
	cmp	r3, #60
	beq	.L68
.L66:
	add	r3, r3, #1
	str	r3, [r4, #28]
.L65:
	add	sp, sp, #196
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L68:
	ldr	r2, [r4, #0]
	cmp	r2, #19
	bgt	.L66
	add	r5, sp, #92
	mov	r3, #0
	mov	r0, r5
	str	r3, [r4, #28]
	bl	createEnemy
	add	r1, sp, #104
	mov	r2, #88
	ldr	r3, .L69+4
	mov	r0, sp
	mov	lr, pc
	bx	r3
	ldmia	r5, {r1, r2, r3}
	add	r0, r4, #4
	ldr	ip, .L69+8
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #0]
	add	r3, r3, #1
	str	r3, [r4, #0]
	b	.L65
.L70:
	.align	2
.L69:
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
	ldr	r3, .L73
	ldr	r2, [r3, #16]
	ldr	r1, [r0, #16]
	mov	r2, r2, asr #8
	sub	r2, r2, #16
	cmp	r2, r1, asr #8
	bxne	lr
	ldr	r3, [r3, #20]
	ldr	r2, [r0, #20]
	mov	r3, r3, asr #8
	cmp	r3, r2, asr #8
	bxne	lr
	ldr	r3, .L73+4
	ldr	r3, [r3, #8]
	cmp	r3, #0
	movne	r3, #1
	strne	r3, [r0, #96]
	bx	lr
.L74:
	.align	2
.L73:
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
	bl	spawner
	ldr	r3, .L88
	ldr	r4, [r3, #4]
	cmp	r4, #0
	beq	.L75
	ldr	r6, .L88+4
	ldr	r5, .L88+8
	ldr	r8, .L88+12
	mov	r7, #0
	b	.L83
.L81:
	cmp	sl, r3
	blt	.L86
.L82:
	mov	r0, r4
	bl	enemyCollisions
	ldr	r4, [r4, #100]
	cmp	r4, #0
	beq	.L75
.L83:
	ldr	r3, [r4, #16]
	ldr	r1, [r5, #8]
	ldr	r2, [r5, #4]
	add	sl, r4, #20
	ldmia	sl, {sl, fp}	@ phole ldm
	mov	r9, r3, asr #8
	ldr	r0, [r4, #32]
	cmp	r9, #132
	sub	r2, sl, r2, asl #8
	sub	r1, r3, r1, asl #8
	ldr	r3, [r4, #28]
	ldr	lr, [r4, #0]
	ldr	ip, [r4, #4]
	add	r0, fp, r0
	str	r2, [r4, #4]
	movle	r2, #33792
	str	r0, [r4, #24]
	strle	r2, [r4, #16]
	strle	r7, [r4, #24]
	cmp	r3, #0
	str	lr, [r4, #8]
	str	ip, [r4, #12]
	str	r1, [r4, #0]
	blt	.L87
	ldrne	r2, [r4, #36]
	rsbne	r3, r2, r3
	strne	r3, [r4, #28]
.L79:
	ldr	r2, [r4, #48]
	cmp	r3, r2
	bge	.L80
	rsb	r2, r2, #0
	cmp	r3, r2
	strgt	r7, [r4, #28]
.L80:
	ldr	r3, [r6, #20]
	cmp	sl, r3
	ble	.L81
	mov	lr, pc
	bx	r8
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r3, r3, r0, lsr #31
	ldr	r2, .L88+4
	sub	sl, sl, r3, asl #8
	mov	r3, #4096
	str	r3, [r4, #60]
	ldr	r3, [r2, #20]
	cmp	sl, r3
	str	sl, [r4, #20]
	bge	.L82
.L86:
	mov	lr, pc
	bx	r8
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r3, r3, r0, lsr #31
	add	sl, sl, r3, asl #8
	str	sl, [r4, #20]
	str	r7, [r4, #60]
	mov	r0, r4
	bl	enemyCollisions
	ldr	r4, [r4, #100]
	cmp	r4, #0
	bne	.L83
.L75:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L87:
	ldr	r2, [r4, #36]
	add	r3, r3, r2
	str	r3, [r4, #28]
	b	.L79
.L89:
	.align	2
.L88:
	.word	.LANCHOR0
	.word	player
	.word	.LANCHOR1
	.word	rand
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
	ldr	r3, .L91
	ldmib	r3, {r2, r3}	@ phole ldm
	add	r0, r2, r2, lsr #31
	add	r1, r3, r3, lsr #31
	mov	ip, r3, asl #16
	mov	r2, r2, asl #16
	mov	r0, r0, asl #15
	mov	r1, r1, asl #15
	mov	r3, #67108864
	mov	r2, r2, lsr #16
	mov	ip, ip, lsr #16
	mov	r0, r0, lsr #16
	mov	r1, r1, lsr #16
	strh	r2, [r3, #16]	@ movhi
	strh	ip, [r3, #18]	@ movhi
	strh	r0, [r3, #20]	@ movhi
	strh	r1, [r3, #22]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L92:
	.align	2
.L91:
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
	ldr	r3, .L98
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L96
.L94:
	ldr	r3, .L98+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L93
	ldr	r3, .L98+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L97
.L93:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L97:
	ldr	r3, .L98+12
	mov	lr, pc
	bx	r3
	b	.L93
.L96:
	bl	update
	ldr	r3, .L98+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L98+20
	mov	lr, pc
	bx	r3
	b	.L94
.L99:
	.align	2
.L98:
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
	ldr	r3, .L101
	mov	r4, r0
	mov	lr, pc
	bx	r3
	mov	r1, r5
	ldr	r3, .L101+4
	mov	lr, pc
	bx	r3
	add	r0, r1, r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L102:
	.align	2
.L101:
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
	.global	timeFreeze
	.global	head
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	player,100,4
	.comm	state,4,4
	.comm	sbb,4,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	coolDown, %object
	.size	coolDown, 4
coolDown:
	.word	20
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.word	136
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
	.type	isDash, %object
	.size	isDash, 4
isDash:
	.space	4
	.type	timeFreeze, %object
	.size	timeFreeze, 4
timeFreeze:
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
