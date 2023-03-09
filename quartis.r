#formeça a posição e valore correspondente ao 1, 2 e 3 quartis dos elementos:
#56,8,9,3,13,67,43,6,9,12,90

valor = c(56,8,9,3,13,67,43,6,9,12,90)
quant = length(valor)

valor

q1 = 0.25*(quant+1)
q1
q2 = (quant+1)/2
q2
q3 = 0.75*(quant+1)
q3

summary(valor)
