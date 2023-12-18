import matplotlib
matplotlib.use('TkAgg')
import numpy as np
import time
import matplotlib.pyplot as plt
pi=np.pi
xf=10
x0=xf/2
D=0.5
N=10
tamanho=1
#Optei por tentar por tudo o que podia em funções separadas, assim fica mais facil controlar

#Resultado analitico de acordo com o programa anterior, mas pode mudar o D pra deixar mais flexivel
def resultado_analitico(xf,x0, D):
    i=0
    a=1
    resultado=0
    for i in range(101):
        a=a+2*i
        resultado += 16 * (xf ** 2) * ((-1) ** i) * np.cos(pi * a * x0 / (2 * xf)) / ((a ** 3) * (pi ** 3) * D)
  
    return  resultado
    
#função separada que conta somente o tempo do caminhante, da pra mudar e salvar os passos.
def caminhante(xf,x0, tamanho):
    posicao=x0
    num=0
    tempo=0
    while posicao<xf:
        num=np.random.randint(2)
        if posicao==0:
            posicao=posicao+tamanho
        if num==0:
            posicao=posicao-tamanho
        else:
            posicao=posicao+tamanho
        tempo=tempo+1
    return tempo

#até aqui MFPT somente, considerando numero de caminhantes
b=0
mfpt=np.zeros(N)
t=np.zeros(N)
for b in range(N):
    t[b]=caminhante(xf,x0,tamanho)
    mfpt=np.sum(t)/N
print(t)
print("MFPT:")
print(mfpt)
print("\n")
#tamanho2=np.zeros(10)
print(resultado_analitico(xf,x0,D))
print("\n")
print(caminhante(xf,x0,tamanho))
print("\n")
#Como o D está  fixado em 0.5 e ele é função do tamanho do passo
#vou alterar o tamanho da linha xf para fazer a comparação do mfpt de forma correta
#caso contrário não fecha com o resultado analitico
#DESTA PARTE AQUI:
f=0
mfptpasso=np.zeros(N)
mfpttodos=[]
resanalitico=[]
tam=np.zeros(N)
#aqui tamanho variavel da linha!
for f in np.arange(10,110,10):
        x0=f/2
        xf=f
        #aqui em baixo o numero de caminhantes
        for b in range(N):
            tam[b]=caminhante(xf,x0,tamanho)
            mfptpasso=np.sum(tam)/N
        #aqui eu to coletando as informaçoes por tam de passo, apos N caminhantes cairem!    
        mfpttodos.append(mfptpasso)
        #aqui como o resultado analitico varia com diferentes tamanhos de linha
        resanalitico.append(resultado_analitico(xf,x0,D))
        print("resultado analitico:\n")
        print(f)
        print("\n")
        print(resultado_analitico(xf,x0,D))
print("\n tam: ")
#print(tam)
print("\n mfpt tamanho:")
print(mfpttodos)
print(resultado_analitico(xf,x0,D))
print(resanalitico)
print("\n")
#ATE AQUI é onde eu to calculando diferentes resultados analiticos e diferentes MFPT para
#diferentes tamanhos de passos, no caso, tamanhos de linha! Funcionou, mas pode ficar lento
#porque é muita coisa, o erro é só por o MFPT - resultado analitico



