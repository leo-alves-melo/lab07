@ ALuno: Leonardo Alves de Melo
@ RA: 156188

@ Global symbol
    .global set_speed_motor

	.align 4
set_speed_motor:

	stmfd sp!, {r7}	@ Guarda o valor de r7 na pilha, pois irei usar o registrador nesta rotina
	mov r7, #0  @ Move para r7 o valor 0
	
	add r7, r1, #126 @ Sabendo que r1 contem o motor a ser alterado, 
					@ Somo ele com o valor 126 e terei em r7 a chamada da funcao correta
	svc 0x0			@ Faz a chamada do sistema operacional para setar o motor com valor de r0

	ldmfd sp!, {r7} @ r7 recebe de volta o valor que foi colocado na pilha
	mov pc, lr 		@ Retorna para a rotina que o chamou



@ Global symbol
    .global set_speed_motors

	.align 4
set_speed_motors:

	stmfd sp!, {r7}	@ Guarda o valor de r7 na pilha, pois irei usar o registrador nesta rotina
	mov r7, #124  @ Move para r7 o valor da chamada de modificacao dos motores

	svc 0x0			@ Faz a chamada do sistema operacional para setar os motores com valores de r0 e r1	

	ldmfd sp!, {r7}	@ r7 recebe da pilha o valor que tinha anteriormente 

	mov pc, lr 		@ Retorna para a rotina que o chamou

@ Global symbol
    .global read_sonar

	.align 4
read_sonar:

	stmfd sp!, {r7}	@ Guarda o valor de r7 na pilha, pois irei usar o registrador nesta rotina
	mov r7, #125  	@ Move para r7 o valor da chamada de leitura de sonar

	svc 0x0			@ Faz a chamada do sistema operacional para ler o sonar que esta em r0 e retorna em r0 o valor lido	

	ldmfd sp!, {r7}	@ r7 recebe da pilha o valor que tinha anteriormente 

	mov pc, lr 		@ Retorna para a rotina que o chamou

@ Global symbol
    .global read_sonars

	.align 4
read_sonars:

	stmfd sp!, {lr}	@ Guarda o valor de lr na pilha, pois irei alterar o registrador nesta rotina

	mov r1, r0 		@ r1 recebe o endereco inicial do vetor
	mov r2, #16 	@ r2 recebe o tamanho do vetor
	mov r3, #0 		@ r3 recebe o sensor que deve ser lido 

do_while:  			@ loop para ler todos os sonares e colocar no vetor
	
	mov r0, r3 		@ r0 recebe o sensor que deve ser lido atualmente
	bl read_sonar 	@ salta para a rotina que le o sonar de r0 com link

	stmfd r1!, {r0} @ guarda a leitura do sonar na posicao atual do vetor e atualiza a posicao do vetor
	sub r2, r2, #1 	@ subtrai 1 no numero de leituras que deve ser feita
	cmp r2, #0 		@ Compara o numero de repeticoes com zero
	bhi do_while 	@ Se ainda houver repeticoes a serem feitas, volta para o inicio do loop 




	ldmfd sp!, {lr}	@ lr recebe da pilha o valor que tinha anteriormente 


