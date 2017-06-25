clear all ;close all;clc;
ngrad=16;
grad=rand(ngrad,ngrad,2)*2-1;
nx=128;
ny=256;
nmax=max(nx,ny);
im=zeros(nx,ny);
% for i=0:nx-1
%     for j=0:ny-1
%         im(i+1,j+1)=perlin(i/nmax*(ngrad/2),j/nmax*(ngrad/2),grad );
%         
%     end
% end
x=0:1/nmax*(ngrad/2):nx-1;
y=0:1/nmax*(ngrad/2):ny-1;
[Xim,Yim]=meshgrid(x,y);

% imshow(im,[])