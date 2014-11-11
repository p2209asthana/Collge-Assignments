function [Keypoints, Descriptors] = MySIFT(Image)
close all;
clc;
Image=rgb2gray(Image);
Descriptors=[];
[Image1,Image2,Image3,Image4]=GetScaledImages(Image);
[Octave1,Octave2,Octave3,Octave4]=MyScaleSpace(Image1,Image2,Image3,Image4);
[DoGOctave1,DoGOctave2,DoGOctave3,DoGOctave4]=MyDoG(Octave1,Octave2,Octave3,Octave4);
[KP1,KP2,KP3,KP4] = MyKeyPointDetect(DoGOctave1,DoGOctave2,DoGOctave3,DoGOctave4);
[KP1,KP2,KP3,KP4] = MyEliminateKeypoints(DoGOctave1,DoGOctave2,DoGOctave3,DoGOctave4,KP1,KP2,KP3,KP4);
[KPV1,KPV2,KPV3,KPV4] = GetVectorizedKeypoints(KP1,KP2,KP3,KP4);
[KPV1,KPV2,KPV3,KPV4] = MyAssignOrientation( Image1,Image2,Image3,Image4,KPV1,KPV2,KPV3,KPV4);
% [Descriptor1,Descriptor2,Descriptor3,Descriptor4]=MyKeypointDescriptor(Image1,Image2,Image3,Image4,KPV1,KPV2,KPV3,KPV4);
Keypoints=[KPV1;KPV2;KPV3;KPV4];
Keypoints=deg2rad(Keypoints);
% Descriptors=[Descriptor1;Descriptor2;Descriptor3;Descriptor4];
end

function [Keypoints]= deg2rad(Keypoints)
Keypoints(:,4)=degtorad(Keypoints(:,4))-pi;
end
