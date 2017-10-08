#######################################################################################################################
#TRABALHO DE ARQUITETURA DE COMPUTADORES I 																			  #
#NOMES: ARTHUR DE MENEZES																							  #
#		RONALDO MIRAGLIA BRANDÃO DE LIMA																			  #
#RGA'S: 																								  #
#		201419070231																								  #
#######################################################################################################################
# int main()
# {
#	char texto_entrada[100],
#	     texto_cifrado[100],
#	     texto_decifrado[100],
#	     chave[100];
#	int tamanho_texto,
#	    tamanho_chave ;
#
#	// Lê texto de entrada
#	printf("Texto de entrada: ") ;
#	scanf(" %[^\n]s", texto_entrada) ;
#	
#	tamanho_texto = strlen(texto_entrada) ;
#
#	// Lê chave
#	printf("Chave: ") ;
#	scanf(" %[^\n]s", chave) ;
#
#	tamanho_chave = strlen(chave) ;
#
#	// Cifra texto de entrada, obtendo texto cifrado
#	cifra(texto_entrada, texto_cifrado, chave, tamanho_texto, tamanho_chave) ;
#
#	// Imprime texto cifrado
#	printf("Texto cifrado: %s\n", texto_cifrado) ;
#	fflush(stdin) ;
#
#	// Decifra texto cifrado, obtendo texto decifrado
#	cifra(texto_cifrado, texto_decifrado, chave, tamanho_texto, tamanho_chave) ;
#
#	// Imprime texto decifrado
#	printf("Texto decifrado: %s\n", texto_decifrado) ;
#	// Compara texto de entrada com texto decifrado
#	if (strcmp(texto_entrada, texto_decifrado) != 0)
#	{
#		printf("Erro na cifragem/decifragem\n") ;
#	}
#
#	return 0 ;
# }
#
# void cifra(char *texto_in, char *texto_out, char *chave, int tamanho_texto, int tamanho_chave)
# {
#	int i, j ;
#	
#	i = 0 ;
#	j = 0 ;
#
#	// Para cada caracter de texto_in
#	while (i < tamanho_texto)
#	{
#		// Obtém caracter de texto_out, usando caracter do texto_in e caracter da chave
#		texto_out[i] = texto_in[i] ^ chave[j] ;
#
#		i ++ ;
#		// Se chegou ao fim da chave, começa a partir de seu primeiro caracter de novo
#		if (j == tamanho_chave)
#		{
#			j = 0 ;
#		}
#	}
#	texto_out[i] = '\0' ;
# }
# --------------------------------------------------------------------------------------------
# Uso dos registradores
#
# $t0: representa variável texto_entrada
# $t1: representa variável chave
# $t2: representa variável texto_cifrado
# $t3: representa variável texto_decifrado
#
# $t4: representa variável tamanho_texto
# $t5: representa variável tamanho_chave
#
# $t6: usado como contador no loop
#
# ---------------------------------------------
# Função cifra()
#
#

.data						# área de dados
	texto_entrada:	.space 100		# texto_entrada[100]
	texto_cifrado: 	.space 100		# texto_cifrado[100]
	texto_decifrado:.space 100		# texto_decifrado[100]
	chave: 		.space 100		# chave[100]
	mensagem1: 	.asciiz "Texto de entrada: "
	mensagem2: 	.asciiz "Chave: \n"
	mensagem3: 	.asciiz "Texto cifrado: \n"
	mensagem4: 	.asciiz "Texto decifrado: \n"
	mensagem5: 	.asciiz "Erro na cifragem/decifragem\n"
	enter: 		.asciiz "\n"
	espaco: 	.asciiz " "

.text 						# área de código
	main:					# Função principal
		# Ler texto de entrada
		jal imprimir_msg1		# chama função para imprimir mensagem 1
		jal ler_texto_entrada		# chama função para leitura do texto de entrada
		
		# Ler chave
		jal imprimir_msg2		# chama função para imprimir mensagem 2
		jal ler_chave			# chama função para leitura da chave
		
		# calcular tamanho do texto
		jal strlen_texto_entrada	# chama função de calcular tamanho do texto_entrada
		addi $t4, $t6, -1		# atribui a $t8 o tamanho da palavra
		jal imprime_inteiro
		#j fim
		# calcular tamanho da chave
		#jal strlen_chave		# chama função de calcular tamanho da chave
		#addi $t5, $t6, -1		# atribui a $t9 o tamanho da chave
		
		
		# chamar função de cifra()
		
		# Resultado
		jal imprimir_msg3		# Imprimir mensagem texto cifrado
		jal imprimir_texto_entrada	# Imprimir texto cifrado
		
		jal imprimir_msg4		# Imprimir mensagem de texto decifrado
		jal imprimir_chave		# Imprimir texto decifrado
		
		jal imprimir_compara_textos	# chama função para verificação dos textos

        	j fim				# chama função de finalização do programa

imprime_inteiro:
	li $v0, 1	# código para imprimir um inteiro
	la $a0, ($t4)	# $a0 é o registrador que irá conter o valor a ser impresso
	syscall		# executa a chamado do SO para imprimir
	jr $ra		# volta para o lugar de onde foi chamado (no caso, jal imprime_inteiro)
############################################################################################################
# ------------------------------------------- Imprimir mensagens ----------------------------------------- #
############################################################################################################
imprimir_msg1:				# imprime mensagem e ler valor
    	la $a0, mensagem1    		# Carrega string para escrever na tela
    	li $v0, 4			# conteúdo lido ficará no registrador $v0
    	syscall				# executa chamada ao sistema
    	jr $ra				# volta para o lugar de onde foi chamado (no caso, jal imprime_msg1)

