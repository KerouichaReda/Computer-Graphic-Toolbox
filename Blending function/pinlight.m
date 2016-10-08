function [ C ] = pinlight( A,B )
%PINLIGHT Summary of this function goes here
%   Detailed explanation goes here

C=(B<(2*A-1)).*(2*A-1)+(((B>=(2*A-1)) & (B < 2*A)).*B + (B>=2*A).*(2*A));
end

