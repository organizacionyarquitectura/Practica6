# 3.
# calcule el cociente y el residuo de una división.

#variables
	.data
x:	.word 16 # dividendo
y:	.word 3 # divisor

# cargando registros
	.text
	lw $t0 x
	lw $t1 y
	move $t2 $zero
	
# implementando la division
# mydiv(x, y)
#   t2 = 0
#   while (x >= y)
#      x -= y     
#      t2 ++
#   return t2, x
mydiv:	blt $t0 $t1 done
	sub $t0 $t0 $t1
	addi $t2 $t2 1
	j mydiv
	
done:	move $v0 $t2 # guardando cociente en $v0
	move $v1 $t0 # guardando residuo en $v1
