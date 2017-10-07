.data
	texto_entrada: .word 0:100
	texto_cifrado: .word 0:100
	texto_decifrado: .word 0:100
	chave: .word 0:100
mensagem1: .asciiz "Texto de entrada: \n"
mensagem2: .asciiz "Chave: \n"
mensagem3: .asciiz "Texto cifrado: \n"
mensagem4: .asciiz "Texto decifrado: \n"
mensagem5: .asciiz "Erro na cifragem/decifragem\n"
enter: .asciiz "\n"
espaço: .asciiz " "
.text
	inicio:
		la   $a0, mensagem1       
      	li   $v0, 4           
      	syscall
      	
		jal le_char_do_teclado
		la  $t1, 0($v0)				#$t1 = texto_entrada   
		
		jal strlen	#chamada para descobrir tamanho do texto
		add $t2, $t0, $zero #$t2 é tamanho do texto
		
	
	
	j fim

strlen:
		li $t0, 0 # initialize the count to zero
	loop:
		lb $t1, 0($a0) # load the next character into t1
		beqz $t1, exit # check for the null character
		addi $a0, $a0, 1 # increment the string pointer
		addi $t0, $t0, 1 # increment the count
		j loop # return to the top of the loop
	exit:
		jr $ra
fim:
		li $v0, 10	# código para encerrar o programa
		syscall		# executa a chamada do SO para encerrar
	
le_char_do_teclado:
		li $v0, 12	# código para ler um inteiro
		syscall		# executa a chamada do SO para ler 	
		jr $ra		# volta para o lugar de onde foi chamado (no caso, jal le_char_do_teclado)
imprime_char:
		li $v0, 4	# código para imprimir um palavra
		la $a0, ($t7)	# $a0 é o registrador que irá conter o valor a ser impresso
		syscall		# executa a chamado do SO para imprimir
		jr $ra		# volta para o lugar de onde foi chamado (no caso, jal imprime_char)
