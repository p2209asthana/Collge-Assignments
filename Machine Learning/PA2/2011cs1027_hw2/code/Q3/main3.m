clear all;
clc;
close all;

deg=2;
load('credit.mat');
blue_set=[];
red_set=[];
for i=1:size(data,1)
    if(label(i))
        blue_set=[blue_set ; [data(i,1) data(i,2)]];
    else
        red_set=[red_set ; [data(i,1) data(i,2)]];
    end
end

scatter(blue_set(:,1),blue_set(:,2),'b')
hold on
scatter(red_set(:,1),red_set(:,2),'r')
xlabel('X0');
ylabel('X1');
title('Classification b/w 2 classes using logistic regression');
legend('Class1','Class0');

Xdash=featuretransform(data,deg);
w=zeros(size(Xdash,2),1);
options = optimset('GradObj', 'on', 'MaxIter', 100);
[w objval] = fminunc(@(w)(objgradcompute(w, Xdash, label)), w, options);

plotdecisionboundary(w, 0:0.1:7, 0:0.1:7,deg);
 figure;
 
 scatter(blue_set(:,1),blue_set(:,2),'b')
 hold on
 scatter(red_set(:,1),red_set(:,2),'r')
 xlabel('X0');
 ylabel('X1');
 title('Classification b/w 2 classes using linear discriminant');
 legend('Class1','Class0');
 lindiscriminant(Xdash, label,deg);