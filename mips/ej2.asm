# 2.
# calcule el máximo común divisor de dos números.
# se usará el algoritmo de Euclides

# variables, aqui damos nuestros dos numeros
	.data
x:	.word 18 # primer número
y:	.word 15 # segundo número
z:	.word # resultado

# código
	.text
# cargando registros
	lw $t0 x
	lw $t1 y

# implementando el algoritmo
# gcd(x, y)
#	if y == 0 return x
#	else return gcd(y, x mod y)
gcd:	beq $t1 $zero done
	div $t0 $t1 
	move $t0 $t1
	mfhi $t1
	j gcd
	
done:	move $v0 $t0
	sw $v0 z
