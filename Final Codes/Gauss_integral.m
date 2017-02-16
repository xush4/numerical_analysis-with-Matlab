clc
%利用Gauss积分公式计算[a,b]上的积分
c=input('积分函数,c=0,f(x)=cos x;c=1,f(x)=x^2;c=2,f(x)=exp(x^2)');
a=input('积分下限');
b=input('积分上限');
m=input('积分区间的数目');
n=input('每个区间上积分点的数目');
h=(b-a)/m;
x(1)=a;
for j=1:m
    x(j+1)=x(j)+h;
end
[t,wf]=gausspw(n);
int=0;
for i=1:m
    med=sum(wf.*intf((x(i)+x(i+1))/2+h*t/2,c));
    int=int+med;
end
int=int*h/2;




