n=5
clf
h=10/n;
x=[-5:10/n:5];
y=1./(1+x.^2);
x0=[-5:1:5];
y0=1./(1+x0.^2);
y1=1./(1+x.^2);
plot(x,y,'--r')
%插值曲线
hold on
%原曲线
plot(x0,y0,'-b')
for i=1:10
    for k=1: n
        if x0(i)>=x(k)&x0(i)<x(k+1)
            slopei=(y(k)-y(k+1))/(x(k)-x(k+1))
            ki=y(k)-slopei*x(k)
            yi=slopei*x0(i)+ki
            error(i)=abs(yi-y0(i))
        end
    end
end
inferror=max(error)
legend('Interpolation','Origin')
xlabel(['The error is',num2str(inferror)])
title(['Piecewise Linear Interpolation with h=',num2str(h),'(',num2str(n),'points)'])