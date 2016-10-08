function [ C ] = softlight( A,B )
%SOFTLIGHT Summary of this function goes here
%   Detailed explanation goes here
C=(A<=0.5).*((2.*A-1).*(B-B.*B)+B)+(A>0.5).*((2*A-1).*(sqrt(B)-B)+B);

end

