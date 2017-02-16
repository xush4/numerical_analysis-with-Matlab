%fn(1).h = @integrand1;
fn(1).h = @integrand2;
%fn(1).h = @integrand3;
%fn(1).h = @integrand4;
[S,N]=AdaptiveSimpsonC(fn,0,1,1e-6)