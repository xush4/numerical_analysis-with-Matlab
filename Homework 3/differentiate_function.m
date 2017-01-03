function df = differentiate_function( f )
%NEWTON_METHOD 此处显示有关此函数的摘要
%   此处显示详细说明
df=[diff(f,'x1');diff(f,'x2')];
df=conj(df');
end