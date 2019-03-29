# Aproximar hasta que los primeros N dígitos sean siempre correctos
pres = int(input('digitos de presición (hasta 75): '))
pi = '3.14159265358979323846264338327950288419716939937510582097494459230781640628'
if (pres < 0) or (pres > 75) :
    print("precisión no válida")
    exit()

sum = 0
i = 0
conv = False
while True:
    term = 1/(2*i + 1)
    if i % 2:
        sum -= term
    else:
        sum += term

    ssum = str(4*sum)
    #print(ssum, i)
    if i == 2:
         pres += 1
    if ssum[0:pres] == pi[0:pres]  and conv:
        break
    elif conv:
        conv = False
    elif ssum[0:pres] == pi[0:pres]:
        conv = True
    i+=1

print('resultado: ', sum * 4, 'it: ', i)