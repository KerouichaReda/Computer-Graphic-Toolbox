function [ C ] = darken( A,B)
%DARKEN Summary of this function goes here
%   Detailed explanation goes here
C=B.*(A>=B)+A.*(B>A);

end

