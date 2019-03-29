# 2.
# calcule el máximo común divisor de dos números.
# se usará el algoritmo de Euclides

# variables
	.data
x:	.word 18 # primer número
y:	.word 15 # segundo número
z:	.word # resultado

# código
	.text
# cargando variables
	lw $t0 x
	lw $t1 y
	j gcd

# implementando el algoritmo
# gcd(a, b)
#	if b == 0 return a
#	else return gcd(b, a mod b)
gcd:	beq $t1 $zero done
	div $t0 $t1 
	move $t0 $t1
	mfhi $t1
	j gcd
	
done:	move $v0 $t0
	sw $v0 z