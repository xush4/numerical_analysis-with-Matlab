function val = integrand3(x)
r = sqrt(sum(x.^2,1));     %the vector with elements 
                % as square of v's elements
val1=100*exp(-100*r);
val = 1.*(x>0 & x<=1).*val1 + x.*0.5.*(x>1)+0.*(x<=0);