function val = integrand2(x)
r = sqrt(sum(x.^2,1));     %the vector with elements 
                % as square of v's elements
val=100*exp(-100*r);