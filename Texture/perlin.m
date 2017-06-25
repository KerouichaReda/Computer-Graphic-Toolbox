function [ out ] = perlin( x,y,g )
% perlin: Short description
%
% Extended description
% Determine grid cell coordinates
global Gradient;
Gradient=g;
x0 = floor(x);
x1 = x0 + 1;
y0 = floor(y);
y1 = y0 + 1;

% Determine interpolation weights
% Could also use higher order polynomial/s-curve here
sx = x -x0;
sy = y - y0;

sx=6*sx^5-15*sx^4+10*sx^3;
sy=6*sy^5-15*sy^4+10*sy^3;
% Interpolate between grid point gradients
n0 = dotGridGradient(x0, y0, x, y);
n1 = dotGridGradient(x1, y0, x, y);
ix0 = lerp(n0, n1, sx);
n0 = dotGridGradient(x0, y1, x, y);
n1 = dotGridGradient(x1, y1, x, y);
ix1 = lerp(n0, n1, sx);
out = lerp(ix0, ix1, sy);

end  % perlin



% Function to linearly interpolate between a0 and a1
% Weight w should be in the range [0.0, 1.0]
function out =lerp(a0, a1, w)
  out= (1.0 - w)*a0 + w*a1;
end

% Computes the dot product of the distance and gradient vectors.
function out =dotGridGradient( ix, iy,  x,  y)

    % Precomputed (or otherwise) gradient vectors at each grid node
    global Gradient;

    % Compute the distance vector
     dx = x - double(ix);
     dy = y - double(iy);

    % Compute the dot-product
    out= (dx*Gradient(iy+1,ix+1,1) + dy*Gradient(iy+1,ix+1,2));
end
