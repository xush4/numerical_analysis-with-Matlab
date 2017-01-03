%  forward euler method
function   [x,y] = Forward_Euler ( f, y0, a, b, h ) 
y ( 1 ) = y0 ;
n = ( b - a ) / h;
x = a : h : b;
for i = 1 : n
    y ( i +1 ) = y ( i ) + h * feval ( f, y ( i ) ) ;
end;