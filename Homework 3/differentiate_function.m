function df = differentiate_function( f )
%NEWTON_METHOD �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
df=[diff(f,'x1');diff(f,'x2')];
df=conj(df');
end