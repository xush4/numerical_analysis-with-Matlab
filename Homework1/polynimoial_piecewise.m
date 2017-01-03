%polynimoial_piecewise
function [h,inferror]=polynimoial_piecewise(n)
clf
h=10/n;
x=[-5:10/n:5];
y=1./(1+x.^2);
x0=[-5:0.005:5];
y0=1./(1+x0.^2);
y1=1./(1+x.^2);
plot(x,y,'--r')
%Interpolation
hold on
%Origin
plot(x0,y0,'-b')
for i=1:2000
    for k=1: n
        if x0(i)>=x(k)&x0(i)<x(k+1)
            slopei=(y(k)-y(k+1))/(x(k)-x(k+1))
            ki=y(k)-slopei*x(k)
            y1(i)=slopei*x0(i)+ki
            error(i)=abs(y1(i)-y0(i))
        end
    end
end

inferror=max(error)
legend('Interpolation','Origin')
xlabel(['The error is',num2str(inferror)])
title(['Piecewise Linear Interpolation with h=',num2str(h),'(',num2str(n),'points)'])