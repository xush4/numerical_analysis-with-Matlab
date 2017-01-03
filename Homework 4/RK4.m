function [T,Y]=RK4( f, y0, a, b, h)
M=(b-a)/h;
T=a:h:b;
Y(1)=y0;
for i=1:M
    k1=h*feval(f,Y(i));
    k2=h*feval(f,Y(i)+k1/2);
    k3=h*feval(f,Y(i)+k2/2);
    k4=h*feval(f,Y(i)+k3);
    Y(i+1)=Y(i)+(k1+2*k2+2*k3+k4)/6;
end