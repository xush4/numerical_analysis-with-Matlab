function [ out,t ] = Iteration_BR2_Method( x0,eps)
% Broyden Method II
% x0 is initial guess. eps is error. HO has been set to I.
% Iteration_BR2_Method([1;1]) and Iteration_BR2_Method([1;-1]) for test.
format long
if(nargin==1)
    eps=1.0e-8;     %缺省精度为0.00000001
end;
syms x1 x2
f1=x1^2+x2^2-1;
f2=(x1-1)^2+x2^2-1;
fun=[f1 f2];
con=0;
H0=[1,0;0,1];
t=0;
while (con==0)
f0=double(subs(fun,{'x1' 'x2'},{x0(1) x0(2)})); 
a=f0';
delta = -H0*a;
out=x0+delta;
f1=double(subs(fun,{'x1' 'x2'},{out(1) out(2)}));
s=delta;
v=(f1-f0)';
H0=H0+(s-H0*v)*s'*H0/(s'*H0*v);
if norm(out-x0)<eps ;
con=1;
end
x0=out;
t=t+1;
end
end