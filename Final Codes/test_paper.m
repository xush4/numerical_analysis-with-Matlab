%d = [0;1];
d = [0,0,0;1,0,0;0,1,0;0,0,1];
%With the above setting, the adaptive quadrature function can be called.
%fn(1).h = @integrand1; % Heaviside Function
fn(1).h = @integrand2; %100*exp(-100*r)
%fn(1).h = @integrand3; % 1.*(x>0 & x<=1).*integrand2 + x.*0.5.*(x>1)+0.*(x<=0);
%fn(1).h = @integrand4; %0.5.*(x>pi/4)+0.1.*(x<pi/4)+0.3.*(x==pi/4);
X=0;
W=0;
%[X, W] = Adaptive_Gausspt_integration(fn, d, [5,8], 1e-6);
 [X, W] = Adaptive_Gausspt_integration(fn, d, [3,9], 1e-6);
%double(X*W)
val=0;
for i=1:length(X)
   %val=val+ W(i)*integrand1(X(i))
   val=val+ W(i)*integrand2(X(i));
   %val=val+ W(i)*integrand3(X(i));
   %val=val+ W(i)*integrand4(X(i));
end
val
plot(X)