function [I]=AdaptiveSimpson(f,a,b,eps) %Recursive
format long
set(0,'RecursionLimit',100000)
if(nargin==3)
    eps=1.0e-8;     %缺省精度为0.00000001
end;
[I]=double(quadSimpson(f,a,b,eps));

function [q]=quadSimpson(f,a,b,eps)
QA=IntSimpson(f,a,b);
QLeft=IntSimpson(f,a,(a+b)/2);
QRight=IntSimpson(f,(a+b)/2,b);
if(abs(QLeft+QRight-QA)<=eps)
    q=QLeft+QRight;
else
    q=quadSimpson(f,a,(a+b)/2,eps)+quadSimpson(f,(a+b)/2,b,eps);  
end

function I = IntSimpson(fn,a,b)   
format long
         I=((b-a)/6)*(fn.h(a)+...
            4*fn.h((a+b)/2)+...
            fn.h(b));