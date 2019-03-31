# 1. 
# sin usar la memoria ni la instrucción move, copie el contenido de un registro a otro.
# registro origen: $v1
# registro destino: $v0

# variables, aqui damos nuestros dos numeros
	.data
x:	.word 42 # contenido del registro de origen

# código
	.text
# cargando registro v1
	lw $v1 x
# copiando contenido a v0
	add $v0, $v1, $zero
