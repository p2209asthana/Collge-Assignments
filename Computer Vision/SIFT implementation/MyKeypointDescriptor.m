function [Descriptor1,Descriptor2,Descriptor3,Descriptor4]=MyKeypointDescriptor(Image1,Image2,Image3,Image4,KPV1,KPV2,KPV3,KPV4);
Descriptor1=GetDescriptor(Image1,KPV1);
Descriptor2=GetDescriptor(Image2,KPV2);
Descriptor3=GetDescriptor(Image3,KPV3);
Descriptor4=GetDescriptor(Image4,KPV4);
end

function GetDescriptor(Image,KPV)
Image=padarray(Image,[17 17]);

gradientX=zeros(size(Image)-2);
gradientY=zeros(size(Image)-2);
gradientmag=zeros(size(Image)-2);
gradientdir=zeros(size(Image)-2);

gradientX(:,:)=Image(2:end-1,3:end)-Image(2:end-1,1:end-2);
gradientY(:,:)=Image(3:end,2:end-1)-Image(1:end-2,2:end-1);
gradientmag(:,:)=sqrt(gradientX(:,:).^2+gradientY(:,:).^2);


for i=1:size(gradientX)
    for j=1:size(gradientX)
        if gradientX(i,j)==0
            gradientdir(i,j)=0;
        else
            gradientdir(i,j)= atand(gradientX(i,j)/gradientY(i,j));
            gradientdir(i,j)= gradientdir(i,j)+ (gradientX(i,j)<0)*180;
            gradientdir(i,j)= mod(gradientdir(i,j)+360,360); 
        end
    end
end



for num=1:size(KPV,1)
    row=KP(num,1);
    col=KP(num,2);
    row=row+16;
    col=col+16;
    gradd=gradientdir(row-7:row+8,col-7:col+8)/10;
    gradd=floor(gradd);
    gradm=gradientmag(row-7:row+8,col-7:col+8);
    bucket=zeros(1,37);
    for k=1:size(gradd,1)
        for l =1:size(gradd,2)
            bucket(gradd(k,l)+1)=bucket(gradd(k,l)+1)+gradm(k,l);
        end
    end
    bucket(36)=bucket(36)+bucket(37);
    bucket=bucket(1:end-1);
    first_max=max(bucket);
    second_max=max(bucket(bucket~=first_max));
    if(second_max<0.8*first_max)
        second_max=-1;
    end
    for k=1:size(bucket,2)
        if bucket(k)== first_max
            KP(num,4)=10*k ;
        end
        if bucket(k) ==second_max
            count_2=count_2+1;
            KP_2(count_2,:)=[KP(num,1),KP(num,2),KP(num,3),10*k];
        end
    end
   
end



end
