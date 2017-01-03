function I=AdaptiveSimpson(f,a,b,eps) %Recursive
format long
if(nargin==3)
    eps=1.0e-8;     %缺省精度为0.00000001
end;
I=double(quadSimpson(f,a,b,eps));

function q=quadSimpson(f,a,b,eps)
QA=IntSimpson(f,a,b);
QLeft=IntSimpson(f,a,(a+b)/2);
QRight=IntSimpson(f,(a+b)/2,b);
if(abs(QLeft+QRight-QA)<=15*eps*(b-a))
    q=QLeft+QRight;
else
    q=quadSimpson(f,a,(a+b)/2,eps)+quadSimpson(f,(a+b)/2,b,eps);   
end
function I = IntSimpson(f,a,b)   
format long
        I=((b-a)/6)*(subs(sym(f),findsym(sym(f)),a)+...
            4*subs(sym(f),findsym(sym(f)),(a+b)/2)+...
            subs(sym(f),findsym(sym(f)),b));
