clc
clear all
close all

%%
n=10;
x=linspace(0,2*pi,11);
x2=0:2*pi/n:2*pi;


figure()
%tiledlayout(5,2);
for i=1:n
    plot(x2,sin(i*x2),'-o');
    title('sin',i)
end





