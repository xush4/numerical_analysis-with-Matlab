function  [ x, y ] = CN_Method( f, y0, a, b, h, tol )
y ( 1 ) = y0 ;
n = ( b - a ) / h;
x = a : h : b;
for i = 1 : n
    yt = y ( i );
    done = 0;
    while  done==0
        ytt = double(y(i) + 0.5 * h * [feval(f,y(i))+feval(f,yt)]);
        done = ( abs ( ytt - yt ) < tol );
        yt=double(ytt);
    end;
    y(i+1)=ytt;
end;