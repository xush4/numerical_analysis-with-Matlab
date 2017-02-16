function [GaussPt, W] = Adaptive_integration(fn, d, dim, ...
nsp, GaussPtg1, Wg1, GaussPtg2, Wg2, tol)
%Recursive way to Divide and Rule
set(0,'RecursionLimit',50000)
numfun = length(fn);
nspd = nsp.^dim;
PARTITION = zeros(numfun, 1);
for ind = 1:numfun
[integ1, GaussPtt1, Wt1] = Approximate_Integration(fn(ind), ...
d, dim, nspd(1), GaussPtg1, Wg1);
[integ2]= Approximate_Integration(fn(ind), d, dim, ...
nspd(2), GaussPtg2, Wg2);
err = abs(integ2 - integ1);
%  if (err >= tol*abs(max(GaussPtt1)-min(GaussPtt1)))
   if (err >= tol/(nsp(1)*nsp(2)))
       PARTITION(ind) = 1; end
end
if any(PARTITION)
two_power_dim = 2^dim;
GaussPttemp = cell(1, two_power_dim); Wtemp = cell(1, two_power_dim);
vectors = (d(2:end, :) - repmat(d(1, :), dim, 1)) / 2;
I = zeros(dim, 1);
for ind = 1:two_power_dim
base = d(1, :);
    for j = 1:dim
    base = base + (I(j))*vectors(j, :);
    end
division = [base; repmat(base, dim, 1) + vectors];
[GaussPttemp{ind}, Wtemp{ind}] = Adaptive_integration(fn(PARTITION == 1), division, dim, nsp, ...
GaussPtg1, Wg1, GaussPtg2, Wg2, tol);
I = incrementI(I, dim);
end
GaussPt = []; W = [];
for ind = 1:two_power_dim
GaussPt = [GaussPt, GaussPttemp{ind}];
W = [W; Wtemp{ind}];
end
else
GaussPt = GaussPtt1;
W = Wt1;
end
%-----------------------------------------------------------