imprimir_msg2:				# imprime mensagem e ler valor
    	la $a0, mensagem2    		# Carrega string para escrever na tela
    	li $v0, 4			# conteúdo lido ficará no registrador $v0
    	syscall				# executa chamada ao sistema
    	jr $ra				# volta para o lugar de onde foi chamado (no caso, jal imprime_msg2)
    	
imprimir_msg3:				# imprime mensagem e ler valor
    	la $a0, mensagem3    		# Carrega string para escrever na tela
    	li $v0, 4			# conteúdo lido ficará no registrador $v0
    	syscall				# executa chamada ao sistema
    	jr $ra				# volta para o lugar de onde foi chamado (no caso, jal imprime_msg3)

imprimir_msg4:				# imprime mensagem e ler valor
    	la $a0, mensagem4    		# Carrega string para escrever na tela
    	li $v0, 4			# conteúdo lido ficará no registrador $v0
    	syscall				# executa chamada ao sistema
    	jr $ra				# volta para o lugar de onde foi chamado (no caso, jal imprime_msg4)

imprimir_msg5:				# imprime mensagem e ler valor
    	la $a0, mensagem5    		# Carrega string para escrever na tela
    	li $v0, 4			# conteúdo lido ficará no registrador $v0
    	syscall				# executa chamada ao sistema
    	jr $ra				# volta para o lugar de onde foi chamado (no caso, jal imprime_msg5)
    	
############################################################################################################
# ---------------------------------------- ler textos de entrada ----------------------------------------- #
############################################################################################################

ler_texto_entrada:			# função de ler dados do teclado
	li $v0, 8			# código para ler uma palavra
	la $a0, texto_entrada  		# carrega espaço de byte no endereço
    	li $a1, 100      		# Atribui espaço de bytes para string
    	move $t0, $a0   		# salva string em $t0
	syscall				# executa a chamada do SO para ler
	sw $t0, -100			#
	jr $ra 				# volta para o lugar de onde foi chamado (no caso, jal ler_texto_entrada)

ler_chave:				# função de ler dados do teclado
	li $v0, 8			# código para ler uma palavra
	la $a0, chave  			# carrega espaço de byte no endereço
    	li $a1, 100      		# Atribui espaço de bytes para string
    	move $t1, $a0   		# salva string em t1
	syscall				# executa a chamada do SO para ler
	sw $t1, -200			# salva palavra na pilha 
	jr $ra 				# volta para o lugar de onde foi chamado (no caso, jal ler_chave_do_teclado)

############################################################################################################
# ------------------------------------ Imprimir resultados do algoritmo ---------------------------------- #
############################################################################################################

imprimir_texto_entrada:				# Imprimir frase lida
	lw $t0, -100
	la $a0, texto_entrada  		# recarregar espaço no byte para o endereço principal
    	move $a0, $t0   		# Endereço primário = endereço t0 (ponteiro de carga)
    	li $v0, 4       		# Imprirmir string
    	syscall				# chamada ao SO para imprimir
    	jr $ra				# retorno de função para quem chamou
    	
imprimir_chave:				# Imprimir frase lida
	lw $t1, -200
	la $a0, texto_entrada  		# recarregar espaço no byte para o endereço principal
    	move $a0, $t1   		# Endereço primário = endereço t1 (ponteiro de carga)
    	li $v0, 4       		# Imprirmir string
    	syscall				# chamada ao SO para imprimir
    	jr $ra				# retorno de função para quem chamou

imprimir_texto_cifrado:
	lw $a0, -4($a0)
	la $a0, texto_cifrado  		# recarregar espaço no byte para o endereço principal
    	move $a0, $t2   		# Endereço primário = endereço t2 (ponteiro de carga)
    	li $v0, 4       		# Imprirmir string
    	syscall				# chamada ao SO para imprimir
    	jr $ra				# retorno de função para quem chamou
imprimir_compara_textos:
	beq $t0 , $t3 , iguais
	jal imprimir_msg5
	jr $ra
iguais:
	jr $ra

############################################################################################################
# ------------------------------------------ Cálculo do algortimo ---------------------------------------- #
############################################################################################################

cifra:					# Função cifra()
	add $t0, $zero, $zero		# i = 0
	add $t1, $zero, $zero		# j = 0
					
					
while:					# laço de repetição dentro da função
	slt $t3, $t0, $t9		# Se i < tamanho_texto ? $t3=1 : $t3=0
	bne $t3, $zero, fim_while	# Se $t3 != 0 ? fim_while
#					# texto_out[i] = texto_in[i] ^ chave[j];
	addi $t0, $t0, 1		# i++;
	beq $t1, $t8, jzero  		# Se j == tamanho_chave
	j while				# volta para o while
	
fim_while:
#					# text_out[i] = '\0'

jzero:
	add $t1, $zero, $zero		# j = 0;
	jr $ra
	

strlen_texto_entrada:
	li $t6, 0 # initialize the count to zero
loop_i:
	lb $t7, 0($a0) # load the next character into t1
	beqz $t7, exit_i # check for the null character
	addi $a0, $a0, 1 # increment the string pointer
	addi $t6, $t6, 1 # increment the count
	j loop_i # return to the top of the loop
exit_i:
	jr $ra

############################################################################################################
# -------------------------------------------- Fim do algortimo ------------------------------------------ #
############################################################################################################

fim:					# Função para encerrar programa
	li $v0, 10			# código para encerrar o programa
	syscall				# executa a chamada do SO para encerrar

