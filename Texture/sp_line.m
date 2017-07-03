function [ out ] = sp_line( x,knot )
% sp_line: the code of the sp_line
%
% x, lattice point
% number of point
% the points vector
CR=[-0.5 1.5 -1.5 0.5; 1.0 -2.5 2.0 -0.5; -0.5 0 0.5 0; 0 1 0 0] ;
nknots=length(knot);
nspans=nknots-3;
x=clamp(0,1,x)*nspans;
span=floor(x);
if (span>=nknots-3)
span=nknots-4;
end
x=x-span;
p=span+1;


C3=CR(1,:)*knot(p:p+3)';
C2=CR(2,:)*knot(p:p+3)';
C1=CR(3,:)*knot(p:p+3)';
C0=CR(4,:)*knot(p:p+3)';


out=((C3*x+C2)*x+C1)*x+C0;
end  % sp_line
