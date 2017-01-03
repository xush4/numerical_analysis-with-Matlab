function [out,t] = Iteration_Newton_Method( x0,eps )
%NEWTON_METHOD
%Iteration_Newton_Method([1,1]) and Iteration_Newton_Method([1,-1]) for
%test.
format long
if(nargin==1)
    eps=1.0e-8;     %缺省精度为0.00000001
end;
syms x1 x2
f1=x1^2+x2^2-1;
f2=(x1-1)^2+x2^2-1;
fun=[f1 f2];
dfun=differentiate_function( fun );
con=0;
t=0;
while (con==0)
f=double(subs(fun,{'x1' 'x2'},{x0(1) x0(2)})); 
df=subs(dfun,{'x1' 'x2'},{x0(1) x0(2)}); 
df=double(conj(df));
out= double(x0'- df^(-1)*f')';
if norm(out-x0)<eps ;
con=1;
end
x0=out; 
t=t+1;
end
end

