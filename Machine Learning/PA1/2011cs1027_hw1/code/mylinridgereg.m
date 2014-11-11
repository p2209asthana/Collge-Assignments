function [ W ] =  mylinridgereg(X, T, lambda)

numcols=size(X,2);
trans=transpose(X);
W = pinv((trans*X) + lambda*eye(numcols)) * trans * T ;

end