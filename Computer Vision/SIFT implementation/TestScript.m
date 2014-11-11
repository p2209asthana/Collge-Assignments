function TestScript
clc
clear all
close all
%Driver fucntion

cat=imread('cat.bmp');
[Keypoints, Descriptors] = MySIFT(cat)
end

