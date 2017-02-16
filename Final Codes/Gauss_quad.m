function [XYZg, Wg] = Gauss_quad(nsp, dim)
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