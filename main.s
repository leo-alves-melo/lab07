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
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #72
	b	.L9
.L11:
	mov	r0, r0	@ nop
.L9:
	bl	testaFrente
	mov	r3, r0
	str	r3, [fp, #-12]
	b	.L2
.L5:
	ldr	r3, [fp, #-12]
	cmp	r3, #2
	bne	.L3
	bl	retoRapido
.L3:
	ldr	r3, [fp, #-12]
	cmp	r3, #1
	bne	.L4
	bl	retoDevagar
	bl	testaGiroMovimento
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	desvia
.L4:
	bl	testaFrente
	mov	r3, r0
	str	r3, [fp, #-12]
.L2:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L5
	bl	stop
	sub	r3, fp, #76
	mov	r0, r3
	bl	testaSentidoGiro
	mov	r3, r0
	str	r3, [fp, #-8]
	b	.L6
.L8:
	ldr	r0, [fp, #-8]
	bl	gira
.L6:
	mov	r0, #3
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L12
	cmp	r2, r3
	bhi	.L11
	mov	r0, #4
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L12
	cmp	r2, r3
	bls	.L8
	b	.L9
.L13:
	.align	2
.L12:
	.word	799
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
	b	.L15
.L16:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L15:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L16
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
	mov	r0, #25
	mov	r1, #25
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
	bne	.L27
	mov	r0, #0
	mov	r1, #15
	bl	set_speed_motors
	b	.L29
.L27:
	mov	r0, #15
	mov	r1, #0
	bl	set_speed_motors
.L29:
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
	ldr	r3, .L42
	cmp	r2, r3
	bls	.L31
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L32
.L31:
	mov	r0, #5
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L42
	cmp	r2, r3
	bls	.L33
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L32
.L33:
	mov	r0, #1
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L42
	cmp	r2, r3
	bls	.L34
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L32
.L34:
	mov	r0, #6
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L42
	cmp	r2, r3
	bls	.L32
	mov	r3, #0
	str	r3, [fp, #-8]
.L32:
	mov	r0, #2
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L42+4
	cmp	r2, r3
	bls	.L35
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L41
.L35:
	mov	r0, #5
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L42+4
	cmp	r2, r3
	bls	.L37
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L41
.L37:
	mov	r0, #1
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L42+4
	cmp	r2, r3
	bls	.L38
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L41
.L38:
	mov	r0, #6
	bl	read_sonar
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L42+4
	cmp	r2, r3
	bls	.L39
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L41
.L39:
	mov	r3, #0
	str	r3, [fp, #-8]
.L41:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L43:
	.align	2
.L42:
	.word	1499
	.word	799
	.size	testaGiroMovimento, .-testaGiroMovimento
	.align	2
	.global	testaSentidoGiro
	.type	testaSentidoGiro, %function
testaSentidoGiro:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #5
	str	r3, [fp, #-8]
	b	.L45
.L48:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, .L65
	cmp	r2, r3
	bls	.L46
	mov	r3, #0
	b	.L47
.L46:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L45:
	ldr	r3, [fp, #-8]
	cmp	r3, #11
	ble	.L48
	mov	r3, #2
	str	r3, [fp, #-8]
	b	.L49
.L51:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, .L65
	cmp	r2, r3
	bls	.L50
	mov	r3, #1
	b	.L47
.L50:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L49:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L51
	mov	r3, #15
	str	r3, [fp, #-8]
	b	.L52
.L54:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, .L65
	cmp	r2, r3
	bls	.L53
	mov	r3, #1
	b	.L47
.L53:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L52:
	ldr	r3, [fp, #-8]
	cmp	r3, #11
	bgt	.L54
	mov	r3, #5
	str	r3, [fp, #-8]
	b	.L55
.L57:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #800
	bls	.L56
	mov	r3, #0
	b	.L47
.L56:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L55:
	ldr	r3, [fp, #-8]
	cmp	r3, #11
	ble	.L57
	mov	r3, #2
	str	r3, [fp, #-8]
	b	.L58
.L60:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #800
	bls	.L59
	mov	r3, #1
	b	.L47
.L59:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L58:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L60
	mov	r3, #15
	str	r3, [fp, #-8]
	b	.L61
.L63:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #800
	bls	.L62
	mov	r3, #1
	b	.L47
.L62:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L61:
	ldr	r3, [fp, #-8]
	cmp	r3, #11
	bgt	.L63
	mov	r3, #0
.L47:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L66:
	.align	2
.L65:
	.word	1500
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
	ldr	r3, .L74
	cmp	r2, r3
	bls	.L68
	ldrh	r2, [fp, #-10]
	ldr	r3, .L74
	cmp	r2, r3
	bhi	.L69
.L68:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L70
.L69:
	ldrh	r2, [fp, #-12]
	ldr	r3, .L74+4
	cmp	r2, r3
	bls	.L71
	ldrh	r2, [fp, #-10]
	ldr	r3, .L74+4
	cmp	r2, r3
	bhi	.L72
.L71:
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L70
.L72:
	mov	r3, #2
	str	r3, [fp, #-8]
.L70:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L75:
	.align	2
.L74:
	.word	799
	.word	1499
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
	bne	.L77
	mov	r0, #7
	mov	r1, #15
	bl	set_speed_motors
	b	.L79
.L77:
	mov	r0, #15
	mov	r1, #7
	bl	set_speed_motors
.L79:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	desvia, .-desvia
	.ident	"GCC: (GNU) 4.4.3"
	.section	.note.GNU-stack,"",%progbits
