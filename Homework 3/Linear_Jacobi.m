function [ out, i ] = Linear_Jacobi( A, b, x0, eps, N)
% Ax=b. Solve x. 
% Jacobi method: B=D^(-1); 0<w<2/max{eigenvalue}.
if(nargin==3)
    eps=1.0e-6;     %缺省精度为0.00000001
    N=4000;
end;
if(nargin==4)
    N=4000;     %缺省精度为0.00000001
end;
[m,n]=size(A);
if m~=n, error(' A matrix needs to be square'); end 
k=length(b);
if m~=k, error(' Check your A and b'); end 
D=diag(diag(A));
for i=1:N
out=x0+D\(b-A*x0);
if norm(out-x0)/norm(b)<eps ;
    break
end
x0=out;
end
end

