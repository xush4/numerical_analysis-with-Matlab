syms y
f=@(y) 6*y-6*y^2;

h=[0.5,0.25,0.1];
y0=0.5;a=0;b=20;tol=1e-6;
[FEx1,FEy1]= Forward_Euler ( f, y0, a, b, h(1) ) ;
[FEx2,FEy2]= Forward_Euler ( f, y0, a, b, h(2) ) ;
[FEx3,FEy3]= Forward_Euler ( f, y0, a, b, h(3) ) ;
plot(FEx1,FEy1,FEx2,FEy2,FEx3,FEy3)
 

%[BEx1,BEy1]= Backward_euler ( f, y0, a, b, h(1), tol ) ;
%[BEx2,BEy2]= Backward_euler ( f, y0, a, b, h(2), tol );
% not convergent because y_n+1 can not be solved with iteration.
[BEx3,BEy3]= Backward_euler ( f, y0, a, b, h(3), tol );
figure; plot(BEx3,BEy3)
 
%[CNx1,CNy1]= CN_Method ( f, y0, a, b, h(1),tol ) ;
% not convergent because y_n+1 can not be solved with iteration.
[CNx2,CNy2]= CN_Method ( f, y0, a, b, h(2),tol ) ;
[CNx3,CNy3]= CN_Method ( f, y0, a, b, h(3),tol ) ;
figure; plot(CNx2,CNy2,CNx3,CNy3)

[RKx1,RKy1]= RK4( f, y0, a, b, h(1)) ;
[RKx2,RKy2]= RK4( f, y0, a, b, h(2)) ;
[RKx3,RKy3]= RK4( f, y0, a, b, h(3));
figure; plot(RKx1,RKy1,RKx2,RKy2,RKx3,RKy3)
