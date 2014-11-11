function [ ImageOut ] = MyCorr(ImageIn, Mask)
ImageIn=double(ImageIn);
Mask=double(Mask);
[mr mc]=size(Mask);
limitX = floor(mr/2);
limitY = floor(mc/2);
% centreX = ceil(mr/2);
% centreY = ceil(mc/2);
ImageOut=zeros(size(ImageIn));
[or oc od]=size(ImageOut);

ImageIn=padarray(ImageIn,[limitX limitY]);

for k=1:od
    for i=1:or
        for j=1:oc
            s_outer=0;
            for u=-limitX:limitX
                s_inner=0;
                for v=-limitY:limitY
                    s_inner= s_inner + Mask(limitX+u+1,limitY+v+1)*ImageIn(limitX+i+u,limitY+j+v,k);
                end
                s_outer= s_outer + s_inner;
            ImageOut(i,j,k)=s_outer;
            end
        end
    end
end




ImageOut=uint8(ImageOut);
end

