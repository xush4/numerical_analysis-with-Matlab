
%The MATLAB code for the quadrature construction follows.
function [X, W] = ndimensional_adaptive_integration(fn, d, nsp, tol)
% External Dependencies (m-files)
% gauss_points(nsp) : 1D Gauss points
% gauss_weights(nsp): 1D Gauss weights
dim = size(d, 2); % dimension
[XYZg1, Wg1] = Get_initial_quad(nsp(1), dim);
[XYZg2, Wg2] = Get_initial_quad(nsp(2), dim);
[X, W] = Adaptive_integration(fn, d, dim, ...
nsp, XYZg1, Wg1, XYZg2, Wg2, tol);
%------------------------------------------------------------
function [XYZ, W] = Adaptive_integration(fn, d, dim, ...
nsp, XYZg1, Wg1, XYZg2, Wg2, tol)
numfun = length(fn);
nspd = nsp.^dim;
PARTITION = zeros(numfun, 1);
for ind = 1:numfun
[integ1, XYZt1, Wt1] = Integrate_over_one_cell(fn(ind), ...
d, dim, nspd(1), XYZg1, Wg1);
integ2 = Integrate_over_one_cell(fn(ind), d, dim, ...
nspd(2), XYZg2, Wg2);
err = abs(integ2 - integ1);
if (err >= tol), PARTITION(ind) = 1; end
end
if any(PARTITION)
two_power_dim = 2^dim;
XYZtemp = cell(1, two_power_dim); Wtemp = XYZtemp;
vectors = (d(2:end, :) - repmat(d(1, :), dim, 1)) / 2;
I = zeros(dim, 1);
for ind = 1:two_power_dim
base = d(1, :);
for j = 1:dim
base = base + (I(j))*vectors(j, :);
end
division = [base; repmat(base, dim, 1) + vectors];
[XYZtemp{ind}, Wtemp{ind}] = Adaptive_integration(...
fn(PARTITION == 1), division, dim, nsp, ...
XYZg1, Wg1, XYZg2, Wg2, tol);
I = incrementI(I, dim);
end
XYZ = []; W = [];
for ind = 1:two_power_dim
XYZ = [XYZ, XYZtemp{ind}];
W = [W; Wtemp{ind}];
end
else
XYZ = XYZt1;
W = Wt1;
end
%------------------------------------------------------------
function [integ, XYZt, Wt] = Integrate_over_one_cell(fn, d, ...
dim, nspd, XYZg, Wg)
A = (d(2:end, :) - repmat(d(1, :), dim, 1))';
shift = d(1, :)';
XYZt = A*XYZg + repmat(shift, 1, nspd);
Wt = Wg*det(A);
integ = dot(Wt, fn.h(XYZt));
%------------------------------------------------------------
function [XYZg, Wg] = Get_initial_quad(nsp, dim)
% Get a nsp^dim point quad over the unit 'dim'-dimensional hypercube
[xg,wg] = lgwt(nsp,0,1);
XYZg = xg;
Wg = wg;
for i = 2:dim
XYZg = repmat(XYZg, nsp, 1);
XYZg(:, i) = reshape(repmat(xg, 1, nsp^(i-1))', 1, nsp^i);
Wg = repmat(Wg, nsp, 1);
Wg(:, i) = reshape(repmat(wg, 1, nsp^(i-1))', 1, nsp^i);
end
XYZg = XYZg';
Wg = prod(Wg, 2);
%------------------------------------------------------------
function I = incrementI(I, dim)
% Keep track of the vectors that construct the current cell
I(1) = I(1) + 1;
for i = 1:(dim-1)
if (I(i) == 1), break; end
I(i) = 0;
I(i+1) = I(i+1) + 1;
end