function [ KP1,KP2,KP3,KP4] = MyKeyPointDetect( DoGoctave1,DoGoctave2,DoGoctave3,DoGoctave4)
[KP11, KP12]=FindMinMax(DoGoctave1);
[KP21, KP22]=FindMinMax(DoGoctave2);
[KP31, KP32]=FindMinMax(DoGoctave3);
[KP41, KP42]=FindMinMax(DoGoctave4);

KP1=zeros([2,size(KP11)]);
KP2=zeros([2,size(KP21)]);
KP3=zeros([2,size(KP31)]);
KP4=zeros([2,size(KP41)]);

KP1(1,:,:)=KP11;
KP1(2,:,:)=KP12;
KP2(1,:,:)=KP21;
KP2(2,:,:)=KP22;
KP3(1,:,:)=KP31;
KP3(2,:,:)=KP32;
KP4(1,:,:)=KP41;
KP4(2,:,:)=KP42;

end
function [ KP1,KP2 ] = FindMinMax(DoGoctave)
DoG1=squeeze(DoGoctave(1,:,:));
DoG2=squeeze(DoGoctave(2,:,:));
DoG3=squeeze(DoGoctave(3,:,:));
DoG4=squeeze(DoGoctave(4,:,:));

KP1=zeros(size(DoG2));
KP2=zeros(size(DoG3));
for i=2:size(DoG2,1)-1
    for j=2:size(DoG2,1)-1
        a=DoG1(i-1:i+1,j-1:j+1);
        b=DoG2(i-1:i+1,j-1:j+1);
        c=DoG3(i-1:i+1,j-1:j+1);
        d=DoG4(i-1:i+1,j-1:j+1);
        
        amin=min(min(a));
        amax=max(max(a));
        bmin=min(min(b));
        bmax=max(max(b));
        cmin=min(min(c));
        cmax=max(max(c));
        dmin=min(min(d));
        dmax=max(max(d));
        
        min1=min([amin bmin cmin]);
        max1=max([amax bmax cmax]);
        min2=min([bmin cmin dmin]);
        max2=max([bmax cmax dmax]);
            
        if DoG2(i,j)==min1 || DoG2(i,j)==max1 
           KP1(i,j)=1;
        end
        if DoG3(i,j)==min2 || DoG3(i,j)==max2 
           KP2(i,j)=1; 
        end
    end

end


end

