function [mse] = meansquarederr(T, Tdash)
    temp=T-Tdash;
    temp=temp.^2;
    mse = mean(temp) / 2;
end 