function [h0,inferror,i]=spline3(number)
%Written by Sheng Xu
%number is the interval you hope to get.
%h0 is the mesh size, inferror is the biggest error of the function, 
%i is the number of interval achives the bigggest error.
clf
h0=10/number;
x=[-5:h0:5];
y=1./(1+x.^2);
x0=[-5:0.005:5];
y0=1./(1+x0.^2);
%Origin
plot(x0,y0,'g')
hold on
n=length(x);% n=number+1
h=diff(x);
h(n)=h(n-1);
d = zeros(n,1);
 %Rows 2 to (n-1) of d, (bn on the PPT)
 for i = 2:n-1
    d(i) = (1/h(i))*y(i-1) - ((1/h(i)) + (1/h(i+1)))*y(i) + (1/h(i+1))*y(i+1);
 end
 %Rows 1 and n of b
 d(1) = (2*x(1))/((1+x(1)^2)^2) - (1/h(1))*y(1) + (1/h(1))*y(2);
 d(n) = -(2*x(n))/((1+x(n)^2)^2) + (1/h(n))*y(n-1) - (1/h(n))*y(n);
 d = 6*d;
 
A = zeros(n,n);
 %Rows 2 to (n-1) of A
 for i = 2:(n-1) 
     A(i,i-1) = h(i-1); %Subdiagonal areas
     A(i,i) = 2*(h(i-1)+h(i)); %Diagonal areas
     A(i,i+1) = h(i); %Upper-diagonal areas
 end
 %Rows 1 and n of A
 A(1,1) = 2*h(1);
 A(1,2) = h(1);
 A(n,n) = 2*h(n-1);
 A(n,n-1) = h(n-1);    
M=inv(A)*d;   %Solve the Matrix               
syms g
for k=1:n-1   %Solve for the spline
s(k)=M(k)*(x(k+1)-g)^3/(6*h(k))+M(k+1)*((g-x(k))^3/(6*h(k)))+(y(k)-M(k)*h(k)^2/6)*(x(k+1)-g)/h(k)+(y(k+1)-M(k+1)*h(k)^2/6)*(g-x(k))/h(k)+g^3;
end
for k=1:n-1
    S(k,:)=sym2poly(s(k));  %piecewise splines
end
%fix a calculation problem when n=5
E = zeros(n-1,4);
E(:,1)=1;
a=S-E;
for i=1:2000 %Calculate the error approximately.
    for k=1: n-1
        if x0(i)>=x(k)&x0(i)<x(k+1)
            yi(i)=a(k,1).*x0(i).^3 + a(k,2).*x0(i).^2 + a(k,3).*x0(i)+ a(k,4);
            truey=1./(1.+x0(i).^2);
            error(i)=abs(yi(i)-truey);
        end
    end
end
yi(2001)=a(n-1,1).*x0(2001).^3 + a(n-1,2).*x0(2001).^2 + a(n-1,3).*x0(2001)+ a(n-1,4);
error(2001)=abs(yi(2001)-y0(2001)); %Do not forget the last elements!.
plot(x0,yi,'r')
inferror=max(error);
xlabel(['The error is',num2str(inferror)]) %output everything in figure.
legend('Origin','Interpolation')
title(['Piecewise Linear Interpolation with h=',num2str(h0),'(',num2str(n),'points)'])