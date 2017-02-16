function I = incrementI(I, dim)
% Keep track of the vectors that construct the current cell
I(1) = I(1) + 1;
for i = 1:(dim-1)
if (I(i) == 1), break; end
I(i) = 0;
I(i+1) = I(i+1) + 1;
end