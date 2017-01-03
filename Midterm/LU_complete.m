function [L,U,P,Q] = LU_complete( A )
format long
% This function performs LU factorization for a matrix A. The function
% returns the lower and upper triangular matrices as separate matrices. It 
% also returns matrices P and Q indicating the row and column exchanges, 
% respectively. The function uses complete pivoting, such that PAQ = LU. 
[m,n]=size(A);
if m~=n, error(' A matrix needs to be square'); end 
dim = length(A);
% Initialize P and Q to the identity matrices.
P = eye(dim);
Q = eye(dim);
% For each row in A,
for i=1:dim-1,
% Find the element with largest magnitude in each
% submatrix which will be the new pivot.
pivot = max(max(abs(A([i:dim],[i:dim]))));
% find the indeces of the new pivot
[x,y] = find(abs(A([i:dim],[i:dim])) == pivot);
if i~=1;
x(1) = x(1) + (i-1);
y(1) = y(1) + (i-1);
end;
% interchange the rows and columns
A([i,x(1)],:) = A([x(1),i],:);
A(:,[i,y(1)]) = A(:,[y(1),i]);
% store the changes in the matrices P and Q
P([i,x(1)],:) = P([x(1),i],:);
Q(:,[i,y(1)]) = Q(:,[y(1),i]);
% Compute the factor.
for k = i+1:n     
A(k,i)=A(k,i)/pivot;    
A(k,i+1:n)=A(k,i+1:n)-A(k,i)*A(i,i+1:n);     
end 
end
% The U factor is the upper triangle of A, with zeros in the lower triangle.
U = triu(A);
% The L factor is the lower triangle of A, with zeros in the lower triangle and ones along the main diagonal.
L = tril(A,-1) + eye(dim);
