clc
clear all
close all

h0=pi/4;
n=10;
n1=2;

%x=linspace(0,pi,n+1);
dx=linspace(0,pi/4,n1+1);
x=ones(1,n1+1)*pi/4;
%e_central(x,dx)

%plot(dx,e_central(pi/4,dx),"-r")
%hold on 
%plot(dx,e_forward(x,dx),"-g")
%hold on
%plot(dx,e_backward(x,dx),"-k")
%legend("central","forward","backward")
%xlabel("dx")
%ylabel("error")
%forward_diff(dx)=(sin(x+dx)-sin(x))/dx;
%backward_diff(dx)=(sin(x+dx)-sin(x))/dx;
%central_diff(dx)=(sin(x+dx)-sin(x-dx))/(2*dx);

%e_forward=abs(cos(x)-forward_diff(x,dx))/abs(cos(x));
e_backward=abs(cos(x)-backward_diff(x,dx))/abs(cos(x));
%e_central=abs(cos(x)-cent%ral_diff(x,dx))/abs(cos(x));

function a1=forward_diff(x1,x2)
a1=(sin(x1+x2)-sin(x1))/x2;
end
function a2=backward_diff(x1,x2)
a2=(sin(x1+x2)-sin(x1))/x2;
end
function a3=central_diff(x1,x2)
a3=(sin(x1+x2)-sin(x1-x2))/(2*x2);
end
function a4=e_forward(x1,x2)
a4=abs(cos(x1)-forward_diff(x1,x2))/abs(cos(x1));
end
function a5=e_backward(x1,x2)
a5=abs(cos(x1)-backward_diff(x1,x2))/abs(cos(x1));
end
function a6=e_central(x1,x2)
a6=abs(cos(x1)-central_diff(x1,x2))/abs(cos(x1));
end

