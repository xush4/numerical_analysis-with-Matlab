format long
clear; e=0;
A1=[2,1,2;1,2,3;4,1,2];
A=A1;
[L,U,Pf]=LU_partial(A);
e(1,1)=norm((Pf*A-L*U),'fro')/(norm(L,'fro')*norm(U,'fro'));
e(1,2)=norm((Pf*A-L*U),'fro')/norm(A,'fro');

A2=[10,1,1;1,10,1;1,1,20];
A=A2;
[L,U,Pf]=LU_partial(A);
e(2,1)=norm((Pf*A-L*U),'fro')/(norm(L,'fro')*norm(U,'fro'));
e(2,2)=norm((Pf*A-L*U),'fro')/norm(A,'fro');

A3 = hilb(5);
A=A3;
[L,U,Pf]=LU_partial(A);
e(3,1)=norm((Pf*A-L*U),'fro')/(norm(L,'fro')*norm(U,'fro'));
e(3,2)=norm((Pf*A-L*U),'fro')/norm(A,'fro');

A4 = hilb(10);
A=A4;
[L,U,Pf]=LU_partial(A);
e(4,1)=norm((Pf*A-L*U),'fro')/(norm(L,'fro')*norm(U,'fro'));
e(4,2)=norm((Pf*A-L*U),'fro')/norm(A,'fro');

A5 = hilb(20);
A=A5;
[L,U,Pf]=LU_partial(A);
e(5,1)=norm((Pf*A-L*U),'fro')/(norm(L,'fro')*norm(U,'fro'));
e(5,2)=norm((Pf*A-L*U),'fro')/norm(A,'fro');
e