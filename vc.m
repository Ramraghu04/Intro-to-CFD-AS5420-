clc
clear all
%%
n=5;
x=0:2*pi/(n-1):2*pi;
xx=0:2*pi/(50):2*pi
y=interp1(x,sin(x),xx,'cubic');
figure()
plot(xx,y,'-o')