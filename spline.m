clc
clear all
%%
x=0:2*pi/11:2*pi;
xx=0:pi/25:2*pi;
y=sin(x);
yy=interp1(x,y,xx,'cubic');
figure()
plot(xx,yy)
%%
n=30;
x=linspace(0,2*pi,11);
x2=0:2*pi/10:2*pi;


figure()
tiledlayout(5,6);
for i=1:n
    nexttile

    plot(x2,sin(i*x2),'-o');
    title('sin',i)
end
%%
n=30;
x=0:2*pi/11:2*pi;
xx=0:pi/25:2*pi;
figure()
tiledlayout(5,6);
for i=1:n
    nexttile
    yy=sin(i*x);
    plot(x,yy,'-o')
    title('cubic sin',i)
end
%%
clc
clear all
%%
x=0:2*pi/11:2*pi;
xx=0:2*pi/11:2*pi;
y=sin(x);
yy=interp1(x,y,xx,'spline');
figure()
plot(xx,yy)
%%
n=10;
x=linspace(0,2*pi,11);
x2=0:2*pi/n:2*pi;


figure()
tiledlayout(5,2);
for i=1:n
    nexttile
    
    plot(x2,sin(i*x2),'-o');
    title('sin',i)
end
%%
n=30;
x=0:2*pi/11:2*pi;
xx=0:pi/25:2*pi;
figure()
tiledlayout(5,6);
for i=1:n
    nexttile
    yy=interp1(x,sin(i*x),xx,'cubic');
    plot(xx,yy,'-o')
    title('cubic sin',i)
end


