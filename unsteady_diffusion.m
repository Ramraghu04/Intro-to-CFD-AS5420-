clc
clear all
close all

n=51;
dom_length=1;
d_l=dom_length/(n-1);
x=0:d_l:dom_length;
y=0:d_l:dom_length;
r=[];
r_new=[];
for i=1:n
  r(i,1)=x(i).^2-y(1).^2;
  r(i,n)=x(i).^2-y(n).^2;
  r(1,i)=x(1).^2-y(i).^2;
  r(n,i)=x(n).^2-y(i).^2;
end
r_new=r;
error_mag=1;
error_tol=0.001;
dt=0.0001
z=0;
d=0;
while error_mag>error_tol
  for i=2:(n-1)
    for j=2:(n-1)
      r_new(i,j)=r(i,j)+dt*(r(i+1,j)+r(i-1,j)+r(i,j+1)+r(i,j-1)-4*r(i,j))/d_l.^2;
      z=z+1;
    end
  end


  t=0;

  for i=2:(n-1)
    for j=2:(n-1)
      error_mag=error_mag+abs(r_new(i,j)-r(i,j));
      
    end

  end

r=r_new;

end



