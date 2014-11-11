% compares error before and after removal of least significant attributes%
clear all;


load('abalone.mat');
numrows=size(abalone,1);
numcols=size(abalone,2);
for j=1:3
    for i=1:numrows
        bin(:,j)=abalone(:,1)==(j-1);
    end
end

X= [bin abalone(:,2:numcols-1) ] ;
split_frac=0.8;  
    lambda = 0.75;
        testerr=0;
        trainerr=0;
        for count=1:100
            trainX=[];trainY=[];testX=[];testY=[];
            %random permutation of row indexes
            randXrow = randperm(numrows);
            %splitting of training and testing data
            numtrain = floor(split_frac * numrows );
            
            %fetching training data
            for i=1:numtrain
                trainX(i,:)=X(randXrow(i),:);
                trainY(i,1)=abalone(randXrow(i),numcols);
            end
            %calculating mean and stand. dev of training data
            mu=mean(trainX);
            sigma=std(trainX);
            
            %normalization of training data
            temp = ones(numtrain,1)*mu;
            trainX=trainX-temp;
            temp=ones(numtrain,1)*sigma;
            trainX=trainX./temp;
            
            %appending column of ones in training data for bias
            trainX = [ ones(numtrain,1) trainX ];

            %fetching testing data
            for i=numtrain+1:numrows
                testX(i-numtrain,:)=X(randXrow(i),:);
                testY(i-numtrain,1)= abalone(randXrow(i),numcols);
            end
            
            %normalization of testing data
            temp = ones(numrows-numtrain,1)*mu;
            testX=testX-temp;
            temp=ones(numrows-numtrain,1)*sigma;
            testX=testX./temp;
            
            %appending column of ones in testing data for bias
            testX = [ ones(numrows-numtrain,1) testX ];
            %calculating weight matrix
            W =  mylinridgereg(trainX, trainY, lambda) ;
            %predicting output
            Tdash1 = mylinridgeregeval(trainX, W);
            Tdash2 = mylinridgeregeval(testX, W);
            %calculating error
            trainerr=trainerr+meansquarederr(trainY,Tdash1);
            testerr=testerr+meansquarederr(testY,Tdash2);
        end
        trainerr=trainerr/100
        testerr=testerr/100

        
 X= [abalone(:,2:numcols-1)] ;
split_frac=0.8  ;
    trainerrvr=[];testerrvr=[];Xline=[];
    lambda = 0.75;
        testerr=0;
        trainerr=0;
        for count=1:100
            trainX=[];trainY=[];testX=[];testY=[];
            %random permutation of row indexes
            randXrow = randperm(numrows);
            %splitting of training and testing data
            numtrain = floor(split_frac * numrows );
            
            %fetching training data
            for i=1:numtrain
                trainX(i,:)=X(randXrow(i),:);
                trainY(i,1)=abalone(randXrow(i),numcols);
            end
            %calculating mean and stand. dev of training data
            mu=mean(trainX);
            sigma=std(trainX);
            
            %normalization of training data
            temp = ones(numtrain,1)*mu;
            trainX=trainX-temp;
            temp=ones(numtrain,1)*sigma;
            trainX=trainX./temp;
            
            %appending column of ones in training data for bias
            trainX = [ ones(numtrain,1) trainX ];

            %fetching testing data
            for i=numtrain+1:numrows
                testX(i-numtrain,:)=X(randXrow(i),:);
                testY(i-numtrain,1)= abalone(randXrow(i),numcols);
            end
            
            %normalization of testing data
            temp = ones(numrows-numtrain,1)*mu;
            testX=testX-temp;
            temp=ones(numrows-numtrain,1)*sigma;
            testX=testX./temp;
            
            %appending column of ones in testing data for bias
            testX = [ ones(numrows-numtrain,1) testX ];
            %calculating weight matrix
            W =  mylinridgereg(trainX, trainY, lambda) ;
            %predicting output
            Tdash1 = mylinridgeregeval(trainX, W);
            Tdash2 = mylinridgeregeval(testX, W);
            %calculating error
            trainerr=trainerr+meansquarederr(trainY,Tdash1);
            testerr=testerr+meansquarederr(testY,Tdash2);
        end
        trainerr=trainerr/100
        testerr=testerr/100
       