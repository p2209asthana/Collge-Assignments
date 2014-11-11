function [ Image1,Image2,Image3,Image4] = GetScaledImages(Image)
Image1=Image;

Image2=Image1(1:2:end,:,:);
Image2=Image2(:,1:2:end,:);

Image3=Image2(1:2:end,:,:);
Image3=Image3(:,1:2:end,:);

Image4=Image3(1:2:end,:,:);
Image4=Image4(:,1:2:end,:);

end

