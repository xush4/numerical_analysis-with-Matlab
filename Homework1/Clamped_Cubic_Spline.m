%Clamped_Cubic_Spline
function [h]=Clamped_Cubic_Spline(n)
clf
h=10/n
x = -5.:h:5.;  
y = 1./(1+x.^2);
xx = -5.:h/500:5.;
yy = spline(x,y,xx);
plot(xx,yy,'r')
hold on
x0=[-5:0.005:5];
y0=1./(1+x0.^2);
plot(x0,y0,'-b')
legend('Interpolation','Origin')
x1 = x;
y1=1./(1+x1.^2)
pp=spline(x1,y1)
a=pp.coefs
for i=1:2000
            yi=spline(x1,y1,x0(i))
            error(i)=abs(yi-y0(i))
end
inferror=max(error)
xlabel(['The error is',num2str(inferror)])
title(['Cubic Spline Interpolation with h=',num2str(h),'(',num2str(n),'points)'])