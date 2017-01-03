function [h,inferror,i]=Polynimial_piecewise_error_with_derivatives(n)
%Written by Sheng Xu
%polynimoial_piecewise_error_with_derivatives
%Using Derivatives to calculate the error.
%h is the mesh size, inferror is the biggest error of the function, 
%i is the number of interval achives the bigggest error.
clf
format long
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
    for k=1: n
            slopei=(y(k)-y(k+1))/(x(k)-x(k+1));
            ki=y(k)-slopei*x(k);
            F = @(x)  slopei*(1+x^2)*(1+x^2)+2*x;
            maxpoint=fzero(F,x(k));
            yi=slopei*maxpoint+ki;
            y0=1./(1+maxpoint.^2);
            error(k)=abs(yi-y0);
    end
h=10/n
[inferror,i] = max(error)
legend('Interpolation','Origin')
xlabel(['The error is',num2str(inferror)])
title(['Piecewise Linear Interpolation with h=',num2str(h),'(',num2str(n),'points)'])