import numpy as np
import matplotlib.pyplot as plt
import math as m


p=101325 #pa
T=300   #K
u=0  #m/s
R=287 
rho=p/(R*T)
Cv=718 #J/kg-K
Et=Cv*T+u**2/2
g=1.4
Q=[rho,rho*u,rho*Et]
#Q=np.transpose(Q)
#print(Q)





def GetRho(x):
    rho=np.copy(x[0])
    return rho
def GetU(x):
    u=x[1]/x[0]
    return u
def GetT(x):
    u=x[1]/x[0]
    Et=x[2]/x[0]
    T=(Et-u**2/2)/Cv
    return T
def GetP(x):
    return GetRho(x)*R*GetT(x)
def Getvar(x):
    return np.array([GetP(x),GetRho(x),GetT(x),GetU(x)])
def GetEt(x):
    return x[2]/x[0]
def GetA(x):
   datatype=np.dtype(np.double)
   a=GetU(x)
   b=GetEt(x)

   return np.array([[0,1,0],[0.5*(g-3)*a**2,(3-g)*a,(g-1)],[(g-1)*u**3-g*np.dot(b,a),g*b-1.3*(g-1)*u**2,g*a]],dtype=datatype)

def GetE(x):
    return np.dot(GetA(x),x)
def GetQtil(x):
    return np.array([GetRho(x),GetU(x),GetP(x)])
def GetAtil(x):
    return np.array([[GetU(x),GetRho(x),0],[0,GetU(x),1/GetRho(x)],[0,g*GetP(x),GetU(x)]])

#print(np.dot(GetA(Q),Q))
