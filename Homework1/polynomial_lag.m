%lagrange插值
function polynimoial_lag( n )
x=[-5:10/n:5];
y=1./(1+x.^2);
x0=[-5:1/n:5];
y0=lagrange(x,y,x0);
y1=1./(1+x0.^2);
plot(x0,y0,'--r')
%插值曲线
hold on
%原曲线
plot(x0,y1,'-b')