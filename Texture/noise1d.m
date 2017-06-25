function [ nois ] = noise1d( nbslop,np )
% noise1d: result of the 1d noise
%
% nbslop:the number of slop in the signal

nois=zeros(1,(nbslop-1)*np);
slop=rand(1,nbslop)*2-1;
interpo = @(a,b,x) 2*(a - b)*x.^4 - (3*a - 5*b)*x.^3 - 3*b*x.^2 + a*x;
for i=1:nbslop-1

  a=slop(i);
  b=slop(i+1);
  x=0:1/np:1-1/np;
  y=interpo(a,b,x);
  nois(1,(i-1)*np+1:i*np)=y;
end

end  % noise1d
