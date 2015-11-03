	.arch armv5te
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	_start
	.type	_start, %function
_start:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #76
.L2:
	b	.L2
	.size	_start, .-_start
	.align	2
	.global	delay
	.type	delay, %function
delay:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L5
.L6:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L5:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L6
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	inicializa
	.type	inicializa, %function
inicializa:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	mov	r0, #0
	mov	r1, #0
	bl	set_speed_motors
	ldr	r0, [fp, #-8]
	bl	read_sonars
	mov	r0, #1000
	bl	delay
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	inicializa, .-inicializa
	.align	2
	.global	retoRapido
	.type	retoRapido, %function
retoRapido:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #30
	mov	r1, #30
	bl	set_speed_motors
	ldmfd	sp!, {fp, pc}
	.size	retoRapido, .-retoRapido
	.align	2
	.global	retoDevagar
	.type	retoDevagar, %function
retoDevagar:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #12
	mov	r1, #12
	bl	set_speed_motors
	ldmfd	sp!, {fp, pc}
	.size	retoDevagar, .-retoDevagar
	.align	2
	.global	stop
	.type	stop, %function
stop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #0
	mov	r1, #0
	bl	set_speed_motors
	ldmfd	sp!, {fp, pc}
	.size	stop, .-stop
	.align	2
	.global	gira
	.type	gira, %function
gira:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L17
	mov	r0, #0
	mov	r1, #15
	bl	set_speed_motors
	b	.L19
.L17:
	mov	r0, #15
	mov	r1, #0
	bl	set_speed_motors
.L19:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	gira, .-gira
	.align	2
	.global	testaGiroMovimento
	.type	testaGiroMovimento, %function
testaGiroMovimento:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r0, #2
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L32
	cmp	r2, r3
	bls	.L21
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L22
.L21:
	mov	r0, #5
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L32
	cmp	r2, r3
	bls	.L23
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L22
.L23:
	mov	r0, #1
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L32
	cmp	r2, r3
	bls	.L24
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L22
.L24:
	mov	r0, #6
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L32
	cmp	r2, r3
	bls	.L22
	mov	r3, #0
	str	r3, [fp, #-8]
.L22:
	mov	r0, #2
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L32+4
	cmp	r2, r3
	bls	.L25
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L31
.L25:
	mov	r0, #5
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L32+4
	cmp	r2, r3
	bls	.L27
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L31
.L27:
	mov	r0, #1
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L32+4
	cmp	r2, r3
	bls	.L28
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L31
.L28:
	mov	r0, #6
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L32+4
	cmp	r2, r3
	bls	.L29
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L31
.L29:
	mov	r3, #0
	str	r3, [fp, #-8]
.L31:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L33:
	.align	2
.L32:
	.word	1199
	.word	599
	.size	testaGiroMovimento, .-testaGiroMovimento
	.align	2
	.global	testaSentidoGiro
	.type	testaSentidoGiro, %function
testaSentidoGiro:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	read_sonars
	mov	r3, #5
	str	r3, [fp, #-8]
	b	.L35
.L38:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #1200
	bls	.L36
	mov	r3, #0
	b	.L37
.L36:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L35:
	ldr	r3, [fp, #-8]
	cmp	r3, #11
	ble	.L38
	mov	r3, #2
	str	r3, [fp, #-8]
	b	.L39
.L41:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #1200
	bls	.L40
	mov	r3, #1
	b	.L37
.L40:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L39:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L41
	mov	r3, #15
	str	r3, [fp, #-8]
	b	.L42
.L44:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #1200
	bls	.L43
	mov	r3, #1
	b	.L37
.L43:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L42:
	ldr	r3, [fp, #-8]
	cmp	r3, #11
	bgt	.L44
	mov	r3, #5
	str	r3, [fp, #-8]
	b	.L45
.L47:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #600
	bls	.L46
	mov	r3, #0
	b	.L37
.L46:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L45:
	ldr	r3, [fp, #-8]
	cmp	r3, #11
	ble	.L47
	mov	r3, #2
	str	r3, [fp, #-8]
	b	.L48
.L50:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #600
	bls	.L49
	mov	r3, #1
	b	.L37
.L49:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L48:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L50
	mov	r3, #15
	str	r3, [fp, #-8]
	b	.L51
.L53:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #600
	bls	.L52
	mov	r3, #1
	b	.L37
.L52:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L51:
	ldr	r3, [fp, #-8]
	cmp	r3, #11
	bgt	.L53
	mov	r3, #0
.L37:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	testaSentidoGiro, .-testaSentidoGiro
	.align	2
	.global	testaFrente
	.type	testaFrente, %function
testaFrente:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r0, #4
	bl	read_sonar
	mov	r3, r0
	strh	r3, [fp, #-12]	@ movhi
	mov	r0, #3
	bl	read_sonar
	mov	r3, r0
	strh	r3, [fp, #-10]	@ movhi
	ldrh	r2, [fp, #-12]
	ldr	r3, .L62
	cmp	r2, r3
	bls	.L56
	ldrh	r2, [fp, #-10]
	ldr	r3, .L62
	cmp	r2, r3
	bhi	.L57
.L56:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L58
.L57:
	ldrh	r2, [fp, #-12]
	ldr	r3, .L62+4
	cmp	r2, r3
	bls	.L59
	ldrh	r2, [fp, #-10]
	ldr	r3, .L62+4
	cmp	r2, r3
	bhi	.L60
.L59:
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L58
.L60:
	mov	r3, #2
	str	r3, [fp, #-8]
.L58:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L63:
	.align	2
.L62:
	.word	599
	.word	1199
	.size	testaFrente, .-testaFrente
	.align	2
	.global	desvia
	.type	desvia, %function
desvia:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L65
	mov	r0, #7
	mov	r1, #15
	bl	set_speed_motors
	b	.L67
.L65:
	mov	r0, #15
	mov	r1, #7
	bl	set_speed_motors
.L67:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	desvia, .-desvia
	.ident	"GCC: (GNU) 4.4.3"
	.section	.note.GNU-stack,"",%progbits
