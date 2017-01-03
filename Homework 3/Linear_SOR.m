function [ out, i ] = Linear_SOR( A, b, w, x0, eps, N)
% Ax=b. Solve x. 
% Richardson method: B=w*I; 0<w<2/max{eigenvalue}.
if(nargin==2)
    n=length(b);
    D=diag(diag(A));
    w=2/(1+sqrt(1-vrho(eye(length(b))-D^(-1)*A)));
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
    eps=1.0e-6;     %缺省精度为0.00000001
    N=4000;
end;

[m,n]=size(A);
if m~=n, error(' A matrix needs to be square'); end 
k=length(b);
if m~=k, error(' Check your A and b'); end 
D=diag(diag(A));
B=inv(w^(-1)*D+tril(A));

for i=1:N
out=x0+B*(b-A*x0);
if norm(out-x0)/norm(b)<eps ;
    break
end
x0=out;
end
end

