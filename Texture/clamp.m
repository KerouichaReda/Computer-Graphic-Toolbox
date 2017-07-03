function [ out ] = clamp( a,b,x)
% clamp: the clamp functin
%
% A:the left part
% B:the right part
% C:the input
out=a.*(x<a)+b.*(x>b)+x.*(x>=a & x<=b);
end  % clamp
