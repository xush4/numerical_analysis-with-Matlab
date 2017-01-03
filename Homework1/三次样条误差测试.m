function [h]=Clamped_Cubic_Spline(n)
clf
h=10/n
x = -5:5;  
y = 1./(1+x.^2);
xx = -5:10/n:5;
yy = 1./(1+xx.^2);
pp=plot(xx,yy,'r');
plot(xx,yy,'r');
hold on
x0=[-5:0.005:5];
y0=1./(1+x0.^2);
plot(x0,y0,'-b')
legend('Origin','Interpolation')
for i=1:2000
    for k=1: n
        if x0(i)>=x(k)&x0(i)<x(k+1)
            y=a(k,1)*x0(i)^3+a(k,2)*x0(i)^2+a(k,3)*x0(i)^1+a(k,4)*x0(i)^0;
            error(i)=abs(yi-y0(i));
        end
    end
end
inferror=max(error)