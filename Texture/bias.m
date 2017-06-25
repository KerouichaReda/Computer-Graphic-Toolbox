function [ bc ] = bias( x,b)
% bias: Short description
%
% Extended description
bc=x.^(log(b)/log(0.5));
end  % bias
