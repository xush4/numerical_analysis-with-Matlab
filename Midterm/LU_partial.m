function [L,U,Pf]=LU_partial(A)
%LU factorization with partial (Row) pivoting 
%LU_partial :LU factorization with partial pivoting  
%Synopsis:   [L,U,pf]=LU_partial(A) 

%Input:      A = coefficient matrix 
%Output:     L :lower triangular matrix 
%            U :upper triangular matrix 
%            Pf:b¡úPf*b   b=b(pf) 
format long
[m,n]=size(A);
if m~=n, error(' A matrix needs to be square'); end 
P = (1:n)'; 
for i=1:n-1  
% Partial pivoting for column i    
[pivot,p] = max(abs(A(i:n,i)));    
kk = p + i -1;     
if kk ~= i 
      
A([i kk],:) = A([kk i],:);       
P([i kk]) = P([kk i]);    
end
% end of partial pivoting for column i.
% LU factorization (Solving Matrix)    
pivot = A(i,i);     
for k = i+1:n     
A(k,i)=A(k,i)/pivot;    
A(k,i+1:n)=A(k,i+1:n)-A(k,i)*A(i,i+1:n);     
end 
end
% Output P matrix
Pf=zeros(length(P),length(P));
for i=1:length(P)
Pf(i,P(i,1))=1;
end
L = eye(size(A))+tril(A,-1);   %extract L and U  
U = triu(A);