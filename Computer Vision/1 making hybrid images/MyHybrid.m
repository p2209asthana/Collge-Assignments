function HybridImage = MyHybrid(Image1, Image2, CutOff1, CutOff2)
sigma1=size(Image1,1)/(2*pi*CutOff1);
sigma2=size(Image2,2)/(2*pi*CutOff2);
CImage2=Image2;
Image1=double(Image1);
Image2=double(Image2);

[r c d]=size(Image1);%both image should be same size
%[r2 c2]=size(Image2)
Image1=padarray(Image1,[r c],'post');
Image2=padarray(Image2,[r c],'post');

H1=MyGauss(sigma1,size(Image1));
H2=MyGauss(sigma2,size(Image2));
Image1=fftn(Image1);
Image2=fftn(Image2);
H1=fftn(H1);
H2=fftn(H2);
Out1(:,:,1)=Image1(:,:,1).*H1;
Out1(:,:,2)=Image1(:,:,2).*H1;
Out1(:,:,3)=Image1(:,:,3).*H1;
Out2(:,:,1)=Image2(:,:,1).*H2;
Out2(:,:,2)=Image2(:,:,2).*H2;
Out2(:,:,3)=Image2(:,:,3).*H2;

%   imshow(uint8(ifftn(Out1)));
Out1=uint8(ifftn(Out1));
Out2=uint8(ifftn(Out2));
Out1=Out1(r+1:2*r,c+1:2*c,:);
Out2=Out2(r+1:2*r,c+1:2*c,:);
% imshow(uint8(double(CImage2)-double(temp)));

HybridImage=double(Out1)+double(CImage2)-double(Out2);
HybridImage=uint8(HybridImage);


end

