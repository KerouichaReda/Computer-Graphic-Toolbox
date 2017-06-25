function [ gai ] = gain( x,g )
% gain: the gain function
%
% g=the gain value
% x=the input
gai=(x<0.5).*(bias(1-g,2*x)/2)+(x>=0.5).*(1-bias(1-g,2-2*x)/2);
end  % gain
