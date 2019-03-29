# 4.
# escribe un programa que calcule la serie: 4\cdot\sum_{n=0}^{m}{\frac{(-1)^{n}}{2n+1}}
# donde m es el número de iteraciones que ejecutará el programa

	.data
# variables
m:	.float 20.0 # num de iteraciones a ejecutar
aprox:	.float
#constantes
zero: 	.float 0.0
one:	.float 1.0
two:	.float 2.0
four:	.float 4.0

	.text
# cargando registros para contar
 	lwc1 $f0 m
	lwc1 $f1 zero # n : $f1
	lwc1 $f2 zero # n%2 : $f2
# cargando registros para calcular
	lwc1 $f3 zero # sum : $f3
	lwc1 $f4 zero # term : $f4
# cargando constantes
	lwc1 $f8 zero # const zero : $f8
	lwc1 $f5 one # const one : $f5
	lwc1 $f6 two # const two : $f6
	lwc1 $f7 four # const four : $f7
	
# serie
serie:	c.eq.s $f0 $f1 # bool = (n == m)
	bc1t done # if bool then done, else continue
	mul.s $f4 $f1 $f6 # term = 2*n
	add.s $f4  $f4 $f5 # term = term + 1 
	div.s $f4 $f5 $f4 # term = 1/term
	c.eq.s $f2 $f5 # bool = (n%2 == 1)
	bc1t odd # if bool then odd, else continue
# n%2 = 0
	add.s $f3 $f3 $f4 # sum += term
	mov.s $f2 $f5 # n%2 = 0 -> (n+1)%2 = 1
	j contin
# n%2 = 1
odd:	sub.s $f3 $f3 $f4 # sum -= term
	mov.s $f2 $f8 # n%2 = 1 -> (n+1)%2 = 0
contin:	add.s $f1 $f1 $f5 # n++
	j serie

done:	mul.s $f3 $f3 $f7 # sum *= 4
	swc1 $f3 aprox
	 