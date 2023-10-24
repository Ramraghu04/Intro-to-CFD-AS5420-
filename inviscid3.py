import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

from inviscid1 import * 

def Init(Po,To,uo,Pa,Ta,ua,n):
   R=287
   Cv=718
   g=1.4
   #Inlet and exit conditions
   #Po=101325
   #To=300 
   #uo=0 #m/s
   R=287 
   rho_o=Po/(R*To)
   Cv=718 #J/kg-K
   Eto=Cv*To+uo**2/2
   
   #Pa=84000
   #Ta=300
   #ua=0
   rho_a=Pa/(R*Ta)
   Cv=718 #J/kg-K
   Eta=Cv*Ta+ua**2/2
   
   #n=11
   
   Q=[]
   Q_n=[]
   Q.append([rho_o,rho*uo,rho*Eto])
   for i in range(1,n):
      Q.append([rho_a,rho_a*ua,rho_a*Eta])
   #print(Q[10])
   Q_n=np.copy(Q)
   
   E=[]
   E_n=[]
   x=np.copy(GetE(Q[0]))
   E.append(x)
   for i in range(1,n):
      x2=GetE(np.copy(Q[i]))
      E.append(x)
   E_n=np.copy(E)
   return Q,E
#print(E[0])
def ftcs(Q,E,Pa,Ta,Po,To,n,dt):
   Q_n=np.copy(Q)
   Cv=718
   Eto=Cv*To
   dt=0.001
   dx=1/(n-1)
   sigma=dt/dx
   sigma=0.0001
   #print(E[0],E[1]-E[2])
   for i in range(1,n-1):
      Q_n[i]=np.copy(Q[i])-(sigma/2)*(E[i+1]-E[i-1])
   
   Q=np.copy(Q_n)
   #print(GetU(Q[1]))
   #getting boundary point values
   u=GetU(Q[1])
   T=To-(g-1)*u**2/(2*R)
   P=Po*(T/To)**(g/(g-1))
   Q[0]=[P/(R*T),P/(R*T)*u,P/(R*T)*Eto]
   
   E[0]=GetE(Q[0])
   #print(E)
   #getting final condition
   u2=GetU(Q[n-2])
   T2=To-(g-1)*u2**2/(2*R)
   P2=Pa*(T/Ta)**(g/(g-1))
   Q[n-1]=[P2/(R*T2),P2/(R*T2)*u2,P2/(R*T2)*Eto] ######
   
   E[n-1]=GetE(Q[n-1])
   return Q,E







   



