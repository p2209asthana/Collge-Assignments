function [KPV1,KPV2,KPV3,KPV4] = GetVectorizedKeypoints(KP1,KP2,KP3,KP4)

KPV1=VectorizeKeypoint(KP1,1);
KPV2=VectorizeKeypoint(KP2,0.5);
KPV3=VectorizeKeypoint(KP3,0.25);
KPV4=VectorizeKeypoint(KP4,0.125);

end

function KPV=VectorizeKeypoint(KP,scale)
count =0;
KPV=zeros(size(KP,1)*size(KP,2),4);
for i=1:size(KP,1)
    for j=1:size(KP,2)
        if KP(i,j)==1
            count=count+1;
            KPV(count,:)=[i,j,scale,0];
        end
    end
end
KPV=KPV(1:count,:);
end
