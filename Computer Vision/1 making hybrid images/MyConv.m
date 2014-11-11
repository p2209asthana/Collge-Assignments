function [ ImageOut ] = MyConv(ImageIn, Mask)
ImageOut=MyCorr(ImageIn,rot90(Mask,2));
end

