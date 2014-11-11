function TestScript
clc
clear all
close all
%Driver fucntion

%load all images
dog=imread('Samples/dog.bmp');
cat=imread('Samples/cat.bmp');
bird=imread('Samples/bird.bmp');
plane=imread('Samples/plane.bmp');
submarine=imread('Samples/submarine.bmp');
fish=imread('Samples/fish.bmp');
einstein=imread('Samples/einstein.bmp');
marilyn=imread('Samples/marilyn.bmp');
bicycle=imread('Samples/bicycle.bmp');
motorcycle=imread('Samples/motorcycle.bmp');

catface=imread('Myimages/catface.jpg');
womanface=imread('Myimages/womanface.jpg');
batman=imread('Myimages/batman.jpg');
superman=imread('Myimages/superman.jpg');


display(sprintf('figure1--> Gaussian Pyramid of Bicycle'));
MyGaussPyramid(bicycle);

cutoff1=10;
cutoff2=25;
display('------------------ GIVEN IMAGES -------------------');
display('figure2--> Hybrid Image of dog and cat');
display(sprintf('Cutoff1=%d Cutoff2=%d \n',cutoff1,cutoff2));
figure();
imshow(MyHybrid(dog,cat,cutoff1,cutoff2));

cutoff1=10;
cutoff2=30;
display('figure3--> Hybrid Image of bird and plane');
display(sprintf('Cutoff1=%d Cutoff2=%d \n',cutoff1,cutoff2));
figure();
imshow(MyHybrid(plane,bird,cutoff1,cutoff2));

cutoff1=20;
cutoff2=44;
display('figure4--> Hybrid Image of fish and submarine');
display(sprintf('Cutoff1=%d Cutoff2=%d \n',cutoff1,cutoff2));
figure();
imshow(MyHybrid(submarine,fish,cutoff1,cutoff2));

cutoff1=25;
cutoff2=15;
display('figure5--> Hybrid Image of Einstein and Marilyn');
display(sprintf('Cutoff1=%d Cutoff2=%d \n',cutoff1,cutoff2));
figure();
imshow(MyHybrid(einstein,marilyn,cutoff1,cutoff2));

cutoff1=10;
cutoff2=30;
display('figure6--> Hybrid Image of bicycle and motorcycle');
display(sprintf('Cutoff1=%d Cutoff2=%d \n',cutoff1,cutoff2));
figure();
imshow(MyHybrid(motorcycle,bicycle,cutoff1,cutoff2));

cutoff1=20;
cutoff2=30;
display('-------------- TEST IMAGES -----------------');
display('figure7--> Hybrid Image of cat face and woman face');
display(sprintf('Cutoff1=%d Cutoff2=%d \n',cutoff1,cutoff2));
figure();
imshow(MyHybrid(womanface,catface,cutoff1,cutoff2));

cutoff1=25;
cutoff2=20;
display('figure8--> Hybrid Image of superman and batman');
display(sprintf('Cutoff1=%d Cutoff2=%d \n',cutoff1,cutoff2));
figure();
imshow(MyHybrid(superman,batman,cutoff1,cutoff2));
end

