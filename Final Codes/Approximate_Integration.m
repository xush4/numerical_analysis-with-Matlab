function [sum, pt, Wt] = Approximate_Integration(fn, d, dim, nspd, ptg, Wg)
% Approximate Integration on one cell
A = (d(2:end, :) - repmat(d(1, :), dim, 1))';
shift = d(1, :)';
pt = A*ptg + repmat(shift, 1, nspd);
Wt = Wg*det(A);
sum = dot(Wt, fn.h(pt));
%------------------------------------------------------------