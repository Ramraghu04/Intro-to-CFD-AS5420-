clc
clear all
close all

h0=pi/4;
n=23;
h=pi/4;
dh=linspace(0,h,n+1);
dx=0.5

dh2(1)=h;
for i=2:n+1
    dh2(i)=h*(dx);
end

for i=1:n+1
    forward_diff(i)=(sin(h0+dh(i))-sin(h0))/dh(i);
    backward_diff(i)=(sin(h0)-sin(h0-dh(i)))/dh(i);
    central_diff(i)=(sin(h0+dh(i))-sin(h0-dh(i)))/(2*dh(i));

end
 
for j=1:n+1
    e_forward(j)=abs(cos(h0)-forward_diff(j))/abs(cos(h0));
    e_backward(j)=abs(cos(h0)-backward_diff(j))/abs(cos(h0));
    e_central(j)=abs(cos(h0)-central_diff(j))/abs(cos(h0));
end

figure()
plot(dh,e_central,'-r')
hold on
plot(dh,e_backward,'-g')
hold on
plot(dh,e_forward,'-k')
legend('central','backward','forward')
xlabel('dh')
ylabel('error')