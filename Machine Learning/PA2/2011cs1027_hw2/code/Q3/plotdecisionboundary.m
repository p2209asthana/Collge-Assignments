function plotdecisionboundary(w, X, Y,deg)
grid=zeros(size(X,2),size(Y,2));
for i=1:size(grid,1)
    for j=1:size(grid,2)
        Xdash=featuretransform([X(i) Y(j)],deg);
        grid(j,i)=Xdash*w;
    end


end

contour(X,Y,grid,0.5);
end

