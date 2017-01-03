function [ out,t ] = Iteration_BR1_Method( x0,eps)
% Broyden Method I
% Iteration_BR1_Method([1;1]) and Iteration_BR1_Method([1;-1]) for test.
% x0 is initial guess. eps is error. BO has been set to I.
format long
if(nargin==1)
    eps=1.0e-8;     %缺省精度为0.00000001
end;
syms x1 x2
f1=x1^2+x2^2-1;
f2=(x1-1)^2+x2^2-1;
fun=[f1 f2];
con=0;
B0=[1,0;0,1];
I=[1,0;0,1];
t=0;
while (con==0)
f0=double(subs(fun,{'x1' 'x2'},{x0(1) x0(2)})); 
a=f0';
delta = -B0^(-1)*a;
out=x0+delta;
f1=double(subs(fun,{'x1' 'x2'},{out(1) out(2)}));
s=delta;
v=(f1-f0)';
B0=(B0+(1/(s'*s))*(v-B0*s)*s'*I);
if norm(out-x0)<eps ;
con=1;
end
x0=out;
t=t+1;
end
end



