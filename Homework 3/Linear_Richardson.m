function [ out, i ] = Linear_Richardson( A, b, w, x0, eps, N)
% Ax=b. Solve x. 
% Richardson method: B=w*I; 0<w<2/max{eigenvalue}.

if(nargin==2)
    n=length(b);
    w=2/[vrho(A)+min(abs(eig(A)))];
    eps=1.0e-6;     %缺省精度为0.00000001
    N=4000;
    x0=eye(n,1);
end;
if(nargin==3)
    n=length(b);
    eps=1.0e-6;     %缺省精度为0.00000001
    N=4000;
    x0=eye(n,1);
end;
if(nargin==4)
    n=length(b);
    eps=1.0e-6;     %缺省精度为0.00000001
    N=4000;
end;

[m,n]=size(A);
if m~=n, error(' A matrix needs to be square'); end 
k=length(b);
if m~=k, error(' Check your A and b'); end 
I=eye(n);
B=w*I;

for i=1:N
out=x0+B*(b-A*x0);
if norm(out-x0)/norm(b)<eps ;
    break
end
x0=out;
end
end

