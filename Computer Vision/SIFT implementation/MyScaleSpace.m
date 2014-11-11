function [Octave1,Octave2,Octave3,Octave4]= MyScaleSpace(Image1,Image2,Image3,Image4)

mask=MyGauss(10,[21 21]);
Octave1=zeros([5,size(Image1)]);
Octave1(1,:,:)=Image1;
for i=2:5
    Image1=MyCorr(Image1,mask);
    Octave1(i,:,:)=Image1;
end

Octave2=zeros([5,size(Image2)]);
Octave2(1,:,:)=Image2;
for i=2:5
    Image2=MyCorr(Image2,mask);
    Octave2(i,:,:)=Image2;
end

 Octave3=zeros([5,size(Image3)]);
Octave3(1,:,:)=Image3;
for i=2:5
    Image3=MyCorr(Image3,mask);
    Octave3(i,:,:)=Image3;
end

 Octave4=zeros([5,size(Image4)]);
Octave4(1,:,:)=Image4;
for i=2:5
    Image4=MyCorr(Image4,mask);
    Octave4(i,:,:)=Image4;
end

end

