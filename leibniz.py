# N iteraciones de la serie
n = int(input('número de iteraciones: '))

sum = 0
for i in range(n):
    term = 1/(2*i + 1)
    if i % 2:
        #print('termino', i+1, ': -', term)
        sum -= term
    else:
        #print('término', i+1,": ", term)
        sum += term

print('resultado', sum * 4)