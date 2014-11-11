function [ gauss ] = MyGauss( sigma,siz)

gauss=zeros(siz(1),siz(2));
centre=ceil((siz+1)/2);
for i= 1:siz(1)
    for j=1:siz(2)
    gauss(i,j)=exp(-((i-centre(1))^2+(j-centre(2))^2)/(2*sigma^2));
    end

end
gauss=gauss/sum(sum(gauss));

end

