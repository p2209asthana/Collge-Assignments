function lindiscriminant(X, Y,deg)
X=X(:,2:end);
X0=[];
X1=[];
for i=1:size(Y,1)
    if(Y(i)==0)
        X0=[X0;X(i,:)];
    else
        X1=[X1;X(i,:)];
    end
end
mu0=mean(X0);
mu1=mean(X1);
sum=zeros(size(mu0,2),size(mu0,2)); 
for i=1:size(X0,1)
    temp=(X0(i,:)-mu0)'*(X0(i,:)-mu0);
    sum=sum+temp;
end
for i=1:size(X1,1)
    temp=(X1(i,:)-mu1)'*(X1(i,:)-mu1);
    sum=sum+temp;
end
sigma_cap=sum/(size(Y,1)-2);

%discriminants for two classes
disc0=X0*pinv(sigma_cap)*mu0'-0.5*mu0*pinv(sigma_cap)*mu0'+log(size(X0,1)/size(Y,1))
disc1=X1*pinv(sigma_cap)*mu1'-0.5*mu1*pinv(sigma_cap)*mu1'+log(size(X1,1)/size(Y,1))


A=[0:0.1:7];
B=[0:0.1:7];
grid=zeros(size(A,2),size(B,2));
for i=1:size(grid,1)
    for j=1:size(grid,2)
        Xdash=featuretransform([A(i) B(j)],deg);
        grid(j,i)=Xdash(:,2:end)*pinv(sigma_cap)*(mu1-mu0)'-0.5*mu1*pinv(sigma_cap)*mu1'+0.5*mu0*pinv(sigma_cap)*mu0'+log(size(X1,1)/size(X0,1));
    end
end

contour(A,B,grid,[0 0]);
end

