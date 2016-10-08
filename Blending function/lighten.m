function [ C ] = lighten( A,B)
%LIGHTEN Summary of this function goes here
%   Detailed explanation goes here
C=A.*(A>=B)+B.*(B>A);

end

