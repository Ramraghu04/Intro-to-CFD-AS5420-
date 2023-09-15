%Not proper 
clc
clear all
n=11;
n2=2;
m=50;
xn=0:2*pi/m:2*pi;
x=0:2*pi/(n-1):2*pi;
x1=x(1:n-1);
x2=x(2:n);
i=1;
h=2*pi/(n-1);
c=f(x1,i);
c1=g(x1,i).*(h)/3 + c;
c3=f(x2,i);
c2=c3-g(x2,i)*h/3;


for i=1:n2
    figure(i)
    plot(x(1:n-1),Y(x(1:n-1),c3,c2,c1,c),'-o')
end
















function [a]=alp(x)

a=5*(x-(pi/5))/pi;
end

function [n0]=N0(x)

n0=alp(x).^3;
end

function [n1]=N1(x)

n1=3*(alp(x).^2).*(1-alp(x));
end
function [n2]=N2(x)

n2=3*((1-alp(x)).^2).*(alp(x));
end

function [n3]=N3(x)
n3=(1-alp(x)).^3;
end

function [y]=Y(x,c,c1,c2,c3)
y=c.*N0(x)+c1.*N1(x)+c2.*N2(x)+c3.*N3(x);
end

function [s]=f(x,i)
s=sin(i*x);
end
function [f]=g(x,i)
f=i*cos(i*x);
end