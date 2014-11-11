function  MyGaussPyramid(ImageIn)
mask=MyGauss(10,[3 3]);


storage=size(ImageIn,1)*size(ImageIn,2);

numpyramid=4;
o=0;
s=0.5;
subplot('position',[o,0.3,s,s]);
o=o+s;
s=s/2;
imshow(ImageIn);
hold on;
for i=1:numpyramid
    ImageIn=impyramid((MyCorr(ImageIn,mask)),'reduce');
    subplot('position',[o,0.3,s,s]);
    imshow(ImageIn);
    o=o+s;
    s=s/2;
    storage=storage+size(ImageIn,1)*size(ImageIn,2);
end



storage=storage*size(ImageIn,3);

display(sprintf('Memory required to store pyramid after downsampling %d time = %d Bytes \n',numpyramid,storage));
end

