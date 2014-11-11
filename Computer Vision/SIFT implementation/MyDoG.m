function [DoG1,DoG2,DoG3,DoG4]=MyDoG(Octave1,Octave2,Octave3,Octave4)

temp=size(Octave1(1,:,:));
temp=temp(2:end);
DoG1=zeros([4 temp]);

temp=size(Octave2(1,:,:));
temp=temp(2:end);
DoG2=zeros([4 temp]);

temp=size(Octave3(1,:,:));
temp=temp(2:end);
DoG3=zeros([4 temp]);

temp=size(Octave4(1,:,:));
temp=temp(2:end);
DoG4=zeros([4 temp]);


DoG1(:,:,:)=Octave1(1:end-1,:,:)-Octave1(2:end,:,:);
DoG2(:,:,:)=Octave2(1:end-1,:,:)-Octave2(2:end,:,:);
DoG3(:,:,:)=Octave3(1:end-1,:,:)-Octave3(2:end,:,:);
DoG4(:,:,:)=Octave4(1:end-1,:,:)-Octave4(2:end,:,:);

end

