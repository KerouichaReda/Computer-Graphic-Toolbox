function [ C ] = vividlight( A,B )
%VIVIDLIGHT Summary of this function goes here
%   Detailed explanation goes here
C=(A<=0.5).*(1-(1-B)./(2*A))+(A>0.5).*(B./(2.*(1-A)));

end

