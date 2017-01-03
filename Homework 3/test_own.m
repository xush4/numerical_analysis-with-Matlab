A=[2,3;5,-1];
b=[8;3];
x=[0;0];
w=0.2;
[xR,timesR]=Linear_Richardson( A, b )
[xJ,timesJ]=Linear_Jacobi( A, b, x,100)
[xGS,timesGS]=Linear_GaussSeidel( A, b, x)
[xSOR,timesSOR]=Linear_SOR( A, b)