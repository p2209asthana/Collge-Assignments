function  [Pyramid]= MyGaussPyramid(ImageIn)
mask=MyGauss(10,[3 3]);
Pyramid=[];
Pyramid(1)=ImageIn;

numpyramid=4;
% o=0;
% s=0.5;
% subplot('position',[o,0.3,s,s]);
% o=o+s;
% s=s/2;
% imshow(ImageIn);
% hold on;
for i=1:numpyramid
    ImageIn=impyramid((MyCorr(ImageIn,mask)),'reduce');
    Pyramid(i+1)=ImageIn;
end



end

