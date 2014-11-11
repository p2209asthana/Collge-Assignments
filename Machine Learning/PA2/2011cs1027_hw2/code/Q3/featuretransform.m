function [newX ] = featuretransform( X,degree )
newX=[];
powlist=[];
for i=0:degree
 for j= 0:i
    x1_pow=j;
    x2_pow=i-j;
    powlist=[powlist; [x1_pow x2_pow] ];
 end
end

for i=1:size(X,1)
    list=[];
    for j= 1:size(powlist,1)
        list=[list [X(i,1)^powlist(j,1)*X(i,2)^powlist(j,2)]];
    end
    newX=[newX; list];
end




