function [objval gradval] = objgradcompute(w, X, Y)
su=0;
lambda=0;
for i=1:size(X,1)    
g=1/(1+(exp(-1*(X(i,:)*w))));
su=su+Y(i)*log(g)+(1-Y(i))*log(1-g);
end
su=-su;
su=su+lambda*sum(w.^2)/2;
objval=su/size(X,1);

gradval=zeros(size(w));

for i =1:size(X,1)
    for j=1:size(gradval)
        g=1/(1+(exp(-1*(X(i,:)*w))));
        gradval(j)=gradval(j)+ (g-Y(i))*X(i,j);
    end
    
end
gradval=gradval/size(X,1);
temp=zeros(size(gradval));
for i=2:size(temp)
    temp(i)=(lambda/size(X,1))*w(i);
end
gradval=gradval+temp;
