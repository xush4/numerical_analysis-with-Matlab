function val = integrand1(x)
val = 1.*(x>0)+0.5.*(x==0)+0.*(x<0);