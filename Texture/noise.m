function result =noise(nx,ny,c)

RNG=2*rand(c,c)-1;
im=zeros(nx,ny);
imc=zeros(c,ny);
for i=1:c
    for j=1:ny
    imc(i,j)=sp_line(j/ny,RNG(i,:));
    end
end

for i=1:nx
    for j=1:ny
    im(i,j)=sp_line(i/nx,imc(:,j)');
    end
end

result=im;