clc
%����Gauss���ֹ�ʽ����[a,b]�ϵĻ���
c=input('���ֺ���,c=0,f(x)=cos x;c=1,f(x)=x^2;c=2,f(x)=exp(x^2)');
a=input('��������');
b=input('��������');
m=input('�����������Ŀ');
n=input('ÿ�������ϻ��ֵ����Ŀ');
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




