function y=intf(x,c)
%���屻������
if c==0
    y=cos(x);
elseif c==1
    y=x.^2;
elseif c==2
    y=exp(x.^2);
end

