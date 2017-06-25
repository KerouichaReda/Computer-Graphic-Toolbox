function [ gc ] = gammacorrect( x,gamma )
% gammacorrect: the gamma correct function
%
% x:initial value
% gamma =correction power
gc=x.^(1/gamma);
end  % gammacorrect
