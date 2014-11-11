function [ KP1,KP2,KP3,KP4 ] = MyEliminateKeypoints(DoGOctave1,DoGOctave2,DoGOctave3,DoGOctave4,KP1,KP2,KP3,KP4)
ContrastThreshold=0.03;
EdgeThreshold=0.001;

KP11=squeeze(KP1(1,:,:));
KP12=squeeze(KP1(2,:,:));
KP21=squeeze(KP2(1,:,:));
KP22=squeeze(KP2(2,:,:));
KP31=squeeze(KP3(1,:,:));
KP32=squeeze(KP3(2,:,:));
KP41=squeeze(KP4(1,:,:));
KP42=squeeze(KP4(2,:,:));

KP11=ContrastElimination(squeeze(DoGOctave1(2,:,:)),KP11,ContrastThreshold);
KP12=ContrastElimination(squeeze(DoGOctave1(3,:,:)),KP12,ContrastThreshold);
KP21=ContrastElimination(squeeze(DoGOctave2(2,:,:)),KP21,ContrastThreshold);
KP22=ContrastElimination(squeeze(DoGOctave2(3,:,:)),KP22,ContrastThreshold);
KP31=ContrastElimination(squeeze(DoGOctave3(2,:,:)),KP31,ContrastThreshold);
KP32=ContrastElimination(squeeze(DoGOctave3(3,:,:)),KP32,ContrastThreshold);
KP41=ContrastElimination(squeeze(DoGOctave4(2,:,:)),KP41,ContrastThreshold);
KP42=ContrastElimination(squeeze(DoGOctave4(3,:,:)),KP42,ContrastThreshold);
% figure();
% imshow((KP11|KP12)*255);


KP11=EdgeElimination(squeeze(DoGOctave1(2,:,:)),KP11,EdgeThreshold);
KP12=EdgeElimination(squeeze(DoGOctave1(3,:,:)),KP12,EdgeThreshold);
KP21=EdgeElimination(squeeze(DoGOctave2(2,:,:)),KP21,EdgeThreshold);
KP22=EdgeElimination(squeeze(DoGOctave2(3,:,:)),KP22,EdgeThreshold);
KP31=EdgeElimination(squeeze(DoGOctave3(2,:,:)),KP31,EdgeThreshold);
KP32=EdgeElimination(squeeze(DoGOctave3(3,:,:)),KP32,EdgeThreshold);
KP41=EdgeElimination(squeeze(DoGOctave4(2,:,:)),KP41,EdgeThreshold);
KP42=EdgeElimination(squeeze(DoGOctave4(3,:,:)),KP42,EdgeThreshold);

KP1=KP11 | KP12;
KP2=KP21 | KP22;
KP3=KP31 | KP32;
KP4=KP41 | KP42;
end
function KP = EdgeElimination(DoG,KP,threshold)
% mask=MyGauss(5,[11 11]);
% Image1=MyCorr(Image1,mask);
k=1E-4;
Ix=zeros(size(DoG));
Iy=zeros(size(DoG));

DoG=padarray(DoG,[1,1]);


Ix(:,:)=DoG(2:end-1,3:end)-DoG(2:end-1,1:end-2);
Iy(:,:)=DoG(3:end,2:end-1)-DoG(1:end-2,2:end-1);

Ix2=Ix.*Ix;
Iy2=Iy.*Iy;
Ixy=Ix.*Iy;

% mask=MyGauss(5,[1 1]);
% Sx2=MyCorr(mask,Ix2);
% Sy2=MyCorr(mask,Iy2);
% Sxy=MyCorr(mask,Ixy);
Sx2=Ix2;
Sy2=Iy2;
Sxy=Ixy;

R=zeros(size(KP));
for i=1:size(KP,1)
    for j=1:size(KP,2)
        H=[Sx2(i,j) Sxy(i,j);Sxy(i,j) Sy2(i,j)];
        R(i,j)=det(H)-k*trace(H).^2;
    end
end
R=abs(R);
R= R>threshold;
KP=KP & R;
end

function KP = ContrastElimination(DoG,KP,threshold)
for i=1:size(KP,1)
    for j=1:size(KP,1)
        if DoG(i,j)<threshold
            KP(i,j)=0;
        end
    end
end
end



