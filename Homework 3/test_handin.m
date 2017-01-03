t=zeros(5,8);
for i=4 : 8; %4,5,6,7,8
    n=2^i;
A0=2*eye(n);
A=zeros(n);
b=zeros(n,1);
x=zeros(n,1);
for j=1:(n-1)
A(j+1,j)=-1;  
A(j,j+1)=-1;  
x(j)=1;
end
A=A+A0;
b(1)=1;
b(n)=-1;
D=diag(diag(A));
wR1=1/vrho(A);
wR2=2/[vrho(A)+0.5*min(abs(eig(A)))];
wR3=2/[vrho(A)+min(abs(eig(A)))];
[~,timesR1]= Linear_Richardson( A, b, wR1,x,10^(-6),10^i );
[~,timesR2]= Linear_Richardson( A, b, wR2,x,10^(-6),10^i );
[~,timesR3]= Linear_Richardson( A, b, wR3,x,10^(-6),10^i );
%[~,timesR4]= Linear_Richardson( A, b, 3*wR1,x,10^(-6),10^i );
%timesR4;
t(i-3,1)=timesR1;
t(i-3,2)=timesR2;
t(i-3,3)=timesR3;
[~,timesJ] = Linear_Jacobi( A, b, x, 10^(-6),10^i);
t(i-3,4)=timesJ;
[~,timesGS]=Linear_GaussSeidel( A, b, x, 10^(-6),10^i);
t(i-3,5)=timesGS;
wS1=2/(1+sqrt(1-vrho(eye(length(b))-D^(-1)*A)));
wS2=1;
wS3=(1+sqrt(1-vrho(eye(length(b))-D^(-1)*A)));
[~,timesSOR1]=Linear_SOR( A, b, wS1,x, 10^(-6),10^i);
[~,timesSOR2]=Linear_SOR( A, b, wS2,x, 10^(-6),10^i);
[~,timesSOR3]=Linear_SOR( A, b, wS3,x, 10^(-6),10^i);
t(i-3,6)=timesSOR1;
t(i-3,7)=timesSOR2;
t(i-3,8)=timesSOR3;
%[~,timesSOR4]=Linear_SOR( A, b, 3,x, 10^(-6),10^i);
%timesSOR4
end
