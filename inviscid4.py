import numpy as np
import matplotlib.pyplot as plt

#from inviscid1 import *
from inviscid3 import *

Po=101325
To=300
uo=0

Pa=84000
Ta=300
ua=0

dt=0.00001
n=11

error=1
i=0
err=[]
epsilon=0.00001
Qo,Eo=Init(Po,To,uo,Pa,Ta,ua,n)
for i in range(1000):
    Q_new,E_new=ftcs(Qo,Eo,Pa,Ta,Po,To,n,dt)
    diff=Q_new-Qo
    error=np.linalg.norm(diff)
    #diff2=np.array(E_new)-np.array(Eo)
    #error2=np.linalg.norm(diff2)
    print(error)
    #print(error2)
    Qo=np.copy(Q_new)
    Eo=np.copy(E_new)
    err.append(error)
    i=i+1
    print(i)


