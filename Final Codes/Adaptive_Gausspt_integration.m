function [X, W] = Adaptive_Gausspt_integration(fn, d, nsp, tol)
dim = size(d, 2); % dimension
[GaussPtg1, Wg1] = Gauss_quad(nsp(1), dim);
% Pt and Wt for Estimating Local Error
[GaussPtg2, Wg2] = Gauss_quad(nsp(2), dim);
% Pt and Wt for Estimating Global Error
[X, W] = Adaptive_integration(fn, d, dim, ...
nsp, GaussPtg1, Wg1, GaussPtg2, Wg2, tol);
%------------------------------------------------------------

