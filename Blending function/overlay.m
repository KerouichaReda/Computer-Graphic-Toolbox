function [ C ] = overlay( A,B )
%OVERLAY Summary of this function goes here
%   Detailed explanation goes here

C=(B<=0.5).*(2.*A.*B) +(B>0.5).*(1-2.*(1-A).*(1-B));
end

